# MRFN multi-scale representations fusion network
The source code is for the following paper which has been published on IEEE SPL. 

Hui Yu, Kai Wang, Yan Li, Multi-scale Representations Fusion with Joint Multiple Reconstructions Autoencoder for Intelligent Fault Diagnosis, IEEE Signal Processing Letters, 2018, 25(12):1880-1884.

If you find this paper is useful, please cite our paper in your research work. Thanks.

If there are any questions about source code, please do not hesitate to contact Hui Yu (hui_yu_1130@163.com) or me (kai.wang@scu.edu.cn).


=====================================
# How to use the code                                    
=====================================

Running Environment: Windows 7, Matlab R2014b

-----------------------------------------------------
-----------------------------------------------------
Source data: 
1. Case Western Reserve University(CWRU):
   http://csegroups.case.edu/bearingdatacenter/pages/download-data-file.
2. Machinery Failure Prevention Technology(MFPT):
   https://mfpt.org/fault-data-sets/

-----------------------------------------------------
-----------------------------------------------------
Source code:
Reproduce the experimental results for CWRU dataset:
1. Download the CWRU dataset from    
   http://csegroups.case.edu/bearingdatacenter/pages/download-data-file
   In our experiments, the used CWRU data are saved as the file "Sample_12k_Drive_End_Bearing_Fault_Data_DE.mat", which could not be uploaded due to the capacity limitation of Github. 
2. Run the following .m files in the file "Run" to reproduce the reported results. <br>
         -- Multiscale_50_75_100_125_150_TrainPer01_JMRAE.m     <br>
         -- Multiscale_50_75_100_125_150_TrainPer10_JMRAE.m     <br>
         -- Multiscale_50_75_100_125_150_TrainPer10_JMRAE_wd.m  <br>
         -- Multiscale_50_75_100_125_150_TrainPer10_RELU.m      <br>
         -- Multiscale_50_75_100_125_150_TrainPer10_Sigmoid.m   <br>
3. The file "Experimental_Results" includes the experimental results of our paper.
-----------------------------------------------------

Reproduce the experimental results for MFPT dataset:
1. Download the MFPT dataset from    
   https://mfpt.org/fault-data-sets/
   In our experiments, the used MFPT data are saved to the file "MFPT.mat", which incudes the training and test sets. 
2. Run the following .m files in the file "Run" to reproduce the reported results.  <br>
         -- Multiscale_50_75_100_TrainPer10_JMRAE.m              <br>
         -- Multiscale_50_75_100_TrainPer10_JMRAE_wd.m           <br>
         -- Multiscale_50_75_100_125_150_TrainPer10_JMRAE_wd.m   <br>
         -- Multiscale_50_75_100_TrainPer10_RELU.m               <br>
         -- Multiscale_50_75_100_TrainPer10_Sigmoid.m            <br>
3. The file "Experimental_Results" includes the experimental results of our paper.
-----------------------------------------------------
