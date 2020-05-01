% Enter the values for the variables required for the ICA analysis.
% Variables are on the left and the values are on the right.
% Characters must be enterd in single quotes
%
% After entering the parameters, use icatb_batch_file_run(inputFile); 

%% Modality. Options are fMRI and EEG
modalityType = 'fMRI';


%% Enter TR in seconds. If TRs vary across subjects, TR must be a row vector of length equal to the number of subjects.
TR = 1;

%% Parallel info
% enter mode serial or parallel. If parallel, enter number of
% sessions/workers to do job in parallel
parallel_info.mode = 'serial';
parallel_info.num_workers = 4;

%% Group PCA performance settings. Best setting for each option will be selected based on variable MAX_AVAILABLE_RAM in icatb_defaults.m. 
% If you have selected option 3 (user specified settings) you need to manually set the PCA options. See manual or other
% templates (icatb/icatb_batch_files/Input_data_subjects_1.m) for more information to set PCA options 
%
% Options are:
% 1 - Maximize Performance
% 2 - Less Memory Usage
% 3 - User Specified Settings
perfType = 1;


%% There are three ways to enter the subject data
% options are 1, 2, 3 or 4
dataSelectionMethod = 4;


%% Method 4
% Input data file pattern for data-sets must be in a cell array. The no. of rows of cell array correspond to no. of subjects
% and columns correspond to sessions. In the below example, there are 3
% subjects and 1 session. If you have multiple sessions, please see
% Input_data_subjects_2.m file.
input_data_file_patterns = {'/input/sub01_vis/ns*.img';
  '/input/sub02_vis/ns*.img'};

% Input for design matrices will be used only if you have a design matrix
% for each subject i.e., if you have selected 'diff_sub_diff_sess' for
% variable keyword_designMatrix.
input_design_matrices = {};

% Enter no. of dummy scans to exclude from the group ICA analysis. If you have no dummy scans leave it as 0.
dummy_scans = 0;

%%%%%%%% End for Method 4 %%%%%%%%%%%%

%% Enter directory to put results of analysis
outputDir = '/output';

%% Enter Name (Prefix) Of Output Files
prefix = 'vis_gig_ica';

%% Enter location (full file path) of the image file to use as mask
% or use Default mask which is []
maskFile = [];


%% Data Pre-processing options
% 1 - Remove mean per time point
% 2 - Remove mean per voxel
% 3 - Intensity normalization
% 4 - Variance normalization
preproc_type = 1;


%% Scale the Results. Options are 0, 1, 2
% 0 - Don't scale
% 1 - Scale to Percent signal change
% 2 - Scale to Z scores
scaleType = 2;


%% 'Which ICA Algorithm Do You Want To Use';
% see icatb_icaAlgorithm for details or type icatb_icaAlgorithm at the
% command prompt.
% Note: Use only one subject and one session for Semi-blind ICA. Also specify atmost two reference function names

% 1 means infomax, 2 means fastICA, etc.
algoType = 'gig-ica';

%% Report generator (fmri and smri only)
% 0 - Don't display results
% 1 - HTML
% 2 - PDF
display_results = 1;

%% Specify spatial reference files for constrained ICA (spatial) or gig-ica.
refFiles = which('neuromark_53.nii'); 

% Network summary options
network_summary_opts.comp_network_names = { 'SC', (1:5);                    
                                    'AU', (6:7);                  
                                    'SM', (8:16);  
                                    'VI', (17:25); 
                                    'CC', (26:42);      
                                    'DM', (43:49);
                                    'CB', (50:53)};
% spatial maps display threshold                                                                
network_summary_opts.threshold = 2;

% structural file
network_summary_opts.structFile = which('ch2bet.nii');

% format: options are html and pdf
network_summary_opts.format = 'html';

% convert spatial maps to z-scores
network_summary_opts.convert_to_z = 'yes';

% connectivity threshold (fnc in r-values)
network_summary_opts.conn_threshold = 0.25;