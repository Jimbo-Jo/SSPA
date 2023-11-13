clc
clear
close all

%% Parameters
c      = 1500;           % speed of sound
Nf     = 4;              % number of frequency
Nm     = 4;              % number of sensors
f      = 100*(1:Nf);     % frequency
lambda = c./f;           % wavelength
d      = 1/2*lambda(1);  % intersensor spacing
theta  = 60.25;          % direction of arrival     
SNR    = 20;             % SNR
snap   = 1;              % Snapshots

%% Signal generate
par.c      =c ;         
par.d      =d ;         
par.Nm     =Nm ; 
Signal = Generate_signal(theta,f,snap,par,SNR,1);
Y = squeeze(Signal);

%% SSPA
tic
[theta_sspa,error] = SSPA(Y,d,lambda(1));
disp(['the SSPA estimation result are: ',num2str(theta_sspa)]);
toc
