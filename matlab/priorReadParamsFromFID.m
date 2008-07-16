function prior = priorReadParamsFromFID(prior, FID)

% PRIORREADPARAMSFROMFID Read prior params from C++ written FID.
% FORMAT
% DESC reads prior parameters from a file written by C++.
% ARG prior : the prior to put the parameters in.
% ARG FID : the stream from which parameters are read.
% RETURN prior : the prior with the parameters added.
%
% COPYRIGHT : Neil D. Lawrence, 2005, 2006, 2008
%
% SEEALSO : priorReadFromFID, modelReadFromFID

% PRIOR

numParams = readIntFromFID(FID, 'numParams');
params = modelReadFromFID(FID);
fhandle = str2func([prior.type 'PriorExpandParam']);
prior = fhandle(prior, params);

