classdef MaximumValueClassTest < matlab.unittest.TestCase
    properties (TestParameter) %% parameters that will be used in test methods
        matrixes = struct('matrix1',[1 2; -1 -2],'matrix2',[1 2 5; pi -2 10],'matrix3',[1 10 2 5; -1 -2 10 2]);
        matrixesMaximumValue = struct('maximumValueForMatrix1',2,'maximumValueForMatrix2',10,'maximumValueForMatrix3',10);
        vectorRows = struct('vectorRow1',[1 2 -1 -2],'vectorRow2',[1 2 5 -1 -2 10],'vectorRow3',[1 10 2 5 -1 -2 10 2]);
        vectorColumns = struct('vectorColumn1',[1 2 -1 -2]','vectorColumn2',[1 2 5 -1 -2 10]','vectorColumn3',[1 10 2 5 -1 -2 10 2]');
        vectorsMaximumValue = struct('maximumValueForVector1',2,'maximumValueForVector2',10,'maximumValueForVector3',10);
        scalars = struct('scalar1',1,'scalar2',3,'scalar3',4,'scalar4',6,'scalar5',7);
        scalarsMaximumValue = {1,3,4,6,7};
        cell = {{1},{3},{[55, 22; 3 3]},{[55, 22, 3, 3]}};
        string = {'s1';'1';'s2';'2';'s3';'3';'s4';'4'};
        matrixWithString =struct('stringMatrix1',[1, 2; '3', 4],'stringMatrix2',['1', '2'; '3', '4']);
        vectorRowsWithString = struct('stringVectorRow1',[1 2 '3' 4],'stringVectorRow2', ['2' '3' '4' '5']);
        vectorColumnsWithString = struct('stringVectorColumn1',[1 2 '3' 4]','stringVectorColumn2', ['2' '3' '4' '5']');
        matrixWithComplexNumbers = struct('matixWithComplexNumbers1', [3+2i,1+5i;-3+2i, 3-2i],'matixWithComplexNumbers2', [2i,1+5i;-3+2i, 3]);
        multidimensionalArray = struct('multidimensionalArray1', ones(3,4,5),'multidimensionalArray2', zeros(2,2,6));
    end
    methods (Test, ParameterCombination = 'sequential')
        function testMaximumValueInMatrix(testCase, matrixes, matrixesMaximumValue)
            actualSolution = maximumValue(matrixes);
            expectedSolution = matrixesMaximumValue;
            verifyEqual(testCase,actualSolution,expectedSolution, 'Maximum is wrong')
        end
        function testMaximumValueInVectorRow(testCase, vectorRows, vectorsMaximumValue)
            actualSolution = maximumValue(vectorRows);
            expectedSolution = vectorsMaximumValue;
            verifyEqual(testCase,actualSolution,expectedSolution, 'Maximum is wrong')
        end
        function testMaximumValueInColumnRow(testCase, vectorColumns, vectorsMaximumValue)
            actualSolution = maximumValue(vectorColumns);
            expectedSolution = vectorsMaximumValue;
            verifyEqual(testCase,actualSolution,expectedSolution, 'Maximum is wrong')
        end
        function testMaximumValueScalars(testCase, scalars, scalarsMaximumValue)
            actualSolution = maximumValue(scalars);
            expectedSolution = scalarsMaximumValue;
            verifyEqual(testCase,actualSolution,expectedSolution, 'Maximum is wrong')
        end
    end
    methods (Test)
        function testMaximumInCell(testCase,cell)
            verifyError(testCase,@() maximumValue(cell),?MException)
        end
        function testMaximumInString(testCase,string)
            verifyError(testCase,@() maximumValue(string),?MException)
        end
         function testMaximumInMatrixWithString(testCase,matrixWithString)
            verifyError(testCase,@() maximumValue(matrixWithString),?MException)
        end
        function testMaximumInVectorRowsWithString(testCase,vectorRowsWithString)
            verifyError(testCase,@() maximumValue(vectorRowsWithString),?MException)
        end
         function testMaximumInVectorColumnsWithString(testCase,vectorColumnsWithString)
            verifyError(testCase,@() maximumValue(vectorColumnsWithString),?MException)
         end
         function testMatrixWithComplexNumbers(testCase,matrixWithComplexNumbers)
            verifyError(testCase,@() maximumValue(matrixWithComplexNumbers),?MException)
         end
         function testMultidimensionalArray(testCase,multidimensionalArray)
            verifyError(testCase,@() maximumValue(multidimensionalArray),?MException)
         end
    end
end

