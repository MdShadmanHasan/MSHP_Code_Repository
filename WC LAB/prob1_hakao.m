clc
close all
clear all
txt1='Information and communication Engineering';
symbols=double(txt1);
symbolTObitmapping=de2bi(symbols,8,'left-msb');
totNobits=numel(symbolTObitmapping);
inputReshapeBits=reshape(symbolTObitmapping,1,totNobits);
M=8;
sum=0;
for i=1:2
  sum=sum+M;  
  M=sum;
bps=log2(M);

%padding

remainder=rem(totNobits,bps);
if(remainder==0)
    UserPadedData=inputReshapeBits;
else
    UserPadedData=[inputReshapeBits,zeros(1,bps-remainder)];
end

%modulation

reshapeUserPadedData=reshape(UserPadedData,numel(UserPadedData)/bps,bps);
bitToSymbolMapping=bi2de(reshapeUserPadedData,'left-msb');
modulatedSymbol=pskmod(bitToSymbolMapping,M);

BER=[];
SNR=[];
for snr=0:3:50;
   noisySymbols=awgn(modulatedSymbol,snr,'measured');
demoduledSymbol=pskdemod( noisySymbols,M);

demodulatedSymbolToBitMapping=de2bi(demoduledSymbol,'left-msb');
bit=numel(demodulatedSymbolToBitMapping);
outputreshape=reshape(demodulatedSymbolToBitMapping,1,bit);
%remove padding

demodulateBitsWithoutPadding=outputreshape(1:totNobits);
[number,ratio]=biterr(inputReshapeBits,demodulateBitsWithoutPadding);
BER=[BER ratio];
SNR=[SNR snr];
end
if M==8
plot(SNR,BER,'g')
else
hold on
plot(SNR,BER,'r')
legend('Order 8','Order 16')
end

end
xlabel('---------->SNR')
ylabel('---------->BER')
%original text
txtBits=reshape(demodulateBitsWithoutPadding,numel(demodulateBitsWithoutPadding)/8,8);
txtBitsDecimal=bi2de(txtBits,'left-msb');
msg=char(txtBitsDecimal)


