# OpTiMSoC Web Site

The OpTiMSoC web site consists of two parts:

1. The site itself, written mostly in Markdown and transformed into static
   HTML Jekyll (as provided by Github pages). This also includes the blog.
2. The documentation, which is generated from the LaTeX sources by
   LaTeXML and custom XSLT stylesheets.

## Required Software

- Jekyll (if you want to preview)
- LaTeXML v0.8.1

### Jekyll
#### Ubuntu 14.04

    sudo apt-get install jekyll

#### openSUSE 12.3

    sudo zypper install ruby ruby-devel
    sudo gem install jekyll

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

Dependencies for openSUSE 12.3
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

    jekyll serve -w

And then point your browser to `http://localhost:4000` to view the page.

## Re-build documentation

To build the documentation from the repository:

     ./build-docs.sh

## Stock photos

blocks on front page

- URL: http://www.sxc.hu/browse.phtml?f=view&id=308460
- License: http://www.sxc.hu/help/7_2

## Third-Party Code

html5shiv
- Version: v3.7.0
- URL: http://code.google.com/p/html5shiv/
- License: Dual licensed under the MIT or GPL Version 2 licenses

Respond.js
- Version: 1.4.1
- URL: https://github.com/scottjehl/Respond
- License: Dual licensed under the MIT or GPL Version 2 licenses.

bootstrap 3.0
- Version 3.0.3
- URL: http://getbootstrap.com
- License: Apache 2

jQuery 1
- Version: 1.10.2
- URL: http://jquery.com/
- License: MIT License

