$pdf_mode = 1;
$pdflatex = 'xelatex -halt-on-error -interaction=nonstopmode -file-line-error %O %S';
$xelatex = 'xelatex -halt-on-error -interaction=nonstopmode -file-line-error %O %S';
$biber = 'biber %O %S';
$max_repeat = 5;
$clean_ext = 'aux bbl bcf blg fdb_latexmk fls log out run.xml toc lof lot synctex.gz';
