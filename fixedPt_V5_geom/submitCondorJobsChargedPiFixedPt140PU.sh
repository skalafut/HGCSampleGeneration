#!/bin/bash

energyMean=(50 100 200 500 1000)
fileNumber=(3 4) #each output .root file will contain 100 events 


for j in {0..4}
do
	#loop over energyMean
	cd chargedPiPt${energyMean[$j]}/

	for q in {0..1}
	do
		#loop over fileNumber
		#only submit 2 jobs per fixed pT value
		cp /eos/uscms/store/user/lpchgcal/HGCAL_Samples/chargedPiFixedPt_withPFRecHits_SLHC20_V5Geom/step1_chargedPiGun_Pt${energyMean[$j]}_${fileNumber[$q]}_100evts.root .
		eval 'condor_submit request_disk=20000000 request_memory=5000000 chargedPi_Pt${energyMean[$j]}_${fileNumber[$q]}_140PU'

	done

	cd ..

done




