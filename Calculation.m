close all; clear all; clc;
% -------------------------------------------------------------------------
%              Seismic Hazard Assessment by Chung-Han Chan
%              Home work assignment 1 for 2020-12-01 class 
% Model the seismicity rate as a function of magnitude according to the catalogue
%                       Syntheticcatalogue.xlsx
%   Code date: 2020 - 12 - 10
% -------------------------------------------------------------------------
filename = 'Synthetic catalogue.xlsx';
data = xlsread(filename);
lat = data(:,1); long = data(:,2); dep = data(:,3);
mag = data(:,4); mag = mag(~isnan(mag));
% Separate the catalog into 4 regions
% Zone 1: north-west
i1 = find(lat >= 0 & lat <= 1 & long >=-1 & long <= 0);
lat1=lat(i1,:); long1=long(i1,:); dep1=dep(i1,:); mag1=mag(i1,:);
[a1,b1]=GLlaw(mag1,1);
% Zone 2: north-east
i2 = find(lat >= 0 & lat <= 1 & long >=0 & long <= 1);
lat2=lat(i2,:); long2=long(i2,:); dep2=dep(i2,:); mag2=mag(i2,:);
[a2,b2]=GLlaw(mag2,2);
% Zone 3: south-east
i3 = find(lat >= -1 & lat <= 0 & long >=0 & long <= 1);
lat3=lat(i3,:); long3=long(i3,:); dep3=dep(i3,:); mag3=mag(i3,:);
[a3,b3]=GLlaw(mag3,3);
% Zone 3: south-east
i4 = find(lat >= -1 & lat <= 0 & long >=-1 & long <= 0);
lat4=lat(i4,:); long3=long(i4,:); dep4=dep(i4,:); mag4=mag(i4,:);
[a4,b4]=GLlaw(mag4,4);
%%