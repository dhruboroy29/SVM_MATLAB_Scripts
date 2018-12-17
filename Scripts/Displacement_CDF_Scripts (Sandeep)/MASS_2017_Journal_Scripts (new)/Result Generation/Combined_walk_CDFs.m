N=1;
IQRejectionParam=0.9;

h_comb=WalkCdfs_Individual_MASS(["/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Data_Repository/IPSNdata/arc_1/Human",...
                             "/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Data_Repository/IPSNdata/prb_2/Human",...
                             "/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Data_Repository/Parking garage radial ortho (Sandeep)/SenSys10_data_scripts/data/0-amplitude (walks)/ortho/cut",...
                             "/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Data_Repository/Parking garage radial ortho (Sandeep)/SenSys10_data_scripts/data/0-amplitude (walks)/radial/runs/cut",...
                             "/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Data_Repository/IPSNdata/arc_1/Dog",...
                             "/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Data_Repository/IPSNdata/prb_2/Dog",...
                             "/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Data_Repository/IPSNdata/kh_3/Dog",...
                             "/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Data_Repository/IPSNdata/bv_4/Dog",...
                             "/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Data_Repository/IPSNdata/5-15-2011/Dog",...
                             "/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Data_Repository/IPSNdata/5-16-2011/Dog"],...
                             '/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Results/Displacement_Graphs/Walk_CDFs/','radial_7m',250,0.9,N);
%h4=WalkCdfs_Individual_MASS('/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Data_Repository/Darree_Fields/cut','/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Results/Displacement_Graphs/Walk_CDFs/','Darree_fields',250,0.9,N);

%% 1/2-second window thresholds
yL = get(gca,'YLim');
line([0.3 0.3],yL,'Color', 'k');
line([0.33 0.33],yL,'Color', 'k', 'LineStyle', '--');

annotation('textbox',...
    [0.334273182957395 0.765673929776533 0.162500002904046 0.0642857150983689],...
    'String',['1 FA/week',newline,'(IQR=0.9)'],...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FitBoxToText','off');
annotation('textbox',...
    [0.637750626566417 0.746133978202683 0.17678571747658 0.0642857150983689],...
    'String',['1 FA/month',newline,'(IQR=0.9)'],...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FitBoxToText','off');

% Create arrows
annotation('arrow',[0.475438596491228 0.515789473684211],...
    [0.800452784503632 0.842615012106538]);
annotation('arrow',[0.633333333333333 0.56140350877193],...
    [0.785924939467312 0.823244552058111]);

h=gca;
h.XLabel.String = 'Distance (meters)';
h.XLabel.Interpreter='latex';
h.YLabel.String = 'CCDF';
h.YLabel.Interpreter='latex';
xlim([0 1]);
%legend([h0 h1 h2 h3],{'Gymnasium','Building foyer','Garage (orthogonal)','Garage (radial)','Forest'});
%title(sprintf('Target CDFs for\n%d 1/2-second Windows(IQR Parameter=%0.2f)',N,IQRejectionParam),'FontWeight','normal');
xlim([0 0.6]);

saveas(h,strcat('/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Results/Displacement_Graphs/Graphs/Comb_CDFs_N=',num2str(N),'_IQR=',num2str(IQRejectionParam),'.fig'));
saveas(h,strcat('/mnt/6b93b438-a3d4-40d2-9f3d-d8cdbb850183/Research/Robust_Learning/Results/Displacement_Graphs/Graphs/Comb_CDFs_N=',num2str(N),'_IQR=',num2str(IQRejectionParam),'.eps'),'eps2c');
