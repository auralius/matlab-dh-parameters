function jac = serial_arm_jac(n, theta, d, a, alpha, offset, type)
% Compute jacobian of a serial robot numerically, works for both prismatic
% and revolute joint

epsilon = 1e-6; 
epsilon_inv = 1/epsilon;
f0 = f(n, theta, d, a, alpha, offset); % caclulate f0, when no perturbation happens

jac = zeros(length(f0), n);

% Do perturbation
for i = 1 : n
    theta_ = theta;
    d_ = d;
    
    if type(i) == 'r'  % revolute joint      
        theta_(i) =  theta(i) + epsilon;
    elseif type(i) == 'p' % prismatic joint
        d_(i) =  d(i) + epsilon;
    end
    
    jac(:, i) = (f(n, theta_, d_, a, alpha, offset) - f0) .* epsilon_inv;
end

end

%% Forward kinematics 
function x = f(n, theta, d, a, alpha, offset)
    temp = fkine_dh_ee_only(n, theta, d, a, alpha, offset); 
    x = temp(1:3,4);
end