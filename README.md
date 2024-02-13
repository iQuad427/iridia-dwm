
# IRIDIA-DWM

This repository is a starting point to use the DWM1001 module from Decawave (Qorvo) as a communication device. The project was conducted at [IRIDIA](https://code.ulb.ac.be/lab/IRIDIA) (the Artificial Intelligence research laboratory of the Université Libre de Bruxelles) by Quentin Roels as a master project.

Contact me at : 
- quentin.roels@gmail.com

> Note : here is a source I discovered later in my project, that would have been quite usefull to start working properly faster
> https://github.com/TIERS/dwm1001-uwb-firmware

> Might want to look into the Zephyr software and the following git repository later on : https://github.com/foldedtoad/dwm1001

## Project description

The main goal of the project was to design and implement different communication protocols between UWB modules. However, as the previous work on the selected module (DWM1001) were inconclusive, the project was started by creating a basis to allow for further implementation. 

Thus, this repository contains many firmware projects for the module that are example files created to get a better understanding of the tools. They were kept in the repository to allow motivated people to have other examples file to build from.

## Configuration

As many problem were faced to find a conclusive configuration to build on the chosen modules, the following section list the best configuration found and used to program on the modules.

### SEGGER Embedded Studio

SEGGER Embedded Studio is a really powerful and simple to use tool. However, many problems arise depending on the version used since newer versions are not retrocompatible with older versions (on which the basic firmware and packages were implemented). The best trade-off I found between older compatible version and newest features is "[SEGGER Embeddedd Studio for ARM 5.64](https://www.segger.com/downloads/embedded-studio/)" which is also compatible with Apple M1 processor.

#### Configuration

The repository is self contained for SEGGER Embedded Studio, all paths are relative to the current repository structure and all needed packages and drivers are in the lib folder. 

It is designed as a plug-in solution, clone the repo, duplicate an example project and start programming. It should compile properly. However, If you want to change the repo structure you will need to play a lot with the projects relative paths to drivers and libraries

**For everything to work properly, I advise you to keep the repository structure as it is, only duplicate and rename existing projects, do not try to move an existing file or create one from scratch, It won't work because of all the mandatory relative path currently required by the projects** (cf. the troubleshooting section for creating a new SES project)

#### Start-up

To start working on your own SEGGER Embedded Studio project, I recommend that you duplicate the "hello_world" project (/src/embedded/SEGGER Embedded Studio/hello_world) that already has many well defined dependencies to important libraries. From that example, you would get the main file containing the controller loop of the program, allowing you to implement basic program directly out of the box.

### Keil µVision 5

Keil is an other possiblity to program the DWM1001-DEV Boards. It is a really good IDE for embedded programming due to its packaqge versioning tool. It works pretty well but I mainly used SEGGER Embedded Studio since it is more user friendly and available on Mac and Linux, which is not the case of Keil µVision 5. I'll still explain how to configure Keil since it is a really powerful tool.

Mainly useful if you want to program with multi-threading and/or interrupts since CMSIS packages can easily be downloaded with the package downloader tool. SEGGER Enmedded Studio won't help you much with packages. However, Since my threading tests were not concluent, I did not experiment much with the DWM1001 API in Keil, the experimental projects can still be found in the corresponding source file.

#### Configuration informations 

- Operating System : Windows
- IDE for Embedded programming : Keil µVision 5
	- [MDK Version 5](https://www2.keil.com/mdk5?__KEIL__=%2FwEPDwULLTEwNjQzOTU5MzRkZBvdkEi7GvmptyC3QErRD4GQO17g65VwqM3PCimCpK9G&__WWW2__=03993DAC) (which is the development kit of Keil)
- Compiler : ARM Compiler v5.06 update 7 (build 960)

> Note : Keil µVision is only available on Windows, use SEGGER Embedded Studio for Linux and MacOs.

#### Packages

Those are packages is used for the Keil µVision example projects, they are required to compile and download corresponding firmware on the modules

- nRF_DeviceFamilyPack : 8.15.4
- CMSIS : 4.5.0
	- Driver : 2.7.2

> Project specific packages should be specified at the start of the main file of each project (if I did my job well)

#### Compiler 

As stated previously, the compiler used is the "ARM Compiler v5.06 update 7 (build 960)". To use it in Keil you must add the dependency through the project parameters.

#### Start-up

To start working on your own Keil µVision project, I recommend that you duplicate the "hello_world" project (/src/embedded/Keil µVision/hello_world) that already has many well defined dependencies to important libraries. From that example, you would get the main file containing the controller loop of the program, allowing you to implement basic program directly out of the box.

> Note : For any additional packages, Keil has a really good package installer and overall is great at managing versions of the packages installed and included in the project.

## Troubleshooting

### New SES Project not Compiling 

Whenever you want to create a new project, be aware of the following to ensure a working configuration :
- You should duplicate an existing project, it already contains a lot of woking dependencies
- You must add all the files you are going to use in the project explorer of SES
	- Change the relative path macro to the libraries
		1. In project explorer tab, right click on "Solution 'name_of_solution'"
		2. Go to "Options..." > "Code" > "Build" > "Project macros"
		3. Change or add : RELATIVE_PATH to be the relative path to the base directory of the project (containing src, lib,...)
	- Change the paths to include files
		1. In project explorer tab, right click on "Project 'name_of_project'"
		2. Go to "Options..." > "Code" > "Preprocessor" > "User Include Directories"
		3. If not already done, change all paths before the /lib to $(RELATIVE_PATH)
	- For each file.c that you want to use in your project
		1. Create a directory in the project (Right click on "Project" in project explorer tab and click on "New Folder...")
		2. Right click on the new directory and select "Add Existing File..."
		3. Navigate to the file you want to add to the project and double-click on it

IMPORTANT NOTES : If you have changed the depth of the project files (i.e. you moved the folder that you duplicated), all the files that were added to the project are now wrongly added. Since all files are added using relative path from the SES project file. You will need to add them all once again manually, be organized!

The error that typically occurs when this is not done properly is a simple ```Build Error``` with zero other information, if its your case, you better start all the steps again from the duplication part.
