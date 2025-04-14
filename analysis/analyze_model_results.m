function analyze_model_results(t, y, model_type)
% ANALYZE_MODEL_RESULTS
% Analyze and visualize simulation results for SIR, SEIR, SIRD, SEIRD models.
%
% INPUTS:
%   t           - time vector
%   y           - matrix of compartment outputs (each column is a state variable)
%   model_type  - string specifying model: 'SIR', 'SEIR', 'SIRD', or 'SEIRD'
%
% OUTPUT:
%   - Plots the compartment curves
%   - Prints key metrics: peak infection, time to peak, epidemic duration, final counts

    model_type = upper(model_type);  % Ensure capitalized input
    fprintf('\n--- %s Model Results ---\n', model_type);

    switch model_type
        case 'SIR'
            S = y(:,1); I = y(:,2); R = y(:,3);
            I_col = I;
            final_R = R(end);
            labels = {'Susceptible', 'Infected', 'Recovered'};
            fprintf('Final Recovered: %.0f\n', final_R);

        case 'SEIR'
            S = y(:,1); E = y(:,2); I = y(:,3); R = y(:,4);
            I_col = I;
            final_R = R(end);
            labels = {'Susceptible', 'Exposed', 'Infected', 'Recovered'};
            fprintf('Final Recovered: %.0f\n', final_R);

        case 'SIRD'
            S = y(:,1); I = y(:,2); R = y(:,3); D = y(:,4);
            I_col = I;
            final_R = R(end);
            final_D = D(end);
            labels = {'Susceptible', 'Infected', 'Recovered', 'Deceased'};
            fprintf('Final Recovered: %.0f\n', final_R);
            fprintf('Final Deceased: %.0f\n', final_D);

        case 'SEIRD'
            S = y(:,1); E = y(:,2); I = y(:,3); R = y(:,4); D = y(:,5);
            I_col = I;
            final_R = R(end);
            final_D = D(end);
            labels = {'Susceptible', 'Exposed', 'Infected', 'Recovered', 'Deceased'};
            fprintf('Final Recovered: %.0f\n', final_R);
            fprintf('Final Deceased: %.0f\n', final_D);

        otherwise
            error('Unsupported model type: %s. Choose from SIR, SEIR, SIRD, SEIRD.', model_type);
    end

    % Compute key metrics
    [maxI, idx_peak] = max(I_col);
    T_peak = t(idx_peak);

    idx_active = find(I_col >= 1);
    if isempty(idx_active)
        duration = 0;
    else
        duration = t(idx_active(end)) - t(idx_active(1));
    end

    % Print analysis summary
    fprintf('Peak Infections: %.0f\n', maxI);
    fprintf('Time to Peak: %.1f days\n', T_peak);
    fprintf('Epidemic Duration: %.1f days\n', duration);

end
