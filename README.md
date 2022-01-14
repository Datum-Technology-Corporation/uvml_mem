# About
## [Home Page](https://datum-technology-corporation.github.io/uvml_mem/)
The Moore.io UVM Memory Library is a pure UVM solution for digital design simulations.  This project consists of the library (`uvml_mem_pkg`), the self-testing UVM environment (`uvme_mem_st_pkg`) and the test bench (`uvmt_mem_st_pkg`) to verify the library against itself.

## IP
* DV
> * uvml_mem
> * uvme_mem_st
> * uvmt_mem_st
* RTL
* Tools


# Simulation
**1. Change directory to 'sim'**

This is from where all jobs will be launched.
```
cd ./sim
```

**2. Project Setup**

Only needs to be done once, or when libraries must be updated. This will pull in dependencies from the web.
```
./setup_project.py
```

**3. Terminal Setup**

This must be done per terminal. The script included in this project is for bash:

```
export VIVADO=/path/to/vivado/bin # Set locaton of Vivado installation
source ./setup_terminal.sh
```

**4. Launch**

All jobs for simulation are performed via `mio`.

> At any time, you can invoke its built-in documentation:

```
mio --help
```

> To run test 'traffic' with seed '1' and wave capture enabled:

```
mio all uvmt_mem_st -t walk -s 1 -w
```
