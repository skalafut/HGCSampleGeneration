#!/bin/csh

#Setup environment, move and untar needed files and directories, compile everything
setenv HOME /eos/uscms/store/user/skalafut/HGCal/tauJetGunFixedEAndEta_SLHC18
setenv PATH /bin:/usr/bin:/usr/local/bin:/usr/krb5/bin:/usr/afsws/bin:/usr/krb5/bin/aklog

source /uscmst1/prod/sw/cms/cshrc prod
setenv SCRAM_ARCH slc6_amd64_gcc472

cmsrel CMSSW_6_2_0_SLHC18

mv SingleTauJetEmeanEn_cfi_py_GEN_SIM_meanEta_replaceEta_NUM.py CMSSW_6_2_0_SLHC18/src/.
mv forHGCSims_SLHC18.tar CMSSW_6_2_0_SLHC18/src/.


cd CMSSW_6_2_0_SLHC18/src/
tar -xvf forHGCSims_SLHC18.tar
rm forHGCSims_SLHC18.tar 

cmsenv
eval `scramv1 runtime -csh`
eval 'scram b -j 8'

#the .log, .stdout, and .stderr files associated with each job will record any print statement made in the job when the code is running

cmsRun SingleTauJetEmeanEn_cfi_py_GEN_SIM_meanEta_replaceEta_NUM.py

echo "EmeanEn job finished step 1"

cmsDriver.py step2_EmeanEn_meanEtareplaceEta_NUM  --conditions auto:upgradePLS3 -n 500 --eventcontent FEVTDEBUGHLT -s DIGI:pdigi_valid,L1,DIGI2RAW --datatier GEN-SIM-DIGI-RAW --customise SLHCUpgradeSimulations/Configuration/combinedCustoms.cust_2023HGCalMuon --geometry Extended2023HGCalV4Muon,Extended2023HGCalV4MuonReco --magField 38T_PostLS1 --filein file:step1_tauJetGun_EmeanEn_EtareplaceEta_NUM_500evts.root  --fileout file:step2_tauJetGun_EmeanEn_EtareplaceEta_NUM_500evts.root 
 
echo "EmeanEn job finished step 2"

cmsDriver.py step3_EmeanEn_meanEtareplaceEta_NUM  --conditions auto:upgradePLS3 -n 500 --eventcontent FEVTDEBUGHLT -s RAW2DIGI,L1Reco,RECO --datatier GEN-SIM-RECO --customise SLHCUpgradeSimulations/Configuration/combinedCustoms.cust_2023HGCalMuon --geometry Extended2023HGCalV4Muon,Extended2023HGCalV4MuonReco --magField 38T_PostLS1 --filein file:step2_tauJetGun_EmeanEn_EtareplaceEta_NUM_500evts.root  --fileout file:step3_tauJetGun_EmeanEn_EtareplaceEta_NUM_500evts.root 

#move output files from steps1, 2, and 3 to $HOME/.
mv step1_tauJetGun_EmeanEn_EtareplaceEta_NUM_500evts.root $HOME/.
mv step2_tauJetGun_EmeanEn_EtareplaceEta_NUM_500evts.root $HOME/.
mv step3_tauJetGun_EmeanEn_EtareplaceEta_NUM_500evts.root $HOME/.
 
echo "EmeanEn job finished step 3" 
