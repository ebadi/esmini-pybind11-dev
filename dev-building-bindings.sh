#!/bin/bash

./build_esmini.sh

export LD_LIBRARY_PATH=$PWD/esmini/bin


IPATHS=" -Iesmini/externals/pugixml/ -Iesmini/EnvironmentSimulator/Modules/CommonMini/ -Iesmini/EnvironmentSimulator/Modules/RoadManager -Iesmini/EnvironmentSimulator/Modules/Controllers  -Iesmini/EnvironmentSimulator/Modules/PlayerBase -Iesmini/EnvironmentSimulator/Modules/ScenarioEngine/SourceFiles/  -Iesmini/EnvironmentSimulator/Modules/ScenarioEngine/OSCTypeDefs/ -Iesmini/EnvironmentSimulator/Modules/ViewerBase -Iesmini/EnvironmentSimulator/Libraries/esminiLib/  -Iesmini/EnvironmentSimulator/Libraries/esminiRMLib/ -Iesmini/bin/ -Iesmini/externals/OpenSceneGraph/linux/include/"




array=( playerbase roadmanager scenarioengine viewerbase controller esminilib esminirmlib )
for MYMODULE in "${array[@]}"
do
	echo $MYMODULE
	rm -rf $PWD/src/$MYMODULE ;  mkdir  $PWD/src/$MYMODULE
	~/binder/bin/binder --root-module py$MYMODULE --prefix $PWD/esmini/src/$MYMODULE --bind $MYMODULE  --single-file  --config $PWD/esmini/src/py$MYMODULE.cfg  $PWD/esmini/src/py$MYMODULE.hpp  -- -std=c++14 -DNDEBUG $IPATHS
done




#python3 -c "import pyroadmanager.roadmanager; print(dir(pyroadmanager.roadmanager));"
#python3 -c "import pyscenarioengine.scenarioengine; print(dir(pyscenarioengine.scenarioengine));"
#python3 -c "import pyplayerbase; print(dir(pyplayerbase.ScenarioPlayer));"
#python3 -c "import pyviewerbase; print(dir(pyviewerbase.viewer));"
#python3 -c "import pycontroller; print(dir(pycontroller.scenarioengine));"

#python3 -c "import pyesminilib; print(dir(pyesminilib));"
#python3 -c "import pyesminirmlib; print(dir(pyesminirmlib));"

#
# cd docs
# make html

