# -*- coding: utf-8 -*-


import pyplayerbase
import time

print(dir(pyplayerbase.ScenarioPlayer))
print("Python: running constructor")
player = pyplayerbase.ScenarioPlayer()
print("Python: after constructor")
print(player.GetFixedTimestep())
while True:
    print("x")
    player.Frame(1)
    time.sleep(1)

print("Done")
