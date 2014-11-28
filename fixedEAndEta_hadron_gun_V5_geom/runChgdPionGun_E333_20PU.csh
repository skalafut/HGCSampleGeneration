#!/bin/csh

#Setup environment, move and untar needed files and directories, compile everything
setenv HOME /eos/uscms/store/user/lpchgcal/HGCAL_Samples/chgdPionFixedEAndEta_withAllPFRecHits_SLHC20_patch1_20PU 
setenv PATH /bin:/usr/bin:/usr/local/bin:/usr/krb5/bin:/usr/afsws/bin:/usr/krb5/bin/aklog

#source /uscmst1/prod/sw/cms/cshrc prod
source /cvmfs/cms.cern.ch/cmsset_default.csh prod
setenv SCRAM_ARCH slc6_amd64_gcc472

cmsrel CMSSW_6_2_0_SLHC20_patch1

#mv PU.tar step3_EmeanEn_meanEta_replaceEta_20PU_NUM.py step2_EmeanEn_meanEta_replaceEta_20PU_NUM.py forSLHC20_patch1.tar step1_chgdPionGun_EmeanEn_EtareplaceEta_NUM_500evts.root  CMSSW_6_2_0_SLHC20_patch1/src/.

mv step3_EmeanEn_meanEta_replaceEta_20PU_NUM.py forSLHC20_patch1.tar step2_chgdPionGun_EmeanEn_EtareplaceEta_20PU_NUM_100evts.root CMSSW_6_2_0_SLHC20_patch1/src/.


cd CMSSW_6_2_0_SLHC20_patch1/src/
tar -xvf forSLHC20_patch1.tar
rm forSLHC20_patch1.tar

#tar -xvf PU.tar
#rm PU.tar

cmsenv
eval `scramv1 runtime -csh`
eval 'scram b -j 8'

#the .log, .stdout, and .stderr files associated with each job will record any print statement made in the job when the code is running

#cmsRun SinglePiEmeanEn_cfi_py_GEN_SIM_meanEta_replaceEta_NUM.py
#echo "EmeanEn job finished step 1"

#cmsRun step2_EmeanEn_meanEta_replaceEta_20PU_NUM.py 
#echo "EmeanEn job finished step 2"

cmsRun step3_EmeanEn_meanEta_replaceEta_20PU_NUM.py 

#mv step1_chgdPionGun_EmeanEn_EtareplaceEta_NUM_500evts.root $HOME/.
#mv step2_chgdPionGun_EmeanEn_EtareplaceEta_20PU_NUM_100evts.root $HOME/.
mv step3_chgdPionGun_EmeanEn_EtareplaceEta_20PU_NUM_100evts.root $HOME/.
 
echo "EmeanEn job finished step 3" 
