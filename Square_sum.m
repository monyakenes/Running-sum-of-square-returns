clear 
clc
% randn('state', 100)

S0 = 1;
mu = 0.05;
sigma = 0.3;
T = 0.5;
L = 1000;
dt = T/L;

time = [0:dt:T];
M =10;

for j = 1:M
S(j,1) = S0;
temp_sum(j, 1) = 0;
for i = 1:L
    Z = randn(1, L);
    %Stock price model in a discrete time line
    S(j, i+1) = S(j, i) * (1 + mu * dt + sigma * sqrt(dt) * Z(i));
    Return(j, i) = (S(j, i+1) - S(j, i))/S(j,i);
    temp_sum(j, i+1) = temp_sum(j, i) + Return(j, i)^2;
end
 plot(time,temp_sum(j, :), 'b')
 hold on
 title('Running sum-of-square returns')
 hold on
 plot(time, sigma^2 * time, 'r')
end

%% Expected value of S(t)
% expected_value = mean(S,1);
% plot(time, expected_value,'r')
% hold on
% plot(time, S0 * exp(mu * time), 'g')

