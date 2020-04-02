% FT_EXAMPLE_READ_MEF3P0 an example to read MEF 3.0 data set into FieldTrip

%% clear all
clearvars

% look for session path of data
p = mfilename('fullpath');
sesspath = fullfile(fileparts(p), 'mef_3p0.mefd');

% set the password
password = struct('Level1Password', 'password1', 'Level2Password',...
    'password2', 'AccessLevel', 2);

% get the object to deal with FieldTrip
mef_ft = MEFFieldTrip_3p0(sesspath, password);

%% now let's import two channels Left_Occipital-Ref and left-right_occipital
% for the first 10 seconds
mef_ft.SelectedChannel = ["Left_Occipital-Ref" "left-right_occipital"];
mef_ft.StartEnd = [0 10];
mef_ft.SEUnit = 'Second';
[X, t] = mef_ft.importSession;
fs = mef_ft.SamplingFrequency;

figure
ph = plot(t/fs, X);
legend(ph, mef_ft.SelectedChannel)
xlim([0, 1])
xlabel('Time (s)')
ylabel('Amplitude')

%% let's demonstrate more interaction with FieldTrip. Let's import 10 seconds
% data at the beginning of the recording with an assumption that the
% trigger was at 0 second.
in_unit = 'second';
be_second = [0, 10, 0]; % 10-second time of data from the start
out_unit = 'index';
be_sample = mef_ft.SessionUnitConvert(be_second, in_unit, out_unit);

% read data header with ft_read_header
hdr = ft_read_header(sesspath, 'password', password);

% read data with ft_read_data()
dat = ft_read_data(sesspath, 'begsample', be_sample(1), 'endsample', be_sample(2),...
    'header', hdr, 'password', password);

% read data with ft_preprocessing
cfg = [];
cfg.dataset = sesspath;
cfg.password = password;
cfg.header = hdr;
cfg.trl = be_sample;
dat_ieeg = ft_preprocessing(cfg);

% plot the data
cfg.viewmode = 'vertical';
brwview = ft_databrowser(cfg, dat_ieeg);

%% Copyright 2020 Richard J. Cui
% Created: Sun 03/22/2020  9:03:27.318 PM;
% Revision: 0.2  Date: Thu 04/02/2020 11:30:27.749 AM
%
% Multimodel Neuroimaging Lab (Dr. Dora Hermes)
% Mayo Clinic St. Mary Campus
% Rochester, MN 55905
%
% Email: richard.cui@utoronto.ca