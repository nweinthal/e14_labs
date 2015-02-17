clear; close all; clc;
data = csvread('water_thermos.csv');

% Thermocouple 1 was located in the pan of water in the toaster oven.
% Thermocouple 2 was located in the pan of water in the toaster oven.
% Thermocouple 3 was located on the top of the toaster oven.
% Thermocouple 4 was located on the glass of the toaster oven.
% Thermocouple 5 was located on the controls of the toaster oven.

t = data(:,1);
water_1 = data(:,2);
water_2 = data(:,3);
glass = data(:,5);
controls = data(:,6);
power = data(:,7);

% The initial mass of the water was 488.3 ±1 g
% The final mass of the water was 473.3 g

mass_water_initial = 488.3;
mass_water_final = 473.3;

t_i = mean([mean(water_1(1:15)), mean(water_2(1:15))]);
t_f = mean([mean(water_1(end-15:end)), mean(water_2(end-15:end))]);

water_lost = mass_water_initial - mass_water_final;

c_h20 = 4.179 %Joules per gram
H_vap = 42.48 %kJ/mol @ 60 deg C
Hg = 1000*(1/18.02)*H_vap %Joules per gram
Q_heat = mass_water_final*4.179*(t_f-t_i);
Q_evap = water_lost*Hg;

Q = Q_heat+Q_evap
Watts_total = Q/600;
avg_power = mean(power);
efficiency = Watts_total/avg_power


