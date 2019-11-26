#!/bin/bash

for CHANGE in "activate" "deactivate"
do
    mkdir -p "${PREFIX}/etc/conda/${CHANGE}.d"
    cp "${RECIPE_DIR}/${CHANGE}.sh" "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
done

#echo "export OMPI_CC=$CC" >> "${PREFIX}/etc/conda/activate.d/${PKG_NAME}_activate.sh"
#echo "export OMPI_CXX=$CXX" >> "${PREFIX}/etc/conda/activate.d/${PKG_NAME}_activate.sh"
#echo "export OMPI_FC=$FC" >> "${PREFIX}/etc/conda/activate.d/${PKG_NAME}_activate.sh"
