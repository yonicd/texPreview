library(texPreview)
library(svgPanZoom)
library(xml2)

useLib="\\usetikzlibrary{arrows,shapes,snakes,automata,backgrounds,arrows.meta,positioning}"
useLib1="\\usetikzlibrary{arrows,shapes,arrows.meta,positioning}"

texCode=list( g1=list(bodyTikz=paste(readLines(system.file('examples/pkpdTikz/TwoCompartment.tex',package = 'texPreview')),collapse='\n'),pkgs=paste(buildUsepackage(pkg = list('tikz'),uselibrary = useLib),collapse='\n')),
              g2=list(bodyTikz=paste(readLines(system.file('examples/pkpdTikz/pdModel.tex',package = 'texPreview')),collapse='\n'),pkgs=paste(buildUsepackage(pkg = list('tikz'),uselibrary = useLib1),collapse='\n')),
              g3=list(bodyTikz=paste(readLines(system.file('examples/pkpdTikz/pkModel.tex',package = 'texPreview')),collapse='\n'),pkgs=paste(buildUsepackage(pkg = list('tikz'),uselibrary = useLib1),collapse='\n'))
            )

texPreview(obj = texCode$g1$bodyTikz,stem='twoCmt',fileDir = '../deliv/figure',imgFormat = 'png',usrPackages = texCode$g1$pkgs,ignore.stdout=T)
texPreview(obj = texCode$g2$bodyTikz,stem='pdModel',fileDir = '../deliv/figure',imgFormat = 'png',usrPackages = texCode$g2$pkgs,ignore.stdout=T)
texPreview(obj = texCode$g3$bodyTikz,stem='pkModel',fileDir = '../deliv/figure',imgFormat = 'png',usrPackages = texCode$g3$pkgs,ignore.stdout=T)



