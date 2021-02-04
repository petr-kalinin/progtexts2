#!/usr/bin/python3
for j in range(2, 7):
    print("=====  =======  ==  ", end="")
print()
for i in range(16):
    for j in range(2, 8):
        print(" {:3d}    ``{}``       ".format(j*16+i, chr(j*16+i)), end="")
    print("")
for j in range(2, 7):
    print("=====  =======  ==  ", end="")
