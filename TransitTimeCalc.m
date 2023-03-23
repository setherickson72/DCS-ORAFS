m87=1.44E-25; %Mass of Rb in kg
kb=1.38E-23;
v=sqrt(2*kb*373/(pi*m87));
w0=50E-6;
wl=778E-9;

w = @(z) w0*sqrt(1+(wl*z/(pi*w0)).^2);
R = @(z) z.*(1+((pi*w0^2)./(wl*z)).^2);

dw = @(z) (2*v./w(z)).*sqrt(2*log(2)*(1+(pi*w(z).^2./(R(z)*wl)).^2));

z=linspace(-10E-2,10E-2,1000);
ds=dw(z)/(2*pi);

figure(2)
plot(z*1E3,ds*1E-6,'k')
ylabel('Transit Time Broadening (MHz)')
xlabel('Distance from focus (mm)')