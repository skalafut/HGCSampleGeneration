#!/bin/bash

energyMean=(50 100 200 500 1000)
fileNumber=(1 2 3 4 5 6 7 8 9 10) #each output .root file will contain 100 events 


for j in {0..4}
do
	#loop over energyMean
	cd chargedPiPt${energyMean[$j]}/

	for q in {0..9}
	do
		#loop over fileNumber
		eval 'condor_submit request_disk=8000000 request_memory=2000000 chargedPi_Pt${energyMean[$j]}_${fileNumber[$q]}_NoPU'

	done

	cd ..

done




