function Hd = LowpassFilter(Fs, Fpass, Fstop)
%LOWPASSFILTER Returns a discrete-time filter object.

%
% MATLAB Code
% Generated by MATLAB(R) 7.13 and the Signal Processing Toolbox 6.16.
%
% Generated on: 03-Jun-2013 12:05:29
%

% Equiripple Lowpass filter designed using the FIRPM function.

Dpass = 0.057501127785;  % Passband Ripple
Dstop = 0.0001;          % Stopband Attenuation
dens  = 20;              % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fpass, Fstop]/(Fs/2), [1 0], [Dpass, Dstop]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);

% [EOF]