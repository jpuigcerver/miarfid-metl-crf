#!/usr/bin/env python
# -*- coding: utf-8 -*-
from sys import argv, stdin
from random import shuffle, seed

NTST = 160
NVAL = 160

tra_fname = argv[1]
val_fname = argv[2]
tst_fname = argv[3]

F=[]
cl=[]
for l in stdin:
    l = l.strip()
    if l == '':
        F.append(cl)
        cl = []
        continue
    cl.append(l)

seed(1234)
shuffle(F)

f = open(tst_fname, 'w')
for l in F[:NTST]:
    f.write('%s\n\n' % '\n'.join(l))
f.close()

f = open(val_fname, 'w')
for l in F[NTST:NTST+NVAL]:
    f.write('%s\n\n' % '\n'.join(l))
f.close()

f = open(tra_fname, 'w')
for l in F[NTST+NVAL:]:
    f.write('%s\n\n' % '\n'.join(l))
f.close()
