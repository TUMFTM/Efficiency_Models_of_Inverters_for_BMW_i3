# Efficiency Inverters
  
This project aims to model the efficiency and the reliability of inverters.
In terms of efficiency, the inverter in BMW i3, using Infineon IGBT FS800R07A2E3 is modelled. A SiC MOSFET inverter and Cascaded H-Bridges (CHB) are also modelled, which have exactly the same output capability compared to the IGBT inverter. For more details please refer to the paper: 

F. Chang, O. Ilina, L. Voss, and M. Lienkamp, Improving the Overall Efficiency of Automotive Inverters Using a Multilevel Converter Composed of Low Voltage Si MOSFETs, IEEE Trans. Power Electron., vol. 34, no. 4, 2018.

However, these models are specific to the switches and inverters. The author cannot guaranty the validy and the accuracy of the model still hold, when trying to extra-polate or reshape the map.

## Getting Started
As long as MATLAB is installed, downloading the model is sufficient for the usage.
  
### Prerequisites
As the models are programmed in MATLAB 2017b\Simulink 2017b, necessary licenses are required
Nonetheless, in Simulink, no specific package is used. Hence, a basic license is sufficient. 
  
### How to use
Here explanations regarding how to use the tool

### Obtain Efficiency

In order to evaluate the efficiency of the three inverters in BMW i3 in different driving cycles, the user is recommended to follow the steps below:

#### Step 1:

Downloaded repository

#### Step 2: 
Open the file Efficiency_In_Driving_Cycles.m in MATLAB

#### Step 3: 
Select the inverter to simulate, by copying the commented code in line 16-19 and replace line 15

#### Step 4: 
Run the MATLAB code, the running involves corresponding Simulink models, which could take some time.

#### Step 5: 
Collect the results from the workspace of MATLAB, following the comment in 7-11, where the variables are defined


#### Additional Information: 
However, this tool is just directly showing the simulation results of the three inverters in driving cycle. In order to just use the loss models of inverters, the user is referred to Efficiency/Simulink_Models, where three simulink files can be found. 
Each simulink file contains a BMW i3 powertrain model (vehicle longitudinal model + motor model) and an inverter model. All the inverter models are written in *.m code and are well commented. Therefore, the inverter models can be directly used as m functions, for any Simulink or Matlab project.

## Deployment
* [Matlab R2017b](https://de.mathworks.com/products/matlab.html) 
  
## Versioning
First version
  
## Authors
Fengqi Chang
  
## License
This project is licensed under the LGPL License - see the LICENSE.md file for details
 
 
## Sources
Improving the Overall Efficiency of Automotive Inverters Using a Multilevel Converter Composed of Low Voltage Si MOSFETs, doi: 10.1109/TPEL.2018.2854756

## Link to the Paper
Please find the paper [here](https://www.researchgate.net/publication/326311088_Improving_the_Overall_Efficiency_of_Automotive_Inverters_Using_a_Multilevel_Converter_Composed_of_Low_Voltage_Si_MOSFETs), in which the sources of all constant values are given.
