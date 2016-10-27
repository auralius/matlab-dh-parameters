# DH-Parameters with MATLAB

Simple and straight-forward implementation of DH-parameters in MATLAB  
This can be used to execute forward kinematics of the robot to find position and orientation of every link of the robot.  

Features:  
* Forward kinematics
* Homogenous transformation of each link of the robot
* Numerical jacobian
* Simple visualization, it can also be animated
* Inverse kinematics with the pseudo-inverse method.

How to use:
* Create the robot structure with **serial_arm_init**.
* Actuate the joint with **serial_arm_set_joint_pos** or with **serial_arm_set_all_joint_pos** functions.
* Update robot internal structures with **serial_arm_update**
* If necessary, plot the robot with **serial_arm_plot**

![Screenshot][sshot]

[sshot]: https://raw.githubusercontent.com/auralius/matlab-dh-parameters/master/sshot.png "Screenshot"

Auralius Manurung 
manurung.auralius@gmail.com
