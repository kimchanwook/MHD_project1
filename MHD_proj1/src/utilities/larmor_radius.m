function rL = larmor_radius(m, vPerp, q, Bmag)
%LARMOR_RADIUS Compute Larmor radius magnitude.
%
% rL = m * v_perp / (|q| * B)

    rL = m .* abs(vPerp) ./ (abs(q) .* abs(Bmag));
end