#!/bin/bash

# Loop through densities from 0.5 to 1.1 in increments of 0.1
for density in $(seq 0.5 0.1 1.1)
do
    # Define the log file name based on the current density
    LOGFILE="LOGFILE_d${density}.log"

    # Run the LAMMPS simulation and redirect output to the log file
    echo "Running simulation for density = $density"
    mpirun lmp -var density $density -in /home/ap8064/comp-lab-class/comp-lab-class-2024/Week8-LAMMPS-crystallization/Inputs/2dWCA.in > $LOGFILE

    # Check if the simulation was successful
    if [ $? -eq 0 ]; then
        echo "Simulation for density $density completed successfully. Log saved to $LOGFILE."
    else
        echo "Error occurred during the simulation for density $density."
    fi
done

