#!/bin/csh

#SBATCH --nodes=1                       # requests 3 compute servers
#SBATCH --mem=10GB
#SBATCH --cpus-per-task=1               # uses 1 compute core per task
#SBATCH --ntasks-per-node=10  
#SBATCH --time=5:00:00
#SBATCH --job-name=class
#SBATCH --output=gromacs-run.out

echo "0" | gmx_mpi trjconv -s step5_5.tpr -f combined.xtc -o unwrapped.xtc -pbc nojump -n index.ndx

