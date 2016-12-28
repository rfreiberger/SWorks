#!/usr/bin/env python3

def listusernames(logfile):
    file = open(logfile, 'r')
    for line in file:
        logsplit = line.split()
        usernames = logsplit[1]
        print(usernames)

listusernames('foo.log')
