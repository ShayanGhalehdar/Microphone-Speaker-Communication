function m = PM_Demodulation(u,dt)
fc=10^5; ac=1; kp=2;
t=0:dt:(length(u)-1)*dt;
yq = hilbert(u).*exp(-1i*(2*pi*fc*t));
m = (1/kp)*angle(yq);
end
