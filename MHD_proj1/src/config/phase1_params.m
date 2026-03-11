function P = phase1_params(C)
%PHASE1_PARAMS Configuration for Phase 1:
% single charged particle in uniform magnetic field, E = 0.

    % ---------------------------
    % Metadata
    % ---------------------------
    P.phaseName = 'phase1_uniformB';

    % ---------------------------
    % Particle selection
    % ---------------------------
    P.useElectron = true;

    if P.useElectron
        P.q = C.qe;
        P.m = C.me;
        P.particleName = 'electron';
    else
        P.q = C.qp;
        P.m = C.mp;
        P.particleName = 'proton';
    end

    % ---------------------------
    % Uniform electromagnetic fields
    % ---------------------------
    P.B0 = 1e-3;                  % Tesla
    P.E0 = [0; 0; 0];             % V/m, Phase 1 uses E = 0

    % Field function handle
    P.fieldFcn = @fields_uniformB;

    % ---------------------------
    % Initial state
    % ---------------------------
    P.r0 = [0; 0; 0];             % meters

    % Include both perpendicular and parallel velocity components
    P.v0 = [2.0e5; 0; 1.0e5];     % m/s

    % ---------------------------
    % Time settings
    % ---------------------------
    omega_c = cyclotron_frequency(P.q, P.m, P.B0);
    T_c = 2*pi / omega_c;

    P.nGyroPeriods = 20;
    P.tspan = [0, P.nGyroPeriods * T_c];

    % ---------------------------
    % ODE solver options
    % ---------------------------
    P.odeOptions = odeset( ...
        'RelTol', 1e-9, ...
        'AbsTol', 1e-12);

    % ---------------------------
    % Output locations
    % ---------------------------
    P.output.figDir  = 'results/phase1/figures';
    P.output.dataDir = 'results/phase1/data';
end