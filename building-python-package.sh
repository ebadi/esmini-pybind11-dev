#!/bin/bash

pip3 install esmini/

export LD_LIBRARY_PATH=$PWD/esmini/bin

array=( playerbase roadmanager scenarioengine viewerbase controller esminilib esminirmlib )
for MYMODULE in "${array[@]}"
do
	echo $MYMODULE
  python3 -c "import py$MYMODULE; print(dir(py$MYMODULE));"
done

#cd docs
#make html