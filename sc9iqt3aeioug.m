clear; close all; clc;

data = csvread('preheat_thermos.csv');
time = data(:,1);
interior_l = data(:,2);
interior_c = data(:,3);
interior_r = data(:,4);
top = data(:,5);
handle = data(:,6);


disp('final values')
l_final_val = interior_l(end)
c_final_val = interior_c(end)
r_final_val = interior_r(end)
mn = mean([l_final_val, c_final_val, r_final_val])
st = std([l_final_val, c_final_val, r_final_val])

top_final = top(end)
handle_final = handle(end)

disp('time to 90% of final value')
[Lrow,Lcol,Lval] = find((abs(interior_l-l_final_val)...
    /l_final_val)<=0.1);
[Crow,Ccol,Cval] = find((abs(interior_c-c_final_val)...
    /c_final_val)<=0.1);
[Rrow,Rcol,Rval] = find((abs(interior_r-r_final_val)...
    /r_final_val)<=0.1);

time_L = time(Lrow(1))
time_C = time(Crow(1))
time_R = time(Rrow(1))
mn = mean([time_L, time_C, time_R])
st = std([time_L, time_C, time_R])
