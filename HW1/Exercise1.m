clear;
% Exercise 1
N=100;
I_0=100;
T=5;
r=0.05;
delta=0.01; %cont-compounded div. yield
sigma=0.20;

% Question 1
I_T=[50:5:150];
a=0.0075;
b=1;
X_T = N*(1+a*max(I_T-b*I_0,0)); % Payoff at Maturity (Value)

plot(I_T,X_T,'bo-');
grid on;
leg=legend('X_{T}');
set(leg,'Location','NorthWest');
ylabel('Payoff Values X_{T}');
xlabel('Index Values I_{T}');

% Question 2
K=b*I_0;
PV_0=N*(exp(1)^(-r*T));
d1 = (1/(sigma*sqrt(T)))*(log(I_0/K) + ((r - delta) + (sigma^2)/2)*(T));
d2 = d1 - sigma*sqrt(T);
CO_PV_0 = normcdf(d1)*I_0*exp(1)^(-delta*T) - normcdf(d2)*K*exp(1)^(-r*T);

PV_0
CO_PV_0
Price = callPrice(N,I_0,T,r,delta,sigma,a,b)

% Question 3
% Delta = dV/dI_0, Gamma = dDelta/dI_0
Delta = deltaCallPrice(N,I_0,T,r,delta,sigma,a,b)
Gamma = (deltaCallPrice(N,I_0+1,T,r,delta,sigma,a,b) - deltaCallPrice(N,I_0-1,T,r,delta,sigma,a,b))/2
% Rho = dV/dr
Rho = rhoCallPrice(N,I_0,T,r,delta,sigma,a,b)
% Vega = dV/dsigma
Vega = vegaCallPrice(N,I_0,T,r,delta,sigma,a,b)
% Theta = - dV/dt
Theta = thetaCallPrice(N,I_0,T,r,delta,sigma,a,b)

% Question 4
b=[0.2:0.1:1.2];
Price = callPrice(N,I_0,T,r,delta,sigma,a,b);
Delta = deltaCallPrice(N,I_0,T,r,delta,sigma,a,b);
Gamma = (deltaCallPrice(N,I_0+1,T,r,delta,sigma,a,b) - deltaCallPrice(N,I_0-1,T,r,delta,sigma,a,b))/2;
Rho = rhoCallPrice(N,I_0,T,r,delta,sigma,a,b);
Vega = vegaCallPrice(N,I_0,T,r,delta,sigma,a,b);
Theta = thetaCallPrice(N,I_0,T,r,delta,sigma,a,b);

figure(2);
subplot(3,2,1,'align');plot(b,Price,'bo-');grid on;title('Price');xlabel('Base Rate b');
subplot(3,2,2,'align');plot(b,Delta,'g^-');grid on;title('Delta');xlabel('Base Rate b');
subplot(3,2,3,'align');plot(b,Gamma,'rs-');grid on;title('Gamma');xlabel('Base Rate b');
subplot(3,2,4,'align');plot(b,Rho,'yx-');grid on;title('Rho');xlabel('Base Rate b');
subplot(3,2,5,'align');plot(b,Vega,'mp-');grid on;title('Vega');xlabel('Base Rate b');
subplot(3,2,6,'align');plot(b,Theta,'c+-');grid on;title('Theta');xlabel('Base Rate b');

% Question 5 (Extra Credit)
b=1; I_0=[50:5:100];
Price = callPrice(N,I_0,T,r,delta,sigma,a,b);
Delta = deltaCallPrice(N,I_0,T,r,delta,sigma,a,b);
Gamma = (deltaCallPrice(N,I_0+1,T,r,delta,sigma,a,b) - deltaCallPrice(N,I_0-1,T,r,delta,sigma,a,b))/2;
Rho = rhoCallPrice(N,I_0,T,r,delta,sigma,a,b);
Vega = vegaCallPrice(N,I_0,T,r,delta,sigma,a,b);
Theta = thetaCallPrice(N,I_0,T,r,delta,sigma,a,b);

figure(3);
subplot(3,2,1,'align');plot(I_0,Price,'bo-');grid on;title('Price');xlabel('Initial Index I_{0}');
subplot(3,2,2,'align');plot(I_0,Delta,'g^-');grid on;title('Delta');xlabel('Initial Index I_{0}');
subplot(3,2,3,'align');plot(I_0,Gamma,'rs-');grid on;title('Gamma');xlabel('Initial Index I_{0}');
subplot(3,2,4,'align');plot(I_0,Rho,'yx-');grid on;title('Rho');xlabel('Initial Index I_{0}');
subplot(3,2,5,'align');plot(I_0,Vega,'mp-');grid on;title('Vega');xlabel('Initial Index I_{0}');
subplot(3,2,6,'align');plot(I_0,Theta,'c+-');grid on;title('Theta');xlabel('Initial Index I_{0}');
