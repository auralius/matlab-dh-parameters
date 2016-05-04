function T = fkine_dh_ee_only(n, theta, d, a, alpha, offset)
% This functions calculate end-effetor position and orientation from
% given joint values.
%
% d, a, alpha and offset are the DH parameters.
% theta is the joint values.
% n is number of the links.
% d, a, alpha and offset are 1xn matrices.
%
% This gives the same result as the RVC toolbox
%
% Contact: manurung.auralius@gmail.com
%
% References: 
% https://www.cs.duke.edu/brd/Teaching/Bio/asmb/current/Papers/chap3-forward-kinematics.pdf
% See page 75    

T = eye(4);

for i = 1:1:n
    ct = cos(theta(i)+offset(i));
    st = sin(theta(i)+offset(i));
    ca = cos(alpha(i));
    sa = sin(alpha(i));

    T = T* [ ct    -st*ca  st*sa    a(i)*ct ; ...
             st    ct*ca  -ct*sa    a(i)*st ; ...
             0     sa     ca        d(i)    ; ...
             0     0      0         1       ];
end

end