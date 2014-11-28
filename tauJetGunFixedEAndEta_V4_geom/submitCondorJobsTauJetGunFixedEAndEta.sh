#!/bin/bash

energyMean=(20 40 100 200 300 500 600 800 1000)
etaMean=(1.5 1.75 2 2.25 2.5 2.9)
fileNumber=(1 2 3 4 5) #each output .root file will contain 500 events 


for i in {0..5} 
do
	for j in {0..8}
	do
		cd tauJetGunE${energyMean[$j]}/

		for q in {0..4}
		do
			eval 'condor_submit request_disk=15000000 request_memory=4000000 tauJetGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_${fileNumber[$q]}'

		done

		cd ..

	done

done



