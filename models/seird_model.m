function dydt = seird_model(t, y, beta, sigma, gamma, mu)
    % SEIRD model ODEs for COVID-19
    % y = [S; E; I; R; D]

    S = y(1);
    E = y(2);
    I = y(3);
    R = y(4);
    D = y(5);
    
    N = S + E + I + R + D;

    dSdt = -beta * S * I / N;
    dEdt = beta * S * I / N - sigma * E;
    dIdt = sigma * E - gamma * I - mu * I;
    dRdt = gamma * I;
    dDdt = mu * I;

    dydt = [dSdt; dEdt; dIdt; dRdt; dDdt];
end
