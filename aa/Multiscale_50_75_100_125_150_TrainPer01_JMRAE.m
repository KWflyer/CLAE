%  multiscale signals features fusion based on classification
clear,clc
addpath ../common/

% Load Raw Data
load('Sample_12k_Drive_End_Bearing_Fault_Data_DE.mat');  % Vibration signals. 4-D Sample(1:10,1:4,1:1200,1:100)

%% Network Size Setup (Considering 5 different local size)
Time_visibleSize_L1 = 50;
Time_hiddenSize_L1 = Time_visibleSize_L1;

Time_visibleSize_L2 = 75;
Time_hiddenSize_L2 = Time_visibleSize_L2; 

Time_visibleSize_L3 = 100;
Time_hiddenSize_L3 = Time_visibleSize_L3; 

Time_visibleSize_L4 = 125;
Time_hiddenSize_L4 = Time_visibleSize_L4; 

Time_visibleSize_L5 = 150;
Time_hiddenSize_L5 = Time_visibleSize_L5; 

numClasses=10;

%% Parameters of Network
eta = 0.6;   % the trade-off parameter to control the balance between the two reconstruction loss terms
lambda = 1e-4; % weight decay parameter
Softmax_lambda = 1e-5; %  Weight Decay Parameter fo Softmax

%%  Training Setup
Overlap_Rate = 0.97; 
pro_train =0.01; % proportion of training samples

Number_Epoch = 20; % independent  time
Rand_Epoch = GetRandNumble( Sample, Number_Epoch); 


Test_Accuracy =zeros(Number_Epoch,27); % testing classification accuracy matrix
for epoch = 1:Number_Epoch

    % Five scale-specific representation Learning
    [ Train_Feature_L1,Train_labels_L1,Test_Feature_L1,Test_labels_L1,TA_L1] = LearnedLocalTDR( Time_visibleSize_L1, Time_hiddenSize_L1,...
                                                                                                                                             numClasses,eta,lambda,Softmax_lambda,Overlap_Rate,pro_train,Sample, Rand_Epoch,epoch);
    
     [ Train_Feature_L2,Train_labels_L2,Test_Feature_L2,Test_labels_L2,TA_L2] = LearnedLocalTDR( Time_visibleSize_L2, Time_hiddenSize_L2,...
                                                                                                                                             numClasses,eta,lambda,Softmax_lambda,Overlap_Rate,pro_train,Sample, Rand_Epoch,epoch);  
                                                                                                                                         
     [ Train_Feature_L3,Train_labels_L3,Test_Feature_L3,Test_labels_L3,TA_L3] = LearnedLocalTDR( Time_visibleSize_L3, Time_hiddenSize_L3,...
                                                                                                                                             numClasses,eta,lambda,Softmax_lambda,Overlap_Rate,pro_train,Sample, Rand_Epoch,epoch); 
                                                                                                                                             
     [ Train_Feature_L4,Train_labels_L4,Test_Feature_L4,Test_labels_L4,TA_L4] = LearnedLocalTDR( Time_visibleSize_L4, Time_hiddenSize_L4,...
                                                                                                                                             numClasses,eta,lambda,Softmax_lambda,Overlap_Rate,pro_train,Sample, Rand_Epoch,epoch);  
                                                                                                                                         
     [ Train_Feature_L5,Train_labels_L5,Test_Feature_L5,Test_labels_L5,TA_L5] = LearnedLocalTDR( Time_visibleSize_L5, Time_hiddenSize_L5,...
                                                                                                                                             numClasses,eta,lambda,Softmax_lambda,Overlap_Rate,pro_train,Sample, Rand_Epoch,epoch);
                                                                                                                                         

     %% Two-scale representations fusion (Total: 10 categories)
     % L1 and L2 
         Train_Feature_Fusion_L12 = [Train_Feature_L1;Train_Feature_L2];
         Test_Feature_Fusion_L12 =   [Test_Feature_L1;Test_Feature_L2];        
     % L1 and L3
         Train_Feature_Fusion_L13 = [Train_Feature_L1;Train_Feature_L3];
         Test_Feature_Fusion_L13 =   [Test_Feature_L1;Test_Feature_L3];    
     % L1 and L4
         Train_Feature_Fusion_L14 = [Train_Feature_L1;Train_Feature_L4];
         Test_Feature_Fusion_L14 =   [Test_Feature_L1;Test_Feature_L4]; 
     % L1 and L5
         Train_Feature_Fusion_L15 = [Train_Feature_L1;Train_Feature_L5];
         Test_Feature_Fusion_L15 =   [Test_Feature_L1;Test_Feature_L5]; 
     % L2 and L3
         Train_Feature_Fusion_L23 = [Train_Feature_L2;Train_Feature_L3];
         Test_Feature_Fusion_L23 =   [Test_Feature_L2;Test_Feature_L3];  
     % L2 and L4
         Train_Feature_Fusion_L24 = [Train_Feature_L2;Train_Feature_L4];
         Test_Feature_Fusion_L24 =   [Test_Feature_L2;Test_Feature_L4]; 
     % L2 and L5
         Train_Feature_Fusion_L25 = [Train_Feature_L2;Train_Feature_L5];
         Test_Feature_Fusion_L25 =   [Test_Feature_L2;Test_Feature_L5]; 
     % L3 and L4
         Train_Feature_Fusion_L34 = [Train_Feature_L3;Train_Feature_L4];
         Test_Feature_Fusion_L34 =   [Test_Feature_L3;Test_Feature_L4]; 
     % L3 and L5
         Train_Feature_Fusion_L35 = [Train_Feature_L3;Train_Feature_L5];
         Test_Feature_Fusion_L35 =   [Test_Feature_L3;Test_Feature_L5]; 
     % L4 and L5
         Train_Feature_Fusion_L45 = [Train_Feature_L4;Train_Feature_L5];
         Test_Feature_Fusion_L45 =   [Test_Feature_L4;Test_Feature_L5];     

     
     %%  Three-scale representations fusion (Total: 10 categories)
     % L1 and L2 and L3
         Train_Feature_Fusion_L123 = [Train_Feature_L1;Train_Feature_L2;Train_Feature_L3];
         Test_Feature_Fusion_L123 =   [Test_Feature_L1;Test_Feature_L2;Test_Feature_L3];     
     % L1 and L2 and L4
         Train_Feature_Fusion_L124 = [Train_Feature_L1;Train_Feature_L2;Train_Feature_L4];
         Test_Feature_Fusion_L124 =   [Test_Feature_L1;Test_Feature_L2;Test_Feature_L4];     
     % L1 and L2 and L5
         Train_Feature_Fusion_L125 = [Train_Feature_L1;Train_Feature_L2;Train_Feature_L5];
         Test_Feature_Fusion_L125 =   [Test_Feature_L1;Test_Feature_L2;Test_Feature_L5];     
     % L1 and L3 and L4
         Train_Feature_Fusion_L134 = [Train_Feature_L1;Train_Feature_L3;Train_Feature_L4];
         Test_Feature_Fusion_L134 =   [Test_Feature_L1;Test_Feature_L3;Test_Feature_L4];    
     % L1 and L3 and L5
         Train_Feature_Fusion_L135 = [Train_Feature_L1;Train_Feature_L3;Train_Feature_L5];
         Test_Feature_Fusion_L135 =   [Test_Feature_L1;Test_Feature_L3;Test_Feature_L5];     
     % L1 and L4 and L5
         Train_Feature_Fusion_L145 = [Train_Feature_L1;Train_Feature_L4;Train_Feature_L5];
         Test_Feature_Fusion_L145 =   [Test_Feature_L1;Test_Feature_L4;Test_Feature_L5]; 
     % L2 and L3 and L4
         Train_Feature_Fusion_L234 = [Train_Feature_L2;Train_Feature_L3;Train_Feature_L4];
         Test_Feature_Fusion_L234 =   [Test_Feature_L2;Test_Feature_L3;Test_Feature_L4];
     % L2 and L3 and L5
         Train_Feature_Fusion_L235 = [Train_Feature_L2;Train_Feature_L3;Train_Feature_L5];
         Test_Feature_Fusion_L235 =   [Test_Feature_L2;Test_Feature_L3;Test_Feature_L5];
     % L2 and L4 and L5
         Train_Feature_Fusion_L245 = [Train_Feature_L2;Train_Feature_L4;Train_Feature_L5];
         Test_Feature_Fusion_L245 =   [Test_Feature_L2;Test_Feature_L4;Test_Feature_L5];         
     % L3 and L4 and L5
         Train_Feature_Fusion_L345 = [Train_Feature_L3;Train_Feature_L4;Train_Feature_L5];
         Test_Feature_Fusion_L345 =   [Test_Feature_L3;Test_Feature_L4;Test_Feature_L5];


      %% Classification based on Fused features  
TA_L12  = FusionFeauresClassification( numClasses,Softmax_lambda,Train_Feature_Fusion_L12,Test_Feature_Fusion_L12,Train_labels_L1, Test_labels_L1 );     
TA_L13  = FusionFeauresClassification( numClasses,Softmax_lambda,Train_Feature_Fusion_L13,Test_Feature_Fusion_L13,Train_labels_L1, Test_labels_L1 );        
TA_L14  = FusionFeauresClassification( numClasses,Softmax_lambda,Train_Feature_Fusion_L14,Test_Feature_Fusion_L14,Train_labels_L1, Test_labels_L1 );
TA_L15  = FusionFeauresClassification( numClasses,Softmax_lambda,Train_Feature_Fusion_L15,Test_Feature_Fusion_L15,Train_labels_L1, Test_labels_L1 );  
TA_L23  = FusionFeauresClassification( numClasses,Softmax_lambda,Train_Feature_Fusion_L23,Test_Feature_Fusion_L23,Train_labels_L2, Test_labels_L2 );  
TA_L24  = FusionFeauresClassification( numClasses,Softmax_lambda,Train_Feature_Fusion_L24,Test_Feature_Fusion_L24,Train_labels_L2, Test_labels_L2 ); 
TA_L25  = FusionFeauresClassification( numClasses,Softmax_lambda,Train_Feature_Fusion_L25,Test_Feature_Fusion_L25,Train_labels_L2, Test_labels_L2 );
TA_L34  = FusionFeauresClassification( numClasses,Softmax_lambda,Train_Feature_Fusion_L34,Test_Feature_Fusion_L34,Train_labels_L3, Test_labels_L3 );  
TA_L35  = FusionFeauresClassification( numClasses,Softmax_lambda,Train_Feature_Fusion_L35,Test_Feature_Fusion_L35,Train_labels_L3, Test_labels_L3 ); 
TA_L45  = FusionFeauresClassification( numClasses,Softmax_lambda,Train_Feature_Fusion_L45,Test_Feature_Fusion_L45,Train_labels_L4, Test_labels_L4 );  

TA_L123  = FusionFeauresClassification( numClasses,Softmax_lambda,Train_Feature_Fusion_L123,Test_Feature_Fusion_L123,Train_labels_L1, Test_labels_L1 );     
TA_L124  = FusionFeauresClassification( numClasses,Softmax_lambda,Train_Feature_Fusion_L124,Test_Feature_Fusion_L124,Train_labels_L1, Test_labels_L1 );        
TA_L125  = FusionFeauresClassification( numClasses,Softmax_lambda,Train_Feature_Fusion_L125,Test_Feature_Fusion_L125,Train_labels_L1, Test_labels_L1 );
TA_L134  = FusionFeauresClassification( numClasses,Softmax_lambda,Train_Feature_Fusion_L134,Test_Feature_Fusion_L134,Train_labels_L1, Test_labels_L1 );  
TA_L135  = FusionFeauresClassification( numClasses,Softmax_lambda,Train_Feature_Fusion_L135,Test_Feature_Fusion_L135,Train_labels_L1, Test_labels_L1 );  
TA_L145  = FusionFeauresClassification( numClasses,Softmax_lambda,Train_Feature_Fusion_L145,Test_Feature_Fusion_L145,Train_labels_L1, Test_labels_L1 ); 
TA_L234  = FusionFeauresClassification( numClasses,Softmax_lambda,Train_Feature_Fusion_L234,Test_Feature_Fusion_L234,Train_labels_L2, Test_labels_L2 );
TA_L235  = FusionFeauresClassification( numClasses,Softmax_lambda,Train_Feature_Fusion_L235,Test_Feature_Fusion_L235,Train_labels_L2, Test_labels_L2 );  
TA_L245  = FusionFeauresClassification( numClasses,Softmax_lambda,Train_Feature_Fusion_L245,Test_Feature_Fusion_L245,Train_labels_L2, Test_labels_L2 ); 
TA_L345  = FusionFeauresClassification( numClasses,Softmax_lambda,Train_Feature_Fusion_L345,Test_Feature_Fusion_L345,Train_labels_L3, Test_labels_L3 );


Test_Accuracy(epoch,:) = [TA_L1,TA_L2,TA_L3,TA_L4,TA_L5, 0, TA_L12,TA_L13,TA_L14,TA_L15,TA_L23,TA_L24,TA_L25,TA_L34,TA_L35,TA_L45, 0,TA_L123,TA_L124,TA_L125,TA_L134,TA_L135,TA_L145,TA_L234,TA_L235,TA_L245,TA_L345];
                           
save('TAResults_Multiscale_50_75_100_125_150_TrainPer01_JMRAE.mat','Test_Accuracy');                                                                                                                                  
                                                                                                                                                                                                                                                                       
end

Mean_ACC = mean(Test_Accuracy);
Std_ACC = std(Test_Accuracy);
Var_ACC = var(Test_Accuracy);
Max_ACC = max(Test_Accuracy);
Min_ACC = min(Test_Accuracy);
MSVMM_Test_Accuracy = [Mean_ACC;Std_ACC;Var_ACC;Max_ACC;Min_ACC];
save('MSVMMResults_Multiscale_50_75_100_125_150_TrainPer01_JMRAE.mat','MSVMM_Test_Accuracy');


