function mayo_out = mayo_mef30(varargin)
% MAYO_MEF30 read header, event and data from the files formatted in MEF 3.0
%
% Syntax:
%   hdr = mayo_mef30(filename)
%   evt = mayo_mef30(filename, hdr)
%   dat = mayo_mef30(filename, hdr, begsample, endsample, chanindx)
%
% Input(s):
%   filename        - [char] name of the file or folder of the dataset
%   hdr             - [struct] (opt) header structure of the dataset (see
%                     FT_READ_HEADER; default = struct([]))
%   begsample       - [num] (opt) first sample to read (default = [])
%   endsample       - [num] (opt) last smaple to read (default = [])
%   chanindx        - [num] (opt) list of channel indices to read (default
%                     = [])
%
% Output(s):
%   hdr             - [struct] header structure of the dataset (see 
%                     FT_READ_HEADER)
%   evt             - [struct] event structure of the dataset (see
%                     FT_READ_EVENT)
%   dat             - [num] data read in
%
% Example:
%
% Note:
%
% References:
%
% See also ft_filetype, ft_read_header, ft_read_event, ft_read_data.

% Copyright 2020 Richard J. Cui. Created: Sat 03/21/2020  5:26:02.846 PM
% $Revision: 0.1 $  $Date: Sat 03/21/2020  5:26:02.857 PM $
%
% Multimodel Neuroimaging Lab (Dr. Dora Hermes)
% Mayo Clinic St. Mary Campus
% Rochester, MN 55905
%
% Email: richard.cui@utoronto.ca

% =========================================================================
% parse inputs
% =========================================================================
q = parseInputs(varargin{:});
filename    = q.filename;
hdr         = q.hdr;
begsample   = q.begsample;
endsample   = q.endsample;
chanindx    = q.chanindx;

% =========================================================================
% main
% =========================================================================
% setup the instance of the object
% --------------------------------
mef_ft = MEFFieldTrip3p0(filename); % dealing MEF 3.0 data for FieldTrip

% get the desired information
% ---------------------------
switch nargin
    case 1
        % get header
        mayo_out = mef_ft.getHeader;
    case 2
        mayo_out = mef_ft.getEvent(hdr);
    case 5
        mayo_out = mef_ft.getData(hdr, begsample, endsample, chanindx);
    otherwise
        % error
        error('FieldTrip:mayo_mef30:invalidInput',...
            'invalid number of inputs of the function')
end % switch

end % function mayo_mef30

% =========================================================================
% subroutines
% =========================================================================
function q = parseInputs(varargin)

% default
default_hr = struct([]);
default_bs = [];
default_es = [];
default_ci = [];

% parse rule
p = inputParser;
p.addRequired('filename', @ischar);
p.addOptional('hdr', default_hr, @isstruct);
p.addOptional('begsample', default_bs, @isnumeric);
p.addOptional('endsample', default_es, @isnumeric);
p.addOptional('chanindx', default_ci, @isstruct);

% parse and return
p.parse(varargin{:});
q = p.Results;

end % funciton

% [EOF]
