
close all
clc

b = 0.05;
m = 1;
l = 1;
g = 9.81;

theta_0 =[0;3];

t_span = linspace(0,20,100);

[t , results] = ode45(@(t,theta) ode_function(t,theta,b,g,l,m),t_span,theta_0);

k = results;
displacement = k(:,1);
velocity = k(:,2);
 
figure(1)
plot(t,displacement,'linewidth',1,'color','b')
title('time vs displacement')
xlabel('Time')
ylabel('Angular Displacement')

figure(2)
plot(t,velocity,'linewidth',1,'color','r')
title('time vs angularvelocity')
xlabel('Time')
ylabel('Angular velocity')

%simple pendulum animation

ct = 1;
for i=1:length(t)
    x0 = 0 ;
    y0 = 0 ;
    x = l*cos((pi/2)-results(i));
    y = -l*sin((pi/2)-results(i));
    
    %plot of pendulum line from origin
    figure(3)
    plot([-1,1],[0,0],'linewidth',5)
    hold on
    plot([x0 x],[y0 y],'linewidth',3)
    hold on
    
    plot(x,y,'o','markersize',20,'MarkerFaceColor','g')
    axis([-1.5 1.5 -1.5 1])
    grid on
    xlabel('X-axis')
    ylabel('Y-axis')
    title('Motion of Simple Pendulum')
    pause(0.005)
    hold off
    
    M(ct) = getframe(gcf)
    ct = ct+1
end

movie(M)
videofile = VideoWriter('pendulum8.avi','Uncompressed AVI')
open(videofile)
writeVideo(videofile,M)
close(videofile)
    






