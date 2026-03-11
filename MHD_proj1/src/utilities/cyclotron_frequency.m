function omega_c = cyclotron_frequency(q, m, Bmag)
%CYCLOTRON_FREQUENCY Compute cyclotron angular frequency magnitude.
%
% omega_c = |q| B / m

    omega_c = abs(q) .* abs(Bmag) ./ m;
end