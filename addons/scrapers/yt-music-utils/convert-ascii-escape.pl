#!/bin/perl

use strict;
use warnings;

while(<>){
    s/\\x([0-9a-fA-F]{2})/chr(hex($1))/eg;
    print;
}
