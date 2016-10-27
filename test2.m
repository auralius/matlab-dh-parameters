%%
clc;
clear all;
close all;

%% Scara robot DH-Parameters
alpha = [0 0 0 0];
offset = [0 0 0 0];
d = [0 0 0 0];
a = [0.5 0.5 0.5 0.5];
type = ['r','r','r','r'];
base = [0; 0; 0];

planar_4r = serial_arm_init(d, a, alpha, offset, type, base);

%%
planar_4r = serial_arm_update(planar_4r);
planar_4r = serial_arm_plot(planar_4r);   
disp('-----')
disp('EE=')
disp(planar_4r.ee)
disp('EE homogenous transformation=')
disp(planar_4r.T(:,:,end));
disp('Jac=')
disp(planar_4r.jac)

pause(1);
planar_4r = serial_arm_set_joint_pos(planar_4r, 1, pi/6);
planar_4r = serial_arm_update(planar_4r);
planar_4r = serial_arm_plot(planar_4r);   
disp('-----')
disp('EE=')
disp(planar_4r.ee)
disp('EE homogenous transformation=')
disp(planar_4r.T(:,:,end));
disp('Jac=')
disp(planar_4r.jac)

pause(1);
planar_4r = serial_arm_set_joint_pos(planar_4r, 2, pi/6);
planar_4r = serial_arm_update(planar_4r);
planar_4r = serial_arm_plot(planar_4r);
disp('-----')
disp('EE=')
disp(planar_4r.ee)
disp('EE homogenous transformation=')
disp(planar_4r.T(:,:,end));
disp('Jac=')
disp(planar_4r.jac)

pause(1);
planar_4r = serial_arm_set_joint_pos(planar_4r, 3, pi/6);
planar_4r = serial_arm_update(planar_4r);
planar_4r = serial_arm_plot(planar_4r);
disp('-----')
disp('EE=')
disp(planar_4r.ee)
disp('EE homogenous transformation=')
disp(planar_4r.T(:,:,end));
disp('Jac=')
disp(planar_4r.jac)




pause(1);
q = ikine1(planar_4r, [0; 1; 0], 0.01, 100);
planar_4r = serial_arm_set_all_joint_pos(planar_4r, q);
planar_4r = serial_arm_update(planar_4r);
planar_4r = serial_arm_plot(planar_4r);
disp('-----')
disp('EE=')
disp(planar_4r.ee)
disp('EE homogenous transformation=')
disp(planar_4r.T(:,:,end));
disp('Jac=')
disp(planar_4r.jac)

