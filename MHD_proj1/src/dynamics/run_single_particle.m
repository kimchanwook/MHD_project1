function sol = run_single_particle(y0, P)
%RUN_SINGLE_PARTICLE Integrate one particle trajectory.

    [t, y] = ode45(@(t, y) particle_rhs(t, y, P), P.tspan, y0, P.odeOptions);

    sol.t = t;
    sol.y = y;
end