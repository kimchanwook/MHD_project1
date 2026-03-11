function fig = plot_phase1_energy(sol, D, P)
%PLOT_PHASE1_ENERGY Plot kinetic energy and speed vs time.

    t = sol.t;

    fig = figure('Name', 'Phase 1 Energy', 'Color', 'w');

    tiledlayout(2,1);

    nexttile;
    plot(t, D.KE, 'LineWidth', 1.5);
    grid on;
    xlabel('Time (s)');
    ylabel('Kinetic Energy (J)');
    title(sprintf('Kinetic Energy vs Time (%s)', P.particleName));

    nexttile;
    plot(t, D.speed, 'LineWidth', 1.5);
    grid on;
    xlabel('Time (s)');
    ylabel('Speed (m/s)');
    title('Speed vs Time');
end