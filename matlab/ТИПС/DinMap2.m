function varargout = DinMap2(varargin)
% CHAOS Application M-file for Chaos.fig
%    FIG = CHAOS launch Chaos GUI.
%    CHAOS('callback_name', ...) invoke the named callback.

% Last Modified by GUIDE v2.5 22-Aug-2007 11:25:06

if nargin == 0  % LAUNCH GUI

	fig = openfig(mfilename,'reuse');

	% Use system color scheme for figure:
	set(fig,'Color',get(0,'defaultUicontrolBackgroundColor'));

	% Generate a structure of handles to pass to callbacks, and store it. 
	handles = guihandles(fig);
	guidata(fig, handles);

	handles.Alow = 2.9;
	handles.Ahigh = 4;    
	handles.Blow = 2.9;
	handles.Bhigh = 4;
	handles.Xlow = -0.5;
	handles.Xhigh = 1.5;
    
    handles.x0 = 0.49556;
    handles.y0 = 0.9637;
    
    handles.E1 = 0.015;
    handles.E2 = 0.01;
    
    handles.Elow = 0;
    handles.Ehigh = 0.5;
	
	handles.na = 100;
	handles.nb = 100;
	handles.nx = 5000;
	
	handles.for1 = 1000;
	handles.for2 = 100;
    
    handles.naBifur = 1500;
    handles.nxBifur = 1500;
    
    handles.spiderSteps1 = 0;
    handles.spiderSteps2 = 100;
    
    handles.dmap = 0;
    
    handles.cmap = [1 1 1;0 1 0; 1 1 0; 1 0 1; 0 0 1; 0 1 1;0.3 0.3 0.5; 0.8 1 0.2;1 0 0;0.5 0.5 0.5];

	set(handles.tAlow, 'String', num2str(handles.Alow));
	set(handles.tAhigh, 'String', num2str(handles.Ahigh));
   	set(handles.tBlow, 'String', num2str(handles.Blow));
	set(handles.tBhigh, 'String', num2str(handles.Bhigh));
   	set(handles.tXlow, 'String', num2str(handles.Xlow));
	set(handles.tXhigh, 'String', num2str(handles.Xhigh));
    
    set(handles.tE1, 'String', num2str(handles.E1));
	set(handles.tE2, 'String', num2str(handles.E2));
    
   	set(handles.tAres, 'String', num2str(handles.na));
   	set(handles.tBres, 'String', num2str(handles.nb));
   	set(handles.tXres, 'String', num2str(handles.nx));
    
   	set(handles.tFor1, 'String', num2str(handles.for1));
	set(handles.tFor2, 'String', num2str(handles.for2));
    
    set(handles.tMarkB, 'Enable', 'off');
    set(handles.tMarkA, 'Enable', 'off');
    
    %заполнение списка файлов текущей директории
    loadFileList(handles);
    
	guidata(fig, handles);

   	if nargout > 0
		varargout{1} = fig;
	end

elseif ischar(varargin{1}) % INVOKE NAMED SUBFUNCTION OR CALLBACK

	try
		[varargout{1:nargout}] = feval(varargin{:}); % FEVAL switchyard
	catch
		disp(lasterr);
	end

end

% --------------------------------------------------------------------
function tAlow_Callback(h, eventdata, handles, varargin)
nAlow = str2num(get(handles.tAlow, 'String'));

if(handles.Ahigh <= nAlow)
	handles.Alow = nAlow;    
    handles.Ahigh = handles.Alow+0.1;
    set(handles.tAhigh, 'String', num2str(handles.Ahigh));
else
	handles.Alow = nAlow;
end

guidata(gcbo, handles);

% --------------------------------------------------------------------
function tAhigh_Callback(h, eventdata, handles, varargin)
nAhigh = str2num(get(handles.tAhigh, 'String'));

if(nAhigh <= handles.Alow)
    handles.Alow = nAhigh-0.1;
    set(handles.tAlow, 'String', num2str(handles.Alow));
end

handles.Ahigh = nAhigh;

guidata(gcbo, handles);

% --------------------------------------------------------------------
function tXlow_Callback(h, eventdata, handles, varargin)
nXlow = str2num(get(handles.tXlow, 'String'));

if(handles.Xhigh <= nXlow)
	handles.Xlow = nXlow;    
    handles.Xhigh = handles.Xlow+0.1;
    set(handles.tXhigh, 'String', num2str(handles.Xhigh));
else
	handles.Xlow = nXlow;
end

guidata(gcbo, handles);


% --------------------------------------------------------------------
function tXhigh_Callback(h, eventdata, handles, varargin)
nXhigh = str2num(get(handles.tXhigh, 'String'));

if(nXhigh <= handles.Xlow)
    handles.Xlow = nXhigh-0.1;
    set(handles.tXlow, 'String', num2str(handles.Xlow));
end

handles.Xhigh = nXhigh;

guidata(gcbo, handles);


% --------------------------------------------------------------------
function tBlow_Callback(h, eventdata, handles, varargin)
nBlow = str2num(get(handles.tBlow, 'String'));

if(handles.Bhigh <= nBlow)
	handles.Blow = nBlow;    
    handles.Bhigh = handles.Blow+0.1;
    set(handles.tBhigh, 'String', num2str(handles.Bhigh));
else
	handles.Blow = nBlow;
end

guidata(gcbo, handles);


% --------------------------------------------------------------------
function tBhigh_Callback(h, eventdata, handles, varargin)
nBhigh = str2num(get(handles.tBhigh, 'String'));

if(nBhigh <= handles.Blow)
    handles.Blow = nBhigh-0.1;
    set(handles.tBlow, 'String', num2str(handles.Blow));
end

handles.Bhigh = nBhigh;

guidata(gcbo, handles);


% --------------------------------------------------------------------
function tCustomF1_Callback(h, eventdata, handles, varargin)

% --------------------------------------------------------------------
function tAres_Callback(h, eventdata, handles, varargin)
tmp = str2num(get(handles.tAres, 'String'));
if(tmp <= 0)
    tmp = 50;
    set(handles.tAres, 'String', num2str(tmp));
end
handles.na = tmp;
guidata(gcbo, handles);

% --------------------------------------------------------------------
function tBres_Callback(h, eventdata, handles, varargin)
tmp = str2num(get(handles.tBres, 'String'));
if(tmp <= 0)
    tmp = 50;
    set(handles.tBres, 'String', num2str(tmp));
end
handles.nb = tmp;
guidata(gcbo, handles);

% --------------------------------------------------------------------
function tXres_Callback(h, eventdata, handles, varargin)
tmp = str2num(get(handles.tXres, 'String'));
if(tmp <= 0)
    tmp = 50;
    set(handles.tXres, 'String', num2str(tmp));
end
handles.nx = tmp;
guidata(gcbo, handles);

% --------------------------------------------------------------------
function tFor1_Callback(h, eventdata, handles, varargin)
tmp = str2num(get(handles.tFor1, 'String'));
if(tmp <= 0)
    tmp = 300;
    set(handles.tFor1, 'String', num2str(tmp));
end
handles.for1 = tmp;
guidata(gcbo, handles);

% --------------------------------------------------------------------
function tE1_Callback(hObject, eventdata, handles)
tmp = str2num(get(handles.tE1, 'String'));
handles.E1 = tmp;
guidata(gcbo, handles);


% --------------------------------------------------------------------
function tE2_Callback(hObject, eventdata, handles)
tmp = str2num(get(handles.tE2, 'String'));
handles.E2 = tmp;
guidata(gcbo, handles);

% --------------------------------------------------------------------
function mInitValues_Callback(hObject, eventdata, handles)
prompt = {'Input initial \bfx \rmvalue','Input initial \bfy \rmvalue'};
title = 'Initial values';
def = {num2str(handles.x0), num2str(handles.y0)};
lineNo = 1;

AddOpts.Resize='off';
AddOpts.WindowStyle='normal';
AddOpts.Interpreter='tex';
   
answer = inputdlg(prompt, title, lineNo, def, AddOpts);

if(size(answer) == [0 0])
	return;
end

res = eval(answer{1,1});
handles.x0 = res;
res = eval(answer{2,1});
handles.y0 = res;
guidata(gcbo, handles);

% --------------------------------------------------------------------
function tFor2_Callback(h, eventdata, handles, varargin)
tmp = str2num(get(handles.tFor2, 'String'));
if(tmp <= 0)
    tmp = 100;
    set(handles.tFor2, 'String', num2str(tmp));
end
handles.for2 = tmp;
guidata(gcbo, handles);

% --------------------------------------------------------------------
function mBifruSize_Callback(hObject, eventdata, handles)
prompt = {'Input \bfx \rmresolution','Input \bfa(b) \rmresolution'};
title = 'Resolution';
def = {num2str(handles.nxBifur), num2str(handles.naBifur)};
lineNo = 1;

AddOpts.Resize='off';
AddOpts.WindowStyle='normal';
AddOpts.Interpreter='tex';
   
answer = inputdlg(prompt, title, lineNo, def, AddOpts);

if(size(answer) == [0 0])
	return;
end

res = eval(answer{1,1});
handles.nxBifur = res;
res = eval(answer{2,1});
handles.naBifur = res;
guidata(gcbo, handles);

% --------------------------------------------------------------------
function mERange_Callback(hObject, eventdata, handles)
prompt = {'Input \bfElow \rmvalue','Input \bfEhigh \rmvalue'};
title = 'Parameter E range';
def = {num2str(handles.Elow), num2str(handles.Ehigh)};
lineNo = 1;

AddOpts.Resize='off';
AddOpts.WindowStyle='normal';
AddOpts.Interpreter='tex';
   
answer = inputdlg(prompt, title, lineNo, def, AddOpts);

if(size(answer) == [0 0])
	return;
end

res = eval(answer{1,1});
handles.Elow = res;
res = eval(answer{2,1});
handles.Ehigh = res;
guidata(gcbo, handles);


% --------------------------------------------------------------------
function bStart_Callback(h, eventdata, handles, varargin)

handles = Calculate(h, handles);
guidata(gcbo, handles);

% --------------------------------------------------------------------
function handles = Calculate(h, handles)
tic;
stB = (handles.Bhigh - handles.Blow) / handles.nb;
func1 = get(handles.tCustomF1, 'String');
func2 = get(handles.tCustomF2, 'String');
i = handles.nb+1;
nb = handles.nb + 1;


handles.dmap = zeros(handles.nb, handles.na);
[maxC b] = size(handles.cmap);

if((get(handles.cAltAlgorithm, 'Value') == 1) & (handles.nx > 499))
	for B = handles.Blow:stB:handles.Bhigh
        sts = sprintf('%4.1f%% выполнено', (nb-i)*100/nb);
       	set(handles.Status, 'String', sts);
        res = calcCustomFunc2a(handles.Alow, handles.Ahigh, handles.Xlow, handles.Xhigh, handles.na, handles.nx, handles.x0, handles.y0, handles.for1, handles.for2, B, func1, func2, handles.E1, handles.E2);
        handles.dmap(i, :) = fillMapAlt(res, handles.na, handles.nx);    
        i=i-1;    
    end
else
	for B = handles.Blow:stB:handles.Bhigh
        sts = sprintf('%4.1f%% выполнено', (nb-i)*100/nb);
       	set(handles.Status, 'String', sts);
        res = calcCustomFunc2a(handles.Alow, handles.Ahigh, handles.Xlow, handles.Xhigh, handles.na, handles.nx, handles.x0, handles.y0, handles.for1, handles.for2, B, func1, func2, handles.E1, handles.E2);
        handles.dmap(i, :) = fillMap(res, handles.na, handles.nx, maxC);    
        i=i-1;
	end
end
b=toc;
sts = sprintf('Выполнено. Затрачено %12.2f сек.', b);
set(handles.Status, 'String', sts);

%cmap = [1 1 1;0 1 0; 1 1 0; 1 0 1; 0 0 1; 0 1 1;0.3 0.3 0.5; 0.8 1 0.2;1 0 0;0.5 0.5 0.5];

%если установлена галочка 'В отдельном окне'
if(get(handles.cNewWindow, 'Value') == 1)
    hf=figure('Name', 'Dynamic map');
    figure(hf);

    drawMap(handles);
end

axes(handles.Axes);
cla;

drawMap(handles);

SaveLog(handles);
guidata(gcbo, handles);

% --------------------------------------------------------------------
function drawMap(handles)
%вывод карты режимов на экран
image(handles.dmap);    
colormap(handles.cmap);
ticks=[1 handles.nb/4 handles.nb/2 3*handles.nb/4 handles.nb];
tickLabel=num2str([handles.Bhigh:(-handles.Bhigh+handles.Blow)/4:handles.Blow]');
set(gca, 'YTick', ticks);
set(gca, 'YTickLabel', tickLabel);

ticks=[1 handles.na/4 handles.na/2 3*handles.na/4 handles.na];
tickLabel=num2str([handles.Alow:(handles.Ahigh-handles.Alow)/4:handles.Ahigh]');
set(gca, 'XTick', ticks);
set(gca, 'XTickLabel', tickLabel);
tMarkA_Callback(handles.tMarkA,0,handles,0);
tMarkB_Callback(handles.tMarkB,0,handles,0);

% --------------------------------------------------------------------
function bExit_Callback(hObject, eventdata, handles)
close


% --------------------------------------------------------------------
function res = calcCustomFunc2a(Alow, Ahigh, Xlow, Xhigh, na, nx, x0, y0, for1, for2, b, func1, func2, e1, e2)
%вычисление итераций при фиксированном значении параметра b
res=zeros(nx,na);
x(1:na)=x0;
step=(Ahigh-Alow)/na;
a=[Alow:step:Ahigh-step];
y(1:na)=y0;
xNew = zeros(1,na);
yNew = zeros(1,na);
xEv = zeros(1,na);
yEv = zeros(1,na);

mod = nx / (Xhigh - Xlow);

for i=0:for1-1
    xEv = eval(func1);
    yEv = eval(func2);
    
    xNew = -e2.*x + (1-e1).*(xEv)+e2.*y+e1*yEv;
    yNew = -e2.*y + (1-e1).*(yEv)+e2.*x+e1*xEv;
    
    x = xNew;
    y = yNew;
end

for i=0:for2-1
    xEv = eval(func1);
    yEv = eval(func2);
    
    xNew = -e2.*x + (1-e1).*(xEv)+e2.*y+e1*yEv;
    yNew = -e2.*y + (1-e1).*(yEv)+e2.*x+e1*xEv;
    
    x = xNew;
    y = yNew;
    
    yy=(x-Xlow).*mod;
    yy=fix(yy);
    for j=1:na
		if(yy(j) > 1 & yy(j) < nx)
	        res(nx-yy(j),j)=res(nx-yy(j),j)+1;
		end
	end
end


% --------------------------------------------------------------------
function res = calcCustomFunc2b(Blow, Bhigh, Xlow, Xhigh, nb, nx, x0, y0, for1, for2, a, func1, func2, e1, e2)
%вычисление итераций при фиксированном значении параметра a
res=zeros(nx,nb);
x(1:nb)=x0;
step=(Bhigh-Blow)/nb;
b=[Blow:step:Bhigh-step];
y(1:nb)=y0;
xNew = zeros(1,nb);
yNew = zeros(1,nb);
xEv = zeros(1,nb);
yEv = zeros(1,nb);

mod = nx / (Xhigh - Xlow);

for i=0:for1-1
    xEv = eval(func1);
    yEv = eval(func2);
    
    xNew = -e2.*x + (1-e1).*(xEv)+e2.*y+e1*yEv;
    yNew = -e2.*y + (1-e1).*(yEv)+e2.*x+e1*xEv;
    
    x = xNew;
    y = yNew;
end

for i=0:for2-1
    xEv = eval(func1);
    yEv = eval(func2);
    
    xNew = -e2.*x + (1-e1).*(xEv)+e2.*y+e1*yEv;
    yNew = -e2.*y + (1-e1).*(yEv)+e2.*x+e1*xEv;
    
    x = xNew;
    y = yNew;
    
    yy=(x-Xlow).*mod;
    yy=fix(yy);
    for j=1:nb
		if(yy(j) > 1 & yy(j) < nx)
	        res(nx-yy(j),j)=res(nx-yy(j),j)+1;
		end
	end
end


% --------------------------------------------------------------------
function result = fillMap(res, na, nx, maxC)
result = ones(1, na);
for i=1:na
    num = 1;
    for j=1:nx
        if(res(j,i) > 0)
            num = num + 1;
            if(num == maxC) 
                break;
            end
        end
    end
    result(i) = num;
end

% --------------------------------------------------------------------
function result = fillMapAlt(res, na, nx)
result = ones(1, na);
for i=1:na
    num = 1;
    j = 1;
    while j <= nx
        k=0;
        while res(j,i) > 0
            j=j+1;
            k=1;
        end
        num = num + k;
        j=j+1;
    end
    result(i) = num;
end

% --------------------------------------------------------------------
function bOpen_Callback(h, eventdata, handles, varargin)
[fname, fpath] = uigetfile({'*.dm2', 'DinMap2 files (*.dm2)'}, 'Open file');

if(isequal(fname,0)|isequal(fpath,0))
	return;
end

file = strcat(fpath, fname);

ff=fopen(file, 'r');

handles = loadPar(handles, ff);

fclose(ff);
guidata(gcbo, handles);


% --------------------------------------------------------------------
function bSave_Callback(h, eventdata, handles, varargin)
[fname, fpath] = uiputfile({'*.dm2', 'DinMap2 files (*.dm2)'}, 'Save file');

if(isequal(fname,0)|isequal(fpath,0))
	return;
end

[a b] = size(fname);

if(b > 4)
	if(fname(b) == '2' & fname(b-1) == 'm' & fname(b-2) == 'd' & fname(b-3) == '.')
        file = strcat(fpath, fname);
    else
        if(fname(b-3) == '.')
            file = strcat(fpath, fname);        
        else
            file = strcat(fpath, fname, '.dm2');
        end
    end
else
    file = strcat(fpath, fname, '.dm2');
end

ff=fopen(file, 'w');

savePar(handles, ff);

fclose(ff);

% --------------------------------------------------------------------
function cNewWindow_Callback(hObject, eventdata, handles)
%если установлена галочка 'В отдельном окне'
if(get(handles.cNewWindow, 'Value') == 1)
    hf=figure('Name', 'Dynamic map');
    figure(hf);
    drawMap(handles);
    axis square;
    title(sprintf('f1=%s   f2=%s; E1=%s; E2=%s', get(handles.tCustomF1, 'String'), get(handles.tCustomF2, 'String'), num2str(handles.E1), num2str(handles.E2)));
end

% --------------------------------------------------------------------
function bColors_Callback(hObject, eventdata, handles)
tmp = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11];
hf = figure('Name', 'Level colors');
figure(hf);
image(tmp);
tickLabel = ['0'; '1'; '2'; '3'; '4'; '5'; '6'; '7'; '8'; '9'; '>'];
set(gca, 'YTickLabel', tickLabel);
set(gca, 'XTickLabel', []);
colormap(handles.cmap);


function cAltAlgorithm_Callback(hObject, eventdata, handles)

% --------------------------------------------------------------------
function SaveLog(handles)

file = fopen('DinMap2.log', 'a+');
str = datestr(datenum(clock), 'dd-mmm-yyyy HH:MM:SS');

fprintf(file, '---------------------------------------------------------------------\n');
fprintf(file, 'Log entry: ');
fprintf(file, str);

fnc = get(handles.tCustomF1, 'String');
fprintf(file, '\nFunction1: %s\n', fnc);

fnc = get(handles.tCustomF2, 'String');
fprintf(file, 'Function2: %s\n', fnc);

if(get(handles.cAltAlgorithm, 'Value') == 1)
    fprintf(file, '\nАльтернативный алгоритм\n');        
else
    fprintf(file, 'Стандартный алгоритм\n');        
end

fprintf(file, '\nParameters range\n');
fprintf(file, '    a: from %f to %f\n', handles.Alow, handles.Ahigh);
fprintf(file, '    b: from %f to %f\n', handles.Blow, handles.Bhigh);
fprintf(file, '    x: from %f to %f\n', handles.Xlow, handles.Xhigh);
fprintf(file, '    Resolution (na*nb*nx): %d * %d * %d\n', handles.na, handles.nb, handles.nx);
fprintf(file, '    Коэффициенты связи: E1 %f; E2 %f\n', handles.E1, handles.E2);
fprintf(file, '    Начальные значения: x0 = %f; y0 = %f\n', handles.x0, handles.y0);

fprintf(file, 'Количество итераций: %d, %d\n', handles.for1, handles.for2);

fprintf(file, '\nEnd of entry\n\n');

fclose(file);


% --------------------------------------------------------------------
function bBifur_Callback(hObject, eventdata, handles)

if(get(handles.cMarkB, 'Value') == 1)
	stB = (handles.Bhigh - handles.Blow) / handles.nb;
	func1 = get(handles.tCustomF1, 'String');
	func2 = get(handles.tCustomF2, 'String');
	
	B = str2num(get(handles.tMarkB, 'String'));
	
	res = calcCustomFunc2a(handles.Alow, handles.Ahigh, handles.Xlow, handles.Xhigh, handles.naBifur, handles.nxBifur, handles.x0, handles.y0, handles.for1, handles.for2, B, func1, func2, handles.E1, handles.E2);
	
	figure;
	spy(res);
	
	ticks=[0:handles.nxBifur/10:handles.nxBifur];
	tmp=[handles.Xhigh:(-handles.Xhigh+handles.Xlow)/10:handles.Xlow];
	tickLabel=num2str(tmp');
	set(gca, 'YTick', ticks);
	set(gca, 'YTickLabel', tickLabel);
	
	tmp=[handles.Alow:(handles.Ahigh-handles.Alow)/10:handles.Ahigh];
	tickLabel=num2str(tmp');
	ticks = [0:handles.naBifur/10:handles.naBifur];
	set(gca, 'XTick', ticks);
	set(gca, 'XTickLabel', tickLabel);
	xlabel('\bfA');
	ylabel('\itf(x)');
    title(sprintf('f1=%s   f2=%s; B=%s; E1=%s; E2=%s', func1, func2, num2str(B), num2str(handles.E1), num2str(handles.E2)));
end

if(get(handles.cMarkA, 'Value') == 1)
	stA = (handles.Ahigh - handles.Alow) / handles.na;
	func1 = get(handles.tCustomF1, 'String');
	func2 = get(handles.tCustomF2, 'String');
	
	A = str2num(get(handles.tMarkA, 'String'));
	
	res = calcCustomFunc2b(handles.Blow, handles.Bhigh, handles.Xlow, handles.Xhigh, handles.naBifur, handles.nxBifur, handles.x0, handles.y0, handles.for1, handles.for2, A, func1, func2, handles.E1, handles.E2);
	
	figure;
    res = res;
	spy(res);
	
	ticks=[0:handles.nxBifur/10:handles.nxBifur];
	tmp=[handles.Xhigh:(-handles.Xhigh+handles.Xlow)/10:handles.Xlow];
	tickLabel=num2str(tmp');
	set(gca, 'YTick', ticks);
	set(gca, 'YTickLabel', tickLabel);
	
	tmp=[handles.Blow:(handles.Bhigh-handles.Blow)/10:handles.Bhigh];
	tickLabel=num2str(tmp');
	ticks = [0:handles.naBifur/10:handles.naBifur];
	set(gca, 'XTick', ticks);
	set(gca, 'XTickLabel', tickLabel);
	xlabel('\bfB');
	ylabel('\itf(x)');        
    title(sprintf('f1=%s   f2=%s; A=%s; E1=%s; E2=%s', func1, func2, num2str(A), num2str(handles.E1), num2str(handles.E2)));
end
    

function AxesButtonDown(hObject, eventdata, handles)


% --------------------------------------------------------------------
function mSaveRes_Callback(hObject, eventdata, handles)
%сохранение настроек отображения вместе с результатами расчета карты
%режимов
[fname, fpath] = uiputfile({'*.dm2d', 'DinMap2 data files (*.dm2d)'}, 'Save file');

if(isequal(fname,0)|isequal(fpath,0))
	return;
end

[a b] = size(fname);

if(b > 5)
	if(fname(b) == 'd' & fname(b-1) == '2' & fname(b-2) == 'm' & fname(b-3) == 'd' & fname(b-4) == '.')
        file = strcat(fpath, fname);
    else
        if(fname(b-3) == '.')
            file = strcat(fpath, fname);        
        else
            file = strcat(fpath, fname, '.dm2d');
        end
    end
else
    file = strcat(fpath, fname, '.dm2d');
end

ff=fopen(file, 'w');

savePar(handles, ff);

fwrite(ff, handles.dmap, 'int32');

fclose(ff);



% --------------------------------------------------------------------
function mLoadRes_Callback(h, eventdata, handles, varargin)
%сохранение настроек отображения вместе с результатами расчета карты
%режимов
[fname, fpath] = uigetfile({'*.dm2d', 'DinMap2 files (*.dm2d)'}, 'Open file');

if(isequal(fname,0)|isequal(fpath,0))
	return;
end

file = strcat(fpath, fname);

ff=fopen(file, 'r');

handles = loadPar(handles, ff);

handles.dmap = zeros(handles.nb+1, handles.na);
handles.dmap = fread(ff, [handles.nb+1, handles.na], 'int32');

fclose(ff);

axes(handles.Axes);
cla;
drawMap(handles);
guidata(gcbo, handles);


% --------------------------------------------------------------------
function handles = loadPar(handles, ff)
%загрузка параметров отобажений
fnc = fgetl(ff);
set(handles.tCustomF1, 'String', fnc);
fnc = fgetl(ff);
set(handles.tCustomF2, 'String', fnc);

tmp = fscanf(ff, '%f', 10);
handles.Alow = tmp(1);
handles.Ahigh = tmp(2);
handles.Blow = tmp(3);
handles.Bhigh = tmp(4);
handles.Xlow = tmp(5);
handles.Xhigh = tmp(6);
handles.E1 = tmp(7);
handles.E2 = tmp(8);
handles.x0 = tmp(9);
handles.y0 = tmp(10);
guidata(gcbo, handles);

set(handles.tAlow, 'String', num2str(handles.Alow));
set(handles.tAhigh, 'String', num2str(handles.Ahigh));
set(handles.tBlow, 'String', num2str(handles.Blow));
set(handles.tBhigh, 'String', num2str(handles.Bhigh));
set(handles.tXlow, 'String', num2str(handles.Xlow));
set(handles.tXhigh, 'String', num2str(handles.Xhigh));
set(handles.tE1, 'String', num2str(handles.E1));
set(handles.tE2, 'String', num2str(handles.E2));

tAlow_Callback(handles.tAlow, 0, handles, 0)
tAhigh_Callback(handles.tAhigh, 0, handles, 0)
tBlow_Callback(handles.tAlow, 0, handles, 0)
tBhigh_Callback(handles.tAhigh, 0, handles, 0)
tXlow_Callback(handles.tXlow, 0, handles, 0)
tXhigh_Callback(handles.tXhigh, 0, handles, 0)

tmp = fscanf(ff, '%d', 5);

handles.na = tmp(1);
handles.nb = tmp(2);
handles.nx = tmp(3);
handles.for1 = tmp(4);
handles.for2 = tmp(5);

set(handles.tAres, 'String', num2str(handles.na));
set(handles.tBres, 'String', num2str(handles.nb));
set(handles.tXres, 'String', num2str(handles.nx));
set(handles.tFor1, 'String', num2str(handles.for1));
set(handles.tFor2, 'String', num2str(handles.for2));


% --------------------------------------------------------------------
function savePar(handles, ff)
%сохранение параметров отобажений
fnc1 = get(handles.tCustomF1, 'String');
fnc2 = get(handles.tCustomF2, 'String');

fprintf(ff, '%s\n', fnc1);
fprintf(ff, '%s\n', fnc2);
fprintf(ff,'%f %f\n', handles.Alow, handles.Ahigh);
fprintf(ff,'%f %f\n', handles.Blow, handles.Bhigh);
fprintf(ff,'%f %f\n', handles.Xlow, handles.Xhigh);
fprintf(ff,'%f %f\n', handles.E1, handles.E2);
fprintf(ff,'%f %f\n', handles.x0, handles.y0);
fprintf(ff,'%d %d %d\n', handles.na, handles.nb, handles.nx);
fprintf(ff,'%d %d', handles.for1, handles.for2);


% --------------------------------------------------------------------
function mBatchRun_Callback(hObject, eventdata, handles)
%запускает пакетный режим работы. Все данные для режима находятся в файле
%DinMap2.batch. 
%Формат файла - текстовый. Содержит записанные с столбец ссылки на файлы
%*.dm2 с настройками
[fname, fpath] = uigetfile({'DinMap2.batch', 'DinMap2 batch files (DinMap2.batch)'}, 'Load batch file');

if(isequal(fname,0)|isequal(fpath,0))
	return;
end

cd(fpath);

tmp = pwd;
set(handles.CurDir, 'string', tmp);

file = strcat(fpath, fname);

ff1=fopen(file, 'r');
capt = fgetl(ff1);
if(strcmpi(capt, 'DinMap2 batch file') == 0)
    disp('---=== Error. Bad batch file. ===---');
    fclose(ff1);
    return;
end

while 1
    fname = fgetl(ff1);
    if ~ischar(fname)
        break;
    end
 
    %загрузка данных из файла
	ff=fopen(fname, 'r');
    if(ff == -1)
        continue;
    end;
	handles = loadPar(handles, ff);
	fclose(ff);
	guidata(gcbo, handles);
    
    %запуск процесса вычисления
    handles = Calculate(hObject, handles);
    
    %формирование имени файла для сохранения результатов
    res = strfind(fname, '.');
    [a b] = size(res);
    fname1 = fname(1:res(b));
    fname1 = strcat(fname1, 'dm2d');
    
    %сохранение результатов
    ff=fopen(fname1, 'w');
    if(ff == -1)
        break;
    end;
	savePar(handles, ff);
	fwrite(ff, handles.dmap, 'int32');
	fclose(ff);
end

fclose(ff1);


% --------------------------------------------------------------------
function cMarkA_Callback(hObject, eventdata, handles)
if(get(handles.cMarkA, 'Value') == 1)
    set(handles.tMarkA, 'Enable', 'on');
    if(length(get(handles.tMarkA, 'String')>0))
        tMarkA_Callback(handles.tMarkA,0,handles,0);
    end
else
    set(handles.tMarkA, 'Enable', 'off');
    axes(handles.Axes);
	h = findobj('Tag', 'MarkA');
	delete(h);
end


% --------------------------------------------------------------------
function cMarkB_Callback(hObject, eventdata, handles)
if(get(handles.cMarkB, 'Value') == 1)
    set(handles.tMarkB, 'Enable', 'on');
    if(length(get(handles.tMarkB, 'String')>0))
        tMarkB_Callback(handles.tMarkB,0,handles,0);
    end
else
    set(handles.tMarkB, 'Enable', 'off');
    axes(handles.Axes);
	h = findobj('Tag', 'MarkB');
	delete(h);
end


% --------------------------------------------------------------------
function tMarkA_Callback(h, eventdata, handles, varargin)
if(get(handles.cMarkA, 'Value') == 0)
    return;
end
nMark = str2num(get(handles.tMarkA, 'String'));
axes(handles.Axes);
hold on;
h = findobj('Tag', 'MarkA');
delete(h);
b = (nMark - handles.Alow) / (handles.Ahigh - handles.Alow) * handles.na;
plot([b b], [0 handles.nb], 'k', 'Tag', 'MarkA');
hold off;

guidata(gcbo, handles);


% --------------------------------------------------------------------
function tMarkB_Callback(h, eventdata, handles, varargin)

if(get(handles.cMarkB, 'Value') == 0)
    return;
end
nMark = str2num(get(handles.tMarkB, 'String'));
axes(handles.Axes);
hold on;
h = findobj('Tag', 'MarkB');
delete(h);
a = handles.nb - (nMark - handles.Blow) / (handles.Bhigh - handles.Blow) * handles.nb;
plot([0 handles.na], [a a], 'k', 'Tag', 'MarkB');
hold off;

guidata(gcbo, handles);

% --------------------------------------------------------------------
function bPP_Callback(hObject, eventdata, handles)
if((get(handles.cMarkB, 'Value') == 0) | (get(handles.cMarkA, 'Value') == 0))
    errordlg('Для построения фазового портрета должны быть заданы оба параметра', 'Error');
    return;
end
xx(1)=handles.x0;
yy(1)=handles.y0;

b = str2num(get(handles.tMarkB, 'String'));
a = str2num(get(handles.tMarkA, 'String'));

e1=handles.E1;
e2=handles.E2;

func1 = get(handles.tCustomF1, 'String');
func2 = get(handles.tCustomF2, 'String');

x=handles.x0;
y=handles.y0;

% for i=2:1:handles.for1
%     xEv = eval(func1);
%     yEv = eval(func2);
%     
%     xNew = -e2.*x + (1-e1).*(xEv)+e2.*y+e1*yEv;
%     yNew = -e2.*y + (1-e1).*(yEv)+e2.*x+e1*xEv;
%     
%     x = xNew;
%     y = yNew;
% end

for i=2:1:handles.for2+handles.for1
    xEv = eval(func1);
    yEv = eval(func2);
    
    x = -e2.*x + (1-e1).*(xEv)+e2.*y+e1*yEv;
    y = -e2.*y + (1-e1).*(yEv)+e2.*x+e1*xEv;
    
    xx(i) = x;
    yy(i) = y;
end

h=figure;
plot3(xx(handles.for1:handles.for2+handles.for1-1), yy(handles.for1:handles.for2+handles.for1-1), xx(handles.for1+1:handles.for2+handles.for1));
set(h, 'Renderer', 'OpenGL');

% --------------------------------------------------------------------
function mPPE1_Callback(hObject, eventdata, handles)
if((get(handles.cMarkB, 'Value') == 0) | (get(handles.cMarkA, 'Value') == 0))
    errordlg('Для построения фазового портрета должны быть заданы оба параметра', 'Error');
    return;
end
xx(1)=handles.x0;
yy(1)=handles.y0;

b = str2num(get(handles.tMarkB, 'String'));
a = str2num(get(handles.tMarkA, 'String'));

e2=handles.E2;

func1 = get(handles.tCustomF1, 'String');
func2 = get(handles.tCustomF2, 'String');

stE=0.01;

h=figure('Name', 'Phase portrait');
set(h, 'Renderer', 'OpenGL');
title(sprintf('f1=%s   f2=%s; A=%s; B=%s; E2=%s', func1, func2, num2str(a), num2str(b), num2str(handles.E2)));
xlabel('X');
ylabel('Y');
zlabel('E1');
hold on

for e1=handles.Elow:stE:handles.Ehigh
    x=handles.x0;
    y=handles.y0;
    
    for i=2:1:handles.for2+handles.for1
        xEv = eval(func1);
        yEv = eval(func2);
        
        x = -e2.*x + (1-e1).*(xEv)+e2.*y+e1*yEv;
        y = -e2.*y + (1-e1).*(yEv)+e2.*x+e1*xEv;
        
        xx(i) = x;
        yy(i) = y;
        
    end
    
    ee(1:handles.for2)=e1;
    plot3(xx(handles.for1+1:handles.for2+handles.for1), yy(handles.for1+1:handles.for2+handles.for1), ee);
end

% --------------------------------------------------------------------
function bSpider_Callback(hObject, eventdata, handles)
if((get(handles.cMarkB, 'Value') == 0) | (get(handles.cMarkA, 'Value') == 0))
    errordlg('Для построения паутинной диаграммы должны быть заданы оба параметра', 'Error');
    return;
end
stx = (handles.Xhigh - handles.Xlow)/handles.nx;
x=[handles.Xlow:stx:handles.Xhigh];
y=[handles.Xlow:stx:handles.Xhigh];

b = str2num(get(handles.tMarkB, 'String'));
a = str2num(get(handles.tMarkA, 'String'));

func1 = get(handles.tCustomF1, 'String');
func2 = get(handles.tCustomF2, 'String');

fx = eval(func1)+handles.E1*(eval(func2)-eval(func1));
hf = figure('Name', 'Spider graph');
figure(hf);
title(sprintf('f1=%s   f2=%s; A=%s; B=%s; E1=%s E2=%s', func1, func2, num2str(a), num2str(b), num2str(handles.E1), num2str(handles.E2)));
hold on;

plot(x,fx, 'LineWidth', 2);
hold on;
plot(x,x, 'g');

xlim([handles.Xlow handles.Xhigh]);
ylim([handles.Xlow handles.Xhigh]);

x0=handles.x0;
y=handles.y0;
i=1;
sx(i) = x0;
sy(i) = handles.Xlow;
ssx(i) = handles.y0;
ssy(i) = handles.Xlow;

totalSteps = handles.spiderSteps2 + handles.spiderSteps1;

for i=2:2:totalSteps
	sx(i)=sx(i-1);
    x = sx(i-1);
    
    ssx(i)=ssx(i-1);
    y = ssx(i-1);
    
    xEv = eval(func1);
    yEv = eval(func2);
    
    xNew = -handles.E2.*x + (1-handles.E1).*(xEv)+handles.E2.*y+handles.E1*yEv;
    yNew = -handles.E2.*y + (1-handles.E1).*(yEv)+handles.E2.*x+handles.E1*xEv;
    
    x = xNew;
    y = yNew;

    sy(i) = x;
    ssy(i) = y;
    
    sx(i+1)=sy(i);
	sy(i+1)=sy(i);
    
    ssx(i+1)=ssy(i);
	ssy(i+1)=ssy(i);
end

sx = sx(handles.spiderSteps1+1:totalSteps);
sy = sy(handles.spiderSteps1+1:totalSteps);

ssx = ssx(handles.spiderSteps1+1:totalSteps);
ssy = ssy(handles.spiderSteps1+1:totalSteps);

grid on;
plot(sx,sy,'r','LineWidth', 2);    
plot(ssx,ssy,'k','LineWidth', 2, 'LineStyle', ':');    
hold off;


% --------------------------------------------------------------------
function mSpiderSetup_Callback(hObject, eventdata, handles)
prompt = {'Количество предварительных итераций','Количество окончательных итераций'};
title = 'Паутинная диаграмма';
def = {num2str(handles.spiderSteps1), num2str(handles.spiderSteps2)};
lineNo = 1;

AddOpts.Resize='off';
AddOpts.WindowStyle='normal';
AddOpts.Interpreter='tex';
   
answer = inputdlg(prompt, title, lineNo, def, AddOpts);

if(size(answer) == [0 0])
	return;
end

res = eval(answer{1,1});
handles.spiderSteps1 = res;
res = eval(answer{2,1});
handles.spiderSteps2 = res;
guidata(gcbo, handles);


% --------------------------------------------------------------------
function lFileList_Callback(hObject, eventdata, handles)



% --------------------------------------------------------------------
function bCD_Callback(hObject, eventdata, handles)
[fname, fpath] = uigetfile({'*.*', 'All files (*.*)'}, 'Select directory');

if(isequal(fpath,0))
	return;
end

cd(fpath);
loadFileList(handles);

% --------------------------------------------------------------------
function bOpenFromList_Callback(hObject, eventdata, handles)
index_selected = get(handles.lFileList,'Value');
file_list = get(handles.lFileList,'String');
filename = file_list{index_selected}; 

fpath = pwd;
file = fullfile(fpath, filename);

ff=fopen(file, 'r');

handles = loadPar(handles, ff);

handles.dmap = zeros(handles.nb+1, handles.na);
handles.dmap = fread(ff, [handles.nb+1, handles.na], 'int32');

fclose(ff);

axes(handles.Axes);
cla;
drawMap(handles);
guidata(gcbo, handles);


% --------------------------------------------------------------------
function loadFileList(handles)
tmp = pwd;
set(handles.CurDir, 'String', tmp);
dir_struct = dir('*.dm2d');
[sorted_names] = sortrows({dir_struct.name}');
set(handles.lFileList,'String',sorted_names,'Value',1)


% --- Executes during object creation, after setting all properties.
function lFileList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lFileList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --------------------------------------------------------------------
function mE1Map_Callback(hObject, eventdata, handles)
if(get(handles.cMarkB, 'Value') == 1)
    tic;
    B = str2num(get(handles.tMarkB, 'String'));
	stE = (handles.Ehigh - handles.Elow) / handles.nb;
	func1 = get(handles.tCustomF1, 'String');
	func2 = get(handles.tCustomF2, 'String');
	i = handles.nb+1;
	nb = handles.nb + 1;
	
	
    dmap1 = zeros(handles.nb, handles.na);
	[maxC b] = size(handles.cmap);
	
	if((get(handles.cAltAlgorithm, 'Value') == 1) & (handles.nx > 499))
		for E = handles.Elow:stE:handles.Ehigh
            sts = sprintf('%4.1f%% выполнено', (nb-i)*100/nb);
           	set(handles.Status, 'String', sts);
            res = calcCustomFunc2a(handles.Alow, handles.Ahigh, handles.Xlow, handles.Xhigh, handles.na, handles.nx, handles.x0, handles.y0, handles.for1, handles.for2, B, func1, func2, E, handles.E2);
            dmap1(i, :) = fillMapAlt(res, handles.na, handles.nx);    
            i=i-1;
        end
	else
		for B = handles.Blow:stB:handles.Bhigh
            sts = sprintf('%4.1f%% выполнено', (nb-i)*100/nb);
           	set(handles.Status, 'String', sts);
            res = calcCustomFunc2a(handles.Alow, handles.Ahigh, handles.Xlow, handles.Xhigh, handles.na, handles.nx, handles.x0, handles.y0, handles.for1, handles.for2, B, func1, func2, E, handles.E2);
            dmap1(i, :) = fillMap(res, handles.na, handles.nx, maxC);    
            i=i-1;
		end
	end
	b=toc;
	sts = sprintf('Выполнено. Затрачено %12.2f сек.', b);
	set(handles.Status, 'String', sts);
	
    hf=figure('Name', 'Dynamic map');
    figure(hf);
	
	image(dmap1);
	colormap(handles.cmap);
	ticks=[1 handles.nb/4 handles.nb/2 3*handles.nb/4 handles.nb];
	tickLabel=num2str([handles.Ehigh:(-handles.Ehigh+handles.Elow)/4:handles.Elow]');
	set(gca, 'YTick', ticks);
	set(gca, 'YTickLabel', tickLabel);
	
	ticks=[1 handles.na/4 handles.na/2 3*handles.na/4 handles.na];
	tickLabel=num2str([handles.Alow:(handles.Ahigh-handles.Alow)/4:handles.Ahigh]');
	set(gca, 'XTick', ticks);
	set(gca, 'XTickLabel', tickLabel);
    xlabel('A');
    ylabel('E1');
    title(sprintf('f1=%s   f2=%s; B=%s; E1=%s', func1, func2, num2str(B), num2str(handles.E2)));
   
elseif(get(handles.cMarkA, 'Value') == 1)
    tic;
    A = str2num(get(handles.tMarkA, 'String'));
	stE = (handles.Ehigh - handles.Elow) / handles.na;
	func1 = get(handles.tCustomF1, 'String');
	func2 = get(handles.tCustomF2, 'String');
	i = handles.na+1;
	na = handles.na + 1;
	
	
    dmap1 = zeros(handles.na, handles.nb);
	[maxC b] = size(handles.cmap);
	
	if((get(handles.cAltAlgorithm, 'Value') == 1) & (handles.nx > 499))
		for E = handles.Elow:stE:handles.Ehigh
            sts = sprintf('%4.1f%% выполнено', (na-i)*100/na);
           	set(handles.Status, 'String', sts);
            res = calcCustomFunc2b(handles.Alow, handles.Ahigh, handles.Xlow, handles.Xhigh, handles.nb, handles.nx, handles.x0, handles.y0, handles.for1, handles.for2, A, func1, func2, E, handles.E2);
            dmap1(i, :) = fillMapAlt(res, handles.nb, handles.nx);    
            i=i-1;
        end
	else
		for B = handles.Blow:stB:handles.Bhigh
            sts = sprintf('%4.1f%% выполнено', (na-i)*100/na);
           	set(handles.Status, 'String', sts);
            res = calcCustomFunc2b(handles.Alow, handles.Ahigh, handles.Xlow, handles.Xhigh, handles.nb, handles.nx, handles.x0, handles.y0, handles.for1, handles.for2, A, func1, func2, E, handles.E2);
            dmap1(i, :) = fillMap(res, handles.nb, handles.nx, maxC);    
            i=i-1;
		end
	end
	b=toc;
	sts = sprintf('Выполнено. Затрачено %12.2f сек.', b);
	set(handles.Status, 'String', sts);
	
    hf=figure('Name', 'Dynamic map');
    figure(hf);
	
	image(dmap1);
	colormap(handles.cmap);
	ticks=[1 handles.na/4 handles.na/2 3*handles.na/4 handles.na];
	tickLabel=num2str([handles.Ehigh:(-handles.Ehigh+handles.Elow)/4:handles.Elow]');
	set(gca, 'YTick', ticks);
	set(gca, 'YTickLabel', tickLabel);
	
	ticks=[1 handles.nb/4 handles.nb/2 3*handles.nb/4 handles.nb];
	tickLabel=num2str([handles.Blow:(handles.Bhigh-handles.Blow)/4:handles.Bhigh]');
	set(gca, 'XTick', ticks);
	set(gca, 'XTickLabel', tickLabel);
    xlabel('B');
    ylabel('E1');
    title(sprintf('f1=%s   f2=%s; A=%s; E2=%s', func1, func2, num2str(A), num2str(handles.E2)));
end

guidata(gcbo, handles);

% --------------------------------------------------------------------
function mE2Map_Callback(hObject, eventdata, handles)
if(get(handles.cMarkB, 'Value') == 1)
    tic;
    B = str2num(get(handles.tMarkB, 'String'));
	stE = (handles.Ehigh - handles.Elow) / handles.nb;
	func1 = get(handles.tCustomF1, 'String');
	func2 = get(handles.tCustomF2, 'String');
	i = handles.nb+1;
	nb = handles.nb + 1;
	
	
    dmap1 = zeros(handles.nb, handles.na);
	[maxC b] = size(handles.cmap);
	
	if((get(handles.cAltAlgorithm, 'Value') == 1) & (handles.nx > 499))
		for E = handles.Elow:stE:handles.Ehigh
            sts = sprintf('%4.1f%% выполнено', (nb-i)*100/nb);
           	set(handles.Status, 'String', sts);
            res = calcCustomFunc2a(handles.Alow, handles.Ahigh, handles.Xlow, handles.Xhigh, handles.na, handles.nx, handles.x0, handles.y0, handles.for1, handles.for2, B, func1, func2, handles.E1, E);
            dmap1(i, :) = fillMapAlt(res, handles.na, handles.nx);    
            i=i-1;
        end
	else
		for E = handles.Elow:stE:handles.Ehigh
            sts = sprintf('%4.1f%% выполнено', (nb-i)*100/nb);
           	set(handles.Status, 'String', sts);
            res = calcCustomFunc2a(handles.Alow, handles.Ahigh, handles.Xlow, handles.Xhigh, handles.na, handles.nx, handles.x0, handles.y0, handles.for1, handles.for2, B, func1, func2, handles.E1, E);
            dmap1(i, :) = fillMap(res, handles.na, handles.nx, maxC);    
            i=i-1;
		end
	end
	b=toc;
	sts = sprintf('Выполнено. Затрачено %12.2f сек.', b);
	set(handles.Status, 'String', sts);
	
    hf=figure('Name', 'Dynamic map');
    figure(hf);
	
	image(dmap1);
	colormap(handles.cmap);
	ticks=[1 handles.nb/4 handles.nb/2 3*handles.nb/4 handles.nb];
	tickLabel=num2str([handles.Ehigh:(-handles.Ehigh+handles.Elow)/4:handles.Elow]');
	set(gca, 'YTick', ticks);
	set(gca, 'YTickLabel', tickLabel);
	
	ticks=[1 handles.na/4 handles.na/2 3*handles.na/4 handles.na];
	tickLabel=num2str([handles.Alow:(handles.Ahigh-handles.Alow)/4:handles.Ahigh]');
	set(gca, 'XTick', ticks);
	set(gca, 'XTickLabel', tickLabel);
    xlabel('A');
    ylabel('E2');
    title(sprintf('f1=%s   f2=%s; B=%s; E1=%s', func1, func2, num2str(B), num2str(handles.E1)));
   
elseif(get(handles.cMarkA, 'Value') == 1)
    tic;
    A = str2num(get(handles.tMarkA, 'String'));
	stE = (handles.Ehigh - handles.Elow) / handles.na;
	func1 = get(handles.tCustomF1, 'String');
	func2 = get(handles.tCustomF2, 'String');
	i = handles.na+1;
	na = handles.na + 1;
	
	
    dmap1 = zeros(handles.na, handles.nb);
	[maxC b] = size(handles.cmap);
	
	if((get(handles.cAltAlgorithm, 'Value') == 1) & (handles.nx > 499))
		for E = handles.Elow:stE:handles.Ehigh
            sts = sprintf('%4.1f%% выполнено', (na-i)*100/na);
           	set(handles.Status, 'String', sts);
            res = calcCustomFunc2b(handles.Alow, handles.Ahigh, handles.Xlow, handles.Xhigh, handles.nb, handles.nx, handles.x0, handles.y0, handles.for1, handles.for2, A, func1, func2, handles.E1, E);
            dmap1(i, :) = fillMapAlt(res, handles.nb, handles.nx);    
            i=i-1;
        end
	else
		for E = handles.Elow:stE:handles.Ehigh
            sts = sprintf('%4.1f%% выполнено', (na-i)*100/na);
           	set(handles.Status, 'String', sts);
            res = calcCustomFunc2b(handles.Alow, handles.Ahigh, handles.Xlow, handles.Xhigh, handles.nb, handles.nx, handles.x0, handles.y0, handles.for1, handles.for2, A, func1, func2, handles.E1, E);
            dmap1(i, :) = fillMap(res, handles.nb, handles.nx, maxC);    
            i=i-1;
		end
	end
	b=toc;
	sts = sprintf('Выполнено. Затрачено %12.2f сек.', b);
	set(handles.Status, 'String', sts);
	
    hf=figure('Name', 'Dynamic map');
    figure(hf);
	
	image(dmap1);
	colormap(handles.cmap);
	ticks=[1 handles.na/4 handles.na/2 3*handles.na/4 handles.na];
	tickLabel=num2str([handles.Ehigh:(-handles.Ehigh+handles.Elow)/4:handles.Elow]');
	set(gca, 'YTick', ticks);
	set(gca, 'YTickLabel', tickLabel);
	
	ticks=[1 handles.nb/4 handles.nb/2 3*handles.nb/4 handles.nb];
	tickLabel=num2str([handles.Blow:(handles.Bhigh-handles.Blow)/4:handles.Bhigh]');
	set(gca, 'XTick', ticks);
	set(gca, 'XTickLabel', tickLabel);
    xlabel('B');
    ylabel('E2');
    title(sprintf('f1=%s   f2=%s; A=%s; E1=%s', func1, func2, num2str(A), num2str(handles.E1)));
end

guidata(gcbo, handles);
% --------------------------------------------------------------------
function res = calcCustomFuncE(E2low, E2high, Xlow, Xhigh, ne, nx, x0, y0, for1, for2, a, b, func1, func2, e1)
%вычисление итераций при фиксированных a&b
res=zeros(nx,ne);
x(1:ne)=x0;
step=(E2high-E2low)/ne;
e2=[E2low:step:E2high-step];
y(1:ne)=y0;
xNew = zeros(1,ne);
yNew = zeros(1,ne);
xEv = zeros(1,ne);
yEv = zeros(1,ne);

mod = nx / (Xhigh - Xlow);

for i=0:for1-1
    xEv = eval(func1);
    yEv = eval(func2);
    
    xNew = -e2.*x + (1-e1).*(xEv)+e2.*y+e1*yEv;
    yNew = -e2.*y + (1-e1).*(yEv)+e2.*x+e1*xEv;
    
    x = xNew;
    y = yNew;
end

for i=0:for2-1
    xEv = eval(func1);
    yEv = eval(func2);
    
    xNew = -e2.*x + (1-e1).*(xEv)+e2.*y+e1*yEv;
    yNew = -e2.*y + (1-e1).*(yEv)+e2.*x+e1*xEv;
    
    x = xNew;
    y = yNew;
    
    yy=(x-Xlow).*mod;
    yy=fix(yy);
    for j=1:ne
		if(yy(j) > 1 & yy(j) < nx)
	        res(nx-yy(j),j)=res(nx-yy(j),j)+1;
		end
	end
end

% --------------------------------------------------------------------
function m_Emap_Callback(hObject, eventdata, handles)
if((get(handles.cMarkB, 'Value') == 1)&&(get(handles.cMarkA, 'Value') == 1))
    tic;
    B = str2num(get(handles.tMarkB, 'String'));
    A = str2num(get(handles.tMarkA, 'String'));
	stE1 = (1 - 0) / handles.nb;
    stE2 = (0.5 - 0) / handles.nb;
    func1 = get(handles.tCustomF1, 'String');
	func2 = get(handles.tCustomF2, 'String');
	i = handles.nb+1;
	nb = handles.nb + 1;

    dmap1 = zeros(handles.nb, handles.nb);
	[maxC b] = size(handles.cmap);
	
	if((get(handles.cAltAlgorithm, 'Value') == 1) & (handles.nx > 499))
		for E1 = 0:stE1:1
            sts = sprintf('%4.1f%% выполнено', (nb-i)*100/nb);
           	set(handles.Status, 'String', sts);
            res = calcCustomFuncE(0, 0.5, handles.Xlow, handles.Xhigh, handles.nb, handles.nx, handles.x0, handles.y0, handles.for1, handles.for2, A, B, func1, func2, E1);
            dmap1(i, :) = fillMapAlt(res, handles.nb, handles.nx);    
            i=i-1;
        end
	else
		for E1 = 0:stE1:1
            sts = sprintf('%4.1f%% выполнено', (nb-i)*100/nb);
           	set(handles.Status, 'String', sts);
            res = calcCustomFuncE(0, 0.5, handles.Xlow, handles.Xhigh, handles.nb, handles.nx, handles.x0, handles.y0, handles.for1, handles.for2, A, B, func1, func2, E1);
            dmap1(i, :) = fillMap(res, handles.nb, handles.nx);    
            i=i-1;
		end
	end
	b=toc;
	sts = sprintf('Выполнено. Затрачено %12.2f сек.', b);
	set(handles.Status, 'String', sts);
	
    hf=figure('Name', 'Dynamic map');
    figure(hf);
    
   	image(dmap1);
	colormap(handles.cmap);
    ticks=[1 handles.nb/4 handles.nb/2 3*handles.nb/4 handles.nb];
	tickLabel=num2str([1:(-1+0)/4:0]');
	set(gca, 'YTick', ticks);
	set(gca, 'YTickLabel', tickLabel);
	
	ticks=[1 handles.nb/4 handles.nb/2 3*handles.nb/4 handles.nb];
	tickLabel=num2str([0:0.125:0.5]');
	set(gca, 'XTick', ticks);
	set(gca, 'XTickLabel', tickLabel);
    xlabel('E2');
    ylabel('E1');
    title(sprintf('f1=%s   f2=%s; A=%s; B=%s', func1, func2, num2str(A), num2str(B)));
end