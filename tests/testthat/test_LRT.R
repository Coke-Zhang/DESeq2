context("LRT")
test_that("test='LRT' gives correct errors", {
  dds <- makeExampleDESeqDataSet(n=100, m=4)
  dds$group <- factor(c(1,2,1,2))
  design(dds) <- ~ condition
  expect_error(DESeq(dds, test="LRT", reduced=~group))
  expect_error(DESeq(dds, test="LRT", reduced=~1, modelMatrixType="expanded"))
  expect_error(DESeq(dds,test="LRT",reduced=~group, betaPrior=TRUE))
  dds <- estimateSizeFactors(dds)
  dds <- estimateDispersions(dds)
  expect_error(nbinomLRT(dds))
})
