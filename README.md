coecss conda skeletons

Used to create the packages at https://anaconda.org/coecms

If the package is to be added to the analysis3-unstable environment, it is best to load the unstable environment before creating the package to help with coherence of dependency versions.

To add a package

    conda skeleton pypi $PACKAGE

To upload a package using a specific python version

    conda build --user coecms $PACKAGE --python=3.6

To upload a noarch package

    conda build --user coecms $PACKAGE

If this doesn't upload automatically run

    conda config --set anaconda_upload yes

or manually upload with

    anaconda upload --user coecms /path/to/build

The path to use for `anaconda upload` is given at the end of `conda build` output
