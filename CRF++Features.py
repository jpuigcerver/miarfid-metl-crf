#!/usr/bin/env python
# -*- coding: utf-8 -*-
from sys import argv, stdin

W={}
f = open(argv[1], 'r')
for l in f:
    l = l.split()
    W[l[0]] = l[1]
f.close()

F = {}
for l in stdin:
    l = l.strip().split()
    feats = l[:-1]
    fname = l[-1][:-4]
    sid = fname[:-3]
    wid = fname[-2:]
    wrd = W[fname]
    s_wds = F.get(sid, [])
    s_wds.append((wid, feats, wrd))
    F[sid] = s_wds

for sid in F:
    l = F[sid]
    l.sort()
    for d in l:
        print ' '.join(d[1]), d[2]
    print ''
