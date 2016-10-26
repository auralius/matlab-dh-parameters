function r = serial_arm_plot(r)

% Adjust the scale of the three arrows representing the coordinate frame
axis_scale = 0.5;

if (r.h == -1)
    figure;
    hold on;
    grid on;
    
    r.h = plot3(0, 0, 0, '-m*', 'LineWidth', 4);
    
    % Adjust axis limit here, we start form robot base:
    xlim([r.base(1)-3 r.base(1)+3]);
    ylim([r.base(2)-3 r.base(2)+3]);
    zlim([r.base(3)-3 r.base(3)+3]);
    
    r.quiver_x = quiver3(0,0,0,0,0,0, axis_scale, 'r');
    r.quiver_y = quiver3(0,0,0,0,0,0, axis_scale, 'g');
    r.quiver_z = quiver3(0,0,0,0,0,0, axis_scale, 'b');
    %axis equal tight
end

set(r.h, 'XData', r.x(1, :), 'YData', r.x(2, :), 'ZData', r.x(3, :));

for i = 1:r.n+1   
    vx(:, i) = r.T(1:3,1:3,i)*[1; 0; 0];
    vy(:, i) = r.T(1:3,1:3,i)*[0; 1; 0];
    vz(:, i) = r.T(1:3,1:3,i)*[0; 0; 1];
end 

set(r.quiver_x, 'XData', r.x(1, :), 'YData', r.x(2, :), 'ZData', r.x(3, :), ...
    'UData', vx(1,:), 'VData', vx(2,:), 'WData', vx(3,:));
set(r.quiver_y, 'XData', r.x(1, :), 'YData', r.x(2, :), 'ZData', r.x(3, :), ...
    'UData', vy(1,:), 'VData', vy(2,:), 'WData', vy(3,:));
set(r.quiver_z, 'XData', r.x(1, :), 'YData', r.x(2, :), 'ZData', r.x(3, :), ...
    'UData', vz(1,:), 'VData', vz(2,:), 'WData', vz(3,:));

drawnow;