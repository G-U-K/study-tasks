function mycomet(x, y, p, w)
%MYCOMET  Comet-like trajectory.
%The same as COMET, but possible to specify pause between steps.

%   Charles R. Denham, MathWorks, 1989.
%   Revised 2-9-92, LS and DTP; 8-18-92, 11-30-92 CBM.
%   Copyright 1984-2000 The MathWorks, Inc. 
%   $Revision: 5.10 $  $Date: 2000/06/02 04:30:47 $

if nargin == 0, error('Not enough input arguments.'); end
if nargin < 2, y = x; x = 1:length(y); end
if nargin < 3, p = 0.10; w = 0; end

pause on
p = 1/length(x);

ax = newplot;
if ~ishold,
  axis([min(x(isfinite(x))) max(x(isfinite(x))) ...
        min(y(isfinite(y))) max(y(isfinite(y)))])
end
co = get(ax,'colororder');

if size(co,1)>=3,
  % Choose first three colors for head, body, and tail
  head = line('color',co(1,:),'marker','o','erase','xor', ...
              'xdata',x(1),'ydata',y(1));
  body = line('color',co(2,:),'linestyle','-','erase','none', ...
              'xdata',[],'ydata',[]);
  tail = line('color',co(3,:),'linestyle','-','erase','none', ...
              'xdata',[],'ydata',[]);
else
  % Choose first three colors for head, body, and tail
  head = line('color',co(1,:),'marker','o','erase','xor', ...
              'xdata',x(1),'ydata',y(1));
  body = line('color',co(1,:),'linestyle','--','erase','none', ...
              'xdata',[],'ydata',[]);
  tail = line('color',co(1,:),'linestyle','-','erase','none', ...
              'xdata',[],'ydata',[]);
end

m = length(x);
k = round(p*m);

% Grow the body
for i = 2:k+1
   j = i-1:i;
   set(head,'xdata',x(i),'ydata',y(i))
   set(body,'xdata',x(j),'ydata',y(j))
   drawnow
%   M(i-1) = getframe(gcf);     для записи видео
   pause(w);
end

% Primary loop
for i = k+2:m
   j = i-1:i;
   set(head,'xdata',x(i),'ydata',y(i))
   set(body,'xdata',x(j),'ydata',y(j))
   set(tail,'xdata',x(j-k),'ydata',y(j-k))
   drawnow
%     M(i-1) = getframe(gcf);   для записи видео
   pause(w);
end

% Clean up the tail
for i = m+1:m+k
   j = i-1:i;
   set(tail,'xdata',x(j-k),'ydata',y(j-k))
   drawnow
%   M(i-1) = getframe(gcf);     для записи видео
   pause(w);
end

%pause;     для записи видео
%movie(M);  для записи видео