#!/bin/bash

energyMean=(10 30 50 80 100 150 200 300 500)
etaMean=(1.3 1.6 1.9 2.2 2.5 2.8)
fileNumber=(1 2 3 4 5) #each output .root file contains 100 or 30 events 

#q btwn 0 and 4
#i btwn 0 and 5
#j btwn 0 and 8


for q in {0..4} 
do

#q=4 

	for i in {0..5}
	do

		for j in {0..8}
		do

			cd chgdPionGunE${energyMean[$j]}/

			#zero PU
			#cp /eos/uscms/store/user/lpchgcal/HGCAL_Samples/chgdPionFixedEAndEta_withPFRecHits_SLHC20_patch1_NoPU/step2_chgdPionGun_E${energyMean[$j]}_Eta${etaMean[$i]}_NoPU_${fileNumber[$q]}_500evts.root .

			#with PU
			#cp /eos/uscms/store/user/lpchgcal/HGCAL_Samples/chgdPionFixedEAndEta_withPFRecHits_SLHC20_patch1_20PU/step2_chgdPionGun_E${energyMean[$j]}_Eta${etaMean[$i]}_20PU_${fileNumber[$q]}_100evts.root .

			#cp /eos/uscms/store/user/lpchgcal/HGCAL_Samples/chgdPionFixedEAndEta_withPFRecHits_SLHC20_patch1_75PU/step2_chgdPionGun_E${energyMean[$j]}_Eta${etaMean[$i]}_75PU_${fileNumber[$q]}_30evts.root .

			#cp /eos/uscms/store/user/lpchgcal/HGCAL_Samples/chgdPionFixedEAndEta_withPFRecHits_SLHC20_patch1_140PU/step2_chgdPionGun_E${energyMean[$j]}_Eta${etaMean[$i]}_140PU_${fileNumber[$q]}_30evts.root .

			#cp /eos/uscms/store/user/lpchgcal/HGCAL_Samples/chgdPionFixedEAndEta_withPFRecHits_SLHC20_patch1_200PU/step2_chgdPionGun_E${energyMean[$j]}_Eta${etaMean[$i]}_200PU_${fileNumber[$q]}_30evts.root .

			eval 'condor_submit request_disk=20000000 request_memory=5000000 chgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_${fileNumber[$q]}_NoPU'
			#eval 'condor_submit request_disk=20000000 request_memory=5000000 chgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_${fileNumber[$q]}_20PU'
			#eval 'condor_submit request_disk=20000000 request_memory=5000000 chgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_${fileNumber[$q]}_75PU'
			#eval 'condor_submit request_disk=20000000 request_memory=5000000 chgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_${fileNumber[$q]}_140PU'
			#eval 'condor_submit request_disk=20000000 request_memory=5000000 chgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_${fileNumber[$q]}_200PU'

			cd ..

		done


	done

done



