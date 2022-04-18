t = out.tout;
P = out.P.data;
V = out.V.data;
S = out.S.data;

W_total=12000; % 总能量
length_t=length(t);
tao=300;
CP=0.4*1000;
P=P.*1000;
delta_u=zeros(length_t,1);
W=zeros(length_t,1);
delta_u(1)=0;
for i=2:length_t
    delta_u(i)=t(i)-t(i-1);
end
W(1)=W_total;
temp1(1)=0;
temp2(1)=0;
for j=2:length_t
    temp1(j)=0;
    for i=2:j
        if P(i)>=CP
            temp2(j) = (P(i)-CP);
        else
            temp2(j) = 0;
        end
        temp1(j) = temp1(j) + exp(-(t(j)-t(i))/tao) * temp2(j) * delta_u(i)^2;
    end
    W(j) = W_total - temp1(j);
end
figure
plot(W)
figure
plot(P)
