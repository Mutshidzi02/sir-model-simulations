% Main simulation script for measles using the SIR model

% Clear the workspace and command window
clc; 
clear;

% Define the total population and initial conditions
N = 1e6;          % Total population: 1,000,000
I0 = 10;          % Initial number of infected individuals
R0 = 0;           % Initial number of recovered individuals
S0 = N - I0 - R0; % Initial number of susceptible individuals

% Set the model parameters based on literature (e.g., Khan et al., 2023)
beta = 0.80;      % Transmission rate
gamma = 0.067;    % Recovery rate

% Define the simulation time span (0 to 200 days)
tspan = [0 200];

% Initial conditions vector: [S; I; R]
y0 = [S0; I0; R0];

% Solve the system of ODEs using the ode45 solver
[t, y] = ode45(@(t, y) sir_model(t, y, beta, gamma), tspan, y0);

% Plot the simulation results
figure;
plot(t, y(:,1), 'b-', 'LineWidth', 2); hold on; % Susceptible
plot(t, y(:,2), 'r-', 'LineWidth', 2);          % Infected
plot(t, y(:,3), 'g-', 'LineWidth', 2);          % Recovered
xlabel('Time (days)');
ylabel('Population');
legend('Susceptible', 'Infected', 'Recovered');
title('Measles Simulation using the SIR Model');
grid on;

% Solve the system
[t, y] = ode45(@(t, y) sir_model(t, y, beta, gamma), tspan, y0);

% Analyze results automatically
analyze_model_results(t, y, 'SIR');


% === ANALYSIS ===

