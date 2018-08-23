
# Set the working directory...
setwd("C:/Thesis/Analysis-R")
dataDirectory <- "datafiles"
sheetNameValue <- "Raw Data"
variableNameFile <- "variableNames.xlsx"
variableSheetName <- "variableNames"
reverseCoding <- "08/02/2016"

VariableNonTidy <- c(
					 "IPAddress",
					 "startTime",
					 "duplicate",
					 "seqNumber",
					 "extReferences",
					 "custV1",
					 "custV2",
					 "custV3",
					 "custV4",
					 "custV5",
					 "referenceMail",
					 "referenceGroup",
					 "Name",
					 "CompanyName",
					 "Email"
					 )

SIRelation1 <- c(
				"SIRelationManager1",
				"SIRelationColleague1",
				"SIRelationSubordinate1",
				"SIRelationFamily1",
				"SIRelationMentor1",
				"SIRelationNeighbor1"
				)

SIRelation2 <- c(
				"SIRelationManager2",
				"SIRelationColleague2",
				"SIRelationSubordinate2",
				"SIRelationFamily2",
				"SIRelationMentor2",
				"SIRelationNeighbor2"
				)

SIRelation3 <- c(
				"SIRelationManager3",
				"SIRelationColleague3",
				"SIRelationSubordinate3",
				"SIRelationFamily3",
				"SIRelationMentor3",
				"SIRelationNeighbor3"
				)
SITopic1 <- c(
				"SITopicPolitics1",
				"SITopicLocalEvents1",
				"SITopicWork1",
				"SITopicFriends1",
				"SITopicLeisure1",
				"SITopicFamily1"
				)

SITopic2 <- c(
				"SITopicPolitics2",
				"SITopicLocalEvents2",
				"SITopicWork2",
				"SITopicFriends2",
				"SITopicLeisure2",
				"SITopicFamily2"
				)

SITopic3 <- c(
				"SITopicPolitics3",
				"SITopicLocalEvents3",
				"SITopicWork3",
				"SITopicFriends3",
				"SITopicLeisure3",
				"SITopicFamily3"
				)

SIList1 <- c(
				"SICloseness1",
				SIRelation1,
				"SIFrequency1",
				SITopic1,
				"SIExchangeDepth1",
				"SIUniqueness1",
				"SICommunityOverlap1",
				"SIDurationMonth1",
				"SITimeMinutes1"
				)

SIList2 <- c(
				"SICloseness2",
				SIRelation2,
				"SIFrequency2",
				SITopic2,
				"SIExchangeDepth2",
				"SIUniqueness2",
				"SICommunityOverlap2",
				"SIDurationMonth2",
				"SITimeMinutes2"
				)
SIList3 <- c(
				"SICloseness3",
				SIRelation3,
				"SIFrequency3",
				SITopic3,
				"SIExchangeDepth3",
				"SIUniqueness3",
				"SICommunityOverlap3",
				"SIDurationMonth3",
				"SITimeMinutes3"
				)

SIList <- c(SIList1, SIList2, SIList3)

ClimateTrust <- c(
						"ClimateTrust1",
						"ClimateTrust2",
						"ClimateTrust3",
						"ClimateTrust4",
						"ClimateTrust5"
						)
				  

ClimateReciprocity <- c(
						"ClimateReciprocity1",
						"ClimateReciprocity2"
						)

ClimateIdentification <- c(
								"ClimateIdentification1",
								"ClimateIdentification2",
								"ClimateIdentification3",
								"ClimateIdentification4"
								)
						   
ClimateSharedLang <- c(
						"ClimateSharedLang1",
						"ClimateSharedLang2",
						"ClimateSharedLang3"
						)
					   
ClimateSharedVision <- c(
						"ClimateSharedVision1",
						"ClimateSharedVision2",
						"ClimateSharedVision3"
						)

ClimateRelationInitation <- c(
								"ClimateRelationInitation1",
								"ClimateRelationInitation2",
								"ClimateRelationInitation3",
								"ClimateRelationInitation4"
								)

Climate <- c(ClimateTrust, 
			 ClimateReciprocity, 
			 ClimateIdentification, 
			 ClimateSharedLang, 
			 ClimateSharedVision, 
			 ClimateRelationInitation
			 )
							  
LearningEmbed <- c(
						"LearningEmbed1",
						"LearningEmbed2",
						"LearningEmbed3",
						"LearningEmbed4",
						"LearningEmbed5",
						"LearningEmbed6"
						)

LearningEmpower <- c(
						"LearningEmpower1",
						"LearningEmpower2",
						"LearningEmpower3",
						"LearningEmpower4",
						"LearningEmpower5",
						"LearningEmpower6"
						)
				   
LearningConnection <- c(
						"LearningConnection1",
						"LearningConnection2",
						"LearningConnection3",
						"LearningConnection4",
						"LearningConnection5",
						"LearningConnection6"
						)
						
LearningLeader <- c(
						"LearningLeader1",
						"LearningLeader2",
						"LearningLeader3"
						)

Learning <- c(LearningEmbed,
			  LearningEmpower,
			  LearningConnection,
			  LearningLeader
			  )

InnovationProduct <- c(
						"InnovProduct1",
						"InnovProduct2",
						"InnovProduct3",
						"InnovProduct4",
						"InnovProduct5"
						)
					   
InnovationProcess <- c(
						"InnovProcess1",
						"InnovProcess2",
						"InnovProcess3",
						"InnovProcess4"
						)
					   
InnovationOperation <- c(
						"InnovOperation1",
						"InnovOperation2",
						"InnovOperation3",
						"InnovOperation4"
						)
						 
InnovationCompetitor <- c(
								"InnovCompetitor1",
								"InnovCompetitor2"
								)
						  
InnovationType <- c(
						"InnovRadical1",
						"InnovRadical2"
						)

Innovation <- c(InnovationProduct,
				InnovationProcess,
				InnovationOperation,
				InnovationCompetitor,
				InnovationType
				)

MotivationIntrinsic <- c(
						"MotivationIntrinsic1",
						"MotivationIntrinsic2",
						"MotivationIntrinsic3",
						"MotivationIntrinsic4",
						"MotivationIntrinsic5",
						"MotivationIntrinsic6",
						"MotivationIntrinsic7"
						)
						 
MotivationIntegrated <- c(
								"MotivationIntegrated1",
								"MotivationIntegrated2",
								"MotivationIntegrated3"
								)


MotivationIdentified <- c(
								"MotivationIdentified1",
								"MotivationIdentified2",
								"MotivationIdentified3",
								"MotivationIdentified4"
								)


MotivationIntrojected <- c(
								"MotivationIntrojected1",
								"MotivationIntrojected2",
								"MotivationIntrojected3",
								"MotivationIntrojected4"
								)

MotivationExternal <- c( "MotivationExternal1")

Motivation <- c(MotivationIntrinsic,
				MotivationIntegrated,
				MotivationIdentified,
				MotivationIntrojected,
				MotivationExternal
				)

WorkType <- c(
				"BusinessADM",
				"BusinessASS",
				"BusinessEES",
				"BusinessICM",
				"BusinessITC",
				"BusinessECM",
				"BusinessMA",
				"BusinessPE",
				"BusinessTES",
				"BusinessOther"
				)
			  
						

