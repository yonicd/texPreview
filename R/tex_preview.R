#' @title Render and Preview snippets of TeX in R Viewer
#' @description input TeX script into the function and it renders a pdf and 
#' converts it an image which is sent to Viewer.
#' @param obj object to convert to TeX script
#' @param tex_lines vector of character, in case of special needs, instead of
#'  asking texPreview to build up, you may choose to pass in the contents of the 
#' complete LaTeX file directly. It should be a vector of character with each 
#' element as a line of raw TeX code. 
#' @param stem character, name to use in output files, Default: "tex_temp"
#' @param fileDir character, output destination. If NULL a temp.dir() 
#' will be used and no output will be saved, Default: tex_opts$get('fileDir')
#' @param overwrite logical, controls if overwriting of output 
#' stem* files given their existences
#' @param margin table margin for pdflatex call, Default: tex_opts$get('margin')
#' @param imgFormat character, defines the type of image the PDF is 
#' converted to Default: tex_opts$get('imgFormat')
#' @param returnType character, one of "viewer", "html", or "tex" 
#' determining appropriate return type for the rendering process, 
#' Default: tex_opts$get('returnType')
#' @param resizebox logical, forces a tabular tex object to be constrained on the
#'  margins of the document, Default: tex_opts$get('resizebox')
#' @param usrPackages character, vector of usepackage commands, 
#' see details for string format
#' @param engine character, specifies which latex to pdf engine to use
#'  ('pdflatex','xelatex','lualatex'), Default: tex_opts$get('engine')
#' @param cleanup character, vector of file extensions to clean up after 
#' building pdf, Default: tex_opts$get('cleanup')
#' @param keep_pdf logical, controls if the rendered pdf file should be kept
#'  or deleted, Default is FALSE
#' @param tex_message logical, controls if latex executing messages 
#' are displayed in console. Default is FALSE
#' @param density numeric, controls the density of the image. 
#' Default is 150: tex_opts$get('density)
#' @param svg_max numeric, maximum svg file size allowable to preview, 
#' Default: tex_opts$get('svg_max') 
#' @param print.xtable.opts list, contains arguments to pass to print.table, 
#' relevant only if xtable is used as the input, 
#' Default: tex_opts$get('print.xtable.opts')
#' @param opts.html list, html options, Default: tex_opts$get('opts.html')
#' @param markers logical, if TRUE then RStudio markers will be invoked to 
#' create links for the log file on rendering errors, Default: interactive()
#' @param ... passed to [system2][base::system2]
#' @details 
#' 
#'  `tex_preview` is an `S3 method` that can be used to preview TeX output from different
#'  object classes. 
#'  
#'  Built-in support includes:
#'  
#'   - character (tex lines)
#'   - knitr_kable (kable/kableExtra)
#'   - xtable
#'   - texreg
#'   - equatiomatic
#' 
#' \foldstart{System Requirements}
#' 
#' The function assumes the system has pdflatex installed and it is  defined in the PATH. 
#' 
#' \foldend{}
#' 
#' \foldstart{TeX Packages}
#' 
#' To add packages to the tex file on render there are two options
#'   
#'  - Use [build_usepackage][texPreview::build_usepackage] and use the input
#'    argument `usrPackages`.
#'  - Append to the input object `\\usepackage{...}` calls, they will be parsed
#'    and added the to rendering.
#'   
#' \foldend{}   
#'   
#' \foldstart{Images}
#'   
#'  - An image file of the name stem with the extension specified in `imgFormat`. 
#'  - The default extension is png.
#'     
#' \foldend{}
#' 
#' \foldstart{Side effects}
#' 
#'  - The function writes two files to disk in the `fileDir`
#'    - Image file
#'    - TeX script
#'  - The rendering files are removed up from the `fileDir`. This can
#'  be controlled using the `cleanup` argument or `tex_opts$get('cleanup')`
#'  
#' \foldend{}
#'   
#' @return 
#' 
#' The output of the function is dependent on the value of returnType:
#' 
#'  - viewer: NULL, a magick image is printed in the internal viewer
#'  - tex, beamer: character, TeX lines
#'  - input: character, path to the file containing the tex wrapped in an input call
#'  - html, html5, s5, slidy, slideous, dzslides, revealjs, md: 
#'    - magick image 
#'    - Printed as an HTML document in the internal viewer
#' 
#' @examples
#' data('iris')
#' if(interactive()){
#' 
#' #use xtable to create tex output
#'  tex_preview(obj = xtable::xtable(head(iris,10)))
#' 
#' #use knitr kable to create tex output
#'  tex_preview(knitr::kable(mtcars, "latex"))
#' 
#' tex <- '\\begin{tabular}{llr}
#' \\hline
#' \\multicolumn{2}{c}{Item} \\\\
#' \\cline{1-2}
#' Animal    & Description & Price (\\$) \\\\
#' \\hline
#' Gnat      & per gram    & 13.65      \\\\
#' & each        & 0.01       \\\\
#' Gnu       & stuffed     & 92.50      \\\\
#' Emu       & stuffed     & 33.33      \\\\
#' Armadillo & frozen      & 8.99       \\\\
#' \\hline
#' \\end{tabular}'
#' 
#' tex_preview(obj = tex,stem = 'eq',imgFormat = 'svg')
#' 
#' # use tex_lines parameter to pass full document
#' 
#' tikz_example <- system.file('examples/tikz/credit-rationing.tex',
#' package = 'texPreview')
#' 
#' tikzEx       <- readLines(tikz_example,warn = FALSE)
#' tex_preview(tex_lines = tikzEx)
#' 
#' #use texPreview preamble to build document chunks
#' 
#'   usetikz <- paste(tikzEx[14:23],collapse="\n")
#'   bodytikz <- paste(tikzEx[25:90],collapse="\n")
#'   tex_preview(obj = bodytikz,
#'   usrPackages = build_usepackage(pkg = 'tikz',uselibrary = usetikz))
#' }
#' @concept tex
#' @rdname tex_preview
#' @export 
tex_preview <- function (obj, 
                         tex_lines         = NULL,
                         stem              = "tex_temp",
                         fileDir           = tex_opts$get('fileDir'), 
                         overwrite         = TRUE, 
                         margin            = tex_opts$get('margin'),
                         imgFormat         = tex_opts$get('imgFormat'), 
                         returnType        = tex_opts$get('returnType'),
                         resizebox         = tex_opts$get('resizebox'),
                         usrPackages       = NULL,
                         engine            = tex_opts$get('engine'),
                         cleanup           = tex_opts$get('cleanup'),
                         keep_pdf          = FALSE, 
                         tex_message       = FALSE, 
                         density           = tex_opts$get('density'),
                         svg_max           = tex_opts$get('svg_max'),
                         print.xtable.opts = tex_opts$get('print.xtable.opts'),
                         opts.html         = tex_opts$get('opts.html'),
                         markers           = interactive(),...) 
{
  
  UseMethod('tex_preview')
  
}

#' @export
tex_preview.default <- function(obj, 
                                tex_lines         = NULL,
                                stem              = "tex_temp",
                                fileDir           = tex_opts$get('fileDir'), 
                                overwrite         = TRUE, 
                                margin            = tex_opts$get('margin'),
                                imgFormat         = tex_opts$get('imgFormat'), 
                                returnType        = tex_opts$get('returnType'),
                                resizebox         = tex_opts$get('resizebox'),
                                usrPackages       = NULL,
                                engine            = tex_opts$get('engine'),
                                cleanup           = tex_opts$get('cleanup'),
                                keep_pdf          = FALSE, 
                                tex_message       = FALSE, 
                                density           = tex_opts$get('density'),
                                svg_max           = tex_opts$get('svg_max'),
                                print.xtable.opts = tex_opts$get('print.xtable.opts'),
                                opts.html         = tex_opts$get('opts.html'),
                                markers           = interactive(),...) {
  
  session_opts <- tex_opts$get()
  
  tex_opts$set(
    fileDir = fileDir,
    margin = margin,
    imgFormat = imgFormat,
    returnType = returnType,
    resizebox = resizebox,
    engine = engine,
    cleanup = cleanup,
    density = density,
    print.xtable.opts = print.xtable.opts,
    opts.html = opts.html,
    svg_max = svg_max
  )
  
  on.exit({
    if(!exists('keep_log')) keep_log <- FALSE
    tex_cleanup(cleanup,stem,keep_pdf,keep_log)
    tex_opts$set(session_opts)
    
  },add = TRUE)

  write_flag <- tex_dir_setup()

  if (is.null(tex_lines)) {
  
    tex_lines <- build_lines(obj, stem, tex_opts$get('usrPackages'))
  
  }else{
    
    cat(tex_lines,file = file.path(tex_opts$get('fileDir'),sprintf('%s.tex',stem)),sep = '\n')
    
  }
  
  tab_lines <- readLines(file.path(tex_opts$get('fileDir'),sprintf('%s.tex',stem)))
  
  class(tab_lines) <- sprintf('texpreview_%s',tex_opts$get('returnType'))
  
  tex_log <- tex_build(tex_lines,stem,tex_message,...)

  keep_log <- attr(tex_log,'error')
  
  if(keep_log){
    
    if(markers){
      
      make_marker(stem,tex_log)
      
    }
    
    stop(parse_log(tex_log))
}
  
  imgOut <- tex_image(obj,stem, write_flag, overwrite)

  tex_viewer(imgOut, stem)

  return(tex_return(obj = tab_lines,stem, img_format = imgFormat))
  
}

#' @export
tex_preview.character <- function(obj, 
                                  tex_lines         = NULL,
                                  stem              = "tex_temp",
                                  fileDir           = tex_opts$get('fileDir'), 
                                  overwrite         = TRUE, 
                                  margin            = tex_opts$get('margin'),
                                  imgFormat         = tex_opts$get('imgFormat'), 
                                  returnType        = tex_opts$get('returnType'),
                                  resizebox         = tex_opts$get('resizebox'),
                                  usrPackages       = NULL,
                                  engine            = tex_opts$get('engine'),
                                  cleanup           = tex_opts$get('cleanup'),
                                  keep_pdf          = FALSE, 
                                  tex_message       = FALSE, 
                                  density           = tex_opts$get('density'),
                                  svg_max           = tex_opts$get('svg_max'),
                                  print.xtable.opts = tex_opts$get('print.xtable.opts'),
                                  opts.html         = tex_opts$get('opts.html'),
                                  markers           = interactive(),...){
  
  tex_preview.default(obj,tex_lines,stem,fileDir,overwrite,margin,
              imgFormat,returnType,resizebox,usrPackages,
              engine,cleanup,keep_pdf,tex_message,density,
              svg_max,print.xtable.opts,opts.html,markers,...)
  
}

#' @export
tex_preview.knitr_kable <- function(obj, 
                                    tex_lines         = NULL,
                                    stem              = "tex_temp",
                                    fileDir           = tex_opts$get('fileDir'), 
                                    overwrite         = TRUE, 
                                    margin            = tex_opts$get('margin'),
                                    imgFormat         = tex_opts$get('imgFormat'), 
                                    returnType        = tex_opts$get('returnType'),
                                    resizebox         = tex_opts$get('resizebox'),
                                    usrPackages       = NULL,
                                    engine            = tex_opts$get('engine'),
                                    cleanup           = tex_opts$get('cleanup'),
                                    keep_pdf          = FALSE, 
                                    tex_message       = FALSE, 
                                    density           = tex_opts$get('density'),
                                    svg_max           = tex_opts$get('svg_max'),
                                    print.xtable.opts = tex_opts$get('print.xtable.opts'),
                                    opts.html         = tex_opts$get('opts.html'),
                                    markers           = interactive(),...){
 
  
  if(attr(obj,'format')!='latex')
    stop('object must have latex format')
  
  obj <- as.character(obj)
  
  tex_preview(obj,tex_lines,stem,fileDir,overwrite,margin,
              imgFormat,returnType,resizebox,usrPackages,
              engine,cleanup,keep_pdf,tex_message,density,
              svg_max,print.xtable.opts,opts.html,markers,...)
  
}

#' @export
tex_preview.xtable <- function(obj, 
                               tex_lines         = NULL,
                               stem              = "tex_temp",
                               fileDir           = tex_opts$get('fileDir'), 
                               overwrite         = TRUE, 
                               margin            = tex_opts$get('margin'),
                               imgFormat         = tex_opts$get('imgFormat'), 
                               returnType        = tex_opts$get('returnType'),
                               resizebox         = tex_opts$get('resizebox'),
                               usrPackages       = NULL,
                               engine            = tex_opts$get('engine'),
                               cleanup           = tex_opts$get('cleanup'),
                               keep_pdf          = FALSE, 
                               tex_message       = FALSE, 
                               density           = tex_opts$get('density'),
                               svg_max           = tex_opts$get('svg_max'),
                               print.xtable.opts = tex_opts$get('print.xtable.opts'),
                               opts.html         = tex_opts$get('opts.html'),
                               markers           = interactive(),...){
  
  write_flag <- tex_dir_setup()
  
  print.xtable.opts$x <- obj
  
  print.xtable.opts$comment <- FALSE
  
  if (!"file" %in% names(print.xtable.opts)) {
    
    print.xtable.opts$file <- file.path(fileDir, paste0(stem,".tex"))
    
  }
  
  obj <- do.call("print", print.xtable.opts)
  
  tex_preview(obj,tex_lines,stem,fileDir,overwrite,margin,
              imgFormat,returnType,resizebox,usrPackages,
              engine,cleanup,keep_pdf,tex_message,density,
              svg_max,print.xtable.opts,opts.html,markers,...)

}

#' @export
tex_preview.equation <- function(obj, 
                                 tex_lines         = NULL,
                                 stem              = "tex_temp",
                                 fileDir           = tex_opts$get('fileDir'), 
                                 overwrite         = TRUE, 
                                 margin            = tex_opts$get('margin'),
                                 imgFormat         = tex_opts$get('imgFormat'), 
                                 returnType        = tex_opts$get('returnType'),
                                 resizebox         = tex_opts$get('resizebox'),
                                 usrPackages       = NULL,
                                 engine            = tex_opts$get('engine'),
                                 cleanup           = tex_opts$get('cleanup'),
                                 keep_pdf          = FALSE, 
                                 tex_message       = FALSE, 
                                 density           = tex_opts$get('density'),
                                 svg_max           = tex_opts$get('svg_max'),
                                 print.xtable.opts = tex_opts$get('print.xtable.opts'),
                                 opts.html         = tex_opts$get('opts.html'),
                                 markers           = interactive(),...){
  
  
  obj <- sprintf('$$\n%s\n$$',as.character(obj))
  
  tex_preview(obj,tex_lines,stem,fileDir,overwrite,margin,
              imgFormat,returnType,resizebox,usrPackages,
              engine,cleanup,keep_pdf,tex_message,density,
              svg_max,print.xtable.opts,opts.html,markers,...)
  
}