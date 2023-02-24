%% Dr. Jones HW 12 CR3BP

% Problem 1: Find position of the LaGrange Points 

mass1 = 6*10^24; % mass 1 in kg
mass2 = 6*10^23; % mass 2 in kg 

mu = mass2/(mass1 + mass2); 

x1 = mu; %normalized distance units 
x2 = 1 - mu; % normalized distance units

m1 = 1 - mu; %normalized mass units
m2 = mu; 

CapOmega = 1; 


% Find LaGrange Points where ry = 0. They will be in a line

f_rx = @(rx) rx - (1 - mu)*((rx + mu)/abs(rx + mu)^3) - mu*((rx - (1 - mu))/(abs(rx + mu - 1))^3);

LG = fsolve(f_rx,[-1])

%% Problem 2 

% set up propagator for the CR3BP

odeoptions = odeset('RelTol', 1e-12, 'AbsTol', 1e-12);

r0 = [.487, 0.86, 0];
v0 = [0.0005, 0.0005, 0]; 

timespan = 0:.001:30;
Y0 = [r0,v0];

mu = 0.0121506037932213; 

[T,Y] = ode45(@CR3BProp, timespan, Y0, odeoptions, mu);

% Find LaGrange Points for System
f_rx = @(rx) rx - (1 - mu)*((rx + mu)/abs(rx + mu)^3) - mu*((rx - (1 - mu))/(abs(rx + mu - 1))^3);


LG1 = fsolve(f_rx, [1]);
LG2 = fsolve(f_rx, [0.5]);
LG3 = fsolve(f_rx, [-1]);

LG4 = [.5 - mu; sqrt(3)/2]; %First element is X component, second it Y 
LG5 = [.5 - mu; -sqrt(3)/2];

% Assume a DU is 384,400 km for this display
DU = 384400; 

% Location of Primary Bodies in DU. Note Y component is 0 b/c in straight
% line
x1 = mu;
x2 = 1-mu;


%plot(DU*Y(1:length(Y),1), DU*Y(1:length(Y),2), DU*LG1, 0, 'ro', DU*LG2, 0, 'ro', DU*LG3, 0, 'ro', DU*LG4(1), DU*LG4(2), 'bo', DU*LG5(1), DU*LG5(2), 'bo', DU*x1, 0, 'x', DU*x2, 0, '+', 'LineWidth', 2.0)

%3D plot
plot3(DU*Y(1:length(Y),1), DU*Y(1:length(Y),2), DU*Y(1:length(Y),3), DU*LG1, 0, 0,'o', DU*LG2, 0, 0, 'o', DU*LG3, 0, 0, 'o', DU*LG4(1), DU*LG4(2), 0, 'o', DU*LG5(1), DU*LG5(2), 0,'o')

grid on
title('Synodic Frame')

hold on 

[X,Y,Z] = sphere;
surf(X,Y,Z)
r = 1; %Earth Radius


