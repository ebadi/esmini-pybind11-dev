# -*- coding: utf-8 -*-



import pyroadmanager
import pyplayerbase
import time

od= pyroadmanager.roadmanager.OpenDrive()

j= od.GetJunctionById(0)
print(od)
print(j)

print(dir(pyplayerbase.ScenarioPlayer))
print("Python: running constructor")
player = pyplayerbase.ScenarioPlayer(["filename", "--window",  "60", "60", "800", "400",  "--osc", "./esmini/resources/xosc/cut-in.xosc"])

while not player.IsQuitRequested():
    print("x")
    player.Frame(1)
    time.sleep(1)
    print("GetParameterValueInt", player.GetParameterValueInt("test",1))

print("Done")

