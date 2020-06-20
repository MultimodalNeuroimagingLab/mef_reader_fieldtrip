MEF 2.1/3.0 Fieldtrip External Toolbox (mef_reader_fieldtrip)
=============================================================

[![License](https://img.shields.io/github/license/MultimodalNeuroimagingLab/mef_reader_fieldtrip.svg?)](https://github.com/MultimodalNeuroimagingLab/mef_reader_fieldtrip)
![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/MultimodalNeuroimagingLab/mef_reader_fieldtrip)
[![HitCount](http://hits.dwyl.io/MultimodalNeuroimagingLab/mef_reader_fieldtrip.svg)](http://hits.dwyl.io/MultimodalNeuroimagingLab/mef_reader_fieldtrip)

Introduction
------------
**mef_reader_fieldtrip** is a [Fieldtrip](http://www.fieldtriptoolbox.org/) external toolbox that reads data compressed in Multiscale Electrophysiology Format (or Mayo EEG File, MEF). 
Current version is capable of reading [MEF Version 2.1](https://github.com/benbrinkmann/mef_lib_2_1) and [MEF version 3.0](https://msel.mayo.edu/codes.html) files.
The code of **mef_reader_fieldtrip** is hosted on Github of [Multimodal Neuroimaging Lab](https://github.com/MultimodalNeuroimagingLab) at the repository [mef_reader_fieldtrip](https://github.com/MultimodalNeuroimagingLab/mef_reader_fieldtrip).
The backbone of the toolbox is a C-MEX package which is also employed in [MEF_import](https://github.com/jiecui/MEF_import) to read MEF datasets into [EEGLAB](https://sccn.ucsd.edu/eeglab/index.php).


Installation
------------
1. Download and install [FieldTrip](https://github.com/fieldtrip/fieldtrip). Assume that the root directory of FieldTrip is `fieldtrip`.
(_Please note that at present, **mef_reader_fieldtrip** has not been merged officially into Fieldtrip.
You may download a fork of Fieldtrip [here](https://github.com/MultimodalNeuroimagingLab/fieldtrip/tree/master), where the toolbox has been installed_).
1. Download [mef_reader_fieldtrip](https://github.com/MultimodalNeuroimagingLab/mef_reader_fieldtrip) package and unzip it if necessary.
1. If the version of Fieldtrip is not capable of recognizing MEF data type, look for the directory `fieldtrip` in **mef_reader_fieldtrip** package and then copy it to the root directory of FieldTrip `fieldtrip`.
1. Otherwise, check the `external` directory of Fieldtrip. If the folder `mayo_mef` exists, go to next step. If not, only copy the folder `mayo_mef` under the directory `external` of **mef_reader_fieldtrip** package to the `external` directory of FieldTrip.
1. In MATLAB, go to the directory `fieldtrip` and type commands `ft_defaults` and `ft_hastoolbox('mayo_mef',1);` to install the toolbox. 
1. If necessary, make mex files by typing command `make_mayo_mex` in MATLAB command window.

Sample data
----------------
A small sample dataset (~17 M) of MEF 2.1/3.0 is provided from this [link](https://app.box.com/s/wwkdwl51joavrblu40v075bz2gb5fwrf) on box.com, or from Open Science Framework (OSF) via this [link](https://osf.io/q7hwe/?view_only=b30ab1f63fb041aea9b1155f71a4751a).
Look for the folder `sample_mef`and download it to your local computer.
To test the toolbox using the sample data, open `test_mayo_mef.m` under directory `fieldtrip/test` and modify the variables according to the locations of the dataset.
Two additional examples of reading MEF dataset, `ft_example_read_mef2p1.m` and `ft_example_read_mef3p0.m` are included in folder `sample_mef` as well.

    % =========================================================================
    % Note of sample dataset
    % =========================================================================
    % Go to https://github.com/MultimodalNeuroimagingLab/mef_reader_fieldtrip
    % and follow the instructions to download the sample dataset. Set the path
    % to the sample dataset below.
    
    %% set path to sample dataset
    % please set the path to sample dataset
    mef21_data = '/path/to/sample_mef/mef_2p1';
    mef30_data = '/path/to/sample_mef/mef_3p0.mefd';

Set the locations of the dataset in the last two lines of above code block and then execute command `test_mayo_mef` in MATLAB.


Acknowledgment
--------------
Multiscale Electrophysiology Format (MEF) is a novel electrophysiology file format designed for large-scale storage of electrophysiological recordings.
MEF can achieve significant data size reduction when compared to existing techniques with stat-of-the-art lossless data compression.
It satisfies the Health Insurance Portability and Accountability Act (HIPAA) to encrypt any patient protected health information transmitted over a public network.

The details of MEF file can be found at [here](https://www.mayo.edu/research/labs/epilepsy-neurophysiology/mef-example-source-code) from [Mayo Systems Electrophysiology Lab](http://msel.mayo.edu/) and [here](https://main.ieeg.org/?q=node/28) on [International Epilepsy Portal](https://main.ieeg.org). 

The c-mex code to read MEF 2.1 data is mainly developed from the work done by [Ben Brinkmann](https://github.com/benbrinkmann/mef_lib_2_1), Matt Stead, Dan Crepeau, and [Gregory Worrell](https://www.mayo.edu/research/faculty/worrell-gregory-a-m-d-ph-d/bio-00027235) from [Mayo Systems Electrophysiology Lab](https://msel.mayo.edu/codes.html),  Mayo Clinic, Rochester MN.


License
-------
**mef_reader_fieldtrip** is distributed with the GPL v3 Open Source License.
