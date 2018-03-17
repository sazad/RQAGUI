%% Recurrence Main Program File w/ GUI
%  This m-file: 
%  creates figure from 'recurrencefig.m' file 
%  click open file button -> pick .mat file that contains the variable called data_raw
%  execute 'updateRP.m' function which does
%   -> vectorize 
%   -> create distance matrix 
%   -> create recurrence matrix 
%   -> plot into GUI

clc; clear vars; close all;
disp('Create recurrence matrix and plot')
rpfig = recurrencefig();
