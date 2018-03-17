function varargout = recurrencefig(varargin)
% RECURRENCEFIG MATLAB code for recurrencefig.fig
%      RECURRENCEFIG, by itself, creates a new RECURRENCEFIG or raises the existing
%      singleton*.
%
%      H = RECURRENCEFIG returns the handle to a new RECURRENCEFIG or the handle to
%      the existing singleton*.
%
%      RECURRENCEFIG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RECURRENCEFIG.M with the given input arguments.
%
%      RECURRENCEFIG('Property','Value',...) creates a new RECURRENCEFIG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before recurrencefig_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to recurrencefig_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help recurrencefig

% Last Modified by GUIDE v2.5 17-Mar-2018 00:14:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @recurrencefig_OpeningFcn, ...
                   'gui_OutputFcn',  @recurrencefig_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

%% --- Executes just before recurrencefig is made visible.
function recurrencefig_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to recurrencefig (see VARARGIN)


% Choose default command line output for recurrencefig
handles.output = hObject;
hObject.UserData = struct(...
    'data_raw', [],...  % | matrix of linear data
    'embed', 5,...      % <-|   7  paramters      %
    'delay', 1,...      % |                     %
    'pstart', [],...    % |                     %
    'pend', [],...      %|
    'maxpend',[],...  % |                     %
    'range',[],...      % |                     %
    'norm', 1,...       % |                     %
    'rescale', 1,...    % |                     %
    'radius', 1,...     % <-|                    %
    'line', 2, ...      %  -------------------- %
    'prec', [],...      % <-| quantification variables
    'pdet', [],...      % |                     %
    'lmax', [],...      % |                     %
    'ent', [],...       % |                     %
    'tnd', [],...       % |                     %
    'plam', [],...      % |                     %
    'tt', []);          % <-|                   %
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes recurrencefig wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = recurrencefig_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
varargout{1} = handles.output;
% Get default command line output from handles structure


%% CALLBACK FUNCTIONS:
%% PARAMTER 1: EMBED
% --- Executes on button press in embedminus.
function embedminus_Callback(hObject, eventdata, handles)
% hObject    handle to embedminus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('clicked on embedminus')
embed = str2num(handles.embedtext.String);
if (embed > 1)
    handles.embedtext.String=num2str(embed-1);
    handles.figure1.UserData.embed = embed-1;
    handles.figure1.UserData = updateRP(handles.figure1.UserData);
    guidata(hObject, handles);   
end       

function embedtext_Callback(hObject, eventdata, handles)
% hObject    handle to embedtext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of embedtext as text
%        str2double(get(hObject,'String')) returns contents of embedtext as a double
disp('typed in embedtext')   
embed = str2num(get(hObject,'String'));
if (embed >= 1)
    handles.figure1.UserData.embed = embed;
    handles.figure1.UserData = updateRP(handles.figure1.UserData);
    guidata(hObject, handles);   
end

% --- Executes on button press in embedplus.
function embedplus_Callback(hObject, eventdata, handles)
% hObject    handle to embedplus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('clicked on embedplus') 
embed = str2num(handles.embedtext.String);
handles.embedtext.String = num2str(embed+1);
handles.figure1.UserData.embed = embed+1;
handles.figure1.UserData = updateRP(handles.figure1.UserData);
guidata(hObject, handles);  


%% PARAMTER 2: DELAY
% --- Executes on button press in delayminus.
function delayminus_Callback(hObject, eventdata, handles)
% hObject    handle to delayminus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('clicked on delayminus')   
delay = str2num(handles.delaytext.String);
if (delay > 1)
    handles.delaytext.String=num2str(delay-1);
    handles.figure1.UserData.delay = delay-1;
    handles.figure1.UserData = updateRP(handles.figure1.UserData);
    guidata(hObject, handles);   
end     

function delaytext_Callback(hObject, eventdata, handles)
% hObject    handle to delaytext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('typed in delaytext')   
delay = str2num(get(hObject,'String'));
if (delay >= 1)
    handles.figure1.UserData.delay = delay;
    handles.figure1.UserData = updateRP(handles.figure1.UserData);
    guidata(hObject, handles);   
end    

% --- Executes on button press in delayplus.
function delayplus_Callback(hObject, eventdata, handles)
% hObject    handle to delayplus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('clicked on delayplus')   
delay = str2num(handles.delaytext.String);
handles.delaytext.String = num2str(delay+1);
handles.figure1.UserData.delay = delay+1;
handles.figure1.UserData = updateRP(handles.figure1.UserData);
guidata(hObject, handles);  


%% PARAMETR 3: RANGE: W = Pend-Pstart+1

function pstart_Callback(hObject, eventdata, handles)
% hObject    handle to pstart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pstart as text
%        str2double(get(hObject,'String')) returns contents of pstart as a double
disp('pstart callback triggered')
pstart = str2num(get(hObject,'String'));
if (pstart >= 1)
    handles.figure1.UserData.pstart = pstart;
    guidata(hObject, handles);   
end  

function pend_Callback(hObject, eventdata, handles)
% hObject    handle to pend (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pend as text
%        str2double(get(hObject,'String')) returns contents of pend as a double
disp('pend callback triggered')
pend = str2num(get(hObject,'String'));
if (pend >= 1)
    handles.figure1.UserData.pend = pend;
    guidata(hObject, handles);   
end  

%% PARAMETER 4: NORM: 1 Euclidian 2 Min 3 Max
% --- Executes when selected object is changed in normbg.
function normbg_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in normbg 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('normbg changed')
switch (hObject.String)
    case 'Euclidian'
        handles.figure1.UserData.norm = 1;
    case 'Min'
        handles.figure1.UserData.norm = 2;
    case 'Max'
        handles.figure1.UserData.norm = 3;
end 
disp(handles.figure1.UserData.norm);
% options for norm need to be corrected
% so for now, changing norm back to 1 
% so rpplot only uses euclidian distance
% once fixed, delete this next line:
handles.figure1.UserData.norm = 1;
% below code is good
handles.figure1.UserData = updateRP(handles.figure1.UserData);
guidata(hObject, handles); 

%% PARAMETER 5: RESCALING: 1 None 2 Mean 3 Max
% --- Executes when selected object is changed in rescalebg.
function rescalebg_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in rescalebg 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('rescalebg changed')
switch (hObject.String)
    case 'None'
        handles.figure1.UserData.rescale = 1;
    case 'Mean'
        handles.figure1.UserData.rescale = 2;
    case 'Max'
        handles.figure1.UserData.rescale = 3;
end
disp(handles.figure1.UserData.rescale);
%is rescaling option implemented?
%handles.figure1.UserData = updateRP(handles.figure1.UserData);
guidata(hObject, handles);

%% PARAMETER 6: RADIUS 
% TO BE DECIDED


%% PARAMETER 7: LINE
% --- Executes on button press in lineminus.
function lineminus_Callback(hObject, eventdata, handles)
% hObject    handle to lineminus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('clicked on lineminus')   
line = str2num(handles.linetext.String);
if (line > 2)
    handles.linetext.String=num2str(line-1);
    handles.figure1.UserData.line = line-1;
    handles.figure1.UserData = updateRP(handles.figure1.UserData);
    guidata(hObject, handles); 
end    

function linetext_Callback(hObject, eventdata, handles)
% hObject    handle to linetext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('typed in linetext')   
line = str2num(get(hObject,'String'));
if (line >= 2)
    handles.figure1.UserData.line = line;
    handles.figure1.UserData = updateRP(handles.figure1.UserData);
    guidata(hObject, handles);   
end

% --- Executes on button press in lineplus.
function lineplus_Callback(hObject, eventdata, handles)
% hObject    handle to lineplus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('clicked on lineplus')   
line = str2num(handles.linetext.String);
handles.linetext.String = num2str(line+1);
handles.figure1.UserData.line = line+1;
handles.figure1.UserData = updateRP(handles.figure1.UserData);
guidata(hObject, handles);  



%% TOOLBAR BUTTON CALLBACKS:
% --------------------------------------------------------------------
function opendata_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to opendata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

format long
handles = guihandles;
try
    disp('Opening...')
    %open a .mat type file only
    [fname,fpath] = uigetfile('*.mat','Open Raw Data File');    
    if (fpath)
        % load .mat file with a variable called data_raw into the workspace
        load(sprintf('%s/%s',fpath,fname));
        
        % assume variable data_raw was loaded
        handles.figure1.UserData.data_raw = data_raw;
       
        disp('Open Completed');
        uiwait(msgbox('Open Completed','Open Completed','modal'));
        % create recurrence plot graph with current params set
        handles.figure1.UserData = updateRP(handles.figure1.UserData);
        guidata(hObject,handles);
    else
        disp('Open Canceled');
    end
catch ME
    if (strcmp (ME.identifier,'MATLAB:badsubscript'))
        uiwait(msgbox('Please Select a Raw Data File','Error','error', 'modal'));
        disp('Open Aborted');
        
    elseif (strcmp(ME.identifier,'MATLAB:COM:E2148140012'));
        uiwait(msgbox('Please enable editing in Excel','Error','error','modal'));
        disp('Open Aborted');
    else
        uiwait(msgbox('Unknown Error, Please Try Again','Error','error', 'modal'));
        disp('Open Aborted');
    end
end

% --------------------------------------------------------------------
function helpmenu_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to helpmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('help button clicked')

% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);


%% IGNORE FUNCTIONS BELOW THIS LINE, NOT USEFUL
% --------------------------------------------------------------------

% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes during object creation, after setting all properties.
function embedtext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to embedtext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function delaytext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to delaytext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function pend_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pend (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function pstart_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pstart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function linetext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to linetext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
