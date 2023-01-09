function u=DSB_Modulation(m,dt)
fc=10^5; ac=2;
t=0:dt:(length(m)-1)*dt;
u=ac*m.*cos(2*pi*fc*t);
end