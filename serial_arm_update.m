function r = serial_arm_update(r)

   r.pts = zeros(3, r.n);
        
   T = fkine_dh(r.n, r.q, r.d, r.a, r.alpha, r.offset); 
   
   for i = 1 : r.n+1
       r.pts(:, i) = (T(1:3, 4, i)) + r.base;
   end
 
   r.ee = r.pts(:, r.n+1);
   r.jac = serial_arm_jac(r.n, r.q, r.d, r.a, r.alpha, r.offset, r.type);
   r.T = T;
end