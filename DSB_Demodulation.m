function m=DSB_Demodulation(u,dt,bw)
fc=10^5; ac=2;
t=0:dt:(length(u)-1)*dt;
m=2*lowpass(u.*cos(2*pi*fc*t),bw/2,1/dt)/ac;
end

