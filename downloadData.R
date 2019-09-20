# library(devtools)
# library(pbapply)
# library(data.table)
library(PharmacoGxPrivate)


# tmpdir=tempdir()
# path.data=file.path("/pfs/out")
# path.drug=file.path(path.data, "drug")
# path.cell=file.path(path.data, "celline")
# path.sens=file.path(path.data, "sens")
# saveres=file.path("/pfs/out/saveres")
# verbose=FALSE



tmpdir=tempdir()
path.data=file.path("/pfs/out")
path.drug=file.path(path.data, "drug")
path.cell=file.path(path.data, "celline")
path.sens=file.path(path.data, "sens")
saveres=file.path(path.data,"saveres")
verbose=FALSE

options(stringsAsFactors=FALSE)


if(!file.exists(path.data)) { dir.create(path.data, showWarnings=FALSE, recursive=TRUE) }
if(!file.exists(path.drug)) { dir.create(path.drug, showWarnings=FALSE, recursive=TRUE) }
if(!file.exists(path.cell)) { dir.create(path.cell, showWarnings=FALSE, recursive=TRUE) }
if(!file.exists(path.sens)) { dir.create(path.sens, showWarnings=FALSE, recursive=TRUE) }
if(!file.exists(file.path(path.data, "dwl"))) { dir.create(file.path(path.data, "dwl"), showWarnings=FALSE, recursive=TRUE) }
if(!file.exists(saveres)) { dir.create(saveres, showWarnings=FALSE, recursive=TRUE) }

myfn <- "CTRPv2.0_2015_ctd2_ExpandedDataset.zip"
if(!file.exists(file.path(path.data, "dwl", myfn))){
  dwlresult <- download.file(url="ftp://anonymous:guest@caftpd.nci.nih.gov/pub/OCG-DCC/CTD2/Broad/CTRPv2.0_2015_ctd2_ExpandedDataset/CTRPv2.0_2015_ctd2_ExpandedDataset.zip", destfile=file.path(path.data, "dwl", myfn), quiet=TRUE)

  res <- unzip(zipfile=file.path(path.data, "dwl", "CTRPv2.0_2015_ctd2_ExpandedDataset.zip"), exdir=file.path(path.data, "dwl"), overwrite=FALSE)

  file.copy(from=file.path(path.data, "dwl", "v20.meta.per_compound.txt"), to=file.path(path.drug, "v20.meta.per_compound.txt"))
  file.copy(from=file.path(path.data, "dwl", "v20.meta.per_cell_line.txt"), to=file.path(path.cell, "v20.meta.per_cell_line.txt"))
  file.copy(from=file.path(path.data, "dwl", "v20.meta.media_comp.txt"), to=file.path(path.cell, "v20.meta.media_comp.txt"))
  file.copy(from=file.path(path.data, "dwl", "v20.data.per_cpd_post_qc.txt"), to=file.path(path.sens, "v20.data.per_cpd_post_qc.txt"))
  file.copy(from=file.path(path.data, "dwl", "v20.data.curves_post_qc.txt"), to=file.path(path.sens, "v20.data.curves_post_qc.txt"))
  file.copy(from=file.path(path.data, "dwl", "v20.meta.per_experiment.txt"), to=file.path(path.sens, "v20.meta.per_experiment.txt"))

}

