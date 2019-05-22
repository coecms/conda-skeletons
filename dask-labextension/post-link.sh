#!/bin/bash
# We redirect stderr & stdout to conda's .messages.txt; for details, see
#     http://conda.pydata.org/docs/building/build-scripts.html
# Copied from https://github.com/conda-forge/jupyter_contrib_nbextensions-feedstock/
{
  "${PREFIX}/bin/jupyter" labextension install dask-labextension
} >>"${PREFIX}/.messages.txt" 2>&1
