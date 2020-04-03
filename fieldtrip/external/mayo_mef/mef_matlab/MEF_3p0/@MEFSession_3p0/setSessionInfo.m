function metadata = setSessionInfo(this, sesspath, password)
% MEFSESSION_3P0.SETSESSIONINFO set session information of MEFSession_3p0
%
% Syntax:
%   setSessionInfo(this, sesspath, password)
% 
% Input(s):
%   this            - [obj] MEFSession_3p0 object
%   sesspath        - [char] (opt) session path of MEF 3.0 data
%   password        - [struct] (opt) MEF 3.0 password structure (see MEFSession_3p0
%                     for the details)
%
% Output(s):
%   metadata    	- [struct] structure containing session metadata, 
%                     channels metadata, segments metadata and records
%
% Example:
%
% Note:
%
% References:
%
% See also read_mef_session_metadata_3p0.

% Copyright 2020 Richard J. Cui. Created: Sat 03/21/2020 11:09:38.008 PM
% $Revision: 0.2 $  $Date: Sun 03/22/2020  1:50:17.958 PM $
%
% Multimodel Neuroimaging Lab (Dr. Dora Hermes)
% Mayo Clinic St. Mary Campus
% Rochester, MN 55905
%
% Email: richard.cui@utoronto.ca

% =========================================================================
% parse inputs
% =========================================================================
q = parseInputs(this, sesspath, password);
sesspath = q.sesspath;
password = q.password;

% =========================================================================
% main
% =========================================================================
this.SessionPath = sesspath; % set session path directory
this.Password = password; % set password
metadata = this.read_mef_session_metadata_3p0;
this.MetaData = metadata;
this.get_sess_parts;
this.get_sessinfo;

end % function setSessionInfo

% =========================================================================
% subroutines
% =========================================================================
function q = parseInputs(varargin)

% default

% parse rules
p = inputParser;
p.addRequired('this', @isobject);
p.addRequired('sesspath', @ischar);
p.addRequired('password', @isstruct);

% parse and return
p.parse(varargin{:});
q = p.Results;

end % function

% [EOF]
