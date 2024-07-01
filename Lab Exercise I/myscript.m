% Example Script: Factorial Calculation and Classification


% Function to calculate factorial
function result = calculateFactorial(n)
 result = 1;
 for i = 1:n
 result = result * i;
 end
end


% Main Script
disp('Factorial Calculation and Classification Script');


% Calculate and display factorials for numbers 1 to 5
for num = 1:5
 factorialResult = calculateFactorial(num);
 disp(['Factorial of ' num2str(num) ' is ' num2str(factorialResult)]);


 % Classify the result
 if factorialResult < 100
 disp('Result is Small');
 else
 disp('Result is Large');
 end
end
