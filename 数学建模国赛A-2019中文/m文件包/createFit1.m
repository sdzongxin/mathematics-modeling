function [fitresult, gof] = createFit1(t1, h1)
%CREATEFIT(T1,H1)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : t1
%      Y Output: h1
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 14-Sep-2019 03:32:47 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( t1, h1 );

% Set up fittype and options.
ft = fittype( 'gauss1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0];
opts.StartPoint = [1.995 0.44 0.0721987870785197];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
legend( h, 'h1 vs. t1', 'untitled fit 1', 'Location', 'NorthEast' );
% Label axes
xlabel t1
ylabel h1
grid on


