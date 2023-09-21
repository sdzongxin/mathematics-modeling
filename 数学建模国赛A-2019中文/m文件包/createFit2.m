function [fitresult, gof] = createFit2(t2, h2)
%CREATEFIT(T2,H2)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : t2
%      Y Output: h2
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 14-Sep-2019 03:35:56 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( t2, h2 );

% Set up fittype and options.
ft = fittype( 'gauss1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0];
opts.StartPoint = [1.9942 2.01 0.0719380407673218];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
legend( h, 'h2 vs. t2', 'untitled fit 1', 'Location', 'NorthEast' );
% Label axes
xlabel t2
ylabel h2
grid on


