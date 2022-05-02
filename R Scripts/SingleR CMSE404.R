#First part is to load the required libraries for SingelR analysis
library(SingleR)
library(celldex) #Contains reference data with proper annotations

#Loading of a popular test data set from 10x Genomics (Zheng et al 2017)
library(TENxPBMCData)
#Sanity check to make sure SingleR annotation is working 
new.data <- TENxPBMCDATA("pbmc4k")
ref.data <- HumanPrimaryCellAtlasData(ensembl=TRUE)
predictions <- SingleR(test=newli.data,assay.type.test=1,ref=ref.data,labels=ref.data$labels.main)

table(predictions$labels)


#Testing SingleR annotation capabilities by annotating cell types in HSC data with reference ImmGenData from cell dex
library(scRNAseq)
sce <- GrunHSCData(ensembl=TRUE)
sce

#Annotation of each cell with the ImmGen reference dataset
immgen <- ImmGenData(ensembl=TRUE)
head(immgen$label.fine) #Represents the highest resolution annotations available for the dataset

#Call on SingleR to annotate with Immgen dataset.
pred <- SingleR(test=sce,ref=immgen,labels=immgen$label.fine,assay.type.test=1)
colnames(pred)
head(sort(table(pred$labels), decreasing=TRUE))
#Removal of low quality batch of cells fixes the differentiated labels that were mixed in
actual.hsc <- pred$labels[sce$protocol=="sorted hematopoietic stem cells" & sce$sample!="JC4"]
head(sort(table(actual.hsc), decreasing=TRUE))


#Recreation of Figures
#1b> path.data = '~/Desktop/CMSE410project'
path.out = '~/Desktop/CMSE410project/out'
path.data = '~/Desktop/CMSE410project'



#Applying multiple different references using singleR and comparing the references
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



com.res2 <- SingleR(test = pbmc, assay.type.test=1,ref = list(BPE=bpe, HPCA=hpca), labels = list(bpe$label.main, hpca$label.main))

table(com.res2$labels) 

head(com.res2$orig.results$BPE$labels)
head(com.res2$orig.results$HPCA$labels)


