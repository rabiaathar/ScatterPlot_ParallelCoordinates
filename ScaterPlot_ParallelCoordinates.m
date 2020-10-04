%File reading
fid = fopen('DataWeierstrass.csv');
HDRS = textscan(fid,'%s %s %s %s %s %s %s',1, 'delimiter',';');
DATA = textscan(fid,'%s %s %f %f %f %f %f','delimiter',';');
fclose(fid);
%Data Seperation
professor=char(DATA{1});
lecture=char(DATA{2});
participants=DATA{3};
professional_expertise=DATA{4};
motivation=DATA{5};
clear_presentation=DATA{6};
overall_impression=DATA{7};
%labels foe the data
labels = {'Professor','Lecture','Participants','Professional expertise','Motivation','Clear presentation','Overall impression'};
profid=double.empty (122,0);
lectid=double.empty (122,0);
%Preprocessing on char data
for i=1:122
    profid(i,1)=str2double(strrep(professor(i,:),'prof',''));
    lectid(i,1)=str2double(strrep(lecture(i,:),'lecture',''));
end
alldata=[profid lectid participants professional_expertise motivation clear_presentation overall_impression];
%PART A-Scatterplot Matrix Plot
figure
[h,ax,bigax] = gplotmatrix(alldata,alldata);title ('Scatterplot Matrix');
for i = 1:7    % label the plots                                  
  xlabel(ax(7,i), labels{i},'FontSize',8);
  ylabel(ax(i,1), labels{i},'FontSize',8);
end
%PART B-Parallel Coordinates Plot
figure
alldata=[profid lectid participants professional_expertise motivation clear_presentation overall_impression];
parallelcoords(alldata,'Group',professor,'Labels',labels,'standardize','on');title ('Parallel Coordinates');
