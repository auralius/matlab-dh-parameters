function q = ikine1(r, p, treshold, max_iter)

ra = rank(r.jac); % check the rank of the jacobian, if rank == 2, planar robot

x = r.ee;
q = r.q;
jac = r.jac;

k = 1;

while 1
    k = k + 1;
    
    delta_x = p - x;
    
    jac = jac(1:ra, :);
    delta_q = jac'*inv(jac*jac')*delta_x(1:ra,:);
    q = q + delta_q;
    
    T = fkine_dh_ee_only(r.n, q, r.d, r.a, r.alpha, r.offset); 
    x = T(1:3, 4); % take positoin only, no orientations
    jac = serial_arm_jac(r.n, q, r.d, r.a, r.alpha, r.offset, r.type);
    
    if norm(delta_x) < treshold || k > max_iter
        fprintf('ikine breaks after %i iterations.\n', k);
        break;
    end
end

end