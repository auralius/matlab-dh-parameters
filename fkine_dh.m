function T = fkine_dh(n, theta, d, a, alpha, offset)
% This functions calculate tip position and orientation of all links from
% given joint values.
%
% d, a, alpha and offset are the DH parameters.
% theta is the joint values.
% n is number of the links.
% d, a, alpha and offset are 1xn matrices.
% T contains the homogenous transformation matrix of each link starting
% from the base T(:,:,1) to the end-effector T(:,:,n+1)
%
% This gives the same result as the RVC toolbox
%
% Contact: manurung.auralius@gmail.com
%
% References: 
% https://www.cs.duke.edu/brd/Teaching/Bio/asmb/current/Papers/chap3-forward-kinematics.pdf
% See page 75    

T(:,:,1) = eye(4);

for i = 1:1:n
    ct = cos(theta(i)+offset(i));
    st = sin(theta(i)+offset(i));
    ca = cos(alpha(i));
    sa = sin(alpha(i));

    T(:,:,i+1) = T(:,:,i) * [ ct    -st*ca   st*sa     a(i)*ct ; ...
                              st    ct*ca    -ct*sa    a(i)*st ; ...
                              0     sa       ca        d(i)    ; ...
                              0     0        0         1       ];
end

end