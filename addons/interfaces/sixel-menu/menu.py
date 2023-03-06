#!/bin/python

import os
import sys
import tty
import termios
import shutil
import json
import sys
import subprocess

from enum import Enum, auto

KEYS = {
    b'\x1b[A': "ARROW_UP",
    b'\x1b[B': "ARROW_DOWN",
    b'\x1b[D': "ARROW_LEFT",
    b'\x1b[C': "ARROW_RIGHT"
}


class Key:
    @staticmethod
    def toString(b: bytes):
        keyrepr = KEYS.get(b)
        if not keyrepr:
            return str(b, "utf-8")
        return keyrepr

    def __init__(self, name: str, bytes: bytes):
        self.type = type
        self.name = name
        self.bytes = bytes

    def __eq__(self, name: str):
        return self.name == name

    def __repr__(self):
        return f'{self.name}:{self.bytes}'


fd = sys.stdin.fileno()

old_settings = termios.tcgetattr(fd)

tty.setraw(sys.stdin.fileno())


class KeyType(Enum):
    ESCAPE = auto()
    ARROW = auto()
    FKEY = auto()
    # home/end/insert/page(up/down)
    ASCII = auto()
    REGULAR = auto()


def getInput():
    seq = bytes()
    escapeSequence = False
    while len(seq) == 0 or escapeSequence:
        cur_char = bytes(sys.stdin.read(1), "utf-8")
        seq += cur_char
        if seq[-1] == 27:
            escapeSequence = True
        elif (escapeSequence and seq[-1] != 91) and \
                (seq[-1] > 57 or seq[-1] < 48) and \
                seq[-1] != 79 and seq[-1] != 59:
            escapeSequence = False
    return Key(Key.toString(seq), seq)


class Lines(list):
    renderCmd = ""

    def __init__(self, *data):
        super().__init__(data)
        self.selectedLine = 0
        self.outputCache = {}

    def renderPreview(self):
        sys.stderr.write("\033[s")
        sys.stderr.write(f'\033[0;{TERMCOLUMNS // 2 + 1}H')
        if self.outputCache.get(self.selectedLine):
            sys.stderr.write(self.outputCache[self.selectedLine])
        else:
            cmd = list(map(lambda x: x.replace(
                "{}", line), self.renderCmd))
            o = subprocess.check_output(cmd).decode("utf-8")
            self.outputCache[self.selectedLine] = o
            sys.stderr.write(o + "\n")
        sys.stderr.write("\033[u")

    def render(self):
        start = max(0, self.selectedLine - TERMLINES // 2)
        end = min(len(self) + 1, self.selectedLine + TERMLINES // 2)
        i = start
        for line in self[start:end]:
            displayLine = line
            if len(line) > TERMCOLUMNS // 2:
                displayLine = line[0:TERMCOLUMNS // 2]
            if i == self.selectedLine:
                if self.renderCmd:
                    self.renderPreview()
                sys.stderr.write('\033[31m')
            sys.stderr.write(displayLine + "\033[0m\n\r")
            i += 1

    def appendJSONString(self, string):
        super().append(json.loads(string))

    def down(self):
        if self.selectedLine < len(self) - 1:
            self.selectedLine += 1
        else:
            self.selectedLine = 0

    def up(self):
        if self.selectedLine > 0:
            self.selectedLine -= 1
        else:
            self.selectedLine = len(self) - 1


LINES = Lines()
with open(sys.argv[1], "r") as f:
    for line in f.read().split("\n"):
        if not line:
            continue
        try:
            LINES.append(line.strip())
        except Exception as err:
            print(err)

TERMCOLUMNS, TERMLINES = shutil.get_terminal_size([80, 24])
shouldPrint = True

if len(sys.argv) > 2:
    LINES.renderCmd = sys.argv[2:]
else:
    LINES.renderCmd = ["img2sixel", "-w", "100", "{}"]

while True:
    for f in sys.stderr, sys.stdout:
        f.write("\033[2J\033[0;0H")

    LINES.render()

    sys.stderr.write(f'\033[0;{TERMCOLUMNS // 2}H')
    k = getInput()

    if k == "q":
        shouldPrint = False
        break
    elif k == "ARROW_DOWN" or k == "j":
        LINES.down()
    elif k == "ARROW_UP" or k == "k":
        LINES.up()
    elif k == '\r':
        break


termios.tcsetattr(fd, termios.TCSADRAIN, old_settings)

os.system("clear")

if shouldPrint:
    for fd in sys.stderr, sys.stdout:
        fd.write("\033[2J\033[0;0H")
    print(LINES[LINES.selectedLine])
