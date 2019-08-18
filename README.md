# CLAE:Representation Learning with Class Level Autoencoder
The source code is for the following paper which will be available soon!

Hui Yu, Kai Wang, Yan Li, Wu Zhao. Representation Learning with Class Level Autoencoder for Intelligent Fault Diagnosis, IEEE Signal Processing Letters, 2019.

If you find this paper is useful, please cite our paper in your research work. Thanks.

If there are any questions about source code, please do not hesitate to contact Hui Yu (hui_yu_1130@163.com) or me (kai.wang@scu.edu.cn).



=====================================
# How to use the code                                    
=====================================

Running Environment: Windows 7, Matlab R2014b

-----------------------------------------------------
-----------------------------------------------------
Dataset used in this Paper: 
1. Case Western Reserve University(CWRU) bearing dataset:
   http://csegroups.case.edu/bearingdatacenter/pages/download-data-file.
   
-----------------------------------------------------
-----------------------------------------------------
Source code:
Reproduce the experimental results on CWRU dataset:
1. Your can download the the source CWRU dataset from  
   http://csegroups.case.edu/bearingdatacenter/pages/download-data-file <br>
   In our experiments, the used raw CWRU data are selected and saved as the file "Sample_12k_Drive_End_Bearing_Fault_Data_DE.mat", and the used CWRU data with the additive Gaussian white noise, which are shared at **Baidu  Netdisk**: https://pan.baidu.com/s/1Lo7PUV_AETrrMqhHNmr7zA, due to the capacity limitation of Github. <br>
   You can freely download this data file.
2. Run the following .m files in the file "Effects of Network Architectures" to reproduce the reported results in Fig.4 of our paper, and the corresponding experimental results are included in the file "Experimental_Results". <br>
         -- CLAE_Units_50_75.m     <br>
         -- CLAE_Units_50_100.m     <br>
         -- CLAE_Units_75_100.m  <br>
         -- CLAE_Units_75_150.m      <br>
         -- CLAE_Units_100_100.m   <br>
         -- CLAE_Units_100_150.m  <br>
         -- CLAE_Units_150_150.m      <br>
         -- CLAE_Units_150_200.m   <br>
3. Similary, the instructions in  Step 2 above can also be applied to these documents, such as the files "Effects of OLR", "Robustness Against Noise", and "Best Results".
3. Tips: The experimental results included in the above "Experimental_Results" files are re-calculated when submitting code, which may be a slight deviation from the results reported in our paper due to the effects of randomness of choosing training samples.
-------------------------------------------------------

