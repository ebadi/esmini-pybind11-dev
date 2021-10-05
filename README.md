
### Install the package
```
git clone https://github.com/ebadi/esmini-pybind11-dev.git
cd esmini-pybind11-dev
pip3 install ./esmini/
```
To test the python modules:
```
./test-python-package.sh
python3 scenarioplayer.py
python3 modlist.py
```
To use esminiLib and esminiRMLib, first make sure `libesminiLib.so` and `libesminiRMLib.so` are in `$PWD/esmini/bin`. Then `export LD_LIBRARY_PATH=$PWD/esmini/bin`.

Building esmini using the instruction below will automatically place these files in the correct location.

```
cd esmini ; cmake .; cmake --build . --config Release --target install ; cd ..
```

### Please ignore, dev only 
rebuilding pybind11 bindings (for development only): 
```
./dev-building-bindings.sh
```
