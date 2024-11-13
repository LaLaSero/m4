clc;
clear all;
folder_name='C:\Octave_file\user-made-struct\20231206'
filelist=dir(folder_name)
% Created by Octave 6.4.0, Sun Mar 05 13:23:14 2023 GMT <unknown@DESKTOP-U2J4JSS>

len=length(filelist);
for i=3:len
  
if strcmp(filelist(i).name(end-3:end),'.jpg')
  lenn=length(filelist(i).name);
  file_name=folder_name;
  file_name(end+1)='\';
  file_name(end+1:end+lenn)=filelist(i).name;
data=imread(file_name);
% Determine vomlume nowxlen=length(data(1,:));
% Determine vomlume nowxlen=length(data(1,:));
xlen=length(data(1,:));
ylen=length(data(:,1));


% Write pixels to file. 
data=data<255/2;
file_name(end-2:end)='txt';
fid=fopen(file_name,'w');
temp='';
for j=1:ylen
  temp = cat(2,temp,sprintf('%d',data(j,:)));  
end
fdisp (fid, temp);
fclose(fid);

end

end