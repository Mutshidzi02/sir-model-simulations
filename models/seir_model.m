function dydt = seir_model(t, y, beta, sigma, gamma)
    % SEIR model ODEs for Influenza
    % y = [S; E; I; R]

    S = y(1);
    E = y(2);
    I = y(3);
    R = y(4);
    
    N = S + E + I + R;

    dSdt = -beta * S * I / N;
    dEdt = beta * S * I / N - sigma * E;
    dIdt = sigma * E - gamma * I;
    dRdt = gamma * I;

    dydt = [dSdt; dEdt; dIdt; dRdt];
end
