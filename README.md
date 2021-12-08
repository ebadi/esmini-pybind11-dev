
### Install the package
```
git clone https://github.com/ebadi/esmini-pybind11.git
cd esmini-pybind11
pip3 install .
```
To test the python modules, download the esmini resources and run the following scripts:
```
python3 example/scenarioplayer.py
python3 example/intermodule.py.py
```

To automatically extract the list of methods:
```
./test-python-package.sh
python3 example/modlist.py
```

### Documentation
To find the API documentation, follow these [https://ebadi.github.io/esmini-pybind11](https://ebadi.github.io/esmini-pybind11)

### Development only 
rebuilding pybind11 bindings (for development only): 
```
./dev-building-bindings.sh
rm LOG_FILE ; pip3 install .  --log LOG_FILE
```
Generating API documentation 
```
cd documentation; 
./doc-build.sh
```
 
### Credits
This work is done by [Infotiv AB](https://www.infotiv.se) under [VALU3S](https://valu3s.eu) project. This project has received funding from the [ECSEL](https://www.ecsel.eu) Joint Undertaking (JU) under grant agreement No 876852. The JU receives support from the European Union’s Horizon 2020 research and innovation programme and Austria, Czech Republic, Germany, Ireland, Italy, Portugal, Spain, Sweden, Turkey.

The ECSEL JU and the European Commission are not responsible for the content on this website or any use that may be made of the information it contains.

[ScenarioGenerator](https://github.com/ebadi/ScenarioGenerator) project is started and is currently maintained by [Hamid Ebadi](https://github.com/ebadi).