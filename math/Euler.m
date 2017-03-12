function Euler()

% Defining the constants that are given
rho = 7800;
V =  9.0478e-07;
Cp = 600;
h = 20;
A = 4.5239e-04;
sigma = 5.67E-8;
Ti = 1150;
Tf = 400;
T0 = 325;

% ask for these values
epsilon = input('epsilon is... ');
c = input('number of steps are... ');

% defining the step size DT
DT = ((Ti - Tf)/c);

% the initial time is 0
t = 0;

% iterate through "c" times

for i = 1:c  
    T = Ti - i*DT;
    Dt = (rho*V*Cp*DT)/((h*A*(T-T0))+(sigma*epsilon*A*((T^4)-(T0^4))));
    t = t + Dt;
end

% outputs the final time
t

end

