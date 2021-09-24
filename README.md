
### Install and run the pyplayerbase package
```
git clone https://github.com/ebadi/esmini-pybind11-dev.git
cd esmini-pybind11-dev
./dev-building-bindings.sh
```
Note that you have to place `libesminiLib.so` in `$PWD/esmini/bin`. Building esmini using the instruction below will automatically do that for you. 
```
./building-python-package.sh
export LD_LIBRARY_PATH=$PWD/esmini/bin ; python3 scenarioplayer.py
```



Building esmini:
```
cd esmini ; cmake .; cmake --build . --config Release --target install ; cd ..
```

### Please ignore, dev only 
rebuilding pybind11 bindings (for development only): 
```
IPATHS=" -Iesmini/externals/pugixml/ -Iesmini/EnvironmentSimulator/Modules/CommonMini/ -Iesmini/EnvironmentSimulator/Modules/RoadManager -Iesmini/EnvironmentSimulator/Modules/Controllers  -Iesmini/EnvironmentSimulator/Modules/PlayerBase -Iesmini/EnvironmentSimulator/Modules/ScenarioEngine/SourceFiles/  -Iesmini/EnvironmentSimulator/Modules/ScenarioEngine/OSCTypeDefs/ -Iesmini/EnvironmentSimulator/Modules/ViewerBase -Iesmini/EnvironmentSimulator/Libraries/esminiLib/  -Iesmini/EnvironmentSimulator/Libraries/esminiRMLib/ -Iesmini/bin/ -Iesmini/externals/OpenSceneGraph/linux/include/"

MYMODULE=playerbase

rm -rf $PWD/src/$MYMODULE ;  mkdir  $PWD/src/$MYMODULE

~/binder/bin/binder --root-module py$MYMODULE --prefix $PWD/esmini/src/$MYMODULE --bind $MYMODULE  --single-file  --config $PWD/esmini/src/py$MYMODULE.cfg  $PWD/esmini/src/py$MYMODULE.hpp  -- -std=c++14 -DNDEBUG $IPATHS
```

Building esmini:
```
cd esmini ; cmake .; cmake --build . --config Release --target install ; cd ..
```
