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
% modulacion para s en los tres
suma = 0;
max = 10^3;
beta = 1;
Ac = 2;
fm = La;
fc = 20e3;
for i = 1:length(tt)
    for n = 1:max
       suma = Ac*(besselj(n,beta)*(sin(2*pi*(La + n*fm)*tt(i)) + sin(2*pi*(Do + n*fm)*tt(i)) + sin(2*pi*(Mi + n*fm)*tt(i)) ) ...
           + besselj(n-max,beta)*(sin(2*pi*(La + (n-max)*fm)*tt(i)) + sin(2*pi*(Do + (n-max)*fm)*tt(i)) + sin(2*pi*(Mi + (n-max)*fm)*tt(i))))+suma;
    end
    s_fm(i) = suma;
end
%% P2.1
