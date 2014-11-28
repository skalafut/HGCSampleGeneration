#!/bin/bash
fileNumber=(1 2 3 4 5) #each output .root file will contain 500 events 

energyMean=(10 30 50 80 100 150 200 300 500)

etaMean=(1.3 1.6 1.9 2.2 2.5 2.8)

for i in {0..5} 
do
	for j in {0..8}
	do

		for q in {0..4}
		do
			##replace NUM, meanEn, replaceEta in .csh, job submission file, step2, and step3 python files
			
			##No PU
			eval "sed 's/replaceEta/${etaMean[$i]}/g' runChgdPionGun_E333_NoPU.csh > runChgdPionGun_E333_meanEta_${etaMean[$i]}_NoPU.csh"
			eval "sed 's/replaceEta/${etaMean[$i]}/g' chgdPionGun_E333_NoPU > chgdPionGun_E333_meanEta_${etaMean[$i]}_NoPU"
			eval "sed 's/replaceEta/${etaMean[$i]}/g' step3_TEMP_NoPU.py > step3_TEMP_NoPU_updateEta.py"
			eval "sed 's/replaceEta/${etaMean[$i]}/g' step2_TEMP_NoPU.py > step2_TEMP_NoPU_updateEta.py"

			
			eval "sed 's/meanEn/${energyMean[$j]}/g' runChgdPionGun_E333_meanEta_${etaMean[$i]}_NoPU.csh > runChgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_NoPU.csh"
			eval "sed 's/meanEn/${energyMean[$j]}/g' chgdPionGun_E333_meanEta_${etaMean[$i]}_NoPU > chgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_NoPU"
			eval "sed 's/meanEn/${energyMean[$j]}/g' step3_TEMP_NoPU_updateEta.py > step3_TEMP_NoPU_updateEta_updateE.py"
			eval "sed 's/meanEn/${energyMean[$j]}/g' step2_TEMP_NoPU_updateEta.py > step2_TEMP_NoPU_updateEta_updateE.py"
	

			eval "sed 's/NUM/${fileNumber[$q]}/g' runChgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_NoPU.csh > runChgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_${fileNumber[$q]}_NoPU.csh"
 			eval "sed 's/NUM/${fileNumber[$q]}/g' chgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_NoPU > chgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_${fileNumber[$q]}_NoPU"
			eval "sed 's/NUM/${fileNumber[$q]}/g' step3_TEMP_NoPU_updateEta_updateE.py > step3_E${energyMean[$j]}_meanEta_${etaMean[$i]}_NoPU_${fileNumber[$q]}.py"
			eval "sed 's/NUM/${fileNumber[$q]}/g' step2_TEMP_NoPU_updateEta_updateE.py > step2_E${energyMean[$j]}_meanEta_${etaMean[$i]}_NoPU_${fileNumber[$q]}.py"


			rm runChgdPionGun_E333_meanEta_${etaMean[$i]}_NoPU.csh runChgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_NoPU.csh 
			rm chgdPionGun_E333_meanEta_${etaMean[$i]}_NoPU chgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_NoPU
		   	rm step3_TEMP_NoPU_updateEta.py step3_TEMP_NoPU_updateEta_updateE.py 
		   	rm step2_TEMP_NoPU_updateEta.py step2_TEMP_NoPU_updateEta_updateE.py 


			mv runChgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_${fileNumber[$q]}_NoPU.csh ../chgdPionGunE${energyMean[$j]}/.
			mv chgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_${fileNumber[$q]}_NoPU ../chgdPionGunE${energyMean[$j]}/.
			mv step3_E${energyMean[$j]}_meanEta_${etaMean[$i]}_NoPU_${fileNumber[$q]}.py ../chgdPionGunE${energyMean[$j]}/.
			mv step2_E${energyMean[$j]}_meanEta_${etaMean[$i]}_NoPU_${fileNumber[$q]}.py ../chgdPionGunE${energyMean[$j]}/.


			##140 PU files

			eval "sed 's/replaceEta/${etaMean[$i]}/g' runChgdPionGun_E333_140PU.csh > runChgdPionGun_E333_meanEta_${etaMean[$i]}_140PU.csh"
			eval "sed 's/replaceEta/${etaMean[$i]}/g' chgdPionGun_E333_140PU > chgdPionGun_E333_meanEta_${etaMean[$i]}_140PU"
			eval "sed 's/replaceEta/${etaMean[$i]}/g' step3_TEMP_140PU.py > step3_TEMP_140PU_updateEta.py"
			eval "sed 's/replaceEta/${etaMean[$i]}/g' step2_TEMP_140PU.py > step2_TEMP_140PU_updateEta.py"

			
			eval "sed 's/meanEn/${energyMean[$j]}/g' runChgdPionGun_E333_meanEta_${etaMean[$i]}_140PU.csh > runChgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_140PU.csh"
			eval "sed 's/meanEn/${energyMean[$j]}/g' chgdPionGun_E333_meanEta_${etaMean[$i]}_140PU > chgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_140PU"
			eval "sed 's/meanEn/${energyMean[$j]}/g' step3_TEMP_140PU_updateEta.py > step3_TEMP_140PU_updateEta_updateE.py"
			eval "sed 's/meanEn/${energyMean[$j]}/g' step2_TEMP_140PU_updateEta.py > step2_TEMP_140PU_updateEta_updateE.py"
	

			eval "sed 's/NUM/${fileNumber[$q]}/g' runChgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_140PU.csh > runChgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_${fileNumber[$q]}_140PU.csh"
 			eval "sed 's/NUM/${fileNumber[$q]}/g' chgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_140PU > chgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_${fileNumber[$q]}_140PU"
			eval "sed 's/NUM/${fileNumber[$q]}/g' step3_TEMP_140PU_updateEta_updateE.py > step3_E${energyMean[$j]}_meanEta_${etaMean[$i]}_140PU_${fileNumber[$q]}.py"
			eval "sed 's/NUM/${fileNumber[$q]}/g' step2_TEMP_140PU_updateEta_updateE.py > step2_E${energyMean[$j]}_meanEta_${etaMean[$i]}_140PU_${fileNumber[$q]}.py"


			rm runChgdPionGun_E333_meanEta_${etaMean[$i]}_140PU.csh runChgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_140PU.csh 
			rm chgdPionGun_E333_meanEta_${etaMean[$i]}_140PU chgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_140PU
		   	rm step3_TEMP_140PU_updateEta.py step3_TEMP_140PU_updateEta_updateE.py 
		   	rm step2_TEMP_140PU_updateEta.py step2_TEMP_140PU_updateEta_updateE.py 


			mv runChgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_${fileNumber[$q]}_140PU.csh ../chgdPionGunE${energyMean[$j]}/.
			mv chgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_${fileNumber[$q]}_140PU ../chgdPionGunE${energyMean[$j]}/.
			mv step3_E${energyMean[$j]}_meanEta_${etaMean[$i]}_140PU_${fileNumber[$q]}.py ../chgdPionGunE${energyMean[$j]}/.
			mv step2_E${energyMean[$j]}_meanEta_${etaMean[$i]}_140PU_${fileNumber[$q]}.py ../chgdPionGunE${energyMean[$j]}/.


			##20 PU files

			eval "sed 's/replaceEta/${etaMean[$i]}/g' runChgdPionGun_E333_20PU.csh > runChgdPionGun_E333_meanEta_${etaMean[$i]}_20PU.csh"
			eval "sed 's/replaceEta/${etaMean[$i]}/g' chgdPionGun_E333_20PU > chgdPionGun_E333_meanEta_${etaMean[$i]}_20PU"
			eval "sed 's/replaceEta/${etaMean[$i]}/g' step3_TEMP_20PU.py > step3_TEMP_20PU_updateEta.py"
			eval "sed 's/replaceEta/${etaMean[$i]}/g' step2_TEMP_20PU.py > step2_TEMP_20PU_updateEta.py"

			
			eval "sed 's/meanEn/${energyMean[$j]}/g' runChgdPionGun_E333_meanEta_${etaMean[$i]}_20PU.csh > runChgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_20PU.csh"
			eval "sed 's/meanEn/${energyMean[$j]}/g' chgdPionGun_E333_meanEta_${etaMean[$i]}_20PU > chgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_20PU"
			eval "sed 's/meanEn/${energyMean[$j]}/g' step3_TEMP_20PU_updateEta.py > step3_TEMP_20PU_updateEta_updateE.py"
			eval "sed 's/meanEn/${energyMean[$j]}/g' step2_TEMP_20PU_updateEta.py > step2_TEMP_20PU_updateEta_updateE.py"
	

			eval "sed 's/NUM/${fileNumber[$q]}/g' runChgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_20PU.csh > runChgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_${fileNumber[$q]}_20PU.csh"
 			eval "sed 's/NUM/${fileNumber[$q]}/g' chgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_20PU > chgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_${fileNumber[$q]}_20PU"
			eval "sed 's/NUM/${fileNumber[$q]}/g' step3_TEMP_20PU_updateEta_updateE.py > step3_E${energyMean[$j]}_meanEta_${etaMean[$i]}_20PU_${fileNumber[$q]}.py"
			eval "sed 's/NUM/${fileNumber[$q]}/g' step2_TEMP_20PU_updateEta_updateE.py > step2_E${energyMean[$j]}_meanEta_${etaMean[$i]}_20PU_${fileNumber[$q]}.py"


			rm runChgdPionGun_E333_meanEta_${etaMean[$i]}_20PU.csh runChgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_20PU.csh 
			rm chgdPionGun_E333_meanEta_${etaMean[$i]}_20PU chgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_20PU
		   	rm step3_TEMP_20PU_updateEta.py step3_TEMP_20PU_updateEta_updateE.py 
		   	rm step2_TEMP_20PU_updateEta.py step2_TEMP_20PU_updateEta_updateE.py 


			mv runChgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_${fileNumber[$q]}_20PU.csh ../chgdPionGunE${energyMean[$j]}/.
			mv chgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_${fileNumber[$q]}_20PU ../chgdPionGunE${energyMean[$j]}/.
			mv step3_E${energyMean[$j]}_meanEta_${etaMean[$i]}_20PU_${fileNumber[$q]}.py ../chgdPionGunE${energyMean[$j]}/.
			mv step2_E${energyMean[$j]}_meanEta_${etaMean[$i]}_20PU_${fileNumber[$q]}.py ../chgdPionGunE${energyMean[$j]}/.


			##75 PU files

			eval "sed 's/replaceEta/${etaMean[$i]}/g' runChgdPionGun_E333_75PU.csh > runChgdPionGun_E333_meanEta_${etaMean[$i]}_75PU.csh"
			eval "sed 's/replaceEta/${etaMean[$i]}/g' chgdPionGun_E333_75PU > chgdPionGun_E333_meanEta_${etaMean[$i]}_75PU"
			eval "sed 's/replaceEta/${etaMean[$i]}/g' step3_TEMP_75PU.py > step3_TEMP_75PU_updateEta.py"
			eval "sed 's/replaceEta/${etaMean[$i]}/g' step2_TEMP_75PU.py > step2_TEMP_75PU_updateEta.py"

			
			eval "sed 's/meanEn/${energyMean[$j]}/g' runChgdPionGun_E333_meanEta_${etaMean[$i]}_75PU.csh > runChgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_75PU.csh"
			eval "sed 's/meanEn/${energyMean[$j]}/g' chgdPionGun_E333_meanEta_${etaMean[$i]}_75PU > chgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_75PU"
			eval "sed 's/meanEn/${energyMean[$j]}/g' step3_TEMP_75PU_updateEta.py > step3_TEMP_75PU_updateEta_updateE.py"
			eval "sed 's/meanEn/${energyMean[$j]}/g' step2_TEMP_75PU_updateEta.py > step2_TEMP_75PU_updateEta_updateE.py"
	

			eval "sed 's/NUM/${fileNumber[$q]}/g' runChgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_75PU.csh > runChgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_${fileNumber[$q]}_75PU.csh"
 			eval "sed 's/NUM/${fileNumber[$q]}/g' chgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_75PU > chgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_${fileNumber[$q]}_75PU"
			eval "sed 's/NUM/${fileNumber[$q]}/g' step3_TEMP_75PU_updateEta_updateE.py > step3_E${energyMean[$j]}_meanEta_${etaMean[$i]}_75PU_${fileNumber[$q]}.py"
			eval "sed 's/NUM/${fileNumber[$q]}/g' step2_TEMP_75PU_updateEta_updateE.py > step2_E${energyMean[$j]}_meanEta_${etaMean[$i]}_75PU_${fileNumber[$q]}.py"


			rm runChgdPionGun_E333_meanEta_${etaMean[$i]}_75PU.csh runChgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_75PU.csh 
			rm chgdPionGun_E333_meanEta_${etaMean[$i]}_75PU chgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_75PU
		   	rm step3_TEMP_75PU_updateEta.py step3_TEMP_75PU_updateEta_updateE.py 
		   	rm step2_TEMP_75PU_updateEta.py step2_TEMP_75PU_updateEta_updateE.py 


			mv runChgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_${fileNumber[$q]}_75PU.csh ../chgdPionGunE${energyMean[$j]}/.
			mv chgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_${fileNumber[$q]}_75PU ../chgdPionGunE${energyMean[$j]}/.
			mv step3_E${energyMean[$j]}_meanEta_${etaMean[$i]}_75PU_${fileNumber[$q]}.py ../chgdPionGunE${energyMean[$j]}/.
			mv step2_E${energyMean[$j]}_meanEta_${etaMean[$i]}_75PU_${fileNumber[$q]}.py ../chgdPionGunE${energyMean[$j]}/.


			##200 PU files

			eval "sed 's/replaceEta/${etaMean[$i]}/g' runChgdPionGun_E333_200PU.csh > runChgdPionGun_E333_meanEta_${etaMean[$i]}_200PU.csh"
			eval "sed 's/replaceEta/${etaMean[$i]}/g' chgdPionGun_E333_200PU > chgdPionGun_E333_meanEta_${etaMean[$i]}_200PU"
			eval "sed 's/replaceEta/${etaMean[$i]}/g' step3_TEMP_200PU.py > step3_TEMP_200PU_updateEta.py"
			eval "sed 's/replaceEta/${etaMean[$i]}/g' step2_TEMP_200PU.py > step2_TEMP_200PU_updateEta.py"

			
			eval "sed 's/meanEn/${energyMean[$j]}/g' runChgdPionGun_E333_meanEta_${etaMean[$i]}_200PU.csh > runChgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_200PU.csh"
			eval "sed 's/meanEn/${energyMean[$j]}/g' chgdPionGun_E333_meanEta_${etaMean[$i]}_200PU > chgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_200PU"
			eval "sed 's/meanEn/${energyMean[$j]}/g' step3_TEMP_200PU_updateEta.py > step3_TEMP_200PU_updateEta_updateE.py"
			eval "sed 's/meanEn/${energyMean[$j]}/g' step2_TEMP_200PU_updateEta.py > step2_TEMP_200PU_updateEta_updateE.py"
	

			eval "sed 's/NUM/${fileNumber[$q]}/g' runChgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_200PU.csh > runChgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_${fileNumber[$q]}_200PU.csh"
 			eval "sed 's/NUM/${fileNumber[$q]}/g' chgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_200PU > chgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_${fileNumber[$q]}_200PU"
			eval "sed 's/NUM/${fileNumber[$q]}/g' step3_TEMP_200PU_updateEta_updateE.py > step3_E${energyMean[$j]}_meanEta_${etaMean[$i]}_200PU_${fileNumber[$q]}.py"
			eval "sed 's/NUM/${fileNumber[$q]}/g' step2_TEMP_200PU_updateEta_updateE.py > step2_E${energyMean[$j]}_meanEta_${etaMean[$i]}_200PU_${fileNumber[$q]}.py"


			rm runChgdPionGun_E333_meanEta_${etaMean[$i]}_200PU.csh runChgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_200PU.csh 
			rm chgdPionGun_E333_meanEta_${etaMean[$i]}_200PU chgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_200PU
		   	rm step3_TEMP_200PU_updateEta.py step3_TEMP_200PU_updateEta_updateE.py 
		   	rm step2_TEMP_200PU_updateEta.py step2_TEMP_200PU_updateEta_updateE.py 


			mv runChgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_${fileNumber[$q]}_200PU.csh ../chgdPionGunE${energyMean[$j]}/.
			mv chgdPionGun_E${energyMean[$j]}_meanEta_${etaMean[$i]}_${fileNumber[$q]}_200PU ../chgdPionGunE${energyMean[$j]}/.
			mv step3_E${energyMean[$j]}_meanEta_${etaMean[$i]}_200PU_${fileNumber[$q]}.py ../chgdPionGunE${energyMean[$j]}/.
			mv step2_E${energyMean[$j]}_meanEta_${etaMean[$i]}_200PU_${fileNumber[$q]}.py ../chgdPionGunE${energyMean[$j]}/.


		done

	done

done


