function r = serial_arm_set_joint_pos(r, idx, q)
% Set position of joint-'idx' to 'q'.
% q (1x1) is a joint value in radians.

if r.type(idx) == 'r'
    r.q(idx) = q;
elseif r.type(idx) == 'p'
    r.d(idx) = q;
end

end