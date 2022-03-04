clear all; close all;clc;

N=16;
m=N-1;
d=0.5;
D = d*[-(N-1)/2:1:(N-1)/2].';
u = [-1:0.001:1];
v = exp(j*2*pi*D*u);
nu = length(u);
u2 = [0:0.0001:1];
n2 = length(u2);
v2 = exp(j*2*pi*D*u2);

SL = [-20 -30 -40];
ss = ['-.';'--';'-b'];

HPBW = zeros(1,3);
HPBWdeg = zeros(1,3);
BWNNdeg = zeros(1,3);
BWNN = zeros(1,3);
DI = zeros(1,3);
DIR = zeros(1,3);
w = zeros(N,3);
for q=1:3
R = 10^(-SL(q)/20);
x0 = cosh(acosh(R)/(N-1));
p = [1:1:N-1];
a = 2*acos(cos((2*p-1)*pi/(2*(N-1)))/x0);
z = exp(j*a);
r = a/pi;
wt = poly(z).';

w(:,q) = wt/sum(wt);
Bd = w(:,q)'*v;
figure(1)
subplot(3,1,q)
plot(u,10*log10(abs(Bd).^2))
xlabel('u=\psi/\pi')
ylabel('Beampattern')
if q==1
   title(['Dolph-Chebychev, N = ' int2str(N) ', SL = ' num2str(SL(q)) 'dB'])
else
   title(['SL = ' num2str(SL(q)) 'dB'])
end

axis([-1 1 -60 0])

B2 = real(w(:,q)'*v2);
g = find(B2<1/sqrt(2));
HPBW  = 2*u2(min(g));
HPBWdeg = 2*(90-acos(HPBW/2)*180/pi);

[b,g] = find(abs(B2(2:n2-1))<abs(B2(1:n2-2))&abs(B2(2:n2-1))<abs(B2(3:n2)));
gmin = min(g);
NULL = u2(gmin);
Ndeg = 90-acos(NULL)*180/pi;
BWNN = 2*NULL;
BWNNdeg = 2*Ndeg;

DIR = 1/abs(w(:,q)'*w(:,q));
DI = 10*log10(DIR);
hold on
text(0.5,-4,['HPBW = ' sprintf('%1.2f',HPBW) ' (' sprintf('%1.1f',HPBWdeg) ' deg.)']);
text(0.5,-9,['BWNN = ' sprintf('%1.2f',BWNN) ' (' sprintf('%1.1f',BWNNdeg) ' deg.)']);
text(0.5,-14,['Direct. = ' sprintf('%1.1f',DIR) ' (' sprintf('%1.1f',DI) ' dB)']);
hold off
grid on

end