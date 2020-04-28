% Opening script to get the container id which is required for executing 
% main gica in /scripts/batch_cmd.m and copying output from container to % %host directory.

disp('Testing Group ICA ');

% Initialize random variable
a = randn(10, 1);

save('/output/data_v91.txt', 'a', '-ascii');

disp('Done');

fprintf('\n');


