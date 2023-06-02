%Program written by Divya M 
%Fundamentals of Power System Economics by Daniel S % Kirschen & Goran Strbac

clc; clear all; close all;

% question 2.3
% Inverse demand function; IDF = -10q+2000
% Inverse supply function;  ISF = 5q + 200    from q = 0.2pi - 40

display('Part-a')
for i1 = 0:200
    IDF(i1+1) = -10*i1+2000;
    ISF(i1+1) = 5*i1 + 200;
end
A = [1 10; 1 -5];
B = [2000;200];
solution = linsolve(A,B);
market_clearing_price = solution(1)
equilibrium_demand = solution(2)

figure(1)
x = 1:i1+1;
set(gcf,'Name','Inverse Demand Function & Inverse Supply Function','Color','w')
plot(x,IDF,'-b','LineWidth',2)
hold on;
plot(x,ISF,'-r','LineWidth',2)
hold on;
plot(solution(2)+1,solution(1),'ks','LineWidth',2)
hold on;
plot(x,0,'-g','LineWidth',2)
hold on;
%grid on;
xlabel('No. of Products,q')
ylabel('pi')
title('Market Equilibrium')
txt = sprintf('Equilibrium point (q = %.2f, pi = %.2f)',solution(2),solution(1));
legend('Inverse Demand Function','Inverse Supply Function',txt);

display('Part-b')
consumption = solution(2)
gross_surplus = trapz(0:consumption,IDF(1:consumption+1))
net_surplus = trapz(0:consumption,IDF(1:consumption+1)-800)

figure(2)
abc = ones(1,consumption+1);
abc1 = solution(1)*abc;
set(gcf,'Name','Market Equilibrium','Color','w')
plot(x,IDF,'-b','LineWidth',2)
hold on;
plot(x,ISF,'-r','LineWidth',2)
hold on;
gross_surplus1 = area(0:consumption,IDF(1:consumption+1),'FaceColor',[0,0.25,0.25]);
hold on
revenue = area(0:consumption, abc1,'FaceColor',[0,0.75,0.75]);
hold on;
plot(x,0,'-g','LineWidth',2)
hold on;
xlabel('No. of Products,q')
ylabel('IDF and ISF,pi')
title('Consumers Surplus')
legend('Inverse Demand Function','Inverse Demand Function','Consumers Net Surplus');

producer_revenue =  trapz(0:consumption,abc1)
producer_profit =  trapz(0:consumption,800-ISF(1:consumption+1))
global_welfare = net_surplus + producer_profit

figure(3)
set(gcf,'Name','Market Equilibrium','Color','w')
plot(x,IDF,'-b','LineWidth',2)
hold on;
plot(x,ISF,'-r','LineWidth',2)
hold on;
producer_revenue1 =  area(0:consumption,abc1, 'FaceColor',[0,0.75,0.75])
%gross_surplus1 = area(0:consumption,IDF(1:consumption+1),'FaceColor',[0,0.25,0.25]);
hold on
producer_profit1 =  area(0:consumption,ISF(1:consumption+1))
hold on;
plot(x,0,'-g','LineWidth',2)
hold on;
xlabel('No. of Products,q')
ylabel('IDF and ISF,pi')
title('Producers Revenue & Profit')
legend('Inverse Demand Function','Inverse Demand Function','Producers profit');
