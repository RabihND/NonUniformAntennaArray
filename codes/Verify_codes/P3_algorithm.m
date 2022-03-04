clear all; close all; clc;

N = 16;                         % number of elements            
d = 0.5;                        % spacing wrt lambda
D = [-(N-1)/2:1:(N-1)/2]'*d;     % positions 

% steering direction
uT = 0 ;                         
vT = exp(j*2*pi*D*uT);

% design parameters
SLLdb = -35;
SLL = 10^(SLLdb/10);   % sidelobe level
alpha = 0.15;           % gain factor
lambda0 = 1;           % initial loading level
errtol = 0.1;          % error tolerance in dB

Delta = 0.01;          % sector width

% Left side of mainlobe
uleft = [-1+Delta/2:Delta:-1/(N*d)];    % sector centers
vleft = exp(j*2*pi*D*uleft);        % array response at sector centers
nl = length(uleft);                 % number of sectors
lambdaleft = ones(1,nl)*lambda0;    % initial loading levels

uleftedge = uleft+Delta/2;               % sector boundaries
vleftedge = exp(j*2*pi*D*uleftedge);     % array response vector at boundaries
dleftedge = (j*2*pi*D*ones(1,nl)).*exp(j*2*pi*D*uleftedge); % derivative vector 

% Right side of mainlobe
uright = -fliplr(uleft);            % sector centers
vright = exp(j*2*pi*D*uright);      % array response at sector centers
nr = length(uright);                % number of sectors
lambdaright = ones(1,nr)*lambda0;   % initial loading levels

urightedge = uright-Delta/2;             % sector boundaries
vrightedge = exp(j*2*pi*D*urightedge);   % array response at sector boundaries
drightedge = (j*2*pi*D*ones(1,nr)).*exp(j*2*pi*D*urightedge); % derivative vector

DelP = ones(N,1)*D'-D*ones(1,N);    % Dmn = pm-pn
A = sinc(2*DelP);                   
Qd = Delta*sinc(DelP*Delta); 

AQ = A;
for n=1:nl
   AQ = AQ+lambda0*(vleft(:,n)*vleft(:,n)').*Qd;
end
for n=1:nr
   AQ = AQ+lambda0*(vright(:,n)*vright(:,n)').*Qd;
end

w = inv(AQ)*vT*inv(vT'*inv(AQ)*vT);
uu = [-1:0.001:1];
vv = exp(j*2*pi*D*uu);

figure(1)
plot(uu,20*log10(abs(w'*vv)))
hold on
axis([-1 1 -60 0])
xlabel('u')
ylabel('Beampattern (dB)')

% adjust sidelobe sectors
wv = w'*vleftedge;
wd = w'*dleftedge;
BL = abs(wv).^2;       % BP at sector edges
DL = 2*real(wd.*wv);   % derivative of BP at sector edges   
n=nl;
while BL(n)>SLL & DL(n)>0           % In main beam if beam pattern>SLL and increasing
   n=n-1;
   uleft = uleft(1:n);
   uleftedge = uleftedge(1:n);
   vleft = vleft(:,1:n);
   vleftedge = vleftedge(:,1:n);
   dleftedge = dleftedge(:,1:n);
   lambdaleft = lambdaleft(1:n);
end      
nl = n;
plot([-1 uleftedge(nl) uleftedge(nl)],[SLLdb SLLdb -60],':r')

wv = w'*vrightedge;
wd = w'*drightedge;
BL = abs(wv).^2;       % BP at sector edge
DL = 2*real(wd.*wv);   % derivative of BP at sector edge
n=nr;
while BL(nr-n+1)>SLL & DL(nr-n+1)<0 % In main beam if beam pattern>SLL and decreasing
 
   uright = uright(2:n);
   urightedge = urightedge(2:n);
   vright = vright(:,2:n);
   vrightedge = vrightedge(:,2:n);
   drightedge = drightedge(:,2:n);
   lambdaright = lambdaright(2:n);
   n=n-1;
end      
nr = n;
plot([urightedge(1) urightedge(1) 1],[-60 SLLdb SLLdb],':r')
axis([-1 1 -60 0])
it = 1;
hold off
DI = -10*log10(abs(w'*w));
title(['Problem 3.9.4, N= ' int2str(N) ', SL = ' num2str(SLLdb) 'dB, DI = ' num2str(DI) ', iter. = ' int2str(it)])

B = zeros(1,nl+nr);
for n=1:nl
   wT = w.*conj(vleft(:,n));
   B(n) = real(wT'*Qd*wT);                 % average BP 'error' from 0 in sector
end
for n=1:nr
   wT = w.*conj(vright(:,n));
   B(nl+n) = real(wT'*Qd*wT);              % average BP 'error' from 0 in sector
end
Pdiff = 10*log10(B)-10*log10(SLL*Delta);   % excess above SLL*Delta in dB                   
err = max(Pdiff);

while err>errtol
   it = it+1;
   deltaleft = alpha*lambdaleft.*(Pdiff(1:nl)>0);           % increase loading where constraint not met
   deltaright = alpha*lambdaright.*(Pdiff(nl+1:nl+nr)>0);   % increase loading where constraint not met
   lambdaleft = lambdaleft+deltaleft;
   lambdaright = lambdaright+deltaright;
   for n=1:nl
      AQ = AQ+deltaleft(n)*(vleft(:,n)*vleft(:,n)').*Qd;
   end
   for n=1:nr
      AQ = AQ+deltaright(n)*(vright(:,n)*vright(:,n)').*Qd;
   end
   w = inv(AQ)*vT*inv(vT'*inv(AQ)*vT);
   
   plot(uu,20*log10(abs(w'*vv)))
   hold on
   
   % adjust left hand sidelobe sectors
   wv = w'*vleftedge;
   wd = w'*dleftedge;
   BL = abs(wv).^2;       % BP at sector edge
   DL = 2*real(wd.*wv);   % derivative of BP at sector edge
   
   n=nl;
   while BL(n)>SLL & DL(n)>0          % In main beam if beam pattern>SLL and increasing
      n=n-1;                          
      uleft = uleft(1:n);
      uleftedge = uleftedge(1:n);
      vleft = vleft(:,1:n);
      vleftedge = vleftedge(:,1:n);
      dleftedge = dleftedge(:,1:n);
      lambdaleft = lambdaleft(1:n);
   end      
   nl = n;
   
   wv = w'*vrightedge;
   wd = w'*drightedge;
   BL = abs(wv).^2;       % BP at sector edge
   DL = 2*real(wd.*wv);   % derivative of BP at sector edge
   n=nr;
   while BL(nr-n+1)>SLL & DL(nr-n+1)<0 % In main beam if beam pattern>SLL and decreasing
      uright = uright(2:n);
      urightedge = urightedge(2:n);
      vright = vright(:,2:n);
      vrightedge = vrightedge(:,2:n);
      drightedge = drightedge(:,2:n);
      lambdaright = lambdaright(2:n);
      n=n-1;
   end      
   nr = n;
   
   plot([-1 uleftedge(nl) uleftedge(nl)],[SLLdb SLLdb -60],':r')
   plot([urightedge(1) urightedge(1) 1],[-60 SLLdb SLLdb],':r')
   axis([-1 1 -60 0])
   xlabel('u')
   ylabel('Beampattern (dB)')
   DI = -10*log10(abs(w'*w));
   title(['N= ' int2str(N) ', SL = ' num2str(SLLdb) 'dB, DI = ' num2str(DI) ', Iteration = ' int2str(it)])

   hold off
   
   
   B = zeros(1,nl+nr);
   for n=1:nl
      wT = w.*conj(vleft(:,n));
      B(n) = real(wT'*Qd*wT);                 % average BP 'error' from 0 in sector
   end
   for n=1:nr
      wT = w.*conj(vright(:,n));
      B(nl+n) = real(wT'*Qd*wT);              % average BP 'error' from 0 in sector
   end
   Pdiff = 10*log10(B)-10*log10(SLL*Delta);  % excess above SLL*Delta in dB                   
   err = max(Pdiff);
   drawnow
end
DI
u2 = [0:0.0001:0.2];
n2 = length(u2);
v2 = exp(j*2*pi*D*u2);
B2 = real(w'*v2);
[b,g] = find(abs(B2(2:n2-1))<abs(B2(1:n2-2))&abs(B2(2:n2-1))<abs(B2(3:n2)));
gmin = min(g);
NULL = u2(gmin);
BWNN = 2*NULL

% compute Dolph-Chebychev weights
R = 10^(-SLLdb/20);
x0 = cosh(acosh(R)/(N-1));
p = [1:1:N-1];
wt = poly(exp(j*2*acos(cos((2*p-1)*pi/(2*(N-1)))/x0))).';
wdc = wt/sum(wt);
DIdc = -10*log10(abs(wdc'*wdc))
BWNNdc = (2/(pi*d))*acos(cos(pi/(2*(N-1)))/x0)


figure
plot(uu,20*log10(abs(w'*vv)),'b')
hold on
plot(uu,20*log10(abs(wdc'*vv)),'--g')
axis([-1 1 -60 0])
xlabel('u')
ylabel('Beampattern (dB)')
title(['N= ' int2str(N) ', SL = ' num2str(SLLdb) 'dB, Iteration = ' int2str(it)])
legend('Synth. Pattern','Dolph-Chebychev')
