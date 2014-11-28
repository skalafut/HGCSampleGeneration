#!/bin/bash

fileNumber=(1 2 3 4 5 6 7 8 9 10) #each output .root file will contain 100 events 
energyMean=(50 100 200 500 1000)

for i in {0..9} 
do
	#looping over i corresponds to looping over etaMax, etaMin, and fileNumber 

	for j in {0..4}
	do
		#loop over j corresponds to looping over energyMin, energyMax, and energyMean 

		#now make copies of the step2 .py files
		#change meanEn and NUM
		eval "sed 's/NUM/${fileNumber[$i]}/' step2_Template.py > step2_temp1.py"
		eval "sed 's/meanEn/${energyMean[$j]}/' step2_temp1.py > step2_ChargedPi_Pt_${energyMean[$j]}_NoPU_${fileNumber[$i]}.py"

		rm step2_temp1.py  
	   	mv step2_ChargedPi_Pt_${energyMean[$j]}_NoPU_${fileNumber[$i]}.py ../chargedPiPt${energyMean[$j]}/.

		eval "sed 's/NUM/${fileNumber[$i]}/' step2_Template_140PU.py > step2_temp1_140PU.py"
		eval "sed 's/meanEn/${energyMean[$j]}/' step2_temp1_140PU.py > step2_ChargedPi_Pt_${energyMean[$j]}_140PU_${fileNumber[$i]}.py"

		rm step2_temp1_140PU.py
	   	mv step2_ChargedPi_Pt_${energyMean[$j]}_140PU_${fileNumber[$i]}.py ../chargedPiPt${energyMean[$j]}/.

		#now make copies of the step3 .py files
		#change meanEn and NUM
		eval "sed 's/NUM/${fileNumber[$i]}/' step3_Template.py > step3_temp1.py"
		eval "sed 's/meanEn/${energyMean[$j]}/' step3_temp1.py > step3_ChargedPi_Pt_${energyMean[$j]}_NoPU_${fileNumber[$i]}.py"

		rm step3_temp1.py 
	   	mv step3_ChargedPi_Pt_${energyMean[$j]}_NoPU_${fileNumber[$i]}.py ../chargedPiPt${energyMean[$j]}/.


		eval "sed 's/NUM/${fileNumber[$i]}/' step3_Template_140PU.py > step3_temp1_140PU.py"
		eval "sed 's/meanEn/${energyMean[$j]}/' step3_temp1_140PU.py > step3_ChargedPi_Pt_${energyMean[$j]}_140PU_${fileNumber[$i]}.py"

		rm step3_temp1_140PU.py
	   	mv step3_ChargedPi_Pt_${energyMean[$j]}_140PU_${fileNumber[$i]}.py ../chargedPiPt${energyMean[$j]}/.


	done

done




