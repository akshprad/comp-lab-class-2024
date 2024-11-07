#!/bin/bash
#SBATCH --job-name=anneal_system        # Job name
#SBATCH --output=anneal_system.out      # Standard output file
#SBATCH --error=anneal_system.err       # Standard error file
#SBATCH --nodes=1                       # Number of nodes
#SBATCH --ntasks-per-node=4             # Tasks per node
#SBATCH --cpus-per-task=1               # CPUs per task
#SBATCH --time=01:00:00                 # Maximum runtime (1 hour)
#SBATCH --mem=8GB                       # Memory per node (adjust if needed)

# Load necessary modules (if any)
module load mpi  # Load MPI if needed for mpirun

# Step 1: Create the system
echo "Creating system..."
mpirun lmp -var configfile ../Inputs/n360/kalj_n360_create.lmp -var id 1 -in ../Inputs/create_3d_binary.lmp

# Step 2: Equilibrate the system at different temperatures
temperatures=("1.5" "1.0" "0.9" "0.8" "0.7" "0.65" "0.6" "0.55" "0.5" "0.475" "0.45")

for temp in "${temperatures[@]}"; do
  echo "Equilibrating system at temperature ${temp}..."
  mpirun lmp -var configfile "../Inputs/n360/kalj_n360_T${temp}.lmp" -var id 1 -in ../Inputs/anneal_3d_binary.lmp
done

echo "Annealing process complete."

