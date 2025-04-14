function dydt = sird_model(t, y, beta, gamma, mu)
    % SIRD model ODEs for Ebola
    % Inputs: t = time, y = [S; I; R; D], parameters: beta, gamma, mu
    
    S = y(1);
    I = y(2);
    R = y(3);
    D = y(4);

    N = S + I + R + D;

    dSdt = -beta * S * I / N;
    dIdt = beta * S * I / N - gamma * I - mu * I;
    dRdt = gamma * I;
    dDdt = mu * I;

    dydt = [dSdt; dIdt; dRdt; dDdt];
end
