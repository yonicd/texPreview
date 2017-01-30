#' @export
texPreview=function(obj,fileDir=NULL,fileNM,overwrite=T,imgFormat='png',print.xtable.opts=list()){

  if(is.null(fileDir)){
    fileDir <- tempdir()
    if(!dir.exists(fileDir)) dir.create(fileDir,recursive = T)
    writeFlg=F
  }else{
    writeFlg=T
    if(!dir.exists(fileDir)) return()
  }

  if('xtable'%in%class(obj)){
    print.xtable.opts$x=obj
    if(!'file'%in%names(print.xtable.opts)) print.xtable.opts$file=file.path(fileDir,paste0(fileNM,'.tex'))
    obj=do.call('print',print.xtable.opts)
  } 
  
  cat(paste('\\documentclass[varwidth, border={10 5 50 5}]{standalone}',
            '\\usepackage[usenames,dvispnames,svgnames,table]{xcolor}',
            '\\usepackage{multirow}',
            '\\usepackage{helvet}',
            '\\usepackage{amsmath}',
            '\\usepackage{graphicx}',
            '\\renewcommand{\\familydefault}{\\sfdefault}',
            '\\usepackage{setspace}',
            '\\usepackage{caption}',
            '\\captionsetup{labelformat=empty}',
            '\\begin{document}',
            obj,
            '\\end{document}'
            ),
      file=file.path(fileDir,paste0(fileNM,'Doc.tex'))
      )

  x=getwd()
  setwd(fileDir)

  system(paste('pdflatex',
               file.path(fileDir,paste0(fileNM,'Doc.tex')),
               file.path(fileDir,paste0(fileNM,'Doc.pdf')),
               show.output.on.console=F
  )
  )
  setwd(x)

  imgOut=image_convert(image = image_read(path = file.path(fileDir,paste0(fileNM,'Doc.pdf')),density = 150),format = imgFormat,depth = 16)
  cat('\014')  
  if(writeFlg&overwrite){
    image_write(imgOut,file.path(fileDir,paste0(fileNM,'.',imgFormat)))
    if(!'file'%in%names(print.xtable.opts)) print.xtable.opts$file=file.path(fileDir,paste0(fileNM,'.tex'))
    if('xtable'%in%class(obj)) do.call('print',print.xtable.opts)
  }
  print(imgOut)
  suppressWarnings({junk=sapply(list.files(file.path(fileDir),pattern = 'Doc'),function(x) file.remove(file.path(fileDir,x)))})
}