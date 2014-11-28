# Auto generated configuration file
# using: 
# Revision: 1.20 
# Source: /local/reps/CMSSW/CMSSW/Configuration/Applications/python/ConfigBuilder.py,v 
# with command line options: step2 --conditions auto:upgradePLS3 -n 50 --eventcontent FEVTDEBUGHLT -s DIGI:pdigi_valid,L1,DIGI2RAW --datatier GEN-SIM-DIGI-RAW --customise SLHCUpgradeSimulations/Configuration/combinedCustoms.cust_2023HGCalMuon --geometry Extended2023HGCalMuon,Extended2023HGCalMuonReco --magField 38T_PostLS1 --filein file:step1_chgdPionGun_EmeanEn_EtareplaceEta_140PU_NUM_50evts.root --fileout file:step2_chgdPionGun_EmeanEn_EtareplaceEta_140PU_NUM_50evts.root --pileup AVE_140_BX_25ns --pileup_input file:test.root --no_exec
import FWCore.ParameterSet.Config as cms

process = cms.Process('DIGI2RAW')

# import of standard configurations
process.load('Configuration.StandardSequences.Services_cff')
process.load('SimGeneral.HepPDTESSource.pythiapdt_cfi')
process.load('FWCore.MessageService.MessageLogger_cfi')
process.load('Configuration.EventContent.EventContent_cff')
process.load('SimGeneral.MixingModule.mix_POISSON_average_cfi')
process.load('Configuration.Geometry.GeometryExtended2023HGCalMuonReco_cff')
process.load('Configuration.StandardSequences.MagneticField_38T_PostLS1_cff')
process.load('Configuration.StandardSequences.Digi_cff')
process.load('Configuration.StandardSequences.SimL1Emulator_cff')
process.load('Configuration.StandardSequences.DigiToRaw_cff')
process.load('Configuration.StandardSequences.EndOfProcess_cff')
process.load('Configuration.StandardSequences.FrontierConditions_GlobalTag_cff')

process.maxEvents = cms.untracked.PSet(
    input = cms.untracked.int32(30)
)

# Input source
process.source = cms.Source("PoolSource",
    secondaryFileNames = cms.untracked.vstring(),
    fileNames = cms.untracked.vstring('file:step1_chgdPionGun_EmeanEn_EtareplaceEta_NUM_500evts.root')
)

process.options = cms.untracked.PSet(

)

# Production Info
process.configurationMetadata = cms.untracked.PSet(
    version = cms.untracked.string('$Revision: 1.20 $'),
    annotation = cms.untracked.string('step2 nevts:50'),
    name = cms.untracked.string('Applications')
)

# Output definition

process.FEVTDEBUGHLToutput = cms.OutputModule("PoolOutputModule",
    splitLevel = cms.untracked.int32(0),
    eventAutoFlushCompressedSize = cms.untracked.int32(5242880),
    outputCommands = process.FEVTDEBUGHLTEventContent.outputCommands,
    fileName = cms.untracked.string('file:step2_chgdPionGun_EmeanEn_EtareplaceEta_140PU_NUM_30evts.root'),
    dataset = cms.untracked.PSet(
        filterName = cms.untracked.string(''),
        dataTier = cms.untracked.string('GEN-SIM-DIGI-RAW')
    )
)

# Additional output definition

# Other statements
process.mix.input.nbPileupEvents.averageNumber = cms.double(140.000000)
process.mix.bunchspace = cms.int32(25)
process.mix.minBunch = cms.int32(-12)
process.mix.maxBunch = cms.int32(3)

pileupFileList = cms.untracked.vstring()

pileupFileList.extend( [
	'file:HGCEvents_211_25_100.root',
	'file:HGCEvents_211_25_101.root',
	'file:HGCEvents_211_25_1011.root',
	'file:HGCEvents_211_25_1013.root',
	'file:HGCEvents_211_25_1014.root',
	'file:HGCEvents_211_25_1016.root',
	'file:HGCEvents_211_25_1019.root',
	'file:HGCEvents_211_25_102.root',
	'file:HGCEvents_211_25_1021.root',
	'file:HGCEvents_211_25_1022.root',
	'file:HGCEvents_211_25_1026.root',
	'file:HGCEvents_211_25_1027.root',
	'file:HGCEvents_211_25_103.root',
	'file:HGCEvents_211_25_1030.root',
	'file:HGCEvents_211_25_1031.root',
	'file:HGCEvents_211_25_1033.root',
	'file:HGCEvents_211_25_1035.root',
	'file:HGCEvents_211_25_1036.root',
	'file:HGCEvents_211_25_1037.root',
	'file:HGCEvents_211_25_1039.root',
	'file:HGCEvents_211_25_104.root',
	'file:HGCEvents_211_25_1040.root',
	'file:HGCEvents_211_25_1041.root',
	'file:HGCEvents_211_25_1042.root',
	'file:HGCEvents_211_25_1049.root',
	'file:HGCEvents_211_25_105.root',
	'file:HGCEvents_211_25_1051.root',
	'file:HGCEvents_211_25_1052.root',
	'file:HGCEvents_211_25_1054.root',
	'file:HGCEvents_211_25_1056.root',
	'file:HGCEvents_211_25_1057.root',
	'file:HGCEvents_211_25_1058.root',
	'file:HGCEvents_211_25_1059.root',
	'file:HGCEvents_211_25_106.root',
	'file:HGCEvents_211_25_1060.root',
	'file:HGCEvents_211_25_107.root',
	'file:HGCEvents_211_25_108.root',
	'file:HGCEvents_211_25_109.root',
	'file:HGCEvents_211_25_976.root',
	'file:MinBias_14TeV_HGCV5_1000evts.root',


])

import random
random.shuffle(pileupFileList)
process.mix.input.fileNames = pileupFileList 

process.mix.digitizers = cms.PSet(process.theDigitizersValid)
from Configuration.AlCa.GlobalTag import GlobalTag
process.GlobalTag = GlobalTag(process.GlobalTag, 'auto:upgradePLS3', '')

# Path and EndPath definitions
process.digitisation_step = cms.Path(process.pdigi_valid)
process.L1simulation_step = cms.Path(process.SimL1Emulator)
process.digi2raw_step = cms.Path(process.DigiToRaw)
process.endjob_step = cms.EndPath(process.endOfProcess)
process.FEVTDEBUGHLToutput_step = cms.EndPath(process.FEVTDEBUGHLToutput)

# Schedule definition
process.schedule = cms.Schedule(process.digitisation_step,process.L1simulation_step,process.digi2raw_step,process.endjob_step,process.FEVTDEBUGHLToutput_step)

# customisation of the process.

# Automatic addition of the customisation function from SLHCUpgradeSimulations.Configuration.combinedCustoms
from SLHCUpgradeSimulations.Configuration.combinedCustoms import cust_2023HGCalMuon 

#call to customisation function cust_2023HGCalMuon imported from SLHCUpgradeSimulations.Configuration.combinedCustoms
process = cust_2023HGCalMuon(process)

# End of customisation functions
