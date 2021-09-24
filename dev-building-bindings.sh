#!/bin/bash

IPATHS=" -Iesmini/externals/pugixml/ -Iesmini/EnvironmentSimulator/Modules/CommonMini/ -Iesmini/EnvironmentSimulator/Modules/RoadManager -Iesmini/EnvironmentSimulator/Modules/Controllers  -Iesmini/EnvironmentSimulator/Modules/PlayerBase -Iesmini/EnvironmentSimulator/Modules/ScenarioEngine/SourceFiles/  -Iesmini/EnvironmentSimulator/Modules/ScenarioEngine/OSCTypeDefs/ -Iesmini/EnvironmentSimulator/Modules/ViewerBase -Iesmini/EnvironmentSimulator/Libraries/esminiLib/  -Iesmini/EnvironmentSimulator/Libraries/esminiRMLib/ -Iesmini/bin/ -Iesmini/externals/OpenSceneGraph/linux/include/"

array=( playerbase roadmanager scenarioengine  controller )
for MYMODULE in "${array[@]}"
do
	echo $MYMODULE
	rm -rf $PWD/esmini/EnvironmentSimulator/src/$MYMODULE
	mkdir  $PWD/esmini/EnvironmentSimulator/src/$MYMODULE
	~/binder/bin/binder --annotate-includes --trace --root-module py$MYMODULE --prefix $PWD/esmini/EnvironmentSimulator/src/$MYMODULE --bind $MYMODULE  --single-file  --config $PWD/esmini/EnvironmentSimulator/src/py$MYMODULE.cfg  $PWD/esmini/EnvironmentSimulator/src/py$MYMODULE.hpp  -- -std=c++14 -DNDEBUG $IPATHS
done

MYMODULE="viewerbase"
rm -rf $PWD/esmini/EnvironmentSimulator/src/$MYMODULE
mkdir  $PWD/esmini/EnvironmentSimulator/src/$MYMODULE
~/binder/bin/binder --annotate-includes --trace --root-module py$MYMODULE --prefix $PWD/esmini/EnvironmentSimulator/src/$MYMODULE --bind viewer --single-file  --config $PWD/esmini/EnvironmentSimulator/src/py$MYMODULE.cfg  $PWD/esmini/EnvironmentSimulator/src/py$MYMODULE.hpp  -- -std=c++14 -DNDEBUG $IPATHS


## no binding
array=( esminilib esminirmlib )
for MYMODULE in "${array[@]}"
do
	echo $MYMODULE
	rm -rf $PWD/esmini/EnvironmentSimulator/src/$MYMODULE
	mkdir  $PWD/esmini/EnvironmentSimulator/src/$MYMODULE
	~/binder/bin/binder --annotate-includes --trace --root-module py$MYMODULE --prefix $PWD/esmini/EnvironmentSimulator/src/$MYMODULE --bind ""  --single-file  --config $PWD/esmini/EnvironmentSimulator/src/py$MYMODULE.cfg  $PWD/esmini/EnvironmentSimulator/src/py$MYMODULE.hpp  -- -std=c++14 -DNDEBUG $IPATHS
done
