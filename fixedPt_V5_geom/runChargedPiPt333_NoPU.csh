#!/bin/csh

#Setup environment, move and untar needed files and directories, compile everything
setenv HOME /eos/uscms/store/user/lpchgcal/HGCAL_Samples/chargedPiFixedPt_withPFRecHits_SLHC20_V5Geom
setenv PATH /bin:/usr/bin:/usr/local/bin:/usr/krb5/bin:/usr/afsws/bin:/usr/krb5/bin/aklog

#source /uscmst1/prod/sw/cms/cshrc prod
source /cvmfs/cms.cern.ch/cmsset_default.csh prod
setenv SCRAM_ARCH slc6_amd64_gcc472

cmsrel CMSSW_6_2_0_SLHC20

mv SingleChargedPiPtmeanEn_NUM_GEN_SIM.py step2_ChargedPi_Pt_meanEn_NoPU_NUM.py step3_ChargedPi_Pt_meanEn_NoPU_NUM.py CMSSW_6_2_0_SLHC20/src/.

cd CMSSW_6_2_0_SLHC20/src/

cmsenv
eval `scramv1 runtime -csh`
#shouldn't need scram b since now I am not untarring any PF reco code on the worker node
#eval 'scram b -j 8'

cmsRun SingleChargedPiPtmeanEn_NUM_GEN_SIM.py

cmsRun step2_ChargedPi_Pt_meanEn_NoPU_NUM.py

cmsRun step3_ChargedPi_Pt_meanEn_NoPU_NUM.py

mv step1_chargedPiGun_PtmeanEn_NUM_100evts.root $HOME/.
mv step2_chargedPiGun_PtmeanEn_NoPU_NUM_100evts.root $HOME/.
mv step3_chargedPiGun_PtmeanEn_NoPU_NUM_100evts.root $HOME/.
 
