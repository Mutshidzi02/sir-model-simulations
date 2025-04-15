% MATLAB Code: Improved Spacing for Comparative Graph

% Input Data
diseases = {'Measles', 'Influenza', 'Ebola', 'COVID-19'};
xVals = [1, 2, 3, 4];  % Spaced x-values for diseases
peakInfections = [708648, 66666, 153396, 187240];
timeToPeak = [19.2, 102.5, 45.3, 66.0];
finalRecovered = [999989, 732293, 317994, 808241];
finalDeceased = [0, 0, 476992, 161648];
duration = [200, 200, 132.9, 173.3];

% Normalize values (0–1 scale)
normalize = @(x) x ./ max(x);
norm_peakInfections = normalize(peakInfections);
norm_timeToPeak = normalize(timeToPeak);
norm_finalRecovered = normalize(finalRecovered);
norm_finalDeceased = normalize(finalDeceased);
norm_duration = normalize(duration);

% Combine into matrix
metrics = [norm_peakInfections;
           norm_timeToPeak;
           norm_finalRecovered;
           norm_finalDeceased;
           norm_duration];

metricLabels = {'Peak Infections', 'Time to Peak (days)', ...
                'Final Recovered', 'Final Deceased', 'Epidemic Duration (days)'};

% Plotting
figure('Position', [100, 100, 1000, 600]);  % Wider figure for spacing
hold on;
colors = lines(size(metrics, 1));
markers = {'o', 's', 'd', '^', 'v'};

for i = 1:size(metrics, 1)
    plot(xVals, metrics(i, :), '-o', ...
         'DisplayName', metricLabels{i}, ...
         'LineWidth', 2, ...
         'Marker', markers{i}, ...
         'MarkerSize', 8, ...
         'Color', colors(i,:));
end

% Axis and Labels
xticks(xVals);
xticklabels(diseases);
xlabel('Disease', 'FontSize', 12);
ylabel('Normalized Value (0–1 scale)', 'FontSize', 12);
title('Comparative Simulation Metrics (Normalized)', 'FontSize', 14);
legend('Location', 'eastoutside', 'FontSize', 10);
grid on;
box on;
set(gca, 'FontSize', 12);

hold off;
