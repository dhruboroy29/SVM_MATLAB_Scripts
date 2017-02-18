function plotData(fileName, sampRate,frameSeconds,plotOffset,PLOTFRAMES)
%sampRate=256;


% OutFile = strcat(fileName,'.data.emf');

data = ReadBin([fileName,'.data']);


if PLOTFRAMES==1
    data=data(1+plotOffset:(2*sampRate*frameSeconds)+plotOffset); 
end


[I,Q,N]=Data2IQ(data);

% tmp=[];
% for i=1:127
%     tmp=[tmp,I(i),Q(i)];
% end
% tmp

Index = ([1:N])/sampRate;



% %%%% filter %%%%%%%%%%%%%%%%%%%%
% signal=(I-median(I))+i*(Q-median(Q));
% signal1=timeseries(signal,Index);
% 
% interval=[-10 10];
% idealfilter_signal = idealfilter(signal1,interval,'pass');
% 
% 
% %plot(signal1.Time,abs(signal1.Data),'r-')
% plot(idealfilter_signal.Time,real(idealfilter_signal.Data),'r-'),grid on, hold on
% plot(idealfilter_signal.Time,imag(idealfilter_signal.Data),'g-'),hold off
% axis([0 N/sampRate -1000 1000]);


%%%%%%%%%%%%%% figures %%%%%%%%%%%%%
plot(Index,I-median(I),'r'),hold on,grid on  %%% red is I,  green is Q. remember:hong pei lv, hong zai qian
plot(Index,Q-median(Q),'g'),hold off
axis([0 N/sampRate -500 500]); 
xlabel('Time (s)','FontSize', 20);
ylabel('Amplitude','FontSize', 20);
%axis tight;
title('I and Q');


% % thr=300;
% % span=100;
% % thrPercentage=0.9;
% % 
% % amp=abs((I-median(I))+i*(Q-median(Q)));
% % event=zeros(1,N-span);
% % for j=1:N-span
% %     interval=j:j+span; % length is span+1
% %     ActivePercentage=length(find(amp(interval)>=thr))/(span+1); 
% %     if ActivePercentage>=thrPercentage
% %         event(j)=thr;
% %     else
% %         event(j)=0;
% %     end
% % end
% % 
% % plot(Index,amp,'r-');hold on;grid on;
% % plot(Index(1+span/2:N-span/2),event); hold off;
% % %plot([0 N/sampRate],[thr thr],'-');
% % axis([0 N/sampRate 0 1500]);



% figure;
% plot(Index,((I-median(I)).^2+(Q-median(Q)).^2).^0.5,'b');
% axis([0 N/sampRate 0 1500]);
% title('|I+iQ|');

%legend('I','Q');
%xlabel('Time (seconds)','FontSize', 14);
%ylabel('Radar amplitude in ADC units','FontSize', 14);
%title('Histogram of cumulative displacement for background vs human targets','FontSize', 14);

% print ('-dmeta', OutFile);
fclose('all');
