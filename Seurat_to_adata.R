table(retina$celltype)
# save metadata table:
retina$barcode <- colnames(retina)
retina$UMAP_1 <- retina@reductions$umap@cell.embeddings[,1]
retina$UMAP_2 <- retina@reductions$umap@cell.embeddings[,2]
write.csv(retina@meta.data, file='/home/liuyijun/in_R/retina/metadata.csv', quote=F, row.names=F)

# write expression counts matrix
library(Matrix)
counts_matrix <- GetAssayData(retina, assay='RNA', slot='counts')
writeMM(counts_matrix, file='/home/liuyijun/in_R/retina/counts.mtx')

# write dimesnionality reduction matrix, in this example case pca matrix
write.csv(retina@reductions$pca@cell.embeddings, file='/home/liuyijun/in_R/retina/pca.csv', quote=F, row.names=F)

# write gene names
write.table(
  data.frame('gene'=rownames(counts_matrix)),file='/home/liuyijun/in_R/retina/gene_names.csv',
  quote=F,row.names=F,col.names=F
)
