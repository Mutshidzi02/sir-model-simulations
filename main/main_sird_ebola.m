% Ebola SIRD Simulation using MATLAB
clc; clear;

% === PARAMETERS ===
N = 1e6;             % Total population
I0 = 10;             % Initial infected
R0 = 0;              % Initial recovered
D0 = 0;              % Initial deceased
S0 = N - I0 - R0 - D0; % Initial susceptible

% Updated parameters for clear epidemic dynamics (from literature)
beta = 0.5;          % Transmission rate
gamma = 0.10;        % Recovery rate
mu = 0.15;           % Mortality rate

% Time span
tspan = [0 200];

% Initial state vector
y0 = [S0; I0; R0; D0];

% Solve ODE system
[t, y] = ode45(@(t, y) sird_model(t, y, beta, gamma, mu), tspan, y0);

% Extract results
S = y(:,1);
I = y(:,2);
R = y(:,3);
D = y(:,4);

% === PLOT ===
figure;
plot(t, S, 'b-', 'LineWidth', 2); hold on;
plot(t, I, 'r-', 'LineWidth', 2);
plot(t, R, 'g-', 'LineWidth', 2);
plot(t, D, 'k-', 'LineWidth', 2);
xlabel('Time (days)');
ylabel('Number of Individuals');
legend('Susceptible', 'Infected', 'Recovered', 'Deceased');
title('Ebola Outbreak Simulation using the SIRD Model');
grid on;

% Solve the system
[t, y] = ode45(@(t, y) sird_model(t, y, beta, gamma, mu), tspan, y0);


% Analyze results automatically
analyze_model_results(t, y, 'SIRD');

