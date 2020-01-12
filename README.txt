###################### Initialization ################################
tbxmanager restorepath
addpath 'path_to_casadi-windows-matlabR2016a-v3.5.1'
import casadi.*
cd c:\gurobi900\win64\matlab 
gurobi_setup 
#################################################################

###################### Plots for deliverable #########################

For plots of every deliverable, you have to enter into the corresponding folder and run the commands below:

## deliverable 3.1:
draw('x');
draw('y');
draw('z');
draw("yaw") 

## deliverable 3.2:
draw('x');
draw('y');
draw('z');
draw("yaw");

## deliverable 4.1:
draw();

## deliverable 5.1:
draw();

## deliverable 6.1:
draw();
