% Simulation of Influenza using SEIR Model

clc; clear;

% Initial population
N = 1e6;

% Initial conditions
E0 = 20;      % Exposed
I0 = 10;      % Infected
R0 = 0;       % Recovered
S0 = N - E0 - I0 - R0;

% Parameters from Longini et al. (2005)
beta = 0.45;
sigma = 0.33;
gamma = 0.25;

% Initial condition vector
y0 = [S0; E0; I0; R0];

% Time span
tspan = [0 200];

% Solve ODEs using ode45
[t, y] = ode45(@(t, y) seir_model(t, y, beta, sigma, gamma), tspan, y0);

% Plot results
figure;
plot(t, y(:,1), 'b-', 'LineWidth', 2); hold on;
plot(t, y(:,2), 'm-', 'LineWidth', 2);
plot(t, y(:,3), 'r-', 'LineWidth', 2);
plot(t, y(:,4), 'g-', 'LineWidth', 2);
xlabel('Time (days)');
ylabel('Population');
legend('Susceptible', 'Exposed', 'Infectious', 'Recovered');
title('Influenza Simulation using SEIR Model');
grid on;

% Solve the system
[t, y] = ode45(@(t, y) seir_model(t, y, beta, sigma, gamma), tspan, y0);

% Analyze results automatically
analyze_model_results(t, y, 'SEIR');
