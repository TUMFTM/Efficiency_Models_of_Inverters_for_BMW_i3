clear;
clc;
addpath('Driving_Cycles')
addpath('Simulink_Models')

vehicle_weight  = 1443.331;
EV_array = zeros(8,1);              %consumption of BEV in different driving cycles
Efficiency_array = zeros(8,1);      %efficiency of inverter in different driving cycles
Conduction_loss_array = zeros(8,1); %conduction loss of inverter in different driving cycles
Switching_loss_array = zeros(8,1);  %switching loss of inverter in different driving cycles
Inverter_loss_array = zeros(8,1);   %total loss of inverter in different driving cycles
% All energy values are converted to kWh/100km
k = 0;
efficiency_calc = 'EfficiencyCalculation_Motor_Revised.m';
model = 'Motor_Revised_MOSFET_CHB.slx';%for CHB
% model = 'Motor_Revised_SiC.slx' %for SiC MOSFET inverter
% model = 'Motor_Revised_MOSFET_CHB.slx' %for CHB
% model = 'ComplexTherma_Test_IGBT_Revised.slx' %for IGBT inverter

load('01 USA_NECC.mat')
k = k + 1;
time = length(DRIVING_CYCLE);
sim(model);
run(efficiency_calc);
EV_array(k) = A+S+M;
Efficiency_array(k) = 1-S/(S+B);
Conduction_loss_array(k) = Conduction_loss;
Switching_loss_array(k) = Switching_loss;
Inverter_loss_array(k) = S;
clc;

load('02 EUROPE_City.mat')
k = k + 1;
time = length(DRIVING_CYCLE);
sim(model);
run(efficiency_calc);
EV_array(k) = A+S+M;
Efficiency_array(k) = 1-S/(S+B);
Conduction_loss_array(k) = Conduction_loss;
Switching_loss_array(k) = Switching_loss;
Inverter_loss_array(k) = S;
clc;

load('03 USA_CITY_II.mat')
k = k + 1;
time = length(DRIVING_CYCLE);
sim(model);
run(efficiency_calc);
EV_array(k) = A+S+M;
Efficiency_array(k) = 1-S/(S+B);
Conduction_loss_array(k) = Conduction_loss;
Switching_loss_array(k) = Switching_loss;
Inverter_loss_array(k) = S;
clc;

load('04 USA_FTP_72.mat')
k = k + 1;
time = length(DRIVING_CYCLE);
sim(model);
run(efficiency_calc);
EV_array(k) = A+S+M;
Efficiency_array(k) = 1-S/(S+B);
Conduction_loss_array(k) = Conduction_loss;
Switching_loss_array(k) = Switching_loss;
Inverter_loss_array(k) = S;
clc;

load('05 EUROPE_NEDC.mat')
k = k + 1;
time = length(DRIVING_CYCLE);
sim(model);
run(efficiency_calc);
EV_array(k) = A+S+M;
Efficiency_array(k) = 1-S/(S+B);
Conduction_loss_array(k) = Conduction_loss;
Switching_loss_array(k) = Switching_loss;
Inverter_loss_array(k) = S;
clc;

load('06 WLTP_C3.mat')
k = k + 1;
time = length(DRIVING_CYCLE);
sim(model);
run(efficiency_calc);
EV_array(k) = A+S+M;
Efficiency_array(k) = 1-S/(S+B);
Conduction_loss_array(k) = Conduction_loss;
Switching_loss_array(k) = Switching_loss;
Inverter_loss_array(k) = S;
clc;

load('07 EUROPE_ARTEMIS_MOTORWAY150.mat')
k = k + 1;
time = length(DRIVING_CYCLE);
sim(model);
run(efficiency_calc);
EV_array(k) = A+S+M;
Efficiency_array(k) = 1-S/(S+B);
Conduction_loss_array(k) = Conduction_loss;
Switching_loss_array(k) = Switching_loss;
Inverter_loss_array(k) = S;
clc;

load('08 EUROPE_ARTEMIS_MOTORWAY130.mat')
k = k + 1;
time = length(DRIVING_CYCLE);
sim(model);
run(efficiency_calc);
EV_array(k) = A+S+M;
Efficiency_array(k) = 1-S/(S+B);
Conduction_loss_array(k) = Conduction_loss;
Switching_loss_array(k) = Switching_loss;
Inverter_loss_array(k) = S;
clc;

if strcmp(model,'Motor_Revised_MOSFET_CHB.slx')
    Inverter_Name = 'CHB';
elseif strcmp(model,'Motor_Revised_SiC.slx')
    Inverter_Name = 'SiC MOSFET';
else
    Inverter_Name = 'IGBT';
end

clc;
disp(strcat(Inverter_Name,' is simulated'))
disp('please find consumption of BEV in different driving cycles in EV_array')
disp('efficiency of inverter in different driving cycles in Efficiency_array')
disp('conduction loss of inverter in different driving cycles in Conduction_loss_array')
disp('switching loss of inverter in different driving cycles in Switching_loss_array')
disp('total loss of inverter in different driving cycles in Inverter_loss_array')
