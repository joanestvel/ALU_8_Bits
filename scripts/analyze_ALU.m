clear all;close all;

Data = readtable('..\Results\Sim_Modelsim.txt');

tags = {'A','B','Code','Op','Sim Results','Real Results'};
A = Data.A;
B = Data.B;
Code = Data.Op;
ResSim = Data.Res;
for i=1:32
    if(Code(i) == 0)
        Op(i,1) = {'Add    '};
        Res(i,1) = A(i) + B(i);
    end
    if(Code(i) == 1)
        Op(i,1) = {'And    '};
        Res(i,1) = bitand(A(i),B(i));
    end
    if(Code(i) == 2)
        Op(i,1) = {'Xor    '};
        Res(i,1) = bitxor(A(i),B(i));
    end
    if(Code(i,1) == 3)
        Temp = mod(floor(A(i)/8),2);
        if(Temp == 0)
            Op(i,1) = {'ShiftL0'};
            Res(i,1) = B(i)*2^mod(A(i),8);
        else
            Op(i,1) = {'ShiftR0'};
            Res(i,1) = floor(B(i)/2^mod(A(i),8));
        end
    end
    if(Code(i) == 4)
        Op(i,1) = {'Sub    '};
        Res(i,1) = A(i) - B(i);
    end
    if(Code(i) == 5)
        Op(i,1) = {'Or     '};
        Res(i,1) = bitor(A(i), B(i));
    end
    if(Code(i) == 6)
        Op(i,1) = {"Xnor   "};
        Res(i,1) = bitcmp(bitxor(A(i),B(i)),'uint8');
    end
    if(Code(i,1) == 7)
        Temp = mod(floor(A(i)/8),2);
        if(Temp == 0)
            Op(i,1) = {'ShiftL1'};
            Res(i,1) = bitcmp(bitsll(bitcmp(uint8(B(i)),'uint8'),mod(A(i),8)),"uint8");
        else
            Op(i,1) = {'ShiftR1'};
            Res(i,1) = bitcmp(bitsrl(bitcmp(uint8(B(i)),'uint8'),mod(A(i),8)),"uint8");
        end
    end
end

Res = mod(Res,256);
Result = table(A,B,Code,Op,ResSim,Res,'VariableNames',tags);

writetable(Result, '..\Results\Matlab_Analysis.txt', 'Delimiter','\t');