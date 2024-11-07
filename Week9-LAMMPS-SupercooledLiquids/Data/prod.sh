#!/bin/bash
#SBATCH --job-name=production_simulation   # Job name
#SBATCH --output=production_simulation.out # Standard output file
#SBATCH --error=production_simulation.err  # Standard error file
#SBATCH --nodes=1                          # Number of nodes
#SBATCH --ntasks-per-node=4                # Tasks per node (4 tasks-per-node)
#SBATCH --cpus-per-task=1                  # CPUs per task
#SBATCH --time=00:20:00                    # Maximum runtime (20 minutes, 3x shorter than equilibration)
#SBATCH --mem=8GB                          # Memory per node (adjust if needed)

# Load necessary modules (if any)
module load mpi   # Load MPI if needed for mpirun

# Step 1: Production simulations at different temperatures
temperatures=("1.5" "1.0" "0.9" "0.8" "0.7" "0.65" "0.6" "0.55" "0.5" "0.475" "0.45")

# Start the production simulations for higher temperatures while waiting for equilibration runs
for temp in "${temperatures[@]}"; do
  echo "Running production simulation at temperature ${temp}..."
  mpirun lmp -var configfile "../Inputs/n360/kalj_n360_T${temp}.lmp" -var id 1 -in ../Inputs/production_3d_binary.lmp
done

echo "Production simulations complete."

