function [result,global_median]=noise_amplitudes_one_second_windows(fileName,sampRate,percentile)
data = ReadBin([fileName]);
[I,Q,N]=Data2IQ(data);
Comp = (I-median(I)) + 1i*(Q-median(Q));
global_median = median(abs(Comp))
window_medians = [];
step = sampRate/2;
for i = 1:step:length(Comp)-step
    one_window_signal = Comp(i:i+step-1);
    window_medians = [window_medians median(abs(one_window_signal))];
end
result = prctile(window_medians,percentile)
end