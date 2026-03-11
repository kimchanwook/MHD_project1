function run_all_tests()
%RUN_ALL_TESTS Run all project validation tests from the project root.

    clc;
    fprintf('========================================\n');
    fprintf('Running all tests...\n');
    fprintf('========================================\n');

    addpath('tests');

    test_phase1_energy_conservation();

    % Add future tests here:
    % test_exb_drift();
    % test_compression_field_consistency();
    % test_dipole_field_symmetry();

    fprintf('\n========================================\n');
    fprintf('All requested tests completed.\n');
    fprintf('========================================\n');
end