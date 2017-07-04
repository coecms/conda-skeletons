coecss conda skeletons

Used to create the packages at https://anaconda.org/coecms

To add a package

    conda skeleton pypi $PACKAGE

To upload a package

    conda build --user coecms $PACKAGE
    anaconda upload --user coecms /path/to/build

The path to use for `anaconda upload` is given at the end of `conda build` output
