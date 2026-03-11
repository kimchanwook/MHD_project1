function test_phase1_energy_conservation()
%TEST_PHASE1_ENERGY_CONSERVATION
% Basic validation test for Phase 1:
% In a uniform magnetic field with E = 0, kinetic energy should remain
% nearly constant, up to numerical integration error.

    % ---------------------------
    % Resolve project root safely
    % ---------------------------
    thisFile = mfilename('fullpath');
    testsDir = fileparts(thisFile);
    projectRoot = fileparts(testsDir);

    % ---------------------------
    % Add required paths
    % ---------------------------
    addpath(fullfile(projectRoot, 'src', 'constants'));
    addpath(fullfile(projectRoot, 'src', 'config'));
    addpath(fullfile(projectRoot, 'src', 'fields'));
    addpath(fullfile(projectRoot, 'src', 'dynamics'));
    addpath(fullfile(projectRoot, 'src', 'initialization'));
    addpath(fullfile(projectRoot, 'src', 'diagnostics'));
    addpath(fullfile(projectRoot, 'src', 'utilities'));

    % ---------------------------
    % Load setup
    % ---------------------------
    C = define_constants();
    P = phase1_params(C);
    y0 = initialize_single_particle(P);

    % ---------------------------
    % Run simulation
    % ---------------------------
    sol = run_single_particle(y0, P);
    D = compute_diagnostics(sol.t, sol.y, P, C);

    % ---------------------------
    % Check relative energy drift
    % ---------------------------
    tolerance = 1e-6;

    fprintf('\nRunning test_phase1_energy_conservation...\n');
    fprintf('Relative energy drift = %.6e\n', D.relativeEnergyDrift);
    fprintf('Tolerance             = %.6e\n', tolerance);

    assert(abs(D.relativeEnergyDrift) < tolerance, ...
        'Phase 1 energy conservation test failed: relative drift exceeds tolerance.');

    fprintf('PASS: Energy conservation is within tolerance.\n');
end