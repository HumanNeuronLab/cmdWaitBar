function cmdWaitBar(iStart,iStop,i,varargin)
%
%cmdWaitBar - Create a waitbar in the Command Window that updates on each 
% for-loop iteration.
%
%   cmdWaitBar = (A,B,I) creates a waitbar where A is the starting value of
%   the for-loop, B is its final value, and I is the current iteration's 
%   value.
%
%   cmdWaitBar = (A,B,I,V) where V has a value of either 1 (for waitbar
%   viewer, default viewer) or 2 (for iteration value viewer).
%
%   cmdWaitBar = (A,B,I,C) where C is a char of your choice for the marker
%   to be used in the waitbar (default '·').
%
%
%   Example use:
%
%       A = 1;
%       B = 123;
%       for i = A:B
%
%           cmdWaitBar(A,B,i,'-');
%
%           %[Your code...]
%       end
%
%
%   Created by J.P.Monney | jonathan.monney@unige.ch | Update: 19.12.2022


if nargin < 3
    return
end

vwer = 1;
if ~isempty(varargin)
    idxV = find(cellfun(@isnumeric,varargin));
    if ~isempty(idxV)
        vwer = varargin{idxV(1)}(1);
    end
end

switch vwer
    case 1
        markerC = '·';
        if ~isempty(varargin)
            idxC = find(cellfun(@ischar,varargin));
            if ~isempty(idxC)
                markerC = varargin{idxC(1)}(1);
            end
        end
        nW = matlab.desktop.commandwindow.size;
        nW = nW(1)-3;
        
        if i == iStart
            D = ['\n[' repmat(' ',1,nW) ']\n%4.1f%%\n' ...
                '[In progress...]\n\n'];
            fprintf(1,D,0.0);
        end
        
        
        barState = round((i*nW) / iStop);
        percentState = ((100*i) / iStop);
        if (round(percentState,1) == 100.00) && i < iStop
            percentState = 99.9;
        end
        D = [repmat('\b',1,nW+27) ...
            '[' repmat(markerC,1,barState) repmat(' ',1,nW-barState) ']'...
            '\n%4.1f%%\n[In progress...]\n\n'];
        fprintf(1,D,percentState);

    case 2
        if i == iStart
            D = ['\nIteration: ' ...
                num2str(i) '/' num2str(iStop) ...
                '\n[In progress...]\n\n'];
            fprintf(1,D);
        else
            D = [repmat('\b',1,...
                20+length(num2str(iStop))+length(num2str(i-1))) ...
                num2str(i) '/' num2str(iStop) ...
                '\n[In progress...]\n\n'];
            fprintf(1,D);
        end
end

if i == iStop
    fprintf(1,[repmat('\b',1,18) 'Job complete!\n\n']);
end

end