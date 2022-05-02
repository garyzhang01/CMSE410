library(ggplot2)

#HPSC Before and after quality control (Sorted population)
HPSCbef <- data.frame(label=c("Stem Cells (SC.MEP)", "Neutrophils (GN.ARTH)", "Macrophages (MF)", 
                              "Stem Cells (SC.STSL", "B Cells (proB.FrA)", "Stem Cells (SC.LT34F"), count = c(362,306,166,143,121,103))
HPSCbef

HPSCbef_Plot <- ggplot(data=HPSCbef, aes(x=reorder(label,-count), y=count)) +
                         geom_bar(stat="identity") + geom_text(aes(label=count)) + scale_x_discrete(guide = guide_axis(n.dodge=3))
HPSCbef_Plot

#After

HPSCaf <- data.frame(label=c("Stem cells (SC.STSL)", "Stem cells (SC.LT34F)", "Stem cells (SC.ST34F)", 
                              "Stem cells (SC.CD150-CD48-)", "Stem cells (LTHSC)", "Stem cells (MLP)"), count = c(110,98,37,15,12,7))

HPSCaf_Plot <- ggplot(data=HPSCaf, aes(x=reorder(label,-count), y=count)) +
  geom_bar(stat="identity") + geom_text(aes(label=count)) + scale_x_discrete(guide = guide_axis(n.dodge=3))
HPSCaf_Plot

#Reference specific labels

rsl <- data.frame(label=c("BPE.B-cells","BPE.CD4+T-cells","BPE.CD8+T-cells","BPE.HSC","BPE.Monocytes","BPE.NK cells",
                          "HPCA.HSC_-G-CSF","HPCA.Platelets","HPCA.T_cells"), 
                  count=c(1179,1708,2656,20, 2348,460,1,7,2))
rsl_plot <- ggplot(data=rsl, aes(x=reorder(label,-count), y=count)) +
  geom_bar(stat="identity") + geom_text(aes(label=count)) + scale_x_discrete(guide = guide_axis(n.dodge=3))
rsl_plot

#Combined

combined <- data.frame(label=c("B-cells","B_cell","CD4+ T-cells","CD8+ T-cells","GMP","HSC","Monocyte","Monocytes","NK cells",
                                 +                                "NK_cell","Platelets","Pre-B_cell_CD34-","T-Cells"), 
                         +                        count=c(1170,14,1450,2936,1,22,753,1560,372,10,9,16,68))

combined_plot <- ggplot(data=combined, aes(x=reorder(label,-count), y=count)) + geom_bar(stat="identity") + geom_text(aes(label=count)) + scale_x_discrete(guide = guide_axis(n.dodge=3))
combined_plot  

rs