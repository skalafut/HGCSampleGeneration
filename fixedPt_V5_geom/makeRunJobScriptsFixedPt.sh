#!/bin/bash
fileNumber=(1 2 3 4 5 6 7 8 9 10) #each output .root file will contain 500 events 
energyMean=(50 100 200 500 1000)

for j in {0..4}
do
	#loop over energyMean

	for q in {0..9}
	do
		#loop over fileNumber

		#make the .csh job executable files
		eval "sed 's/meanEn/${energyMean[$j]}/g' runChargedPiPt333_NoPU.csh > runChargedPiPt${energyMean[$j]}_NoPU.csh"
		eval "sed 's/NUM/${fileNumber[$q]}/g' runChargedPiPt${energyMean[$j]}_NoPU.csh > runChargedPiPt${energyMean[$j]}_${fileNumber[$q]}_NoPU.csh"

		rm runChargedPiPt${energyMean[$j]}_NoPU.csh
	
		eval "sed 's/meanEn/${energyMean[$j]}/g' runChargedPiPt333_140PU.csh > runChargedPiPt${energyMean[$j]}_140PU.csh"
		eval "sed 's/NUM/${fileNumber[$q]}/g' runChargedPiPt${energyMean[$j]}_140PU.csh > runChargedPiPt${energyMean[$j]}_${fileNumber[$q]}_140PU.csh"

		rm runChargedPiPt${energyMean[$j]}_140PU.csh

		#make the .txt job submission files	

		eval "sed 's/meanEn/${energyMean[$j]}/g' chargedPi_Pt333_NoPU > chargedPi_Pt${energyMean[$j]}_NoPU"
		eval "sed 's/NUM/${fileNumber[$q]}/g' chargedPi_Pt${energyMean[$j]}_NoPU > chargedPi_Pt${energyMean[$j]}_${fileNumber[$q]}_NoPU"

		rm chargedPi_Pt${energyMean[$j]}_NoPU
	
		eval "sed 's/meanEn/${energyMean[$j]}/g' chargedPi_Pt333_140PU > chargedPi_Pt${energyMean[$j]}_140PU"
		eval "sed 's/NUM/${fileNumber[$q]}/g' chargedPi_Pt${energyMean[$j]}_140PU > chargedPi_Pt${energyMean[$j]}_${fileNumber[$q]}_140PU"

		rm chargedPi_Pt${energyMean[$j]}_140PU

		mv runChargedPiPt${energyMean[$j]}_${fileNumber[$q]}_NoPU.csh ../chargedPiPt${energyMean[$j]}/.
		mv runChargedPiPt${energyMean[$j]}_${fileNumber[$q]}_140PU.csh ../chargedPiPt${energyMean[$j]}/.
		mv chargedPi_Pt${energyMean[$j]}_${fileNumber[$q]}_NoPU ../chargedPiPt${energyMean[$j]}/.
		mv chargedPi_Pt${energyMean[$j]}_${fileNumber[$q]}_140PU ../chargedPiPt${energyMean[$j]}/.


	done

done



