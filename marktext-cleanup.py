#!/usr/bin/python

import sys
import os

# ![](/Users/o98k-ok/Documents/code/ok-scriptables/github-graph/assets/2022-02-24-12-49-30-image.png)

imgTagPrefix = "![]("
imgTagSubfix = ")"
filename = sys.argv[1]
cpath = os.getcwd()
assets = "./assets"

res = []
lines = []

with open(filename, "r") as fd:
    lines = fd.readlines()

    for i in range(len(lines)):
        if imgTagPrefix not in lines[i]:
            continue

        lines[i] = lines[i].replace(cpath, ".")
        start = lines[i].index(imgTagPrefix) + 4
        end = lines[i][start:].index(imgTagSubfix)
        res.append(lines[i][start:end+start])

with open(filename, "w+") as fd:
    fd.writelines(lines)



print(res)

dels = [f for f in os.listdir(assets) if os.path.join(assets, f) not in res]
print("all files: ", res)
print("will cleanup unuseful files: ",  dels)

confirm = raw_input('Confirm[Y/N]?')

if confirm !=  "Y":
   os._exit(0)

for name in dels:
    print(os.path.join(assets, name))
    os.remove(os.path.join(assets, name))
