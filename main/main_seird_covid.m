% COVID-19 SEIRD Simulation using MATLAB
clc; clear;

% === PARAMETERS ===
N = 1e6;             % Total population
E0 = 30;             % Initial exposed
I0 = 10;             % Initial infected
R0 = 0;              % Initial recovered
D0 = 0;              % Initial deceased
S0 = N - E0 - I0 - R0 - D0;

% Parameters (based on Tang et al., 2020)
beta = 0.65;         % Transmission rate
sigma = 0.20;        % Incubation rate
gamma = 0.15;        % Recovery rate
mu = 0.03;           % Mortality rate

% Time span
tspan = [0 200];

% Initial conditions vector
y0 = [S0; E0; I0; R0; D0];

% Solve ODE system
[t, y] = ode45(@(t, y) seird_model(t, y, beta, sigma, gamma, mu), tspan, y0);

% Extract variables
S = y(:,1);
E = y(:,2);
I = y(:,3);
R = y(:,4);
D = y(:,5);

% === PLOT ===
figure;
plot(t, S, 'b-', 'LineWidth', 2); hold on;
plot(t, E, 'm--', 'LineWidth', 2);
plot(t, I, 'r-', 'LineWidth', 2);
plot(t, R, 'g-', 'LineWidth', 2);
plot(t, D, 'k-', 'LineWidth', 2);
xlabel('Time (days)');
ylabel('Number of Individuals');
legend('Susceptible', 'Exposed', 'Infected', 'Recovered', 'Deceased');
title('COVID-19 Simulation using SEIRD Model');
grid on;

% Solve the system
[t, y] = ode45(@(t, y) seird_model(t, y, beta, sigma, gamma, mu), tspan, y0);

% Analyze results automatically
analyze_model_results(t, y, 'SEIRD');



% === ANALYSIS ===

