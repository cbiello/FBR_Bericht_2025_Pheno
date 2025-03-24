#!/usr/bin/env python
#
#
#

import sys,os,re

def header_check(f):
    template="""% -*- coding:utf8 -*-
% vi:encoding=utf8:
% !TEX encoding = UTF-8 Unicode
%"""
#    if not re.match(template,f,re.MULTILINE):
#        print f


def main():
    rc = 0
    for root, dirs, files in os.walk("."):
        for file in files:
            if re.search("\.tex$",file):
                filename = root+"/"+file
                try:                    
                    header_check(open(filename).read().decode("utf-8"))
                except:
                    rc = 1
                    print "Error: " +filename + " is not ASCII or UTF-8 encoded"
    return rc


if ( __name__ == "__main__" ):
    sys.exit(main())
