# -*- coding: utf-8 -*-



import pyroadmanager
import pyplayerbase
import pyscenarioengine
import time

print(dir(pyplayerbase.ScenarioPlayer))
print("Python: running constructor")
player = pyplayerbase.ScenarioPlayer(["filename", "--window",  "60", "60", "800", "400",  "--osc", "./esmini/resources/xosc/cut-in.xosc"])
odr = player.GetODRManager()
se= player.scenarioEngine
print("scenarioEngine", se)
print("scenarioEngine", dir(se))
print("scenarioEngine method:", se.GetHeadstartTime())
print("GetODRManager", odr)
road = odr.GetRoadById(0)
print("GetODRManager::", road)
print("road.Print()::")

road.Print()
while not player.IsQuitRequested():
    print("x")
    player.Frame(1)
    time.sleep(1)
    print("GetParameterValueInt", player.GetParameterValueInt("test",1))

print("Done")

