#!/bin/sh

if [ "$(uname)" = "Darwin" ]; then
    if [ -d "/opt/X11" ]; then
        x11_lib="-L/opt/X11/lib /opt/X11/lib/libX11.6.dylib /opt/X11/lib/libcairo.2.dylib /opt/X11/lib/libfontconfig.1.dylib /opt/X11/lib/libpixman-1.0.dylib /opt/X11/lib/libfreetype.6.dylib /opt/X11/lib/libXrender.1.dylib /opt/X11/lib/libXext.6.dylib"
        x11_inc="-I/opt/X11/include -I/opt/X11/include/freetype2"
        export CAIRO_PREFIX=/opt/X11
        export FREETYPE_PREFIX=/opt/X11
    else
        echo "No X11 libs found. Exiting..." 1>&2
        exit
    fi
fi
     
export CC=${PREFIX}/bin/gcc
export CXXFLAGS="-fPIC $CXXFLAGS"
export LDFLAGS="${x11_lib} -L${PREFIX}/lib $LDFLAGS"
export CPPFLAGS="${x11_inc} -I${PREFIX}/include $CPPFLAGS"
export CFLAGS="${x11_inc} -I${PREFIX}/include $CFLAGS"
export HAS_CAIRO=1
export F2CLIBS=gfortran
export PNG_PREFIX=${PREFIX}
export NCARG_ROOT=${PREFIX}

if [[ $(uname) == Darwin ]]; then
  export MACOSX_DEPLOYMENT_TARGET="10.9"
  export CXXFLAGS="-stdlib=libc++ $CXXFLAGS"
  export CXXFLAGS="$CXXFLAGS -stdlib=libc++"
  export LDFLAGS="-headerpad_max_install_names $LDFLAGS"
fi

python setup.py install
