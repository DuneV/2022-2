%% Cleaner
clc
%% P1

La = 440;
Do = 261.63;
Mi = 329.63;
FF = 8000;
t1 = 0:1/FF:2;
t2 = 2:1/FF:3; 
t3 = 3:1/FF:5;
tt = [t1 t2 t3];
x1 = sin(2*pi*La*t1);
x2 = sin(2*pi*Do*t2);
x3 = sin(2*pi*Mi*t3);
s = [x1 x2 x3];

%% Reproduccion

sound(s,FF)

%% time

plot(tt,s) % modificar el FF +- =400

%% frecuency 

yf = abs(fftshift(fft(s)));
L=length(yf);
f = FF*((-L/2):((L-1)/2))/L;
plot(f,yf)
grid on
xlabel('Hz')
ylabel('A')

%% P2

beta = 1;
fm = La;
fc = 1000;
Ac = 2;
deltaf = beta*fm;
for i=1:length(tt)
    sfm(i) = Ac*cos(2*pi*fc*tt(i) + (beta)*s(i));
end

%%

yf = abs(fftshift(fft(sfm)));
L=length(yf);
f = FF*((-L/2):((L-1)/2))/L;
plot(f,yf)
grid on 
xlabel('Hz')
ylabel('A')

%%

deltaf  = (beta - 2*fm)/2;

