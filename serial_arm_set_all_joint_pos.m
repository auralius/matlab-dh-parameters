function r = serial_arm_set_all_joint_pos(r, q)
% Set position of joint-'idx' to 'q'.
% q (nx1) is the joint values in radians.

if length(q) == r.n
    for i = 1 : r.n
        if r.type(i) == 'r'
            r.q(i) = q(i);
        elseif r.type(i) == 'p'
            r.d(i) = q(i);
        end
    end
else
    error('Input q has wrong dimension!')
end

end