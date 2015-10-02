#!/bin/bash
#
# Build the OpTiMSoC web page
#

OPTIMSOC_DOCS_REPO_URL=${1:-https://github.com/optimsoc/docs.git}
OPTIMSOC_DOCS_BRANCH=${2:-master}

# switch to script directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

rm -rf buildtmp buildout
mkdir buildtmp

# get sources
git clone $OPTIMSOC_DOCS_REPO_URL buildtmp/optimsoc-docs
( cd buildtmp/optimsoc-docs; git checkout $OPTIMSOC_DOCS_BRANCH )

# User guide: HTML
mkdir -p buildtmp/user_guide/{tex,xml,html}
cp buildtmp/optimsoc-docs/user_guide/* buildtmp/user_guide/tex
cp docbuild/user_guide-html.tex buildtmp/user_guide/tex

latexml --dest=buildtmp/user_guide/xml/user_guide.xml \
  buildtmp/user_guide/tex/user_guide-html.tex
latexmlpost --navigationtoc=context --splitat=chapter --splitnaming=label \
  --stylesheet=docbuild/latexml-optimsoc.xsl --format=html \
  --dest=buildtmp/user_guide/html/user_guide.html \
  --xsltparameter=OPTIMSOC_TITLE:"User Guide" \
  buildtmp/user_guide/xml/user_guide.xml

cp -r buildtmp/user_guide/html/*.html docs/user-guide
test -d buildtmp/user_guide/html/mi && cp -r buildtmp/user_guide/html/mi docs/user-guide

# User guide: PDF
( cd buildtmp/optimsoc-docs/user_guide; pdflatex user_guide.tex && pdflatex user_guide.tex )
cp buildtmp/optimsoc-docs/user_guide/user_guide.pdf docs/user-guide.pdf

# Reference Manual
mkdir -p buildtmp/refman/{tex,xml,html}
cp buildtmp/optimsoc-docs/refman/* buildtmp/refman/tex
cp docbuild/refman-*.tex buildtmp/refman/tex

latexml --dest=buildtmp/refman/xml/refman.xml \
  buildtmp/refman/tex/refman-html.tex
latexmlpost --navigationtoc=context --splitat=chapter --splitnaming=label \
  --stylesheet=docbuild/latexml-optimsoc.xsl --format=html \
  --dest=buildtmp/refman/html/refman.html \
  --xsltparameter=OPTIMSOC_TITLE:"Reference Manual" \
  buildtmp/refman/xml/refman.xml

cp -r buildtmp/refman/html/*.html docs/refman
test -d buildtmp/refman/html/mi && cp -r buildtmp/refman/html/mi docs/refman

