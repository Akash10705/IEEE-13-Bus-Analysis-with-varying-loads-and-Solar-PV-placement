%% ================================================================
% MATLAB + OpenDSS INTERFACE
% IEEE 13 BUS SYSTEM - YEARLY (2160 HOUR) ANALYSIS
%
% OUTPUTS:
% 1. Total yearly losses
% 2. Bus voltages (LN magnitude + PU)
% 3. Before PV and After PV comparison
% 4. Hourly voltage profile
% 5. Hourly feeder losses
% 6. Excel export
%
% DSS FILE:
% D:\MINIPROJECT\MINIPROJECT\IEEE13Master.dss
%% ================================================================

clc;
clear;
close all;

%% ================================================================
% START OpenDSS
%% ================================================================

DSSObj = actxserver('OpenDSSEngine.DSS');

if ~DSSObj.Start(0)
    error('OpenDSS failed to start');
end

DSSText     = DSSObj.Text;
DSSCircuit  = DSSObj.ActiveCircuit;
DSSSolution = DSSCircuit.Solution;

%% ================================================================
% COMPILE DSS FILE
%% ================================================================

dssFile = 'D:\MINIPROJECT\MINIPROJECT\IEEE13Master1.dss';

DSSText.Command = ['Compile "', dssFile, '"'];

%% ================================================================
% GET BUS NAMES
%% ================================================================

AllBusNames = DSSCircuit.AllBusNames;

numBuses = length(AllBusNames);

%% ================================================================
% PREALLOCATE VARIABLES
%% ================================================================

Hours = 2160;

% BEFORE PV
Losses_Before_kW   = zeros(Hours,1);
Losses_Before_kVAR = zeros(Hours,1);

% AFTER PV
Losses_After_kW    = zeros(Hours,1);
Losses_After_kVAR  = zeros(Hours,1);

% Voltage storage
VoltagePU_Before = cell(Hours,1);
VoltagePU_After  = cell(Hours,1);

VoltageLN_Before = cell(Hours,1);
VoltageLN_After  = cell(Hours,1);

%% ================================================================
% ================================================================
% CASE 1 : BEFORE PV
% ================================================================
%% ================================================================

disp('================================================');
disp('RUNNING YEARLY SIMULATION : BEFORE PV');
disp('================================================');

DSSText.Command = 'Disable PVSystem.PV675';

%% ================================================================
% YEARLY LOOP
%% ================================================================

for hr = 1:Hours

    fprintf('Before PV Hour = %d / %d\n',hr,Hours);

    DSSSolution.Hour = hr-1;

    DSSSolution.Solve;

    %% LOSSES

    losses = DSSCircuit.Losses;

    Losses_Before_kW(hr)   = losses(1)/1000;
    Losses_Before_kVAR(hr) = losses(2)/1000;

    %% BUS VOLTAGES

    tempPU = [];
    tempLN = [];

    for i = 1:numBuses

        busName = AllBusNames{i};

        DSSCircuit.SetActiveBus(busName);

        bus = DSSCircuit.ActiveBus;

        puVolt = bus.puVmagAngle;
        Volt   = bus.VMagAngle;

        nph = length(puVolt)/2;

        for ph = 1:nph

            Vpu = puVolt(2*ph-1);
            Vln = Volt(2*ph-1);

            tempPU = [tempPU; Vpu];
            tempLN = [tempLN; Vln];

        end
    end

    VoltagePU_Before{hr} = tempPU;
    VoltageLN_Before{hr} = tempLN;

end

%% ================================================================
% ================================================================
% CASE 2 : AFTER PV
% ================================================================
%% ================================================================

disp('================================================');
disp('RUNNING YEARLY SIMULATION : AFTER PV');
disp('================================================');

DSSText.Command = 'Enable PVSystem.PV675';

for hr = 1:Hours

    fprintf('After PV Hour = %d / %d\n',hr,Hours);

    DSSSolution.Hour = hr-1;

    DSSSolution.Solve;

    %% LOSSES

    losses = DSSCircuit.Losses;

    Losses_After_kW(hr)   = losses(1)/1000;
    Losses_After_kVAR(hr) = losses(2)/1000;

    %% BUS VOLTAGES

    tempPU = [];
    tempLN = [];

    for i = 1:numBuses

        busName = AllBusNames{i};

        DSSCircuit.SetActiveBus(busName);

        bus = DSSCircuit.ActiveBus;

        puVolt = bus.puVmagAngle;
        Volt   = bus.VMagAngle;

        nph = length(puVolt)/2;

        for ph = 1:nph

            Vpu = puVolt(2*ph-1);
            Vln = Volt(2*ph-1);

            tempPU = [tempPU; Vpu];
            tempLN = [tempLN; Vln];

        end
    end

    VoltagePU_After{hr} = tempPU;
    VoltageLN_After{hr} = tempLN;

end

%% ================================================================
% TOTAL YEARLY ENERGY LOSS
%% ================================================================

TotalLossBefore_kWh  = sum(Losses_Before_kW);
TotalLossAfter_kWh   = sum(Losses_After_kW);

TotalQBefore_kVARh   = sum(Losses_Before_kVAR);
TotalQAfter_kVARh    = sum(Losses_After_kVAR);

fprintf('\n================================================\n');

fprintf('TOTAL YEARLY ACTIVE LOSS BEFORE PV  = %.2f kWh\n',...
    TotalLossBefore_kWh);

fprintf('TOTAL YEARLY ACTIVE LOSS AFTER PV   = %.2f kWh\n',...
    TotalLossAfter_kWh);

fprintf('LOSS REDUCTION = %.2f kWh\n',...
    TotalLossBefore_kWh - TotalLossAfter_kWh);

fprintf('\n================================================\n');

%% ================================================================
% LOSS COMPARISON TABLE
%% ================================================================

LossComparison = table(...
    [TotalLossBefore_kWh; TotalLossAfter_kWh],...
    [TotalQBefore_kVARh; TotalQAfter_kVARh],...
    'VariableNames',{'ActiveLoss_kWh','ReactiveLoss_kVARh'},...
    'RowNames',{'BeforePV','AfterPV'});

disp(LossComparison);

%% ================================================================
% PLOT ACTIVE POWER LOSSES
%% ================================================================

figure;

plot(1:Hours,Losses_Before_kW,'LineWidth',1.5);
hold on;

plot(1:Hours,Losses_After_kW,'LineWidth',1.5);

xlabel('Hour');
ylabel('Active Power Loss (kW)');

title('Yearly Feeder Loss Comparison');

legend('Before PV','After PV');

grid on;

%% ================================================================
% PLOT REACTIVE POWER LOSSES
%% ================================================================

figure;

plot(1:Hours,Losses_Before_kVAR,'LineWidth',1.5);
hold on;

plot(1:Hours,Losses_After_kVAR,'LineWidth',1.5);

xlabel('Hour');
ylabel('Reactive Power Loss (kVAR)');

title('Yearly Reactive Loss Comparison');

legend('Before PV','After PV');

grid on;

%% ================================================================
% VOLTAGE PROFILE OF FINAL HOUR
%% ================================================================

FinalVoltageBefore = VoltagePU_Before{2160};
FinalVoltageAfter  = VoltagePU_After{2160};

figure;

plot(FinalVoltageBefore,'-o','LineWidth',1.5);
hold on;

plot(FinalVoltageAfter,'-s','LineWidth',1.5);

xlabel('Bus-Phase Index');
ylabel('Voltage (PU)');

title('Voltage Profile at Hour 2160');

legend('Before PV','After PV');

grid on;

%% ================================================================
% MINIMUM VOLTAGE ANALYSIS
%% ================================================================

MinVoltBefore = zeros(Hours,1);
MinVoltAfter  = zeros(Hours,1);

for hr = 1:Hours

    MinVoltBefore(hr) = min(VoltagePU_Before{hr});
    MinVoltAfter(hr)  = min(VoltagePU_After{hr});

end

figure;

plot(MinVoltBefore,'LineWidth',1.5);
hold on;

plot(MinVoltAfter,'LineWidth',1.5);

xlabel('Hour');
ylabel('Minimum Voltage (PU)');

title('Minimum Bus Voltage Throughout Year');

legend('Before PV','After PV');

grid on;

%% ================================================================
% EXPORT RESULTS TO EXCEL
%% ================================================================

HourlyLosses = table(...
    (1:Hours)',...
    Losses_Before_kW,...
    Losses_After_kW,...
    Losses_Before_kVAR,...
    Losses_After_kVAR,...
    'VariableNames',...
    {'Hour',...
    'P_Loss_Before_kW',...
    'P_Loss_After_kW',...
    'Q_Loss_Before_kVAR',...
    'Q_Loss_After_kVAR'});

writetable(HourlyLosses,...
    'Yearly_Losses_Comparison.xlsx');

writetable(LossComparison,...
    'Total_Yearly_Loss_Comparison.xlsx',...
    'WriteRowNames',true);

%% ================================================================
% EXPORT FINAL HOUR VOLTAGES
%% ================================================================

VoltageTable = table(...
    (1:length(FinalVoltageBefore))',...
    FinalVoltageBefore,...
    FinalVoltageAfter,...
    'VariableNames',...
    {'BusPhaseIndex',...
    'VoltagePU_BeforePV',...
    'VoltagePU_AfterPV'});

writetable(VoltageTable,...
    'FinalHourVoltageProfile.xlsx');

%% ================================================================
% SAVE MATLAB DATA
%% ================================================================

save('IEEE13_YearlyResults.mat');

%% ================================================================
% END
%% ================================================================

disp('================================================');
disp('YEARLY ANALYSIS COMPLETED');
disp('================================================');