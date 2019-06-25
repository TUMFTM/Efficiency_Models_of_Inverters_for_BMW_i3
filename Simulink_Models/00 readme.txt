ComplexTherma_Test_IGBT_Revised.slx is used to calculate the BMW i3 powertrain
Motor_Revised_MOSFET_CHB.slx is used to calculate the CHB performance in BMW i3 powertrain
Motor_Revised_SiC.slx is used to calculate the SiC MOSFET inverter performance in BMW i3 powertrain
Motor_Revised_CHB_THD.slx is used to calculate the losses caused by harmonics, only used in section 4.4.4 in the dissertation.

After loading a driving cycle, and change the time setting, any one of the slx models can be used. However, the results are only loaded in the scopes in Simulink and the workspace of MATLAB. The results are still subject to further post processing, before obtaining the final results. This task is mainly handled by the following two m files.

EfficiencyCalculation_Motor_Revised.m is to calculate the efficiency of the inverter
EfficiencyCalculation.m is to post process the results and obtain the efficiency improvement of two DC voltage shifting approaches.

