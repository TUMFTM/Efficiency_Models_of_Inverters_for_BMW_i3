%clc;
%This script is used for post processing of DC shift method simulations
%However, this part of code is not directly used in the outer script
A = 0;
S = 0;
B = 0;
a = 1;%ratio of regeneration assumed, brake fully on regeneration
Ppe = uicos(:,2).*uicos(:,3).*uicos(:,4);
maximum_voltage = 147*sqrt(3);
M = 1;
DC_DC_Efficiency = 0.98;
if(mode == 1)%continuous adjustment
    index_V = uicos(:,2)<maximum_voltage;
    DC_loss = (1 - DC_DC_Efficiency)*abs(Ppe); 
    CandSloss(index_V,4) = CandSloss(index_V,4).* uicos(index_V,2) ./ maximum_voltage;
    CandSloss(index_V,5) = CandSloss(index_V,5).* uicos(index_V,2) ./ maximum_voltage;
else % pack switching
    DC_loss = 0.*Ppe;
    index_V = uicos(:,2)<maximum_voltage/2;
    CandSloss(index_V,4) = CandSloss(index_V,4)/2;
    CandSloss(index_V,5) = CandSloss(index_V,5)/2;
end
for i = 1:length(Ppe)
    if(Ppe(i)>=0)
        A = A + Ppe(i);
        S = S + CandSloss(i,2)+CandSloss(i,3)+CandSloss(i,4)+CandSloss(i,5)+DC_loss(i);
        B = B + Ppe(i);%+Ppe(i)*0.10
        M = M + iron_loss(i,2);
    else
        A = A + Ppe(i)*a;
        S = S + (CandSloss(i,2)+CandSloss(i,3)+CandSloss(i,4)+CandSloss(i,5)+DC_loss(i))*a;
        B = B - Ppe(i)*a;%-Ppe(i)*0.10
        M = M + iron_loss(i,2);
    end
end
A = A/3600000/sum(DRIVING_CYCLE(:,2))*100000;%total energy withdrawn from inverter
M = M/3600000/sum(DRIVING_CYCLE(:,2))*100000;%loss on motor
S = S/3600000/sum(DRIVING_CYCLE(:,2))*100000;%energy wasted on inverter
B = B/3600000/sum(DRIVING_CYCLE(:,2))*100000;%energy throughput of inverter
Copper_loss = sum(abs(Ppe - nT(:,2).*nT(:,3)*2*pi/60))/3600000/sum(DRIVING_CYCLE(:,2))*100000;
Conduction_loss = sum(CandSloss(:,2)+CandSloss(:,3))/3600000/sum(DRIVING_CYCLE(:,2))*100000;
Switching_loss = sum(CandSloss(:,4)+CandSloss(:,5))/3600000/sum(DRIVING_CYCLE(:,2))*100000;
DC_loss_total = sum(DC_loss)/3600000/sum(DRIVING_CYCLE(:,2))*100000;
A + S + M % total energy consumption
A % mechanic energy
S % total inverter loss
1 - S/(S+B) % inverter efficiency
S + B %total throughput plus energy loss on inverter
