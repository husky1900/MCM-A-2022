function [r,s] = road(x)
    filename = 'Fuji_TT_Circuit_3.xlsx';          %文件名
    num = xlsread(filename); 
   for i = 1:size(num,1)
   %fprintf('value of i: %d\n',i)
    if num(i,3)<=x &&  num(i+1,3)>x
       r=num(i,1);
       s=num(i,2);
       break;
    end
   end
end