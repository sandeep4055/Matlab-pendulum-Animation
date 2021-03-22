function [dtheta_dt] = ode_function(t,theta,b,g,l,m)
    
    theta1 = theta(1);
    theta2 = theta(2);
    dtheta1_dt = theta2;
    dtheta2_dt = -(b/m)*theta2 - (g/l)*sin(theta1);
    dtheta_dt = [dtheta1_dt;dtheta2_dt];
    
end
