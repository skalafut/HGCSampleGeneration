#!/bin/bash

fileNumber=(1 2 3 4 5) #each output .root file will contain 500 events 

energyMax=(10.01 30.01 50.01 80.01 100.01 150.01 200.01 300.01 500.01)
energyMin=(9.99 29.99 49.99 79.99 99.99 149.99 199.99 299.99 499.99)
energyMean=(10 30 50 80 100 150 200 300 500)

etaMean=(1.3 1.6 1.9 2.2 2.5 2.8)
etaMax=(1.31001 1.61001 1.91001 2.23001 2.51001 2.81001)
etaMin=(1.29001 1.59001 1.89001 2.21001 2.49001 2.79001) 

element=0 

for i in {0..5} 
do
	for j in {0..8}
	do
		
			#replace NUM, meanEn, meanEta, MAXETA, MINETA, MMAAXXE, and MMIINNE
			eval "sed 's/MINETA/${etaMin[$i]}/' SinglePiE333_cfi_py_GEN_SIM.py > SinglePiE333_cfi_py_GEN_SIM_minEta_${etaMin[$i]}.py"
			eval "sed 's/MAXETA/${etaMax[$i]}/' SinglePiE333_cfi_py_GEN_SIM_minEta_${etaMin[$i]}.py > SinglePiE333_cfi_py_GEN_SIM_minEta_${etaMin[$i]}_maxEta_${etaMax[$i]}.py"
			eval "sed 's/meanEta/${etaMean[$i]}/' SinglePiE333_cfi_py_GEN_SIM_minEta_${etaMin[$i]}_maxEta_${etaMax[$i]}.py > SinglePiE333_cfi_py_GEN_SIM_meanEta_${etaMean[$i]}.py"
			eval "sed 's/MMIINNE/${energyMin[$j]}/' SinglePiE333_cfi_py_GEN_SIM_meanEta_${etaMean[$i]}.py > SinglePiE333_cfi_py_GEN_SIM_meanEta_${etaMean[$i]}_minEn_${energyMin[$j]}.py"
			eval "sed 's/MMAAXXE/${energyMax[$j]}/' SinglePiE333_cfi_py_GEN_SIM_meanEta_${etaMean[$i]}_minEn_${energyMin[$j]}.py > SinglePiE333_cfi_py_GEN_SIM_meanEta_${etaMean[$i]}_minEn_${energyMin[$j]}_maxE_${energyMax[$j]}.py"
			eval "sed 's/meanEn/${energyMean[$j]}/' SinglePiE333_cfi_py_GEN_SIM_meanEta_${etaMean[$i]}_minEn_${energyMin[$j]}_maxE_${energyMax[$j]}.py > SinglePiE${energyMean[$j]}_cfi_py_GEN_SIM_meanEta_${etaMean[$i]}.py"
			eval "sed 's/NUM/${fileNumber[$element]}/' SinglePiE${energyMean[$j]}_cfi_py_GEN_SIM_meanEta_${etaMean[$i]}.py > SinglePiE${energyMean[$j]}_cfi_py_GEN_SIM_meanEta_${etaMean[$i]}_${fileNumber[$element]}.py" 
			rm SinglePiE333_cfi_py_GEN_SIM_minEta_${etaMin[$i]}.py SinglePiE333_cfi_py_GEN_SIM_minEta_${etaMin[$i]}_maxEta_${etaMax[$i]}.py SinglePiE333_cfi_py_GEN_SIM_meanEta_${etaMean[$i]}.py
			rm SinglePiE333_cfi_py_GEN_SIM_meanEta_${etaMean[$i]}_minEn_${energyMin[$j]}.py SinglePiE333_cfi_py_GEN_SIM_meanEta_${etaMean[$i]}_minEn_${energyMin[$j]}_maxE_${energyMax[$j]}.py
			rm SinglePiE${energyMean[$j]}_cfi_py_GEN_SIM_meanEta_${etaMean[$i]}.py
		

	done

	for k in {1..8}
	do
			mv SinglePiE${energyMean[$k]}_cfi_py_GEN_SIM_meanEta_${etaMean[$i]}_${fileNumber[$element]}.py ../chgdPionGunE${energyMean[$k]}/.

	done

done

#for i in {1..8}
#do
#	#copy the .tar directories into each chgdPionGunE directory, except for the E2 directory (where this script is run!)
#	cp forSLHC20_patch1.tar ../chgdPionGunE${energyMean[$i]}/.
#	cp MinBias_14TeV_HGCV5_1000evts.root ../chgdPionGunE${energyMean[$i]}/. 
#
#done

 
