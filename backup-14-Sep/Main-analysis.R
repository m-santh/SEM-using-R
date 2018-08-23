# -------------- Configuration parameters -------------------
#	Global parameters or setting...
# Set the working directory...
setwd("E:/Digital-Dis/innovation-outsource/network/ranjay gulati/community of practice/synopsis/Analysis-R")
dataDirectory <- "datafiles"
sheetNameValue <- "Raw Data"
variableNameFile <- "variableNames.xlsx"
variableSheetName <- "variableNames"

#	Global varibles
variableName <- NULL

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

SIListnoRT1 <- c(
				"SICloseness1",
				"SIFrequency1",
				"SIExchangeDepth1",
				"SIUniqueness1",
				"SICommunityOverlap1",
				"SIDurationMonth1",
				"SITimeMinutes1"
				)

SIListnoRT2 <- c(
				"SICloseness2",
				"SIFrequency2",
				"SIExchangeDepth2",
				"SIUniqueness2",
				"SICommunityOverlap2",
				"SIDurationMonth2",
				"SITimeMinutes2"
				)
SIListnoRT3 <- c(
				"SICloseness3",
				"SIFrequency3",
				"SIExchangeDepth3",
				"SIUniqueness3",
				"SICommunityOverlap3",
				"SIDurationMonth3",
				"SITimeMinutes3"
				)
SIList1 <- c(
				"SICloseness1",
				"SIRelation1",
				"SIFrequency1",
				"SITopic1",
				"SIExchangeDepth1",
				"SIUniqueness1",
				"SICommunityOverlap1",
				"SIDurationMonth1",
				"SITimeMinutes1"
				)

SIList2 <- c(
				"SICloseness2",
				"SIRelation2",
				"SIFrequency2",
				"SITopic2",
				"SIExchangeDepth2",
				"SIUniqueness2",
				"SICommunityOverlap2",
				"SIDurationMonth2",
				"SITimeMinutes2"
				)
SIList3 <- c(
				"SICloseness3",
				"SIRelation3",
				"SIFrequency3",
				"SITopic3",
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
			  
						

# ---------------- Package installations ---------------------------------
#	PACKAGES to be installed and imported.
#
#	xlsx package for - reading and writing to xlsl.
#install.packages("xlsx")
library(xlsx)

#	reshape package for - melt and decast
#install.packages("reshape2")
library(reshape2)

# Alpha
#install.packages("psych")
library(psych)

# MTMM 
#install.packages("psy")
library(psy)

library(plspm)

#install.packages("colortools")
library(colortools)

#install.packages("plsdepot")
#library(plsdepot)

library(RColorBrewer)

# ____________________ Functions implemented _________________________
#
#	Class correction functions.
#	1. SetCloseness(string vector)
#	2. SetInteractionFrequency(string vector)
#	3. SetExchangeDepth(string vector)
#	4. SetInteractionUniqueness(string vector)
#	5. SetCommunity(string vector)
#
#	Data input functions
#	1. ReadVariableName()
#	2. ReadResponseFile(FileName) - corrected data in dataframe.
#

# ReadVariableName
#	This fuction reads the file and gets names of variables
#		- Name of variables
#		- Reverse coded variables
#		- Part of tiny data or not
#	Udates the same in variableName
# 	File variables
#		- variableName1	 (1st row of QuestionPro datalabels)
#		- variableName2	 (2nd row of QuestionPro datalabels)
#		- codedName		 (target names)
#		- reverseCoding	 (indicates whether reverse coded or not)
#		- tidyDataPart	 (is the variable part of tidy data)
# 
ReadVariableName <- function(){

		# Read the xlsx file.
		variableName <- read.xlsx2(variableNameFile, 
							  	  sheetName=variableSheetName,
							  	  header=TRUE,
							  	  stringsAsFactors = FALSE
							  	  )

		# correct the colClasses
		variableName$tidyDataPart <- as.factor(variableName$tidyDataPart)
		variableName$reverseCoding <- as.factor(variableName$reverseCoding)

		# Remove unwanted rows
		variableName <- variableName[variableName$codedName != "",]

}

# SetCloseness
SetCloseness <- function(values) {

		values <- factor(values)
		levels(values) <- list(Acquaintance ="1", 
							GoodFriend="2", 
							CloseFriend="3", 
							Other="4"
							)
		values
}

SetInteractionFrequency <- function(values) {
		values <- factor(values)
		levels(values) <- list(Halfyearly="1", 
							Quarterly="2", 
							Monthly="3", 
							Weekly="4", 
							Daily="5"
							)
		values
}

SetExchangeDepth <- function(values) {
		values <- factor(values)
		levels(values) <- list(None="1", 
							Little="2", 
							Moderate="3", 
							Substantial="4", 
							Great="5"
							)
		values
}

SetInteractionUniqueness <- function(values) {

		values <- factor(values)
		levels(values) <- list(Notatall="1",
							Somewhat="2",
							Moderately="3",
							Mostly="4",
							Always="5"
							)
		values
}

SetCommunity <- function(values) {

		values <- factor(values)
		levels(values) <- list(None="1",
						 	One="2",
							Two="3",
							Three="4",
							Four="5",
							GreatFour="6"
							)
		values
}


Set7likertScale <- function(values) {

		values <- factor(values)
		levels(values) <- list(StronglyDisagree="1",
						 	ModeratelyDisagree="2",
							SlightlyDisagree="3",
							Neutral="4",
							SlightlyAgree="5",
						 	ModeratelyAgree="6",
							StronglyAgree="7"
							)
		values
}

SetRevenueScale <- function(values) {

		values <- factor(values)
		levels(values) <- list(LessThan5="1",
						 	l5to10="2",
							l11to15="3",
							l16to20="4",
							GreaterThan20="5"
							)
		values
}

SetMotivationScale <- function(values) {

		values <- factor(values)
		levels(values) <- list(Notatall="1",
						 	Verysmallextent="2",
							smalextent="3",
							moderateextent="4",
							fairlygreatextent="5",
						 	greatextent="6",
							verygreatextent="7"
							)
		values
}

# ReadResponseFile
#	This function takes in the filename as argument and returns an dataframe
#	The data frame contains the following characterstics..
#		- Correct Coloum names
#		- Correct Coloum types
#		- Correct Coloum values (formatted...)
#		- Removes wrong data i.e, data with time take to fill is 0
#	In short returns corrected data...
ReadResponseFile <- function(fileName) {

		# Read the xlsx file.
		#rawData <- read.csv2(fileName, 
		#					  sep=",",

		rawData <- read.xlsx2(fileName, 
							  sheetName=sheetNameValue,
							  header=TRUE,
							  startRow = 1, # Second row has more descriptions.
							  stringsAsFactors = FALSE
							  )
		# Remove the 2nd row as it has more description..
		rawData<- rawData[2:nrow(rawData),]

		# Read variable name file
		if(is.null(variableName)) {
				variableName <<- ReadVariableName()
		}

		# Set variable names as required..
		names(rawData)<- variableName$codedName

		rawData <- rawData[rawData$timeTaken != "0",]
}

DataIntClass <- function(rawData) {
	for (i in 1:ncol(rawData)) {
 		if(class(rawData[,i]) == "factor") {
 				rawData[,i] <- as.integer(rawData[,i])
 		}
 	}
	rawData
}

GetIndex <- function(colValues, strValues) {
	colIndex <- NULL
	for(i in strValues) {
		colIndex <- c(colIndex, grep(i, colValues))
	}
	colIndex
}

# Assumes the data is in integer format
HandleReverseCoding <- function(rawData) {

		# Read variable name file
		if(is.null(variableName)) {
				variableName <<- ReadVariableName()
		}

		variablesTobeReversed <- variableName$codedName[
											variableName$reverseCoded == TRUE]

		colIndex <- GetIndex(names(rawData),
							 variablesTobeReversed
							 )
		for(i in colIndex) {
				rawData[,i] <- 8 - rawData[,i]
		}
		rawData
}

CleanDataClass <- function(rawData) {

		# Set the right classes for the variables...
		rawData$responseID <- as.integer(rawData$responseID)

		rawData$startTime <- as.POSIXct(as.numeric(responseDataSet$startTime)*
										(60*60*24), 
										origin="1899-12-30", 
										tz="GMT"
										)
		rawData$duplicate <- as.logical(rawData$duplicate)
		rawData$timeTaken <- as.integer(rawData$timeTaken)
		rawData$seqNumber <- as.integer(rawData$seqNumber)
		rawData$countryCode <- factor(rawData$countryCode)
		rawData$region <- factor(rawData$region)

		# Social Interactions..
		rawData$SICount <- as.integer(rawData$SICount)

		rawData$SICloseness1 <- SetCloseness(rawData$SICloseness1)

		# Integer
		rawData$SIRelationManager1 <- as.integer(rawData$SIRelationManager1)
		rawData$SIRelationColleague1 <- as.integer(rawData$SIRelationColleague1)
		rawData$SIRelationSubordinate1 <- as.integer(rawData$SIRelationSubordinate1)
		rawData$SIRelationFamily1 <- as.integer(rawData$SIRelationFamily1)
		rawData$SIRelationMentor1 <- as.integer(rawData$SIRelationMentor1)
		rawData$SIRelationNeighbor1 <- as.integer(rawData$SIRelationNeighbor1)

		rawData$SIFrequency1 <- SetInteractionFrequency(rawData$SIFrequency1)
		# Integer
		rawData$SITopicPolitics1 <- as.integer(rawData$SITopicPolitics1)
		rawData$SITopicLocalEvents1 <- as.integer(rawData$SITopicLocalEvents1)
		rawData$SITopicWork1 <- as.integer(rawData$SITopicWork1)
		rawData$SITopicFriends1 <- as.integer(rawData$SITopicFriends1)
		rawData$SITopicLeisure1 <- as.integer(rawData$SITopicLeisure1)
		rawData$SITopicFamily1 <- as.integer(rawData$SITopicFamily1)

		rawData$SIExchangeDepth1 <- SetExchangeDepth(rawData$SIExchangeDepth1)
		rawData$SIUniqueness1 <- SetInteractionUniqueness(rawData$SIUniqueness1)
		rawData$SICommunityOverlap1 <- SetCommunity(rawData$SICommunityOverlap1)

		# Integer
		rawData$SIDurationMonth1 <- as.integer(rawData$SIDurationMonth1)
		rawData$SITimeMinutes1 <- as.integer(rawData$SITimeMinutes1)

		rawData$SICloseness2 <- SetCloseness(rawData$SICloseness2)

		# Integer
		rawData$SIRelationManager2 <- as.integer(rawData$SIRelationManager2)
		rawData$SIRelationColleague2 <- as.integer(rawData$SIRelationColleague2)
		rawData$SIRelationSubordinate2 <- as.integer(rawData$SIRelationSubordinate2)
		rawData$SIRelationFamily2 <- as.integer(rawData$SIRelationFamily2)
		rawData$SIRelationMentor2 <- as.integer(rawData$SIRelationMentor2)
		rawData$SIRelationNeighbor2 <- as.integer(rawData$SIRelationNeighbor2)

		rawData$SIFrequency2 <- SetInteractionFrequency(rawData$SIFrequency2)
		# Integer
		rawData$SITopicPolitics2 <- as.integer(rawData$SITopicPolitics2)
		rawData$SITopicLocalEvents2 <- as.integer(rawData$SITopicLocalEvents2)
		rawData$SITopicWork2 <- as.integer(rawData$SITopicWork2)
		rawData$SITopicFriends2 <- as.integer(rawData$SITopicFriends2)
		rawData$SITopicLeisure2 <- as.integer(rawData$SITopicLeisure2)
		rawData$SITopicFamily2 <- as.integer(rawData$SITopicFamily2)

		rawData$SIExchangeDepth2 <- SetExchangeDepth(rawData$SIExchangeDepth2)
		rawData$SIUniqueness2 <- SetInteractionUniqueness(rawData$SIUniqueness2)
		rawData$SICommunityOverlap2 <- SetCommunity(rawData$SICommunityOverlap2)

		# Integer
		rawData$SIDurationMonth2 <- as.integer(rawData$SIDurationMonth2)
		rawData$SITimeMinutes2 <- as.integer(rawData$SITimeMinutes2)

		rawData$SICloseness3 <- SetCloseness(rawData$SICloseness3)
		# Integer
		rawData$SIRelationManager3 <- as.integer(rawData$SIRelationManager3)
		rawData$SIRelationColleague3 <- as.integer(rawData$SIRelationColleague3)
		rawData$SIRelationSubordinate3 <- as.integer(rawData$SIRelationSubordinate3)
		rawData$SIRelationFamily3 <- as.integer(rawData$SIRelationFamily3)
		rawData$SIRelationMentor3 <- as.integer(rawData$SIRelationMentor3)
		rawData$SIRelationNeighbor3 <- as.integer(rawData$SIRelationNeighbor3)

		rawData$SIFrequency3 <- SetInteractionFrequency(rawData$SIFrequency3)
		# Integer
		rawData$SITopicPolitics3 <- as.integer(rawData$SITopicPolitics3)
		rawData$SITopicLocalEvents3 <- as.integer(rawData$SITopicLocalEvents3)
		rawData$SITopicWork3 <- as.integer(rawData$SITopicWork3)
		rawData$SITopicFriends3 <- as.integer(rawData$SITopicFriends3)
		rawData$SITopicLeisure3 <- as.integer(rawData$SITopicLeisure3)
		rawData$SITopicFamily3 <- as.integer(rawData$SITopicFamily3)

		rawData$SIExchangeDepth3 <- SetExchangeDepth(rawData$SIExchangeDepth3)
		rawData$SIUniqueness3 <- SetInteractionUniqueness(rawData$SIUniqueness3)
		rawData$SICommunityOverlap3 <- SetCommunity(rawData$SICommunityOverlap3)

		# Integer
		rawData$SIDurationMonth3 <- as.integer(rawData$SIDurationMonth3)
		rawData$SITimeMinutes3 <- as.integer(rawData$SITimeMinutes3)

		# From Climate Trust(80) to InnovationCompetitor(136)

		for(i in 80:136) {
				rawData[,i] <- Set7likertScale(rawData[,i])
		}

		rawData[,137] <- SetRevenueScale(rawData[,137])
		rawData[,138] <- SetRevenueScale(rawData[,138])

		# From MotivationInstrinc1 (139) to Motivation Extn (157)
		for(i in 139:157) {
				rawData[,i] <- SetMotivationScale(rawData[,i])
		}

		rawData$IndustryCategory <- factor(rawData$IndustryCategory)
		levels(rawData$IndustryCategory) <- list(ITHardware="1",
											  ITSoftware="2",
											  ITES="3",
											  Manufacturing="4",
											  Generalservices="5",
											  SoftwareNonIT="6",
											  BPO="7"
											  )

		rawData$IndustryOther < factor(rawData$IndustryOther)

		rawData$BusinessADM <- as.integer(rawData$BusinessADM)
		rawData$BusinessASS <- as.integer(rawData$BusinessASS)
		rawData$BusinessEES <- as.integer(rawData$BusinessEES)
		rawData$BusinessICM <- as.integer(rawData$BusinessICM)
		rawData$BusinessITC <- as.integer(rawData$BusinessITC)
		rawData$BusinessECM <- as.integer(rawData$BusinessECM)
		rawData$BusinessMA <- as.integer(rawData$BusinessMA)
		rawData$BusinessPE <- as.integer(rawData$BusinessPE)
		rawData$BusinessTES <- as.integer(rawData$BusinessTES)

		rawData$BusinessOther < factor(rawData$BusinessOther)

		rawData$NumEmployee <- factor(rawData$NumEmployee)
		levels(rawData$NumEmployee) <- list(LessThan150="1",
										 l151to300="2",
										 l301to500="3",
										 l501to1000="4",
										 l1001to5000="5",
										 l5001to10000="6",
										 l10001to50000="7",
										 Greater50000="8"
										 )

		rawData$RevenueComp <- factor(rawData$RevenueComp)
		levels(rawData$RevenueComp) <- list(Threetimesormore="1",
										 Twiceaslarge="2",
										 Equal="3",
										 Halfaslarge="4",
										 Lessthanhalf="5"
										 )

		rawData$Revenue <- factor(rawData$Revenue)
		levels(rawData$Revenue) <- list(LessThan1Crs="1",
									  l1to5Crs="2",
									  l6to10Crs="3",
									  l11to20Crs="4",
									  l21to50Crs="5",
									  l51to100Crs="6",
									  GreaterThan100Crs="7"
									 )

		rawData$Role <- factor(rawData$Role)
		levels(rawData$Role) <- list(CEOorDirector="1",
								  SeniorManager="2",
								  MiddleManager="3",
								  JuniorManager="4",
								  Nonmanagement="5"
								  )

		rawData$RoleOther <- factor(rawData$RoleOther)

		rawData$Responsibility <- factor(rawData$Responsibility)
		levels(rawData$Responsibility) <- list(RnD="1",
											Administrative="2",
											ProjectManagement="3",
											Marketing="4",
											Consulting="5",
											BDM="6",
											Finance="7",
											SoftwareDevelopment="8",
											Engineering="9",
											WebDevelopment="10",
											ITSupport="11"
											)

		rawData$ResponsibilityOther <- factor(rawData$ResponsibilityOther)

		rawData$CompanyDuration <- as.integer(rawData$CompanyDuration)
		rawData$TotalExperience <- as.integer(rawData$TotalExperience)
		rawData$NumCompanies <- as.integer(rawData$NumCompanies)
		rawData$PostalCode <- as.integer(rawData$PostalCode)

		rawData$Education <- factor(rawData$Education)
		levels(rawData$Education) <- list(LessthanGraduate="1",
									   Graduate="2",
									   PostGraduate="3",
									   Doctorate="4"
									   )

		rawData$Gender <- factor(rawData$Gender)
		levels(rawData$Gender) <- list(Female="1", Male="2")

		rawData$NumCommunities <- SetCommunity(rawData$NumCommunities)

		rawData$CommunityMember <- as.integer(rawData$CommunityMember)
		rawData$CommunityBoard <- as.integer(rawData$CommunityBoard)
		rawData$CommunityCoordinator <- as.integer(rawData$CommunityCoordinator)
		rawData$CommunityMentor <- as.integer(rawData$CommunityMentor)
		rawData$CommunityPresenter <- as.integer(rawData$CommunityPresenter)
		rawData$CommunityParticipant <- as.integer(rawData$CommunityParticipant)

		# Remove unwanted variables
		newData <- rawData[,18:190]
		newData$responseID <- rawData$responseID
		newData$timeTaken <- rawData$timeTaken
		newData$countryCode <- rawData$countryCode
		newData$region <- rawData$region

		newData
}

MyMelt <- function(rawData, measureVar, variableName, valueName, inInt) {

		# Melt Multiple Selections..
		# SIRelation
		# Generate the id variables...
		colIndex <- GetIndex(names(rawData), measureVar)
		idVar <- names(rawData)[-colIndex]

		newData <- melt(rawData, 
						id.vars=idVar,
						measure.vars=measureVar,
						variable.name=variableName,
						value.name=valueName,
						na.rm=T
						)
		# Get index of the new variable
		colIndex <- grep(variableName, names(newData))
		# Remove the rows with value as NA
		newData <- newData[!is.na(newData[,colIndex]),]
		if(inInt) {
			newData[, colIndex] <- as.integer(newData[,colIndex])
		}

		newData

}

MyMeltId <- function(rawData, idVar, measureVar, variableName, valueName, inInt) {

		# Melt Multiple Selections..
		# SIRelation
		newData <- melt(rawData, 
						id.vars=idVar,
						measure.vars=measureVar,
						variable.name=variableName,
						value.name=valueName,
						na.rm=T
						)
		# Get index of the new variable
		colIndex <- grep(variableName, names(newData))
		# Remove the rows with value as NA
		newData <- newData[!is.na(newData[,colIndex]),]
		if(inInt) {
			newData[, colIndex] <- as.integer(newData[,colIndex])
		}

		newData

}

MeltVariables <- function(rawData, inInt) {

		# Melt the tables.
		# Melt Individual Interactions (1, 2,3)

		# Melt Multiple Selections..
		# SIRelation
		newData <- MyMelt(rawData, 
						  SIRelation1,
						  "SIRelation1", 
						  "SIRvalue1", 
						  inInt # Rows to integer..
						  )

		newData <- MyMelt(newData, 
						  SITopic1,
						  "SITopic1", 
						  "SITvalue1", 
						  inInt # Rows to integer..
						  )

		newData <- MyMelt(newData, 
						SIRelation2,
						"SIRelation2", 
						"SIRvalue2", 
						inInt # Rows to integer..
						)

		newData <- MyMelt(newData, 
						  SITopic2,
						  "SITopic2", 
						  "SITvalue2", 
						  inInt # Rows to integer..
						  )

		newData <- MyMelt(newData, 
						SIRelation3,
						"SIRelation3", 
						"value3", 
						inInt
						)

		newData <- MyMelt(newData, 
						  SITopic3,
						  "SITopic3", 
						  "SITvalue3", 
						  inInt # Rows to integer..
						  )

		newData

}

# _____________________ Functional definition complete _______________

# ----------------- Start of main program ----------------------

# Read the response directory...
# It is assumed that all the required files are downloaded from QuestionPro and stored in "datafiles" folder. (Because no URL is avaiable for download)
fileList <- list.files(dataDirectory)

# Read the response data and create a single dataframe...
## Initialize the dataset to NULL; as we append to this dataset...
responseDataSet <- NULL
for(i in fileList) {

	# Read the data from files downloaded from questionpro.
	print(i)
	responseData <- ReadResponseFile(paste0(dataDirectory,"/",i))
	
	# Append the data into the dataset frame...
	responseDataSet <- rbind(responseDataSet, responseData)
}

workingData <- CleanDataClass(responseDataSet)

meltData <- MeltVariables(workingData, T)
meltData <- DataIntClass(meltData)
meltData <- HandleReverseCoding(meltData)

# Now we have all the data in dataset

# Check for normality...

# Check for data validity..
# Cronback's alpha > 0.7
#alpha(temp[,Motivation], check.keys=T)
#alpha(temp[,Climate], check.keys=T)
#alpha(temp[,Innovation], check.keys=T)
#alpha(temp[,Learning], check.keys=T)
#alpha(temp[,SIList1], check.keys=T)
#alpha(temp[,SIList2], check.keys=T)
#alpha(temp[,SIList3], check.keys=T)

# MTMM based validity...
#mtmm(temp, list(Climate, Innovation, Learning, Motivation, SIList1))


#tmp <- GetIndex (c(Climate, Motivation, Learning, SIList, Innovation), names(temp))

#temp <- na.omit(temp[,c(Climate, Motivation, Learning, SIList, Innovation)])


# Working....


#temp <- DataIntClass(meltData)
#temp <- na.omit(temp[,c(Climate, Motivation, Learning, SIList, Innovation)])
# Then run PLM commands...
