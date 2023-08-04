# Application definition arguments

#sigma=4    #controlling the extension of exploration of uncertainty, see Selva et al. (2021), Nat. Comm.
workdir=$PWD/Run/
data_path=/gpfs/projects/bsc44/PTF_WF_no_HC/IO/
templates_path=/gpfs/projects/bsc44/PTF_WF_no_HC/templates/
parfile=/gpfs/projects/bsc44/PTF_WF_no_HC/templates/parfile_mod.txt
kagan_weight=0
mare_weight=0
hours=1
group_sims=4
seis_type=BS

if [ -d $workdir ]; then
    echo "Output file $workdir already exists: please remove it before run"
fi


#Event
#event=2023_0206_turkey
#event=2017_0720_kos-bodrum
event=2003_0521_boumardes ### OK
#event='2020_1030_samos' ### OK
#event='2018_1025_zante' ### OK
#event='2015_0416_crete' ### OK
#event='2017_0612_lesbo' ### OK
#event='2016_1030_norcia'
#event='2015_1117_lefkada'
#event='2016_0125_gibraltar'
#event='2019_0320_turkey'
#event='2019_1126_albania'
#event='2020_0502_crete'

#initialization
#module load COMPSs/3.2
source $PWD/env.sh
#COMPSs execution arguments
nodes=1
exec_time=500
qos=debug
graph=true
log_level=debug

echo "Running compss with $PWD/Code/launch_pycompss_mod.py --seistype  --parameters_file $parfile --event $event --data_path $data_path --run_path $workdir --templates_path $templates_path --kagan_weight $kagan_weight --mare_weight $mare_weight --hours $hours --cfg from_template"

enqueue_compss \
  --num_nodes=${nodes} \
  --qos=${qos} \
  --graph=${graph} \
  --log_level=${log_level} \
  --exec_time=${exec_time} \
  $PWD/Code/launch_pycompss.py --seistype $seis_type --parameters_file $parfile --event $event --data_path $data_path --run_path $workdir --templates_path $templates_path --kagan_weight $kagan_weight --mare_weight $mare_weight --hours $hours --group_sims=$group_sims --cfg from_template 
# --env_script=$PWD/env.sh \
