# -*- coding: utf-8 -*-



import pyroadmanager
import pyplayerbase
import time

print(dir(pyplayerbase.ScenarioPlayer))
print("Python: running constructor")
player = pyplayerbase.ScenarioPlayer(["filename", "--window",  "60", "60", "800", "400",  "--osc", "./esmini/resources/xosc/cut-in.xosc"])
odr = player.GetODRManager()
print("GetODRManager", odr)
road = odr.GetRoadById(0)
print("GetODRManager..", road)

while not player.IsQuitRequested():
    print("x")
    player.Frame(1)
    time.sleep(1)
    print("GetParameterValueInt", player.GetParameterValueInt("test",1))

print("Done")

