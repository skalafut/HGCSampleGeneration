#!/bin/bash

fileNumber=(1 2 3 4 5 6 7 8 9 10) #each output .root file will contain 100 events 

energyMax=(50.01 100.01 200.01 500.01 1000.01)
energyMin=(49.99 99.99 199.99 499.99 999.99)
energyMean=(50 100 200 500 1000)

etaMax=(2.80001 2.80002 2.80003 2.80004 2.80005 2.80006 2.80007 2.80008 2.80009 2.8001)
etaMin=(1.70001 1.70002 1.70003 1.70004 1.70005 1.70006 1.70007 1.70008 1.70009 1.7001)


for i in {0..9} 
do
	#looping over i corresponds to looping over etaMax, etaMin, and fileNumber 

	for j in {0..4}
	do
		#loop over j corresponds to looping over energyMin, energyMax, and energyMean 

		#now make copies of the step1 .py files
			#replace NUM, meanEn, meanEta, MAXETA, MINETA, MMAAXXE, and MMIINNE
			eval "sed 's/MINETA/${etaMin[$i]}/' SingleChargedPiPt333_cfi_GEN_SIM.py > SingleChargedPiPt333_cfi_GEN_SIM_minEta_${etaMin[$i]}.py"
			eval "sed 's/MAXETA/${etaMax[$i]}/' SingleChargedPiPt333_cfi_GEN_SIM_minEta_${etaMin[$i]}.py > SingleChargedPiPt333_cfi_GEN_SIM_minEta_${etaMin[$i]}_maxEta_${etaMax[$i]}.py"
			eval "sed 's/MMIINNE/${energyMin[$j]}/' SingleChargedPiPt333_cfi_GEN_SIM_minEta_${etaMin[$i]}_maxEta_${etaMax[$i]}.py > SingleChargedPiPt333_cfi_GEN_SIM_minEn_${energyMin[$j]}.py"
			eval "sed 's/MMAAXXE/${energyMax[$j]}/' SingleChargedPiPt333_cfi_GEN_SIM_minEn_${energyMin[$j]}.py > SingleChargedPiPt333_cfi_GEN_SIM_minEn_${energyMin[$j]}_maxE_${energyMax[$j]}.py"
			eval "sed 's/meanEn/${energyMean[$j]}/' SingleChargedPiPt333_cfi_GEN_SIM_minEn_${energyMin[$j]}_maxE_${energyMax[$j]}.py > SingleChargedPiPt${energyMean[$j]}_GEN_SIM.py"
			eval "sed 's/NUM/${fileNumber[$i]}/' SingleChargedPiPt${energyMean[$j]}_GEN_SIM.py > SingleChargedPiPt${energyMean[$j]}_${fileNumber[$i]}_GEN_SIM.py" 

			rm SingleChargedPiPt333_cfi_GEN_SIM_minEta_${etaMin[$i]}.py SingleChargedPiPt333_cfi_GEN_SIM_minEta_${etaMin[$i]}_maxEta_${etaMax[$i]}.py
			rm SingleChargedPiPt333_cfi_GEN_SIM_minEn_${energyMin[$j]}.py SingleChargedPiPt333_cfi_GEN_SIM_minEn_${energyMin[$j]}_maxE_${energyMax[$j]}.py
			rm SingleChargedPiPt${energyMean[$j]}_GEN_SIM.py

	done

	for k in {1..4}
	do
		mv SingleChargedPiPt${energyMean[$k]}_${fileNumber[$i]}_GEN_SIM.py ../chargedPiPt${energyMean[$k]}/.
	done

done


#for i in {1..8}
#do
#	#copy the two .tar directories into each neutralChargedPiGunE directory, except for the E2 directory (where this script is run!)
#	cp forHGCSims_SLHC18.tar ../neutralChargedPiGunE${energyMean[$i]}/.
#
#done

 
