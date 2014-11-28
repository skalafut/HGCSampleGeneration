#!/bin/bash
fileNumber=(1 2 3 4 5) #each output .root file will contain 500 events 

energyMean=(20 40 100 200 300 500 600 800 1000)

etaMean=(1.5 1.75 2 2.25 2.5 2.9)

for i in {0..5} 
do
	for j in {0..8}
	do

		for q in {0..4}
		do
			#replace NUM, meanEn, replaceEta in .csh and job submission file (no .txt or .csh ending)
			eval "sed 's/replaceEta/${etaMean[$i]}/g' runTauJetGun_E333.csh > runTauJetGun_E333_meanEta_${etaMean[$i]}.csh"
			eval "sed 's/replaceEta/${etaMean[$i]}/g' tauJetGun_E333 > tauJetGun_E333_meanEta_${etaMean[$i]}"
			
			eval "sed 's/meanEn/${energyMean[$j]}/g' runTauJetGun_E333_meanEta_${etaMean[$i]}.csh > runTauJetGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}.csh"
			eval "sed 's/meanEn/${energyMean[$j]}/g' tauJetGun_E333_meanEta_${etaMean[$i]} > tauJetGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}"
			
			eval "sed 's/NUM/${fileNumber[$q]}/g' runTauJetGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}.csh > runTauJetGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_${fileNumber[$q]}.csh"
 			eval "sed 's/NUM/${fileNumber[$q]}/g' tauJetGun_E${energyMean[$j]}_meanEta_${etaMean[$i]} > tauJetGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_${fileNumber[$q]}"

			rm runTauJetGun_E333_meanEta_${etaMean[$i]}.csh runTauJetGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}.csh 
			rm tauJetGun_E333_meanEta_${etaMean[$i]} tauJetGun_E${energyMean[$j]}_meanEta_${etaMean[$i]} 

			mv runTauJetGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_${fileNumber[$q]}.csh ../tauJetGunE${energyMean[$j]}/.
			mv tauJetGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_${fileNumber[$q]} ../tauJetGunE${energyMean[$j]}/.

		done

	done

done


