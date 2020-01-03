clear; close all; clc;

car_dynamics

%% Part 2: Simulate the system

h = 1; % Set sample period

t = 0:h:10; % Sample times
X0 = [0;0.5]; % Initial state
U0 = 0; % Initial input
Uref = [0.5+0.5*sin(t);zeros(size(t))]; % Sample the input function at the sample period

%%% Simulate using ODE45
ode.name = 'ODE45';
ode.f_discrete = @(X,U) ode45(@(t,x) f(x,U),[0 h], X');
ode.X = X0;
for k=1:length(t)-1
  res = ode.f_discrete(ode.X(:,k),Uref(:,k));
  ode.X(:,k+1) = res.y(:,end);
end

%%% Simulate using RK4

rk4.name = 'RK4';
% --->>> Code here

% --->>> Code here

%%% Simulate using Euler

eur.name = 'Euler';
% --->>> Code here

% --->>> Code here


%% Plot results
plotSims(t, {ode, rk4, eur});


