library(texPreview)
library(svgPanZoom)
library(xml2)

g1="	\\begin{tikzpicture}[
	mycircle/.style={
circle,
draw=black,
fill=white,
fill opacity = 0.3,
text opacity=1,
inner sep=0pt,
minimum size=20pt,
font=\\small,
align=center},
myarrow/.style={-Stealth},
node distance=0.6cm and 1.0cm
]
\\node[mycircle] (c1) {1\\\\(central)\\\\$V_1$};
\\node[mycircle,draw=white,above left=of c1] (c2) {IV bolus};
\\node[mycircle,draw=white,above right=0.5cm of c1] (c3) {sample};
\\node[mycircle,draw=white,below=of c1] (c4) {};
\\node[mycircle,right=of c1] (c5) {2\\\\(peripheral)\\ };
\\node[mycircle,draw=white,below=of c5] (c6) {};

%loop to create standard edges
\\foreach \\i/\\j/\\txt/\\p/\\r in {% start node/end node/text/position
c1/c4/$K_{10}$/left/90,
c5/c6/$K_{20}$/left/90,
c1.350/c5.190/$K_{21}$/below/0
}
\\draw [myarrow] (\\i) -- node[sloped,font=\\small,\\p,rotate=\\r] {\\txt} (\\j);

%draw special edges
\\draw [-Stealth,dashed] (c2) edge[in=130,out=-90](c1);
\\draw [*-] (c3) -- node[font=\\small] {} (c1);
\\draw [myarrow] (c5.168) -- node[font=\\small,above] {$K_{12}$} (c1.15);

% title
	\\node[align=center,font=\\bfseries, yshift=2em] (title) 
at (current bounding box.north)
{Unidentifiable Two-compartment Model};

% caption
	\\node[align=center,font=\\bfseries, yshift=-2em] (caption) 
at (current bounding box.south)
{The model parameters cannot be estimated uniquely \\\\ unless concentration data is available from both compartments};

\\end{tikzpicture}"

g2="	\\begin{tikzpicture}[
	mysquare/.style={
rectangle,
draw=black,
fill=white,
fill opacity = 0.3,
text opacity=1,
inner sep=0pt,
minimum size=40pt,
font=\\small,
align=center},
myarrow/.style={-Stealth},
node distance=0.6cm and 1.0cm
]

\\node[mysquare] (c1) {Prol};
\\node[mysquare,draw=white,below left= of c1] (e) {$E_{drug}$};
\\node[mysquare, minimum size=30pt,right=of c1] (t1) {Transit\\\\1};
\\node[mysquare, minimum size=30pt, right=of t1] (t2) {Transit\\\\2};
\\node[mysquare, minimum size=30pt, right=of t2] (t3) {Transit\\\\3};
\\node[mysquare, right=of t3] (c2) {Circ};
\\node[mysquare,draw=white,below= of c2] (k) {};
\\node[circle,draw=white,minimum size=10pt,font=\\small,above left= of c1] (kp) {$k_{prol}(=k_{tr})$};

\\foreach \\i/\\j/\\txt/\\p/\\r in {% start node/end node/text/position/rotation
c1/t1/$k_{tr}$/above/0,
t1/t2/$k_{tr}$/above/0,
t2/t3/$k_{tr}$/above/0,
t3/c2/$k_{tr}$/above/0,
c2/k/$k_{circ}(=k_{tr})$/right/90
}
\\draw [myarrow] (\\i) -- node[sloped,font=\\small,\\p,rotate=\\r] {\\txt} (\\j);

\\draw [-Stealth] (c2) edge[in=85,out=90,looseness=0.5] node[above]{Feedback=$\\left( \\frac{Circ_0}{Circ} \\right)^\\gamma$}(c1);

\\path (c2) edge[in=315,out=225,looseness=0.5] node[below]{MTT}(c1);

\\draw [-Stealth] (c1) edge [out=95,in=150,looseness=7] node[above left] {} (c1);
\\draw [-Stealth] (e) edge node[left] {} (kp);


\\end{tikzpicture}"

g3="	\\begin{tikzpicture}[
	mysquare/.style={
rectangle,
draw=black,
fill=white,
fill opacity = 0.3,
text opacity=1,
inner sep=0pt,
minimum size=40pt,
font=\\small,
align=center},
myarrow/.style={-Stealth},
node distance=0.6cm and 1.0cm
]

\\node[mysquare] (c1) {};
\\node[mysquare,minimum size=20pt,draw=white,left= of c1] (e1) {$X_0$};
\\node[mysquare,below=of c1] (v1) {$V_1$};
\\node[mysquare,left=of v1] (v3) {$V_3$};
\\node[mysquare,right=of v1] (v2) {$V_2$};
\\node[mysquare,draw=white,below= of v1] (e2) {};

\\foreach \\i/\\j/\\txt/\\p/\\r in {% start node/end node/text/position/rotation
e1/c1.center//above/0,
c1/v1/$ka$/right/90,
v1/v3/$k_{13}$/above/0,
v1/v2/$k_{12}$/above/0,
v1/e2/$k$/right/90
}
\\draw [myarrow] (\\i) -- node[sloped,font=\\small,\\p,rotate=\\r] {\\txt} (\\j);

\\draw [myarrow] (v3.340) -- node[font=\\small,below] {$k_{31}$} (v1.200);
\\draw [myarrow] (v2.200) -- node[font=\\small,below] {$k_{21}$} (v1.340);

\\end{tikzpicture}"

useLib="\\usetikzlibrary{arrows,shapes,snakes,automata,backgrounds,arrows.meta,positioning}"
useLib1="\\usetikzlibrary{arrows,shapes,arrows.meta,positioning}"


texCode=list(g1=list(bodyTikz=paste(g1,collapse='\n'),pkgs=paste(buildUsepackage(pkg = list('tikz'),uselibrary = useLib),collapse='\n')),
              g2=list(bodyTikz=paste(g2,collapse='\n'),pkgs=paste(buildUsepackage(pkg = list('tikz'),uselibrary = useLib1),collapse='\n')),
              g3=list(bodyTikz=paste(g3,collapse='\n'),pkgs=paste(buildUsepackage(pkg = list('tikz'),uselibrary = useLib1),collapse='\n'))
              )

texPreview(obj = texCode$g1$bodyTikz,stem='tikzTest',imgFormat = 'svg',usrPackages = texCode$g1$pkgs,ignore.stdout=T)
texPreview(obj = texCode$g2$bodyTikz,stem='tikzTest',imgFormat = 'svg',usrPackages = texCode$g2$pkgs,ignore.stdout=T)
texPreview(obj = texCode$g3$bodyTikz,stem='tikzTest',imgFormat = 'svg',usrPackages = texCode$g3$pkgs,ignore.stdout=T)



