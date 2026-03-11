function D = compute_diagnostics(t, y, P, ~)
%COMPUTE_DIAGNOSTICS Compute Phase 1 diagnostics from trajectory.

    % Extract state components
    x  = y(:,1);
    yy = y(:,2);
    z  = y(:,3);

    vx = y(:,4);
    vy = y(:,5);
    vz = y(:,6);

    % Speeds
    vPerp = sqrt(vx.^2 + vy.^2);
    speed = sqrt(vx.^2 + vy.^2 + vz.^2);

    % Kinetic energy
    KE = kinetic_energy(P.m, speed);

    % Uniform-B theory
    omega_c = cyclotron_frequency(P.q, P.m, P.B0);
    T_c = 2*pi / omega_c;
    rL_theory = larmor_radius(P.m, vPerp(1), P.q, P.B0);

    % Energy conservation metric
    if abs(KE(1)) > 0
        relativeEnergyDrift = (KE(end) - KE(1)) / KE(1);
    else
        relativeEnergyDrift = NaN;
    end

    % Package output
    D.t = t;
    D.x = x;
    D.y = yy;
    D.z = z;
    D.vx = vx;
    D.vy = vy;
    D.vz = vz;
    D.vPerp = vPerp;
    D.speed = speed;
    D.KE = KE;
    D.omega_c = omega_c;
    D.T_c = T_c;
    D.rL_theory = rL_theory;
    D.relativeEnergyDrift = relativeEnergyDrift;
end