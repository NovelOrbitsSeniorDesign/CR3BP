function [ydot] = CR3BProp(t,Y0,mu)
% Function to Propagate CR3BP

ydot(1:3,1) = [Y0(4); Y0(5); Y0(6)]; 

r1 = sqrt((Y0(1) + mu)^2 + Y0(2)^2 + Y0(3)^2);
r2 = sqrt((Y0(1) + mu - 1)^2 + Y0(2)^2 + Y0(3)^2);


ax = 2*Y0(5) + Y0(1) - (1-mu)*((Y0(1)+mu)/r1^3) - mu*((Y0(1) + mu - 1)/r2^3);
ay = -2*Y0(4) + Y0(2) - (1-mu)*Y0(2)/r1^3 - mu*(Y0(2)/r2^3);
az = -(1 - mu)*Y0(3)/r1^3 - mu*(Y0(3)/r2^3); 

ydot(4:6,1) = [ax; ay; az]; 