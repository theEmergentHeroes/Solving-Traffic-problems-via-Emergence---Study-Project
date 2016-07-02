J = 0.01;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;
s = tf('s');
P_motor  =  K/((J*s+b)*(L*s+R)+K^2);

         
Kp = 200;
Ki = 0;
Kd = 10;
C = pid(Kp,Ki,Kd);
sys_cl = feedback(C*P_motor,1);
step(sys_cl,t)
title('PID Control with Kp and Ki')         
axis([0 5 0 1.5])
         
          hold on; plot(t,ones(1,501),'-r')
          legend('SYSTEM RESPONSE FOR Kp = 100 AND Ki = 100', 'STEP INPUT');
          
          

