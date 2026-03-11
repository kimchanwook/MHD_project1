function fig = plot_phase1_trajectory(sol, P)
%PLOT_PHASE1_TRAJECTORY Plot 3D trajectory and x-y projection.

    y = sol.y;
    x = y(:,1);
    yy = y(:,2);
    z = y(:,3);

    fig = figure('Name', 'Phase 1 Trajectory', 'Color', 'w');

    tiledlayout(1,2);

    % 3D trajectory
    nexttile;
    plot3(x, yy, z, 'LineWidth', 1.5);
    grid on;
    axis equal;
    xlabel('x (m)');
    ylabel('y (m)');
    zlabel('z (m)');
    title(sprintf('3D Trajectory (%s)', P.particleName));

    % x-y projection
    nexttile;
    plot(x, yy, 'LineWidth', 1.5);
    grid on;
    axis equal;
    xlabel('x (m)');
    ylabel('y (m)');
    title('x-y Projection (Gyromotion)');
end