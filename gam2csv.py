#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import subprocess
import sys
import json
import re

def parseHaplos(haploJSON):
    haplo = []
    mapping = haploJSON["path"]["mapping"]
    for m in mapping:
        nodeID = m["position"]["node_id"]
        dnalen = m["edit"][0]["from_length"]
        haplo.append((int(nodeID)))
    return haplo

def getPath(gamfile):
    haplo_list = []
    out = subprocess.check_output("vg view -a " + gamfile, shell=True).strip()
    out = out.decode('utf-8')
    #print(out)
    outs = out.split('\n')
    for i,o in enumerate(outs):
        haploJSON = json.loads(o)
        haplo = parseHaplos(haploJSON)
        haplo_list.append(haplo)    
    return haplo_list 

def getVG(vgfile):
    node_list = []
    out = subprocess.check_output("vg view -j -V " + vgfile, shell=True).strip()
    out = out.decode('utf-8')
    #print(out)
    vgjson = json.loads(out)
    for node in vgjson["node"]:
        node_list.append((int(node["id"]),node["sequence"]))
    return node_list

if __name__=="__main__":
    haplo_list = getPath(sys.argv[1] + ".gam")
    print(haplo_list)
    node_list = getVG(sys.argv[1] + ".vg")
    print(node_list)
