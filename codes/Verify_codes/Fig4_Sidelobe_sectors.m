clear all; close all; clc;

N = 16;                         % number of elements            
d = 0.5;                        % spacing wrt lambda
D = [-(N-1)/2:1:(N-1)/2]'*d;    % positions 

% steering direction
uT = 0 ;                         
vT = exp(j*2*pi*D*uT);

% design parameters
SLLdb = -30;
Delta = 0.05;
uleftedge = [-1+Delta:Delta:-0.2];
nl = length(uleftedge);
urightedge = -fliplr(uleftedge);
nr = length(urightedge);
figure(1)
plot([-1 uleftedge(1) uleftedge(1)],[SLLdb SLLdb -60],':')
hold on
for n=2:nl
   plot([uleftedge(n-1) uleftedge(n) uleftedge(n)],[SLLdb SLLdb -60],':')
end
for n=1:nr-1
   plot([urightedge(n) urightedge(n) urightedge(n+1)],[-60 SLLdb SLLdb],':')
end
plot([urightedge(nr) urightedge(nr) 1],[-60 SLLdb SLLdb],':')
axis([-1 1 -60 0])
ylabel('Sector constraint level (dB)','Fontsize',14)
xlabel('\it u','Fontsize',14)
