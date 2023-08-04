module purge && module load gcc openmpi cuda anaconda3 geos sqlite proj/6.3.0 COMPSs/3.2.1 
module load geos/3.6.2
module load hdf4/4.2.13 pnetcdf/1.9.0-relax-coord-bound  hdf5/1.10.3 netcdf/4.7.4
source activate uma31950
export PTF_HYSEA_DIR=/home/bsc44/bsc44660/SOFTWARE/THySEA_v3.8.1_MC/
export PTF_INSTALL_DIR=/gpfs/projects/bsc44/PTF_WF_clean
export PYTHONPATH=$PTF_INSTALL_DIR/Code:$PTF_INSTALL_DIR/Code/Commons/py:$PYTHONPATH
export PTF_GPUS_NODE=4
export PTF_GPUS_EXEC=4
