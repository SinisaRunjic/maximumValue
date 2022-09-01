clc
clear
resultsClassTest = run(MaximumValueClassTest)
percentPassed = 100 * nnz([resultsClassTest.Passed]) / numel(resultsClassTest);
disp([num2str(percentPassed), '% Passed.']);
writetable(table(resultsClassTest),'maximumValueClassTestExcel.xlsx')