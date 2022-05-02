#Loading in required libraries 
#Citation: Code based of reference from SingleRBook
library(TENxPBMCData)
library(celldex)
library(SingleR)


pbmc <- TENxPBMCData("pbmc8k")


hpca <- HumanPrimaryCellAtlasData(ensembl=TRUE)
bpe <- BlueprintEncodeData(ensembl=TRUE)

hpca2 <- hpca
hpca2$label.main <- paste0("HPCA.", hpca2$label.main)

bpe2 <- bpe
bpe2$label.main <- paste0("BPE.", bpe2$label.main)

shared <- intersect(rownames(hpca2), rownames(bpe2))
combined <- cbind(hpca2[shared,], bpe2[shared,])


com.res1 <- SingleR(pbmc, ref=combined, labels=combined$label.main, assay.type.test=1)
table(com.res1$labels)