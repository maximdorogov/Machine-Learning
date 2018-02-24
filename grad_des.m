clear all, close all, clc

%data_y = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16];
%x = 0:length(data_y)-1;
x = 0:10:1000;
data_y = 2 + x.*2 + 150*randn(1,length(x));

%plot(x,data_y,'o')
%return

%fijo valores iniciales para mis parametros
tita0 = 20;
tita1 = 5;

alfa = 10e-9;

iter = 1;

while 1
  
       res_0 = (1/length(data_y))*alfa*sum(tita0+x.*tita1-data_y);
       res_1 = (1/length(data_y))*alfa*sum((tita0+x.*tita1-data_y).*x);
  
  tita0 = tita0 - res_0;
  tita1 = tita1 - res_1;
  
  J(iter) = 1/(2*length(data_y))*sum(tita0+x.*tita1-data_y);
  
  if iter>=2      
      if J(iter-1) - J(iter) < 10e-4
          break;
      end
  end
  
  iter = iter+1;
  
end  

figure
plot(J,'LineWidth',4);
title('Funcion Costo vs Numero de iteraciones')
xlabel('# iteraciones')
ylabel('$J(\Theta)$','interpreter','Latex','Fontsize',12)
%ylim([0 60])

figure 
hold on
plot(x,data_y,'or','MarkerSize',10);
plot(x,tita0 + tita1*x,'LineWidth',4)
grid minor


