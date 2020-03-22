classdef MEFFieldTrip_3p0 < MEFSession_3p0 & MEFFieldTrip
    % MEFFIELDTRIP_3P0 process MEF 3.0 in FieldTrip
    % 
    % Syntax:
    %   this = MEFFieldTrip_3p0(filename)
    %   this = MEFFieldTrip_3p0(__, password)
    %
    % Input(s):
    %   filename    - [char] session path or channel path or dataset name
    %   password    - [struct] (opt) password (default: empty)
    %                 .Level1Password
    %                 .Level2Password
    %                 .AccessLevel
    %
    % Output(s):
    %   this        - [obj] MEFFieldTrip_3p0 object
    %
    % Note:
    %
    % See also .
    
    % Copyright 2020 Richard J. Cui. Created: Sat 03/21/2020 10:35:23.147 PM
    % $Revision: 0.1 $  $Date: Sat 03/21/2020 10:35:23.147 PM $
    %
    % Multimodel Neuroimaging Lab (Dr. Dora Hermes)
    % Mayo Clinic St. Mary Campus
    % Rochester, MN 55905
    %
    % Email: richard.cui@utoronto.ca
    
    % =====================================================================
    % properties
    % =====================================================================
    properties

    end
    
    % =====================================================================
    % constructor
    % =====================================================================
    methods
        function this = MEFFieldTrip_3p0(varargin)
            % class constructor
            % =================
            % parse inputs
            % ------------
            % default
            default_pw = struct('Level1Password', '',...
                'Level2Password', '', 'AccessLevel', 1);
            
            % parse rules
            p = inputParser;
            p.addRequired('sesspath', @isstr);
            p.addOptional('password', default_pw, @isstruct);
            
            % parse the return the results
            p.parse(varargin{:});
            q = p.Results;
            sesspath = q.sesspath;
            password = q.password;
            
            % operations during construction
            % ------------------------------
            % call super class
            this@MEFFieldTrip;
            this@MEFSession_3p0(sesspath, password);
        end %function
    end % methods
    
    % =====================================================================
    % methods
    % =====================================================================
    methods (Static = true)
        
    end % 
    
    methods
        
    end % methods
end

% [EOF]