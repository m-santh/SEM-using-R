
# Set the working directory...
setwd("E:/Digital-Dis/innovation-outsource/network/ranjay gulati/community of practice/synopsis/Analysis-R")

source("ReadData.R")

library(reshape2)
library(stringr)

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

DataFactor2IntClass <- function(rawData) {
	for (i in 1:ncol(rawData)) {
 		if(class(rawData[,i]) == "factor") {
 				rawData[,i] <- as.integer(rawData[,i])
 		}
 	}
	rawData
}

matchCharacter <- function(item, match, multipler) {
		retValue <- item
		multipler <- as.integer(multipler)
		if(!is.na(str_match(item, match)[[1]] )) {
				value <- str_extract(item, "[0-9]+")
				retValue <-  as.character(as.integer(value)* multipler)
		}
		retValue
}

# This function removes unwanted characters from the variables.
# If it has some standard terms like years, months, hours etc. This function
# Handles the same.
RemoveCharcter <- function(rawData, timeMatch) {
		
	timePattern <- rbind(c("[Mm]in*", "[Hh]our*", "[Hh]r*"),
						 c(1, 60, 60)
						 )
	durationPattern <- rbind(c("[Mm]onth*", "[Mm]nt*", "[Yy]ear*", "[Yy]r*"),
							 c(1, 1, 12, 12)
							 )

	matchPattern <- NULL
	if(timeMatch) {
			matchPattern <- timePattern
	} else {
			matchPattern <- durationPattern
	}

	for(i in 1:dim(matchPattern)[2]) {
		rawData <- unlist(
						lapply(rawData,
							FUN=matchCharacter, 
							match=matchPattern[1,i],
							multipler=matchPattern[2,i]
							)
						)
	}

	rawData <- as.integer(str_extract(rawData, "[0-9]+"))

	rawData
}

#SetSocialRelationClasses
SetSocialRelationClasses <- function(rawData)
{
		# Social Interactions..
		# Since this is editable field, need to handle string character..
		rawData$SICount <- str_extract(rawData$SICount, "[0-9]+")
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

		# Integer from editable values.
		rawData$SIDurationMonth1 <- RemoveCharcter(rawData$SIDurationMonth1, F)
		rawData$SITimeMinutes1 <- RemoveCharcter(rawData$SITimeMinutes1, T)

		#Return
		rawData
}

# Gets colum indexs for the specified strings.
GetColIndex <- function(colValues, strValues) {
	colIndex <- NULL
	for(i in strValues) {
		colIndex <- c(colIndex, grep(i, colValues))
	}
	colIndex
}

# RemoveNullRelation
RemoveNullRelation <- function(rawData) {
	# Convert the block to appropriate class
	rawData <- SetSocialRelationClasses(rawData)

	# Identify the rows to be retained...
  tmpData <- DataFactor2IntClass(rawData)
	rowIndex  <- apply(tmpData[, SIList1], 1, sum, na.rm=T)

  names(rowIndex) <- NULL
	rawData[rowIndex > 0,]

}

# Merge SocialNetwork1 SocialNetwork2 and SocialNetwork3
# In the process, remove any records that does not have values.
MergeSocialRelation <- function(rawData) {

	relation1 <- rawData
	relation1 <- RemoveNullRelation(relation1)

	# Copy SIList2 to SIList1 values
	relation2 <- rawData
	relation2[,SIList1] <- rawData[, SIList2]
	relation2 <- RemoveNullRelation(relation2)

	# Copy SIList3 to SIList1 values
	relation3 <- rawData
	relation3[,SIList1] <- rawData[, SIList3]
	relation3 <- RemoveNullRelation(relation3)

	rawData <- rbind(relation1, relation2, relation3)

	# Remove variables SList2 and SList3
	varNames <- names(rawData)
	colIndex  <- GetColIndex(varNames, c(SIList2, SIList3))
	rawData <- rawData[,varNames[-colIndex]]

	# Now that we have merged and removed variables.. change the list.
	SIList <<- c(SIList1, "SICount")

	# Return
	rawData
}

RemoveNA <- function(rawData, variableNames) {
		colIndex <- GetColIndex(names(rawData), variableNames)
		rowIndex <- rep(TRUE, nrow(rawData))

		for (i in colIndex) {
				rowIndex <- rowIndex & (!is.na(rawData[,i]))
		}

		rawData <- rawData[rowIndex,]
		rawData
}

# Assumes the data is in integer format
HandleReverseCoding <- function(rawData) {

		# Read variable name file
		if(is.null(variablesData)) {
				variablesData <<- ReadVariableName()
		}

		variablesTobeReversed <- variablesData$codedName[
											variablesData$reverseCoding == "T"]

		colIndex <- GetColIndex(names(rawData),
							 variablesTobeReversed
							 )
		for(i in colIndex) {
				rawData[,i] <- 8 - as.integer(rawData[,i])
		}
		rawData
}

HandleOutliers <- function(rawData, omitValues) {

		# Time minutes cannot be > 3 hours..
		# Duration know cannot be greater than 30 years
		rawData$SITimeMinutes1[ rawData$SITimeMinutes1 > 180 ] <- NA
		rawData$SIDurationMonth1[ rawData$SIDurationMonth1 > 360 ] <- NA

		rawData
}

CleanDataClass <- function(rawData) {

		# Set the right classes for the variables...
		rawData$responseID <- as.integer(rawData$responseID)

		rawData$startTime <- as.POSIXct(as.numeric(rawData$startTime)*
										(60*60*24), 
										origin="1899-12-30", 
										tz="GMT"
										)
		rawData$duplicate <- as.logical(rawData$duplicate)
		rawData$timeTaken <- as.integer(rawData$timeTaken)
		rawData$seqNumber <- as.integer(rawData$seqNumber)
		rawData$countryCode <- factor(rawData$countryCode)
		rawData$region <- factor(rawData$region)

		# Social Interactions already set.
		rawData <- SetSocialRelationClasses(rawData)

		# From Climate Trust(80) to InnovationCompetitor(136)
		varNames <- names(rawData)
		colIndexClimate <- grep("ClimateTrust1", varNames)
		colIndexInnov <- grep("InnovCompetitor2", varNames)

		for(i in colIndexClimate:colIndexInnov) {
				rawData[,i] <- Set7likertScale(rawData[,i])
		}

		rawData$InnovRadical1 <- SetRevenueScale(rawData$InnovRadical1)
		rawData$InnovRadical2 <- SetRevenueScale(rawData$InnovRadical2)

		# From MotivationInstrinc1 (139) to Motivation Extn (157)
		colIndexMotivationIntrin <- grep("MotivationIntrinsic1", varNames)
		colIndexMotivationExt <- grep("MotivationExternal1", varNames)
		for(i in colIndexMotivationIntrin:colIndexMotivationExt) {
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

		rawData$CompanyDuration <- RemoveCharcter(rawData$CompanyDuration, F)
		rawData$TotalExperience <- RemoveCharcter(rawData$TotalExperience, F)
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
		varNames <- names(rawData)
		colIndex  <- GetColIndex(varNames, VariableNonTidy)
		newData <- rawData[,varNames[-colIndex]]

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
		varNames <- names(rawData)
		colIndex <- GetColIndex(varNames, measureVar)
		idVar <- varNames[-colIndex]

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

		# Create Embeddedness and Multiplexity variables.
		# Identify the rows to be retained...
		rawData$Multiplexity  <- apply(rawData[, SIRelation1], 1, sum, na.rm=T)
		rawData$Embeddedness  <- apply(rawData[, SITopic1], 1, sum, na.rm=T)

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

		# Reset the SIList correctly...
		colIndex <- GetColIndex(SIList1, c(SIRelation1, SITopic1))

		SIRelation1 <- c("Embeddedness", 
						 "Multiplexity", 
						 "SIRelation1",
						 "SITopic1"
						 )
		# Now that we have merged and removed variables.. change the list.
		SIList <<- c(SIList1[-colIndex], 
					 SIRelation1
					 )

		newData
}

CleanMyData <- function(rawData) {
		# Melt Relation2 and Relation3
		rawData <- MergeSocialRelation(rawData)

		# Convert data to appropriate class
		rawData <- CleanDataClass(rawData)

		rawData <- DataFactor2IntClass(rawData)
		rawData <- HandleReverseCoding(rawData)

		rawData <- MeltVariables(rawData, T)

		# Handle for outliers..
		rawData <- HandleOutliers(rawData, T)

		rawData <- RemoveNA(rawData, 
							c(Climate, 
								SIList,
								Learning,
								Innovation,
								Motivation
								)
							)

		#return
		rawData
}
