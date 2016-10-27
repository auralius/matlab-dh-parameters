function r = serial_arm_init(d, a, alpha, offset, type, base)
% Create a robot structure

    r.base = base;         % base position of the robot (nx1)
    
    % DH-parameters:
    r.d = d;
    r.a = a;
    r.alpha = alpha;
    r.offset = offset;
    
    r.n = length(d);       % nimber of DOFs
    r.q = zeros(r.n, 1);   % current joint values (nx1) in radians
    r.type = type;         % either 'r' or 'p' for revolute and prismatic joint, respectively
       
    r.x = zeros(3, r.n+1); % current end-point position of every link, including the base
    r.jac = zeros(3, r.n); % jacobian of the robot (3xn)
    r.ee = [0;0;0];        % end-point position of the robot (3x1)
    
    % For plotting purposes
    r.h = -1;
    r.quiver_x = -1;
    r.quiver_y = -1;
    r.quiver_z = -1;
end