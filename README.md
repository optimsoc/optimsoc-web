# OpTiMSoC Web Site

## Required Software

- Jekyll (if you want to preview)
- LaTeXML

Installing on Ubuntu 14.04

   sudo apt-get install jekyll

openSUSE 12.3

    sudo zypper install ruby ruby-devel
    sudo gem install jekyll

Install LaTeXML from source (it's either outdated or not available)
the installation will go to /usr/local; trying to install it somewhere
in /opt is extremely annoying because perl/tex search paths need to be
adopted. Ubuntu 15.04's latexml packet works fine

dependencies for Ubuntu 12.04/14.04

    sudo apt-get install libxml2 libxml-libxml-perl \
    libxslt1.1 libxml-libxslt-perl  \
    libparse-recdescent-perl libfile-which-perl \
    liburi-perl libio-string-perl libwww-perl \
    libjson-xs-perl libarchive-zip-perl \
    libimage-size-perl \
    imagemagick perlmagick

dependencies for openSUSE 12.3

    sudo zypper install perl-PerlMagick perl-IO-String \
    perl-JSON-XS perl-XML-LibXSLT

actual installation

    cd ~/src
    git clone https://github.com/brucemiller/LaTeXML.git latexml
    perl Makefile.PL
    make
    sudo make install

## Development

To test the site on your local machine run

    jekyll serve

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

