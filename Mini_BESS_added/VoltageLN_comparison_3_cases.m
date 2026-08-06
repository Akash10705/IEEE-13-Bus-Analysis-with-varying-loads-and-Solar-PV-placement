%% Comparative Voltage & Improvement Analysis Across 4 Cases and 3 Phases
clc; clear; close all;

%% 1. Define Node Voltage Dataset (Line-to-Neutral in Volts)
nodeNames = {'632', '633', '645', '646', '671', '675', '680', '684', '692'};
numNodes = length(nodeNames);
nominal_Vln = (4160 / sqrt(3)); % Nominal L-N Voltage = 2401.78 V

% Phase A Voltages (Volts) [Case 1, Case 2, Case 3, Case 4]
V_PhaseA = [
    2350, 2290, 2375, 2395;  % Node 632
    2340, 2275, 2368, 2390;  % Node 633
    2325, 2250, 2355, 2382;  % Node 645
    2320, 2240, 2350, 2380;  % Node 646
    2310, 2220, 2345, 2378;  % Node 671
    2300, 2200, 2340, 2375;  % Node 675
    2295, 2190, 2335, 2370;  % Node 680
    2290, 2180, 2330, 2368;  % Node 684
    2285, 2170, 2325, 2365   % Node 692
];

% Phase B Voltages (Volts) [Case 1, Case 2, Case 3, Case 4]
V_PhaseB = [
    2355, 2295, 2378, 2398;
    2345, 2280, 2370, 2392;
    2330, 2255, 2358, 2385;
    2325, 2248, 2352, 2382;
    2315, 2228, 2348, 2380;
    2305, 2210, 2342, 2378;
    2300, 2200, 2338, 2372;
    2295, 2190, 2332, 2370;
    2290, 2180, 2328, 2368
];

% Phase C Voltages (Volts) [Case 1, Case 2, Case 3, Case 4]
V_PhaseC = [
    2348, 2288, 2372, 2394;
    2338, 2272, 2365, 2388;
    2320, 2245, 2352, 2380;
    2315, 2238, 2348, 2378;
    2308, 2218, 2342, 2375;
    2298, 2198, 2338, 2372;
    2292, 2185, 2332, 2368;
    2288, 2175, 2328, 2364;
    2282, 2165, 2322, 2360
];

% Calculate Per-Unit Values (p.u.)
pu_A = V_PhaseA / nominal_Vln;
pu_B = V_PhaseB / nominal_Vln;
pu_C = V_PhaseC / nominal_Vln;

%% 2. Compute Percentage Voltage Improvement over Load Altered Case (Case 2)
imprv_A_PV = ((pu_A(:, 3) - pu_A(:, 2)) ./ pu_A(:, 2)) * 100;
imprv_A_BESS = ((pu_A(:, 4) - pu_A(:, 2)) ./ pu_A(:, 2)) * 100;

imprv_B_PV = ((pu_B(:, 3) - pu_B(:, 2)) ./ pu_B(:, 2)) * 100;
imprv_B_BESS = ((pu_B(:, 4) - pu_B(:, 2)) ./ pu_B(:, 2)) * 100;

imprv_C_PV = ((pu_C(:, 3) - pu_C(:, 2)) ./ pu_C(:, 2)) * 100;
imprv_C_BESS = ((pu_C(:, 4) - pu_C(:, 2)) ./ pu_C(:, 2)) * 100;

%% 3. Styling Configuration (High Contrast & High Font Size)
caseLabels = {'Base Case', 'Load Alteration', 'Optimal PV', 'PV + BESS'};
colors = [0.2 0.2 0.2; 0.85 0.325 0.098; 0 0.447 0.741; 0.466 0.674 0.188]; % Grey, Red, Blue, Green

font_title = 18;
font_axis  = 16;
font_tick  = 14;
font_legend = 14;

%% --- Figure 1: Phase A Voltages ---
figure('Name', 'Phase A Voltage Profile Analysis', 'Color', [1 1 1], 'Position', [50 50 1100 650]);
hold on;
for c = 1:4
    plot(1:numNodes, pu_A(:, c), '-o', 'LineWidth', 2.8, 'MarkerSize', 9, ...
        'Color', colors(c, :), 'MarkerFaceColor', colors(c, :), 'DisplayName', caseLabels{c});
end
yline(1.00, '--k', 'Nominal (1.00 pu)', 'LineWidth', 1.8, 'FontSize', font_legend, 'FontWeight', 'bold');
yline(0.95, '--r', 'ANSI Min (0.95 pu)', 'LineWidth', 1.8, 'FontSize', font_legend, 'FontWeight', 'bold');
grid on;
set(gca, 'XTick', 1:numNodes, 'XTickLabel', nodeNames, 'FontWeight', 'bold', 'FontSize', font_tick);
xlabel('Bus / Node Number', 'FontWeight', 'bold', 'FontSize', font_axis);
ylabel('Line-to-Neutral Voltage V_{LN} (p.u.)', 'FontWeight', 'bold', 'FontSize', font_axis);
title('Phase A Node Voltage Comparison Across All 4 Cases', 'FontSize', font_title, 'FontWeight', 'bold');
legend('Location', 'southwest', 'FontSize', font_legend);

%% --- Figure 2: Phase B Voltages ---
figure('Name', 'Phase B Voltage Profile Analysis', 'Color', [1 1 1], 'Position', [100 100 1100 650]);
hold on;
for c = 1:4
    plot(1:numNodes, pu_B(:, c), '-s', 'LineWidth', 2.8, 'MarkerSize', 9, ...
        'Color', colors(c, :), 'MarkerFaceColor', colors(c, :), 'DisplayName', caseLabels{c});
end
yline(1.00, '--k', 'Nominal (1.00 pu)', 'LineWidth', 1.8, 'FontSize', font_legend, 'FontWeight', 'bold');
yline(0.95, '--r', 'ANSI Min (0.95 pu)', 'LineWidth', 1.8, 'FontSize', font_legend, 'FontWeight', 'bold');
grid on;
set(gca, 'XTick', 1:numNodes, 'XTickLabel', nodeNames, 'FontWeight', 'bold', 'FontSize', font_tick);
xlabel('Bus / Node Number', 'FontWeight', 'bold', 'FontSize', font_axis);
ylabel('Line-to-Neutral Voltage V_{LN} (p.u.)', 'FontWeight', 'bold', 'FontSize', font_axis);
title('Phase B Node Voltage Comparison Across All 4 Cases', 'FontSize', font_title, 'FontWeight', 'bold');
legend('Location', 'southwest', 'FontSize', font_legend);

%% --- Figure 3: Phase C Voltages ---
figure('Name', 'Phase C Voltage Profile Analysis', 'Color', [1 1 1], 'Position', [150 150 1100 650]);
hold on;
for c = 1:4
    plot(1:numNodes, pu_C(:, c), '-^', 'LineWidth', 2.8, 'MarkerSize', 9, ...
        'Color', colors(c, :), 'MarkerFaceColor', colors(c, :), 'DisplayName', caseLabels{c});
end
yline(1.00, '--k', 'Nominal (1.00 pu)', 'LineWidth', 1.8, 'FontSize', font_legend, 'FontWeight', 'bold');
yline(0.95, '--r', 'ANSI Min (0.95 pu)', 'LineWidth', 1.8, 'FontSize', font_legend, 'FontWeight', 'bold');
grid on;
set(gca, 'XTick', 1:numNodes, 'XTickLabel', nodeNames, 'FontWeight', 'bold', 'FontSize', font_tick);
xlabel('Bus / Node Number', 'FontWeight', 'bold', 'FontSize', font_axis);
ylabel('Line-to-Neutral Voltage V_{LN} (p.u.)', 'FontWeight', 'bold', 'FontSize', font_axis);
title('Phase C Node Voltage Comparison Across All 4 Cases', 'FontSize', font_title, 'FontWeight', 'bold');
legend('Location', 'southwest', 'FontSize', font_legend);

%% --- Figure 4: Comparative Voltage Improvement Bar Plot ---
figure('Name', 'Comparative Voltage Improvement', 'Color', [1 1 1], 'Position', [200 200 1150 650]);

avg_imprv_PV = [mean(imprv_A_PV), mean(imprv_B_PV), mean(imprv_C_PV)];
avg_imprv_BESS = [mean(imprv_A_BESS), mean(imprv_B_BESS), mean(imprv_C_BESS)];

b = bar(1:3, [avg_imprv_PV; avg_imprv_BESS]', 'grouped');
b(1).FaceColor = [0 0.447 0.741];    % Blue for PV
b(2).FaceColor = [0.466 0.674 0.188]; % Green for PV+BESS

grid on;
set(gca, 'XTick', 1:3, 'XTickLabel', {'Phase A', 'Phase B', 'Phase C'}, ...
    'FontWeight', 'bold', 'FontSize', font_tick);
ylabel('Average Voltage Improvement (%)', 'FontWeight', 'bold', 'FontSize', font_axis);
title('Comparative Line-to-Neutral Voltage Improvement over Stressed Load State', ...
    'FontSize', font_title, 'FontWeight', 'bold');
legend({'Case 3: Optimal PV Insertion', 'Case 4: Hybrid PV + BESS'}, ...
    'Location', 'northwest', 'FontSize', font_legend);

% Annotate bar values with large font size
for i = 1:3
    text(i - 0.15, avg_imprv_PV(i) + 0.35, sprintf('+%.2f%%', avg_imprv_PV(i)), ...
        'FontWeight', 'bold', 'FontSize', 13, 'HorizontalAlignment', 'center');
    text(i + 0.15, avg_imprv_BESS(i) + 0.35, sprintf('+%.2f%%', avg_imprv_BESS(i)), ...
        'FontWeight', 'bold', 'FontSize', 13, 'HorizontalAlignment', 'center');
end
ylim([0, max([avg_imprv_PV, avg_imprv_BESS]) + 1.5]);

%% 5. Print Tabular Results to Command Window
fprintf('\n========================================================================================================\n');
fprintf('                             LINE-TO-NEUTRAL VOLTAGE (V_LN) & IMPROVEMENT SUMMARY                       \n');
fprintf('========================================================================================================\n');
fprintf('%-8s | %-8s | %-10s | %-10s | %-10s | %-10s | %-12s | %-12s\n', ...
    'Node', 'Phase', 'Base(pu)', 'LoadAlt(pu)', 'PV(pu)', 'BESS(pu)', 'PV Gain(%)', 'BESS Gain(%)');
fprintf('--------------------------------------------------------------------------------------------------------\n');
for n = 1:numNodes
    fprintf('%-8s | %-8s | %-10.4f | %-10.4f | %-10.4f | %-10.4f | +%-11.2f%% | +%-11.2f%%\n', ...
        nodeNames{n}, 'Phase A', pu_A(n,1), pu_A(n,2), pu_A(n,3), pu_A(n,4), imprv_A_PV(n), imprv_A_BESS(n));
    fprintf('%-8s | %-8s | %-10.4f | %-10.4f | %-10.4f | %-10.4f | +%-11.2f%% | +%-11.2f%%\n', ...
        nodeNames{n}, 'Phase B', pu_B(n,1), pu_B(n,2), pu_B(n,3), pu_B(n,4), imprv_B_PV(n), imprv_B_BESS(n));
    fprintf('%-8s | %-8s | %-10.4f | %-10.4f | %-10.4f | %-10.4f | +%-11.2f%% | +%-11.2f%%\n', ...
        nodeNames{n}, 'Phase C', pu_C(n,1), pu_C(n,2), pu_C(n,3), pu_C(n,4), imprv_C_PV(n), imprv_C_BESS(n));
    fprintf('--------------------------------------------------------------------------------------------------------\n');
end