function F = PSO_road(k1_PSO,k2_PSO,k3_PSO,k4_PSO,k,model)



% signals
% k1=0.5/180*pi;
% k2=-0.5;
% k3=0.07;
% k4=-1.39;

k1=k1_PSO;
k2=k2_PSO;
k3=k3_PSO;
k4=k4_PSO;



out=sim(model);

t = out.tout;
P = out.P.data;
V = out.V.data;
S = out.S.data;

W_total=5000; % 总能量
length_t=length(t);
tao=377;%time trial
%tao=465;%sprinter
CP=0.25*1000;%time trial
%CP=0.21*1000;%sprinter
P=P.*1000;
delta_u=zeros(length_t,1);
W=zeros(length_t,1);
delta_u(1)=0;
for i_fcn=2:length_t
    delta_u(i_fcn)=t(i_fcn)-t(i_fcn-1);
end
W(1)=W_total;
temp1(1)=0;
temp2(1)=0;
for j_fcn=2:length_t
    temp1(j_fcn)=0;
    for i_fcn=2:j_fcn
        if P(i_fcn)>=CP
            temp2(j_fcn) = (P(i_fcn)-CP);
        else
            temp2(j_fcn) = 0;
        end
        temp1(j_fcn) = temp1(j_fcn) + exp(-(t(j_fcn)-t(i_fcn))/tao) * temp2(j_fcn) * delta_u(i_fcn)^2;
    end
    W(j_fcn) = W_total - temp1(j_fcn);
end
% figure
% plot(W)
% figure
% plot(P)
 
 g_PSO=-min(W);
 if g_PSO>0
     q_PSO=log(g_PSO+10);
 else
     q_PSO=0;
 end

 if q_PSO<2
     theta_PSO=10000000;
 elseif q_PSO<3
     theta_PSO=20000000;     
 elseif q_PSO<4
     theta_PSO=100000000;  
 else
      theta_PSO=300000000;
 end

 if q_PSO<1
     gamma_PSO=1;
 else
     gamma_PSO=2;
 end
 
 H_PSO=theta_PSO*(q_PSO.^gamma_PSO);
 F=max(t)+k*sqrt(k)*H_PSO;

 disp(k)
 disp(min(W))
 disp(F)
end