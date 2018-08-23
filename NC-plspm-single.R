#Single dimension model

DefineInnerModel <- function() {
	SocialClimate 	     <- c(0, 0, 0, 0, 0)
	IndividualMotivation <- c(1, 0, 0, 0, 0)
	SocialNetwork	       <- c(1, 1, 0, 0, 0)
	LearningCapability   <- c(1, 1, 1, 0, 0)
	InnovationAbility    <- c(1, 1, 1, 1, 0)

	innovation_path <- rbind(SocialClimate,
	                         IndividualMotivation,
	                         SocialNetwork,
				 LearningCapability,
				 InnovationAbility
				 )

	colnames(innovation_path) <- rownames(innovation_path)

	innerplot(innovation_path)
}

GetIndex <- function(colValues, strValues) {
	colIndex <- NULL
	for(i in strValues) {
		colIndex <- c(colIndex, which(colValues == i))
	}
	colIndex
}

DefineOuterMode <- function(correctData) {

	colValues <- names(correctData)
	colValues <- names(test)
	
	Innovation[c(1,4, 6:8,12, 13, 17)]
	Learning[c(1,3:4,9:12)]
	Learning[c(9:10,12)]
	Learning[c(1,3:4)]
	Climate[c(1, 8, 12,18)]
	Motivation[c(1,4:7,12,19)]
	

	testList <- c("SICloseness1" , "SIFrequency1" , "SIExchangeDepth1" , "SIUniqueness1" ,       "SICommunityOverlap1", "Topic"    ,           "SIKnown"  ,           "SITimeSpent" )
	# Before commonality...
	innovation_blocks <- list(GetIndex(colValues, Climate[c(1, 8, 12,18)]), 
	                          GetIndex(colValues, Motivation[c(1,4, 5, 6, 12, 19)]), 
	                          GetIndex(colValues, testList[c(2, 3,5:8)]), 
				  GetIndex(colValues, Learning[c(1,3,9, 10, 12)]), 
				  GetIndex(colValues, Innovation[c(1,4, 6:8)])
				  )

	innovation_blocks <- list(GetIndex(colValues, Climate[c(1, 8, 12,18)]), 
	                          GetIndex(colValues, Motivation[c(1,4:7)]), 
	                          GetIndex(colValues, testList[c(2,3,5,6)]), 
	                          GetIndex(colValues, Learning[c(1,3:4,9:12)]), 
	                          GetIndex(colValues, Innovation[c(1,4, 6:8,12, 13)])
	)
	
	# After commonality...
	innovation_blocks <- list(GetIndex(colValues, Climate[c(8, 18)]), 
	                          GetIndex(colValues, Motivation[c(1,4:6)]), 
	                          GetIndex(colValues, testList[2]), 
	                          GetIndex(colValues, Learning[c(1,9:12)]), 
	                          GetIndex(colValues, Innovation[c(1,4, 7:8,12, 13)])
	)
	
	# A means reflective mode of latent varaible, B means formative mode
	innovation_mode <- c("A",
			     "A",
			     "B",
			     "A",
			     "B"
			     )
}

mypls <- function() {
	innov_pls <- plspm(test, innovation_path, innovation_blocks, modes=innovation_mode, boot.val = TRUE, br = 200)
	plot(innov_pls)
	plot(innov_pls, what="loadings")
	summary(innov_pls)
}
