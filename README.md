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

### dr4292 notes

```
### Build on jobfs
rm conda-bld
mkdir -p $PBS_JOBFS/conda-bld
ln -s $PBS_JOBFS/conda-bld
rm .conda
mkdir -p $PBS_JOBFS/.conda
ln -s $PBS_JOBFS/.conda
export CONDA_BLD_PATH=~/conda-bld
module use /g/data/hh5/public/modules
module load conda/analysis3-unstable
mosrs-auth
### Use mamba to pull in conda from unstable env
mamba build shumlib --python 3.9
```

 - The build will fail unless `conda-forge` is the only channel used. Contents of my `.condarc` file:
 ```
channel_priority: strict
channels:
  - conda-forge
 ```
 (Should probably do this on the command line)
 - Its clever enough to figure out all of the dependencies from the coecms channel based on the directories in the `conda-skeleton` repo
 - Best to handle builds of dependencies in order manually though e.g. shumlib -> mule -> ants, when doing this it will construct an ad-hoc local channel and grab packages from there
 - Must have an active `gpg-agent` to get metoffice repos
 - Builds require a little bit of internet access, so can be done on ARE if more reseources are required that copyq has available - will grab everything it needs from the existing environment
 