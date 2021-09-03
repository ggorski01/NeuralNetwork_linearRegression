clear;clc;close all force;

% Assignment 1#: Linear Regression

%   Creates the input and output matrices based on the polynomial 
%substitutions (should be a 4x4 matrix, x, and a 4x2 matrix, d) 
x = [1,1,1,1;
     2,4,8,16;
     3,9,27,81;
     4,16,64,256];
 
d = [4,0;
     9,5;
     5,9;
     0,5];
 
%	Pre-allocates the calculated output y, which should be the same 
%dimensions as d. 
y = [2,3;
     3,4;
     4,5;
     5,6];
 
%   Creates beta and epsilon vectors containing the training weights
%(use all ones for now). 
beta = [1 1 1]';
epsilon = [1 1]';

%	Calculates a temp_y using the linear regression equation for each
%sample of inputs; ideally, there should only be exactly one matrix 
%calculation for each sample.
sample_input1 = [1 x(1,1:2);1 x(1,3:4)]*beta+epsilon;
sample_input2 = [1 x(2,1:2);1 x(2,3:4)]*beta+epsilon;
sample_input3 = [1 x(3,1:2);1 x(3,3:4)]*beta+epsilon;
sample_input4 = [1 x(4,1:2);1 x(4,3:4)]*beta+epsilon;


temp_y = [sample_input1 sample_input2 sample_input3 sample_input4]';
%display(temp_y)

%	Sets the appropriate y values to temp_y. (Hint: use the transpose 
%function to flip an array’s dimensions, and use the colon operator 
%to set multiple indices simultaneously).
y = temp_y;
%display(y);

%	Calculates the error using mean squared error.
error1 = (temp_y(1,1)-d(1,1))^2+(temp_y(1,2)-d(1,2))^2; 
error2 = (temp_y(2,1)-d(2,1))^2+(temp_y(2,2)-d(2,2))^2; 
error3 = (temp_y(3,1)-d(3,1))^2+(temp_y(3,2)-d(3,2))^2;
error4 = (temp_y(4,1)-d(4,1))^2+(temp_y(4,2)-d(4,2))^2;

%   Averaged across all the samples.
mean_sq_error = (error1+error2+error3+error4)*(1/4);

%	Displays the error to the user as a percentage.
fprintf('Percent error:%s\n',(mean_sq_error*100));