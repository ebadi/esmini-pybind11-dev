# -*- coding: utf-8 -*-


import pyplayerbase
import time

print(dir(pyplayerbase.ScenarioPlayer))
print("Python: running constructor")
player = pyplayerbase.ScenarioPlayer()
print("Python: after constructor")
print("GetFixedTimestep", player.GetFixedTimestep())
print("IsQuitRequested", player.IsQuitRequested())

while not player.IsQuitRequested():
    print("x")
    player.Frame(1)
    time.sleep(1)
    print("GetParameterValueInt", player.GetParameterValueInt("test",1))

print("Done")
