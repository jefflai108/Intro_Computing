clear; clc; close all;
%% Load data and declare variables
x=load('matlab.dat');
% transpose x
x=x.';
% assign each position's PER value to different variables 
position_1=x(1:13);
position_2=x(14:26);
position_3=x(27:39);
position_4=x(40:52);
position_5=x(53:65);
% create variable years and assigned year 2003 and 2015 by usign for loop   
years = [];
for i=3:1:15
    years(end+1) = 2000+i;
end

%% Plotting Graphs
figure;
subplot(2,1,1);
plot(years,position_1,'-ro');
hold on;

plot(years,position_2,'-go');

plot(years,position_3,'-bo');

plot(years,position_4,'-co');

plot(years,position_5,'-mo');

xlabel('Season');
ylabel('Player PER');
title('Each Position PER over each NBA season');
legend('Position 1', 'Position 2','Position 3', 'Position 4','Position 5','Location','northwest')
hold off;
% generate trendline for each position on another plot
subplot(2,1,2);
hold on;
coeff1 = polyfit(years, position_1,1);
y1 = polyval(coeff1, years);
plot(years, y1, 'r-');
r1=1-sum((position_1-y1).^2)/sum((position_1-mean(position_1)).^2);

coeff2 = polyfit(years, position_2,1);
y2 = polyval(coeff2, years);
plot(years, y2, 'g-');
r2 =1-sum((position_2-y2).^2)/sum((position_2-mean(position_2)).^2);

coeff3 = polyfit(years, position_3,1);
y3 = polyval(coeff3, years);
plot(years, y3, 'b-');
r3 =1-sum((position_3-y3).^2)/sum((position_3-mean(position_3)).^2);

coeff4 = polyfit(years, position_4,1);
y4 = polyval(coeff4, years);
plot(years, y4, 'c-');
r4 =1-sum((position_4-y4).^2)/sum((position_4-mean(position_4)).^2);

coeff5 = polyfit(years, position_5,1);
y5 = polyval(coeff5, years);
plot(years, y5, 'm-');
r5 =1-sum((position_5-y5).^2)/sum((position_5-mean(position_5)).^2);;

xlabel('Season');
ylabel('Player PER');
title('Trendline for Each Position PER over each NBA season trendline');
legend('Trendline 1', 'Trendline 2','Trendline 3', 'Trendline 4','Trendline 5','Location','northwest')
hold off;
% Vector of r_squared values
rsquared = [r1 r2 r3 r4 r5];
%% Write into a separate file 
fid = fopen('myfile.txt','w')
for i=1:1:5
       fprintf(fid,'R^2 Value for Position %i is: %1.3f \n', i, rsquared(i));
end
fclose(fid)

