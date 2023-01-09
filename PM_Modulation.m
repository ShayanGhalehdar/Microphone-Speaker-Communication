function u = PM_Modulation(m,dt)
fc=10^5; ac=1; kp=2;
t1=0:dt:((length(m)-1)*dt)
u=ac*cos(2*pi*fc*t1+kp*m);
end