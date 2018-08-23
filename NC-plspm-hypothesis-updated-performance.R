#Poor mans model

DefineInnerModel <- function() {
  firmSize 	           <- c(0, 0, 0,  0, 0, 0, 0, 0, 0)
  SocialClimate 	     <- c(1, 0, 0,  0, 0, 0, 0, 0, 0)
	ExtMotivation        <- c(1, 1, 0,  0, 0, 0, 0, 0, 0)
	IntrMotivation       <- c(1, 1, 1,  0, 0, 0, 0, 0, 0)
	SocialNetwork	       <- c(1, 1, 1,  1, 0, 0, 0, 0, 0)
	LearningCapability   <- c(1, 1, 1,  1, 1, 0, 0, 0, 0)
	ProcessInnov         <- c(1, 1, 1,  1, 1, 1, 0, 0, 0)
	ProductInnov         <- c(1, 1, 1,  1, 1, 1, 1, 0, 0)
	CompPerf             <- c(1, 1, 1,  1, 1, 1, 1, 1, 0)
	
	
	
	innovation_path <- rbind(
	                       firmSize,
	                       SocialClimate,
	                       ExtMotivation,
	                       IntrMotivation,
	                       SocialNetwork,
	                       LearningCapability,
	                       ProcessInnov,
	                       ProductInnov,
	                       CompPerf
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
	# Before commonality...
	innovation_blocks <- list(
          GetIndex(colValues, firmSizeList[c(1,3)]), 
	        GetIndex(colValues, Climate[c(1, 8, 12, 18)]), 
				  GetIndex(colValues, Motivation[c(12,19)]), 
				  GetIndex(colValues, Motivation[c(1,4,5,6)]), 
				  GetIndex(colValues, testList[c(2,5)]), 
#          GetIndex(colValues, testList[c(2,7)]), 
          GetIndex(colValues, Learning[c(1,3,9:10,12)]), 
          GetIndex(colValues, Innovation[c(6:8)]),
          GetIndex(colValues, Innovation[c(1,4)]),
          GetIndex(colValues, c("Revenue"))
#GetIndex(colValues, Innovation[c(17)]), # Incremental innovation
#GetIndex(colValues, Innovation[c(16)])  # Radical innovation
	)


		# A means reflective mode of latent varaible, B means formative mode
	innovation_mode <- c(
	         "B",
	         "A",
			     "A",
	#		     "A",
			     "A",
			     "B",
			     "A",
			     "B",
			     "B",
	          "B"
			     )
}

#OUtlier
temp <- (test$SIExchangeDepth1 == 1) | (test$SICount >= 20)

mypls <- function() {
	innov_pls <- plspm(test, innovation_path, innovation_blocks, modes=innovation_mode, boot.val = TRUE, br = 500)
	Paths = innov_pls$path_coefs
	arrow_lwd = 10 * round(Paths, 2)
	plot(innov_pls, arr.pos = 0.35, arr.lwd = arrow_lwd)
	plot(innov_pls, what="loadings")
	innov_pls$gof
	innov_pls$unidim
	innov_pls$outer_model
	innov_pls$crossloadings
	innov_pls$inner_model
	innov_pls$effects
	innov_pls$inner_summary
	innov_pls$path_coefs
	summary(innov_pls)
}


# load plsdepot
library(plsdepot)
# PCA of Innovation network indicators with nipals
si_pca <- nipals(test[!temp, testList])
# plot
plot(si_pca, main = "Innovation network indicators (circle of correlations)",
     cex.main = 1)


mot_pca <- nipals(test[!temp, Motivation[c(1,4:7,12,19)]])
# plot
plot(mot_pca, main = "Motivation indicators (circle of correlations)",
     cex.main = 1)


cli_pca <- nipals(test[!temp, Climate[c(1, 8, 12,18)]])
# plot
plot(cli_pca, main = "Social climate indicators (circle of correlations)",
     cex.main = 1)

learn_pca <- nipals(test[!temp, Learning[c(1,3:4,9:12)]])
# plot
plot(learn_pca, main = "Learning capability indicators (circle of correlations)",
     cex.main = 1)

inno_pca <- nipals(test[!temp, Innovation[c(1,4, 6:8,12, 13, 17)]])
# plot
plot(inno_pca, main = "Innovativeness indicators (circle of correlations)",
     cex.main = 1)



# selecting effects ('active' rows)
good_rows = c(3:5, 7:15)
# 'active' effects in matrix format
path_effs = as.matrix(innov_pls$effects[good_rows, 2:3])

# setting margin size
op = par(mar = c(8, 3, 1, 0.5))
# barplots of total effects (direct + indirect)
barplot(t(path_effs), border = NA, col = c("#9E9AC8", "#DADAEB"),
        las = 2, cex.names = 0.8, cex.axis = 0.8,
        legend = c("Direct", "Indirect"),
        args.legend = list(x = "top", ncol = 2, border = NA,
                           bty = "n", title = "Effects"))
# resetting default margins
par(op)


# Scores

# rescaling scores
Scores = rescale(innov_pls$scores)
# summary
# setting graphic layout and margin sizes
op = par(mfrow = c(2,3), mar = c(4, 5, 2, 1.5), bty = "n")
# for each score
for (j in 1:6) {
# histogram (not showing axes)
hist(Scores[,j], main = colnames(Scores)[j], axes = FALSE,
     xlim = c(1,7), ylim = c(0, 125), xlab = "",
     border = "#6A51A3", col = "#DADAEB")
# add horizontal axis
axis(side = 1, col = "gray70", col.axis = "gray70")
# add vertical axis
axis(side = 2, col = "gray70", col.axis = "gray70", las = 2)
}
# resetting default graphical parameters
par(op)

# scatter plots of rescaled scores
pairs(Scores, pch = 19, cex = 0.7, col = "#807DBA33", cex.axis = 0.8,
      col.axis = "gray70", gap = 0.5)