require(texPreview)

#regular tex script

tex='\\begin{tabular}{llr}
  \\hline
\\multicolumn{2}{c}{Item} \\\\
\\cline{1-2}
Animal    & Description & Price (\\$) \\\\
\\hline
Gnat      & per gram    & 13.65      \\\\
& each        & 0.01       \\\\
Gnu       & stuffed     & 92.50      \\\\
Emu       & stuffed     & 33.33      \\\\
Armadillo & frozen      & 8.99       \\\\
\\hline
\\end{tabular}'

texPreview(obj = tex,stem = 'eq',imgFormat = 'svg')


data('iris')

texPreview(obj = xtable::xtable(head(iris,10)),stem = 'eq',imgFormat = 'svg')
  
tikzEx=readLines('http://www.texample.net/media/tikz/examples/TEX/credit-rationing.tex')
  usetikz=paste(tikzEx[14:23],collapse="\n")
  bodytikz=paste(tikzEx[25:90],collapse="\n")
  
  texPreview(obj = bodytikz,
             stem='tikzTest',imgFormat = 'svg',
             usrPackages = buildUsepackage(pkg = 'tikz',uselibrary = usetikz))


useLib="\\usetikzlibrary{arrows,shapes,snakes,automata,backgrounds,arrows.meta,positioning}"
useLib1="\\usetikzlibrary{arrows,shapes,arrows.meta,positioning}"

texCode=list( g1=list(
              bodyTikz=paste(readLines(system.file('examples/pkpdTikz/TwoCompartment.tex',package = 'texPreview')),collapse='\n'),
              pkgs=paste(buildUsepackage(pkg = list('tikz'),uselibrary = useLib),collapse='\n')),
              g2=list(
                bodyTikz=paste(readLines(system.file('examples/pkpdTikz/pdModel.tex',package = 'texPreview')),collapse='\n'),
                pkgs=paste(buildUsepackage(pkg = list('tikz'),uselibrary = useLib1),collapse='\n')),
              g3=list(
                bodyTikz=paste(readLines(system.file('examples/pkpdTikz/pkModel.tex',package = 'texPreview')),collapse='\n'),
                pkgs=paste(buildUsepackage(pkg = list('tikz'),uselibrary = useLib1),collapse='\n'))
            )

texPreview(obj = texCode$g1$bodyTikz,stem='twoCmt',imgFormat = 'svg',usrPackages = texCode$g1$pkgs,ignore.stdout=T)
texPreview(obj = texCode$g2$bodyTikz,stem='pdModel',imgFormat = 'svg',usrPackages = texCode$g2$pkgs,ignore.stdout=T)
texPreview(obj = texCode$g3$bodyTikz,stem='pkModel',imgFormat = 'svg',usrPackages = texCode$g3$pkgs,ignore.stdout=T)

example("demogTabCat")
example("RNM")
