clear; close all; clc;

%% read data
data = readtable("serial_output.csv");
temperature = data.Data;
t = data.Timestamp;
u = data.entrada;

%% plotting
figure; 

subplot(2,1,1);
plot(t,temperature,'LineWidth',1);
xlabel('time (s)');
ylabel('temperature (ºC)');

subplot(2,1,2);
plot(t,u,'LineWidth',1);
xlabel('time (s)');
ylabel('voltage (V)');

%% calculate pid parameters

K = 32.05;
theta = 174;
tau = 168.8;

tauc = 700;
Kc = (1/K)*(tau/(tauc + theta))
taui = tau;

% tauc = 128;
%tauc = 256;
tauc = 215;
Kc = (1/K)*(2*tau + theta)/(2*tauc + theta)
taui = tau + theta/2;
taud = tau*theta/(2*tau + theta);