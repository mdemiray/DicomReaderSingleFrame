  function varargout = DICOM_READER(varargin)
% DICOM_READER MATLAB code for DICOM_READER.fig
%      DICOM_READER, by itself, creates a new DICOM_READER or raises the existing
%      singleton*.
%
%      H = DICOM_READER returns the handle to a new DICOM_READER or the handle to
%      the existing singleton*.
%
%      DICOM_READER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DICOM_READER.M with the given input arguments.
%
%      DICOM_READER('Property','Value',...) creates a new DICOM_READER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DICOM_READER_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DICOM_READER_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DICOM_READER

% Last Modified by GUIDE v2.5 01-Apr-2014 23:39:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DICOM_READER_OpeningFcn, ...
                   'gui_OutputFcn',  @DICOM_READER_OutputFcn, ...
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


% --- Executes just before DICOM_READER is made visible.
function DICOM_READER_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DICOM_READER (see VARARGIN)

% Choose default command line output for DICOM_READER
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DICOM_READER wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DICOM_READER_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;






function EditInput2_Callback(hObject, eventdata, handles)
% hObject    handle to EditInput2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditInput2 as text
%        str2double(get(hObject,'String')) returns contents of EditInput2 as a double


% --- Executes during object creation, after setting all properties.
function EditInput2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditInput2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function EditBrowse_Callback(hObject, eventdata, handles)
% hObject    handle to EditBrowse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditBrowse as text
%        str2double(get(hObject,'String')) returns contents of EditBrowse as a double


% --- Executes during object creation, after setting all properties.
function EditBrowse_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditBrowse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ButtonBrowse.
function ButtonBrowse_Callback(hObject, eventdata, handles)
% hObject    handle to ButtonBrowse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%[FileName, PathName] = uigetfile('*.*', 'Select an Image');     % A window is opened for the user to select an image
global DirectoryName;
global ReadedFiles;
global Counter;

DirectoryName = uigetdir('Please Select a Directory');
set(handles.EditBrowse, 'string', DirectoryName); % Directory path of the selected image is written to the Edit box.



Counter = 1;

ReadedDirectory = dir(DirectoryName);


for i = 1:numel(ReadedDirectory);
    ReadedFiles(i).name= ReadedDirectory(i).name;
     
end


% --- Executes on button press in ButtonLoadBrowsed.
function ButtonLoadBrowsed_Callback(hObject, eventdata, handles)
% hObject    handle to ButtonLoadBrowsed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Global variables are defined here.
global DirectoryName;
global ReadedFiles;
global Counter;

Counter = 1;

ReadedDirectory = dir(DirectoryName);

LengthOfDirectoryFiles = numel(ReadedDirectory);
%ReadedFileNames = zeros(LengthOfDirectoryFiles, 1);


for i = 1:LengthOfDirectoryFiles;
    ReadedFiles(i).name= ReadedDirectory(i).name;
     
end



FullPath = strcat(DirectoryName, '\' , ReadedFiles(5).name);
DicomImage = dicomread(FullPath);



%Extension(i.e. jpg, jpeg, bmp, png...) of the image file is detected
%below.
% for i=LengthOfDirectory:-1:1
%     if (DirectoryPath(i)== '.')
%         FileExtension = DirectoryPath(i+1 : LengthOfDirectory);
%     end
% end

%A = imread(DirectoryPath, FileExtension);  % Image is read from the selected directory
%Image = im2double(A);
%Image = double(rgb2gray(A));  %Image is converted into a GRAYSCALE IMAGE


%imshow(DicomImage);
imagesc(DicomImage);
axes(handles.AxesOutputImagePlot);
guidata(hObject, handles);


% --- Executes on button press in ButtonCLEAR.
function ButtonCLEAR_Callback(hObject, eventdata, handles)
% hObject    handle to ButtonCLEAR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.AxesOutputImagePlot);

cla(handles.AxesOutputImagePlot,'reset')
guidata(hObject, handles);



function EditInput1_Callback(hObject, eventdata, handles)
% hObject    handle to EditInput1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditInput1 as text
%        str2double(get(hObject,'String')) returns contents of EditInput1 as a double


% --- Executes during object creation, after setting all properties.
function EditInput1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditInput1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ButtonPrevious.
function ButtonPrevious_Callback(hObject, eventdata, handles)
% hObject    handle to ButtonPrevious (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Counter;
global ReadedFiles;
global DirectoryName;

if(Counter >= 1)
    
    FileExtension = GetFileExtension(ReadedFiles(Counter).name);
    if(strcmp(FileExtension, 'dcm'))
        FullPath = strcat(DirectoryName, '\' , ReadedFiles(Counter).name);
        DicomImage = dicomread(FullPath);
        imshow(DicomImage);
        imagesc(DicomImage);
    end
    
    Counter = Counter - 1;
    
else
    Counter = numel(ReadedFiles);
    FileExtension = GetFileExtension(ReadedFiles(Counter).name);
    if(strcmp(FileExtension, 'dcm'))
        FullPath = strcat(DirectoryName, '\' , ReadedFiles(Counter).name);
        DicomImage = dicomread(FullPath);
        
        imagesc(DicomImage);
    end
    
    Counter = Counter - 1;
    
    
end


% --- Executes on button press in ButtonNext.
function ButtonNext_Callback(hObject, eventdata, handles)
% hObject    handle to ButtonNext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


global Counter;
global ReadedFiles;
global DirectoryName;

if(Counter <= numel(ReadedFiles))
    
    FileExtension = GetFileExtension(ReadedFiles(Counter).name);
    if(strcmp(FileExtension, 'dcm'))
        FullPath = strcat(DirectoryName, '\' , ReadedFiles(Counter).name);
        DicomImage = dicomread(FullPath);
        
        DicomInfo = dicominfo(FullPath);
        
        imshow(DicomImage);
        imagesc(DicomImage);
        
    end
    Counter = Counter + 1;

else
    Counter = 1;
    FileExtension = GetFileExtension(ReadedFiles(Counter).name);
    if(strcmp(FileExtension, 'dcm'))
        FullPath = strcat(DirectoryName, '\' , ReadedFiles(Counter).name);
        DicomImage = dicomread(FullPath);
        
        imagesc(DicomImage);
        
    end
    
    Counter = Counter + 1;
end

    
