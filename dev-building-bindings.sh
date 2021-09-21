#!/bin/bash

IPATHS=" -Iesmini/externals/pugixml/ -Iesmini/EnvironmentSimulator/Modules/CommonMini/ -Iesmini/EnvironmentSimulator/Modules/RoadManager -Iesmini/EnvironmentSimulator/Modules/Controllers  -Iesmini/EnvironmentSimulator/Modules/PlayerBase -Iesmini/EnvironmentSimulator/Modules/ScenarioEngine/SourceFiles/  -Iesmini/EnvironmentSimulator/Modules/ScenarioEngine/OSCTypeDefs/ -Iesmini/EnvironmentSimulator/Modules/ViewerBase -Iesmini/EnvironmentSimulator/Libraries/esminiLib/  -Iesmini/EnvironmentSimulator/Libraries/esminiRMLib/ -Iesmini/bin/ -Iesmini/externals/OpenSceneGraph/linux/include/"

array=( playerbase roadmanager scenarioengine viewerbase controller esminilib esminirmlib )
for MYMODULE in "${array[@]}"
do
	echo $MYMODULE
	rm -rf $PWD/esmini/src/$MYMODULE ;  mkdir  $PWD/esmini/src/$MYMODULE
	~/binder/bin/binder --root-module py$MYMODULE --prefix $PWD/esmini/src/$MYMODULE --bind $MYMODULE  --single-file  --config $PWD/esmini/src/py$MYMODULE.cfg  $PWD/esmini/src/py$MYMODULE.hpp  -- -std=c++14 -DNDEBUG $IPATHS
done
