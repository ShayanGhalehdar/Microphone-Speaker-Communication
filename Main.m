dt=1e-6;
fc=1e5;
t=0:dt:1;
m=0.5*cos(2*pi*10*t)+0.5*cos(2*pi*20*t);
bw=obw(m,1/length(m))+meanfreq(m,1/length(m));
y11=PM_Modulation(m,dt);
y12=Channel(y11);
y13=PM_Demodulation(y12,dt);
pmANDdc=y13+1;
y21=DSB_Modulation(m,dt);
y22=Channel(y21);
y23=DSB_Demodulation(y22,dt,bw);
dsbANDdc=y23-1;
plot(t,m,t,pmANDdc,t,dsbANDdc);
%{
%DSB C
[signal,FS]=audioread('Gangnam.mp3');
m=signal';
dt=1/length(m(1,:));
bw=meanfreq(m(1,:),1/length(m(1,:)))+obw(m(1,:),1/length(m(1,:)));
y11=DSB_Modulation(m(1,:),dt);
y21=Channel(y11);
y12=DSB_Modulation(m(2,:),dt);
y22=Channel(y12);
z1=DSB_Demodulation(y21,dt,bw);
z2=DSB_Demodulation(y22,dt,bw);
out=transpose([z1;z2]);
audiowrite('GangnamDSB.wav',out,FS);
%}
%{
%PM C
[signal,FS]=audioread('Gangnam.mp3');
m=signal';
dt=1/length(m(1,:));
y11=PM_Modulation(m(1,:),dt);
y21=Channel(y11);
y12=PM_Modulation(m(2,:),dt);
y22=Channel(y12);
z1=PM_Demodulation(y21,dt);
z2=PM_Demodulation(y22,dt);
out=transpose([z1;z2]);
audiowrite('GangnamPM.wav',out,FS);
%}
%{
%DSB REAL TIME
deviceReader = audioDeviceReader(fs,fs);
deviceWriter = audioDeviceWriter('SampleRate',deviceReader.SampleRate);
tic
while toc>0
    m=transpose(deviceReader());
    deviceWriter(transpose(DSB_Demodulation(Channel(DSB_Modulation(m,dt)),dt,2*(meanfreq(m,length(m))+obw(m,length(m))/2))));
    pause(dt)
end
release(deviceReader);
release(deviceWriter);
%}
%{
%PM REAL TIME
deviceReader = audioDeviceReader(1/dt,1/dt);
deviceWriter = audioDeviceWriter('SampleRate',deviceReader.SampleRate);
process = @(m,dt) PM_Demodulation(Channel(PM_Modulation(m,dt)),dt);
tic
while toc>0
    m=transpose(deviceReader());
    deviceWriter(transpose(PM_Demodulation(Channel(PM_Modulation(m,dt)),dt)));
    pause(dt)
end
release(deviceReader);
release(deviceWriter);
%}
