clear all; close all; clc;

N = 16;
M = (N-1)/2;
n = (-M:M).';
u = -1:0.001:1;
vv = exp(j*n*pi*u);
lu = length(u);

%Define the desired pattern
Bd = zeros(1,lu);
for l = 1:lu
   if ( (acos(u(l)) >= pi/3) & (acos(u(l)) <= 2*pi/3) )
      Bd(l) = 1;
   end
end

ad = 0.5*sinc(0.5*n);						% Rectangular window
B1 = ad'*vv;

Rw_HN = 0.5+0.5*cos(2*pi*n/N);			% Hann window
w2 = ad.*Rw_HN;
B2 = w2'*vv;

Rw_HM = 0.54+0.46*cos(2*pi*n/N);			% Hamming window
w3 = ad.*Rw_HM;
B3 = w3'*vv;

% Find appropriate beta to match the overshoot of Hann and Hamming
A_n = -20*log10(abs(max(B2)-1));                 % 44.1589
beta_n = 0.5842*(A_n-21)^0.4+0.07886*(A_n-21);	% 3.8796
A_m = -20*log10(abs(max(B3)-1));    					% 53.6782
beta_m = 0.1102*(A_m-8.7) ;         					% 4.9566
x = 1-(2*n/N).^2;

Rw_KSn = besseli(0,beta_n*sqrt(x));		% Kaiser window matching Hann window
bes = besseli(0,beta_n);
w4 = ad.*Rw_KSn/bes;
%w4 = w4/sum(w4);
B4 = w4'*vv;

Rw_KSm = besseli(0,beta_m*sqrt(x));		% Kaiser window matching Hamming window
bes = besseli(0,beta_m);
w5 = ad.*Rw_KSm/bes;
%w5 = w5/sum(w5);
B5 = w5'*vv;

figure;
plot(u,real(B1),'g-')
hold on;
plot(u,real(B2),'c--')
plot(u,real(B3),'r-.')
plot(u,real(B4),':')
plot(u,real(B5),'-')
plot(u,real(Bd),'-')
plot([-1 1],[0 0],'-');
plot(0*[1 1],[-0.2 1.2],'-');
hold off;
h=legend('Rectangular','Hann','Hamming','Kaiser 3.88','Kaiser 4.96');
set(h,'Fontsize',12)
xlabel('\it u','Fontsize',14)
ylabel('Beam pattern','Fontsize',14)

figure;
plot(u,real(B1),'g-')
hold on;
plot(u,real(B2),'c--')
plot(u,real(B3),'r-.')
plot(u,real(B4),':')
plot(u,real(B5),'-')
plot(u,real(Bd),'-')
plot([-1 1],[0 0],'-');
plot(0*[1 1],[-0.2 1.2],'-');
hold off;
axis([-0.5 0.5 0.9 1.1])
h=legend('Rectangular','Hann','Hamming','Kaiser 3.88','Kaiser 4.96');
set(h,'Fontsize',12)
xlabel('\it u','Fontsize',14)
ylabel('Beam pattern','Fontsize',14)
