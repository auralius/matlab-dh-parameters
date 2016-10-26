function r = serial_arm_init(d, a, alpha, offset, type, base)
    r.base = base;
    r.d = d;
    r.a = a;
    r.alpha = alpha;
    r.offset = offset;
    
    r.n = length(d);
    r.q = zeros(r.n, 1);
    r.type = type;
       
    r.x = zeros(3, r.n+1);
    r.jac = zeros(3, r.n);
    r.ee = [0;0;0];
    
    r.h = -1;
    r.quiver_x = -1;
    r.quiver_y = -1;
    r.quiver_z = -1;
end