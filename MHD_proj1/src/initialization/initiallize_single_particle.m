function y0 = initialize_single_particle(P)
%INITIALIZE_SINGLE_PARTICLE Build initial state vector for one particle.

    r0 = P.r0(:);
    v0 = P.v0(:);

    if numel(r0) ~= 3 || numel(v0) ~= 3
        error('P.r0 and P.v0 must each be 3-element vectors.');
    end

    y0 = [r0; v0];
end