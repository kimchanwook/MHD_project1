clear; clc; close all;

% ---------------------------
% Add project folders to path
% ---------------------------
addpath('src/constants');
addpath('src/config');
addpath('src/fields');
addpath('src/dynamics');
addpath('src/initialization');
addpath('src/diagnostics');
addpath('src/utilities');
addpath('plots');

% ---------------------------
% Create output directories
% ---------------------------
if ~exist('results/phase1/figures', 'dir')
    mkdir('results/phase1/figures');
end
if ~exist('results/phase1/data', 'dir')
    mkdir('results/phase1/data');
end

% ---------------------------
% Load constants and params
% ---------------------------
C = define_constants();
P = phase1_params(C);

% ---------------------------
% Initialize particle
% ---------------------------
y0 = initialize_single_particle(P);

% ---------------------------
% Run simulation
% ---------------------------
sol = run_single_particle(y0, P);

% ---------------------------
% Compute diagnostics
% ---------------------------
D = compute_diagnostics(sol.t, sol.y, P, C);

% ---------------------------
% Display summary
% ---------------------------
fprintf('\n===== Phase 1: Uniform B, E = 0 =====\n');
fprintf('Particle type            : %s\n', P.particleName);
fprintf('Charge q                 : %.6e C\n', P.q);
fprintf('Mass m                   : %.6e kg\n', P.m);
fprintf('B0                       : %.6e T\n', P.B0);
fprintf('Initial position [m]     : [%.3e, %.3e, %.3e]\n', P.r0(1), P.r0(2), P.r0(3));
fprintf('Initial velocity [m/s]   : [%.3e, %.3e, %.3e]\n', P.v0(1), P.v0(2), P.v0(3));
fprintf('Cyclotron frequency      : %.6e rad/s\n', D.omega_c);
fprintf('Cyclotron period         : %.6e s\n', D.T_c);
fprintf('Theoretical Larmor radius: %.6e m\n', D.rL_theory);
fprintf('Initial kinetic energy   : %.6e J\n', D.KE(1));
fprintf('Final kinetic energy     : %.6e J\n', D.KE(end));
fprintf('Relative energy drift    : %.6e\n\n', D.relativeEnergyDrift);

% ---------------------------
% Plot results
% ---------------------------
fig1 = plot_phase1_trajectory(sol, P);
fig2 = plot_phase1_energy(sol, D, P);

% ---------------------------
% Save figures
% ---------------------------
saveas(fig1, fullfile(P.output.figDir, 'phase1_trajectory.png'));
saveas(fig2, fullfile(P.output.figDir, 'phase1_energy.png'));

% ---------------------------
% Save data
% ---------------------------
save(fullfile(P.output.dataDir, 'phase1_solution.mat'), 'sol', 'D', 'P', 'C');

fprintf('Saved figures to: %s\n', P.output.figDir);
fprintf('Saved data to   : %s\n', P.output.dataDir);