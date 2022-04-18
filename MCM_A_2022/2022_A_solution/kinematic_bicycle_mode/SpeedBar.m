 days = 0:1000:3000;
conc=[61.783,59.78, 57.816,55.605];
 b = bar(days,conc,0.4);%绘柱状图，赋值图形句柄给b
 hold on;
 p = plot(days,conc,'Color',[255,140,0]/255,'LineWidth',1.5);%绘折线图，赋值图形句柄给p

 set(b, 'FaceColor', [71,130,180]/255);
 ylabel('Time(min)')
 xlabel('Altitude(m)')
 
 %%
 
days = [0 6 10 15 20 25 30];
conc=[3748 3798 3842.3 3909.9 3992 0 0]./60;
 b = bar(days,conc,0.8);%绘柱状图，赋值图形句柄给b
 hold on;

 
 p = plot(days(1:5),conc(1:5),'Color',[255,140,0]/255,'LineWidth',1.5);%绘折线图，赋值图形句柄给p

 days = [25 30 ];
conc=[5600 5600]./60;
 set(b, 'FaceColor', [71,130,180]/255);
 b2 = bar(days,conc,0.8);%绘柱状图，赋值图形句柄给b
set(b2, 'FaceColor', [175,197,221]/255);
 ylabel('Time(min)')
 xlabel('Altitude(m)')
 axis ([-5 35 40 70])
 %%
  days = 10:5:30;
conc=[65*60/1000 3.7839 3.7254 3.7073 3.6900]*1000/60;
 b = bar(days,conc,0.4);%绘柱状图，赋值图形句柄给b
 hold on;
 p = plot(days,conc,'Color',[255,140,0]/255,'LineWidth',1.5);%绘折线图，赋值图形句柄给p

 set(b, 'FaceColor', [71,130,180]/255);
 ylabel('Time(min)')
 xlabel('Temperature(\circC)')
  axis ([5 35 40 70])