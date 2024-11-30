#!/bin/bash
#SBATCH --job-name=proton_aimd_1ns  # Job name
#SBATCH --ntasks=12                # Number of tasks (12 tasks per node)
#SBATCH --cpus-per-task=1          # 1 CPU per task
#SBATCH --mem=20GB                 # Memory per node (20 GB)
#SBATCH --time=06:00:00            # Wall time (6 hours)
#SBATCH --output=water_aimd_1ns_%j.log  # Standard output file, %j will be replaced with job ID

# Load the required CP2K module
module load cp2k/openmpi/intel/20201212

# Run the CP2K simulation using mpirun with 12 processes
mpirun -np 12 cp2k.popt -i water.inp -o OUTPUT_FILE_NAME.log

