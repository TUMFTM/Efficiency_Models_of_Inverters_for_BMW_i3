%clc;
A=0;
S=0;
B=0;
a=1;
Ppe=uicos(:,2).*uicos(:,3).*uicos(:,4);
M=0;
for i=1:length(Ppe)
    if(Ppe(i)>=0)
        A=A+Ppe(i);
        S=S+Ploss(i,2);
        B=B+Ppe(i);%+Ppe(i)*0.10
        M=M+iron_loss(i,2);
    else
        A=A+Ppe(i)*a;
        S=S+Ploss(i,2)*a;
        B=B-Ppe(i)*a;%-Ppe(i)*0.10
        M=M+iron_loss(i,2);
    end
end
A=A/3600000/sum(DRIVING_CYCLE(:,2))*100000;%total energy withdrawn from inverter
M=M/3600000/sum(DRIVING_CYCLE(:,2))*100000;%loss on motor
S=S/3600000/sum(DRIVING_CYCLE(:,2))*100000;%energy wasted on inverter
B=B/3600000/sum(DRIVING_CYCLE(:,2))*100000;%energy throughput of inverter
Copper_loss = sum(abs(Ppe - nT(:,2).*nT(:,3)*2*pi/60))/3600000/sum(DRIVING_CYCLE(:,2))*100000;
Conduction_loss = sum(CandSloss(:,2)+CandSloss(:,3))/3600000/sum(DRIVING_CYCLE(:,2))*100000
Switching_loss = sum(CandSloss(:,4)+CandSloss(:,5))/3600000/sum(DRIVING_CYCLE(:,2))*100000
A+S+M % total energy consumption
A % mechanic energy
S % total inverter loss
1-S/(S+B) % inverter efficiency
S+B %total throughput plus energy loss on inverter