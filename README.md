# OpTiMSoC Web Site

The OpTiMSoC web site consists of two parts:

1. The site itself, written mostly in Markdown and transformed into static
   HTML Jekyll (as provided by Github pages). This also includes the blog.
2. The documentation, which is generated from the LaTeX sources by
   LaTeXML and custom XSLT stylesheets.

## Required Software

- LaTeXML v0.8.1
- GitHub Pages Support (based on Jekyll)

### GitHub Pages Support (Jekyll & Co.)
Follwo the instructions in the [GitHub Documentation](https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/) how to install Jekyll with bundler.

### LaTeXML
LaTeXML undergoes quite some changes over time which affect the output. Since
our style sheets are picky, you should really use the exact same version as
listed here and build it from source.

#### Building from source
The installation will go to /usr/local; trying to install it somewhere
in /opt is extremely annoying because perl/tex search paths need to be
adopted.

Dependencies for Ubuntu

```
sudo apt-get install libxml2 libxml-libxml-perl \
    libxslt1.1 libxml-libxslt-perl  \
    libparse-recdescent-perl libfile-which-perl \
    liburi-perl libio-string-perl libwww-perl \
    libjson-xs-perl libarchive-zip-perl \
    libimage-size-perl \
    imagemagick perlmagick
```

Dependencies for openSUSE 13.2
```
sudo zypper install perl-PerlMagick perl-IO-String \
    perl-JSON-XS perl-XML-LibXSLT
```

Build and compile

```
cd ~/src
git clone https://github.com/brucemiller/LaTeXML.git latexml
git checkout v0.8.1
perl Makefile.PL
make
sudo make install
```

## Development

To test the site on your local machine run

    bundle exec jekyll serve -w

And then point your browser to `http://localhost:4000` to view the page.

## Re-build documentation

To build the documentation from the repository:

     ./build-docs.sh

or to use another copy of the optimsoc source repository (like a local one):

    ./build-docs.sh file://$HOME/src/optimsoc/docs

## Stock photos

blocks on front page

- URL: http://www.sxc.hu/browse.phtml?f=view&id=308460
- License: http://www.sxc.hu/help/7_2

## Third-Party Code

html5shiv
- Version: v3.7.2
- URL: https://github.com/afarkas/html5shiv
- License: Dual licensed under the MIT or GPL Version 2 licenses

Respond.js
- Version: 1.4.2
- URL: https://github.com/scottjehl/Respond
- License: Dual licensed under the MIT or GPL Version 2 licenses.

bootstrap 3
- Version 3.3.4
- URL: http://getbootstrap.com
- License: Apache 2

jQuery 1
- Version: 1.11.3
- URL: http://jquery.com/
- License: MIT License
