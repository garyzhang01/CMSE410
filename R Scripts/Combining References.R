library(TENxPBMCData)
library(celldex)
library(SingleR)

pbmc <- TENxPBMCData("pbmc8k")


hpca <- HumanPrimaryCellAtlasData(ensembl=TRUE)
bpe <- BlueprintEncodeData(ensembl=TRUE)


com.res2 <- SingleR(test = pbmc, assay.type.test=1,
                    ref = list(BPE=bpe, HPCA=hpca), 
                    labels = list(bpe$label.main, hpca$label.main))

# Check the final label from the combined assignment.
table(com.res2$labels) 

head(com.res2$orig.results$BPE$labels)
head(com.res2$orig.results$HPCA$labels)

plotScoreHeatmap(com.res2)

plotDeltaDistribution(com.res2)
