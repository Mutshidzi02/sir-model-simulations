function dydt = sir_model(t, y, beta, gamma)
    % SIR model ODEs for modeling measles
    % Inputs:
    %   t     - time (days)
    %   y     - vector [S; I; R] where:
    %           S = susceptible population,
    %           I = infectious population,
    %           R = recovered population.
    %   beta  - transmission rate (e.g., 0.80, see Khan et al., 2023)
    %   gamma - recovery rate (e.g., 0.067, see Khan et al., 2023)
    % Output:
    %   dydt - derivatives [dS/dt; dI/dt; dR/dt]

    % Extract compartments
    S = y(1);
    I = y(2);
    R = y(3);
    
    % Total population (assumed closed)
    N = S + I + R;
    
    % Define the ODEs
    dSdt = -beta * S * I / N;
    dIdt = beta * S * I / N - gamma * I;
    dRdt = gamma * I;
    
    % Return the derivative vector
    dydt = [dSdt; dIdt; dRdt];
end
