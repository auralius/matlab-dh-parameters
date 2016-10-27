function q = ikine1(r, p, treshold, max_iter, q0)
% https://groups.csail.mit.edu/drl/journal_club/papers/033005/buss-2004.pdf
% Equ. 7

if nargin  < 3
    treshold = 0.01;
    max_iter = 100;
    q0 = zeros(r.n, 1);
elseif nargin  < 4
    max_iter = 100;
    q0 = zeros(r.n, 1);
elseif nargin  < 5
    q0 = zeros(r.n, 1);
end

x = r.ee;
q = r.q;
jac = r.jac;

k = 1;

while 1
    k = k + 1;
    
    delta_x = p - x;

    delta_q = pinv(jac)*delta_x + (eye(r.n) - pinv(jac)*jac) * q0;
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