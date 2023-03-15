
# IRIDIA-DWM

This repository is a starting point to use the DWM1001 module from Decawave (Qorvo) as a communication device. The project was conducted at [IRIDIA](https://code.ulb.ac.be/lab/IRIDIA) (the Artificial Intelligence research laboratory of the Université Libre de Bruxelles) by Quentin Roels as a master project.

Contact me at : 
- quentin.roels@gmail.com

> Note : here is a source I discovered later in my project, that would have been quite usefull to start working properly faster
> https://github.com/TIERS/dwm1001-uwb-firmware

## Project description

The main goal of the project was to design and implement different communication protocols between UWB modules. However, as the previous work on the selected module (DWM1001) were inconclusive, the project was started by creating a basis to allow for further implementation. 

Thus, this repository contains many firmware projects for the module that are example files created to get a better understanding of the tools. They were kept in the repository to allow motivated people to have other examples file to build from.

## Configuration

As many problem were faced to find a conclusive configuration to build on the chosen modules, the following section list the best configuration found and used to program on the modules.

### Software 

- Operating System : Windows
- IDE for Embedded programming : Keil µVision 5
	- [MDK Version 5](https://www2.keil.com/mdk5?__KEIL__=%2FwEPDwULLTEwNjQzOTU5MzRkZBvdkEi7GvmptyC3QErRD4GQO17g65VwqM3PCimCpK9G&__WWW2__=03993DAC) (which is the development kit of Keil)
- Compiler : ARM Compiler v5.06 update 7 (build 960)

> Note : Keil µVision is only available on Windows, there exist an other solution called SEGGER Embedded Studio which can also run on Linux and MacOs, but too many problem were faced while trying to create DWM1001 firmwares with it.

### Packages

- nRF_DeviceFamilyPack : 8.15.4
- CMSIS : 4.5.0
	- Driver : 2.7.2

> Project specific packages should be specified at the start of the main file of each project (if I did my job well)

## Start-up

To start working on your own Keil µVision project, I recommend that you duplicate the "hello_world" project (/src/embedded/Keil µVision/hello_world) that already has many well defined dependencies to important libraries. From that example, you would get the main file containing the controller loop of the program, allowing you to implement basic program directly out of the box.

For any additional packages, Keil has a really good package installer and overall is great at managing versions of the packages installed and included in the project.

