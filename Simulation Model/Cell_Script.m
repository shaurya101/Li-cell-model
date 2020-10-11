%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Cell Dynamic Characteristics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load('NEDC_Current_Profile');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cell Type HighPowered NMC (SLPB78216216H)
% Discharge Rates 8C - con; 15C Peak
% Energy Density 158 wh/kg
% Cell Capacity = 31 Ah
% Cell Data Specifications
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

T_amb          = 20;                                    % Ambient Temperature in degree celsius
Qe_init        = 31000;                                 % Extracted Charge Capacity in mAh
cell_length    = 0.227;                                 % Length of cell in mt
cell_width     = 0.226;                                 % Width of cell in mt
cell_thickness = 0.0078;                                % Thickness of cell in mt
cell_area      = cell_length*cell_width;                % Area of the cell in m^2
cell_volume    = cell_length*cell_width*cell_thickness; % Volume of cell in m^3
cell_mass      = 0.720;                                 % Mass of the cell in Kg
cell_Cp_heat   = 810.5328;                              % 
%cell_rho_Cp    = 2040000;                               % Cell Heat Capcity in Jm^-3K^-1


h_conv         = 5;                                     % Covective Heat Exchange Coefficient
                                                        % between cell and environment(Wm^-2K^-1)
                                                        
T_init         = 293.15;                                % Ambient Temperature in Kelvin

%%%%%%%%%%%%%%%%%%%%
%Lookup Tables Data
%%%%%%%%%%%%%%%%%%%%

SOC_LUT         = [0;0.100;0.250;0.500;0.750;0.900;1.00];

Temperature_LUT = [278.15,293.15,313.15];

C1_LUT          = [1913.6,12447,30609;
                   4625.7,18872,32995;
                   23306,40764,47535;
                   10736,18721,26325;
                   18036,33630,48274;
                   12251,18360,26839;
                   9022.9,23394,30606];
               
Capacity_LUT    = [28.01,27.63,27.64];

Em_LUT          = [3.49,3.51,3.52;3.55,3.56,3.56;
                   3.62,3.64,3.64;3.71,3.71,3.72;
                   3.91,3.93,3.94;4.07,4.08,4.08;
                   4.19,4.19,4.19];
               
R0_LUT          = [0.0117,0.0085,0.0090;0.0110,0.0085,0.0090;
                   0.0114,0.0087,0.0092;0.0107,0.0082,0.0088;
                   0.0107,0.0083,0.0091;0.0113,0.0085,0.0089;
                   0.0116,0.0085,0.0089];
          
R1_LUT          = [0.0109,0.0029,0.0013;0.0069,0.0024,0.0012;
                   0.0047,0.0026,0.0013;0.0034,0.0016,0.0010; 
                   0.0033,0.0023,0.0014;0.0033,0.0018,0.0011;
                   0.0028,0.0017,0.0011];

%% Section II
%%%%%%%%%%%%%%%%%%%%%
%Plots
%%%%%%%%%%%%%%%%%%%%%

figure(1)
surf(Temperature_LUT,SOC_LUT,R0_LUT);
title('Internal Resistance(SOC, Temp) Plot');
xlabel('Temperature(Kelvin)');
ylabel('SOC');
zlabel('Internal Resistance(Ohm)');

figure(2)
surf(Temperature_LUT,SOC_LUT,R1_LUT);
title(' Resistance R1(SOC, Temp) Plot');
xlabel('Temperature(Kelvin)');
ylabel('SOC');
zlabel('Resistance R1 (Ohm)');

figure(3)
surf(Temperature_LUT,SOC_LUT,C1_LUT);
title(' Capictance C1(SOC, Temp) Plot');
xlabel('Temperature(Kelvin)');
ylabel('SOC');
zlabel('Capictance1 (mF)');

figure(4)
surf(Temperature_LUT,SOC_LUT,Em_LUT);
title(' Em(SOC,Temp) Plot');
xlabel('Temperature(Kelvin)');
ylabel('SOC');
zlabel('Em (Volts)');
