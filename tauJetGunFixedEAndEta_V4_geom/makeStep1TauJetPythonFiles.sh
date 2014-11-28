#!/bin/bash

#this works
fileNumber=(1 2 3 4 5) #each output .root file will contain 500 events 

energyMean=(20 40 100 200 300 500 600 800 1000)
energyMax=(20.01 40.01 100.01 200.01 300.01 500.01 600.01 800.01 1000.01)
energyMin=(19.99 39.99 99.99 199.99 299.99 499.99 599.99 799.99 999.99)

etaMean=(1.5 1.75 2 2.25 2.5 2.9)
etaMax=(1.51005 1.76005 2.01005 2.26005 2.51005 2.91005)
etaMin=(1.49005 1.74005 1.99005 2.24005 2.49005 2.89005) 

element=4 

for i in {0..5} 
do
	for j in {0..8}
	do

			#replace NUM, meanEn, meanEta, MAXETA, MINETA, MMAAXXE, and MMIINNE
			eval "sed 's/MINETA/${etaMin[$i]}/' SingleTauJetE333_cfi_py_GEN_SIM.py > SingleTauJetE333_cfi_py_GEN_SIM_minEta_${etaMin[$i]}.py"
			eval "sed 's/MAXETA/${etaMax[$i]}/' SingleTauJetE333_cfi_py_GEN_SIM_minEta_${etaMin[$i]}.py > SingleTauJetE333_cfi_py_GEN_SIM_minEta_${etaMin[$i]}_maxEta_${etaMax[$i]}.py"
			eval "sed 's/meanEta/${etaMean[$i]}/' SingleTauJetE333_cfi_py_GEN_SIM_minEta_${etaMin[$i]}_maxEta_${etaMax[$i]}.py > SingleTauJetE333_cfi_py_GEN_SIM_meanEta_${etaMean[$i]}.py"
			eval "sed 's/MMIINNE/${energyMin[$j]}/' SingleTauJetE333_cfi_py_GEN_SIM_meanEta_${etaMean[$i]}.py > SingleTauJetE333_cfi_py_GEN_SIM_meanEta_${etaMean[$i]}_minEn_${energyMin[$j]}.py"
			eval "sed 's/MMAAXXE/${energyMax[$j]}/' SingleTauJetE333_cfi_py_GEN_SIM_meanEta_${etaMean[$i]}_minEn_${energyMin[$j]}.py > SingleTauJetE333_cfi_py_GEN_SIM_meanEta_${etaMean[$i]}_minEn_${energyMin[$j]}_maxE_${energyMax[$j]}.py"
			eval "sed 's/meanEn/${energyMean[$j]}/' SingleTauJetE333_cfi_py_GEN_SIM_meanEta_${etaMean[$i]}_minEn_${energyMin[$j]}_maxE_${energyMax[$j]}.py > SingleTauJetE${energyMean[$j]}_cfi_py_GEN_SIM_meanEta_${etaMean[$i]}.py"
			eval "sed 's/NUM/${fileNumber[$element]}/' SingleTauJetE${energyMean[$j]}_cfi_py_GEN_SIM_meanEta_${etaMean[$i]}.py > SingleTauJetE${energyMean[$j]}_cfi_py_GEN_SIM_meanEta_${etaMean[$i]}_${fileNumber[$element]}.py" 
			rm SingleTauJetE333_cfi_py_GEN_SIM_minEta_${etaMin[$i]}.py SingleTauJetE333_cfi_py_GEN_SIM_minEta_${etaMin[$i]}_maxEta_${etaMax[$i]}.py SingleTauJetE333_cfi_py_GEN_SIM_meanEta_${etaMean[$i]}.py
			rm SingleTauJetE333_cfi_py_GEN_SIM_meanEta_${etaMean[$i]}_minEn_${energyMin[$j]}.py SingleTauJetE333_cfi_py_GEN_SIM_meanEta_${etaMean[$i]}_minEn_${energyMin[$j]}_maxE_${energyMax[$j]}.py
			rm SingleTauJetE${energyMean[$j]}_cfi_py_GEN_SIM_meanEta_${etaMean[$i]}.py

	done

	for k in {1..8}
	do
		mv SingleTauJetE${energyMean[$k]}_cfi_py_GEN_SIM_meanEta_${etaMean[$i]}_${fileNumber[$element]}.py ../tauJetGunE${energyMean[$k]}/.

	done

done


#for i in {1..8}
#do
#	#copy the .tar directory into each tauJetGunE directory, except for the E20 directory (where this script is run!)
#	cp forHGCSims_SLHC18.tar ../tauJetGunE${energyMean[$i]}/.
#
#done

 
