- Fix documentation meta data (conf.py)
- Fix documentation 

1- Better solution for "ImportError: libesminiLib.so: cannot open shared object file: No such file or directory"
export LD_LIBRARY_PATH=$PWD/esmini/bin

2- Windows build

	- Test and see what happends when extra added parts are removed 
    - Test if we can compile a simpler pybind11 project
3- c++ string wrapper for C functions? or vise versa?

```
#python3 -c "import pyesminilib; print(dir(pyesminilib));"
#python3 -c "import pyesminirmlib; print(dir(pyesminirmlib));"
```

4- pass classes between modules
