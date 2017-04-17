clc;
close all;
clear all;
txt1 = 'Information and Commuication Engineering';
Symbols = double(txt1);
SymbolToBitMapping = de2bi(Symbols);
totnobits = numel(SymbolToBitMapping);
InputReshapeBit = reshape(SymbolToBitMapping, 1, totnobits);
M = 8;                  % Modulation Order 
bps = log2(M);
remainder = rem(totnobits, bps);
if (remainder == 0)
    UserPaddedData = InputReshapeBit;
else
    UserPaddedData = [InputReshapeBit, zeros(1, bps-remainder)];
end
