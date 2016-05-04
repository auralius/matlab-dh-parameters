function r = serial_arm_actuate_joint(r, idx, q)
% Set position of joint-'idx' to 'q'.
% q is an absolute joint value.

if r.type(idx) == 'r'
    r.q(idx) = q;
elseif r.type(idx) == 'p'
    r.d(idx) = q;
end

end