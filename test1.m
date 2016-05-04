%%
clc;
clear all;
close all;

%% Scara robot DH-Parameters
alpha = [0 0 0 0];
offset = [0 0 0 0];
a = [0 0.45 0.72 0];
d = [0.21 0 0 0];
type = ['r','r','r','p'];
base = [0; 0; 0];

scara = serial_arm_init(d, a, alpha, offset, type, base);

%%
scara = serial_arm_update(scara);
scara = serial_arm_plot(scara);   
disp('-----')
disp('EE=')
disp(scara.ee)
disp('EE homogenous transformation=')
disp(scara.T(:,:,end));
disp('Jac=')
disp(scara.jac)

pause(1);
scara = serial_arm_actuate_joint(scara, 3, pi/3);
scara = serial_arm_update(scara);
scara = serial_arm_plot(scara);   
disp('-----')
disp('EE=')
disp(scara.ee)
disp('EE homogenous transformation=')
disp(scara.T(:,:,end));
disp('Jac=')
disp(scara.jac)

pause(1);
scara = serial_arm_actuate_joint(scara, 3, 0);
scara = serial_arm_update(scara);
scara = serial_arm_plot(scara);
disp('-----')
disp('EE=')
disp(scara.ee)
disp('EE homogenous transformation=')
disp(scara.T(:,:,end));
disp('Jac=')
disp(scara.jac)

pause(1);
scara = serial_arm_actuate_joint(scara, 4, -0.5);
scara = serial_arm_update(scara);
scara = serial_arm_plot(scara);
disp('-----')
disp('EE=')
disp(scara.ee)
disp('EE homogenous transformation=')
disp(scara.T(:,:,end));
disp('Jac=')
disp(scara.jac)


pause(1);
scara = serial_arm_actuate_joint(scara, 4, 0);
scara = serial_arm_update(scara);
scara = serial_arm_plot(scara);
disp('-----')
disp('EE=')
disp(scara.ee)
disp('EE homogenous transformation=')
disp(scara.T(:,:,end));
disp('Jac=')
disp(scara.jac)

