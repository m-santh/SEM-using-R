#Poor mans model

DefineInnerModel <- function() {
	SocialClimate 	     <- c(0, 0, 0, 0, 0,  0, 0)
	LearnEmbed 	         <- c(0, 0, 0, 0, 0,  0, 0)
	LearnEmpower 	       <- c(0, 0, 0, 0, 0,  0, 0)
	InnovProcess 	       <- c(0, 0, 0, 0, 0,  0, 0)
	IndividualMotivation <- c(1, 0, 0, 0, 0,  0, 0)
	LearningCapability   <- c(1, 1, 1, 0, 0,  0, 0)
	InnovationAbility    <- c(0, 0, 0, 1, 1,  1, 0)

	innovation_path <- rbind(SocialClimate,
	                       LearnEmbed,
	                       LearnEmpower,
	                       InnovProcess,
				 IndividualMotivation,
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
	# Before commonality...
	innovation_blocks <- list(GetIndex(colValues, Climate[c(1, 8, 12,18)]), 
				  GetIndex(colValues, Learning[c(1,3:4)]), 
				  GetIndex(colValues, Learning[c(9:10,12)]), 
				  GetIndex(colValues, Innovation[c(6:8,12)]), 
				  GetIndex(colValues, Motivation[c(1,4:7)]), 
				  GetIndex(colValues, Learning[c(1,3:4,9:10,12)]), 
				  GetIndex(colValues, Innovation[c(1,4, 6:8,12, 13, 17)])
				  )

	# Gve away approach
	innovation_blocks <- list(GetIndex(colValues, Climate[c(1, 8, 12,18)]), 
	                          GetIndex(colValues, Learning[c(1,4)]), 
	                          GetIndex(colValues, Learning[c(9,12)]), 
	                          GetIndex(colValues, Innovation[c(6,12)]), 
	                          GetIndex(colValues, Motivation[c(1,4:7)]), 
	                          GetIndex(colValues, testList[c(1:3,4,5:6)]), 
	                          GetIndex(colValues, Learning[c(3,10)]), 
	                          GetIndex(colValues, Innovation[c(1,4, 7:8, 13, 17)])
	)
	
	# After commonality...
	innovation_blocks <- list(GetIndex(colValues, Climate[c(8)]), 
	                          GetIndex(colValues, Learning[c(1,3,4)]), 
	                          GetIndex(colValues, Learning[c(9:10,12)]), 
	                          GetIndex(colValues, Innovation[c(6:8,12)]), 
	                          GetIndex(colValues, Motivation[c(1,4:7)]), 
	                          GetIndex(colValues, testList[c(2)]), 
	                          GetIndex(colValues, Learning[c(1,3,4,9:10,12)]), 
	                          GetIndex(colValues, Innovation[c(1,4, 6:8,12, 13)])
	)
	# A means reflective mode of latent varaible, B means formative mode
	innovation_mode <- c("A",
			     "A",
			     "A",
			     "A",
			     "A",
			     "A",
			     "A"
			     )
}

mypls <- function() {
	innov_pls <- plspm(test, innovation_path, innovation_blocks, modes=innovation_mode, boot.val = TRUE, br = 200)
	plot(innov_pls)
	plot(innov_pls, what="loadings")
	summary(innov_pls)
}
