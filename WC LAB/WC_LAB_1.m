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

ThreePaddedData = reshape(UserPaddedData, [], bps);
ModulationInput = bi2de(ThreePaddedData);
PSKModulatedSymbol = pskmod(ModulationInput, M);

%for snr = 1:3:25
%SignalThroughTheChannel = awgn(PSKModulatedSymbol, snr, 'measured');
%end

SignalThroughTheChannel = awgn(PSKModulatedSymbol, 25, 'measured');

DemodulatedSignal = pskdemod(SignalThroughTheChannel, M);
SymbolToBitMappingOfDemodulatedSignal = de2bi(DemodulatedSignal);
DemodPaddedData = reshape(SymbolToBitMappingOfDemodulatedSignal, bps, []);

%PaddingRemovedData = 