
clear all
hp=visa('agilent','GPIB0::9::INSTR');
fopen(hp);
fid=fopen('oven.txt','at');
 timer = clock; % start a timer
 
 fprintf(fid, '\n \n');
 t=600;
 i=1
 while etime(clock, timer)<=t;
    ti(i)=etime(clock, timer);
    fprintf(hp, 'MEAS:TEMP? TC,K,(@101)\n');
    temp1(i) = str2num(fscanf(hp));
    fprintf(hp, 'MEAS:TEMP? TC,K,(@102)\n');
    temp2(i)= str2num(fscanf(hp));
    fprintf(hp, 'MEAS:TEMP? TC,K,(@103)\n');
    temp3(i)= str2num(fscanf(hp));
    fprintf(hp, 'MEAS:TEMP? TC,K,(@104)\n');
    temp4(i)= str2num(fscanf(hp));
    fprintf(hp, 'MEAS:TEMP? TC,K,(@105)\n');
    temp5(i)= str2num(fscanf(hp));
    fprintf(hp, 'MEAS:VOLT:DC? AUTO,(@106)\n');
    v= str2num(fscanf(hp));
    w(i)= v/1.25*1000;
    
    
    fprintf('\n%7.0f%7.1f%7.1f%7.1f%7.1f%7.1f%7.1f',ti(i), temp1(i), temp2(i), temp3(i), temp4(i), temp5(i), w(i));
    fprintf(fid,'\n%7.0f%7.1f%7.1f%7.1f%7.1f%7.1f%7.1f',ti(i), temp1(i), temp2(i), temp3(i), temp4(i), temp5(i), w(i));
     
    subplot(2,1,1),plot(ti,temp1,'r',ti,temp2,'b',ti,temp3,'g',ti,temp4,'y',ti,temp5,'k'),xlabel('TIME,SEC.'),ylabel('TEMPERATURE,C'),title('TEMPERATURES VS. TIME')
    subplot(2,1,2),plot(ti,w,'r'),xlabel('TIME,SECONDS'),ylabel('WATTS'),title('POWER VS. TIME')
    i=i + 1


    pause(1);
 end
fclose(fid)
fclose(hp)
delete(hp)

