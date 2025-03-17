#!/bin/bash
#SBATCH --job-name=seqpower
#SBATCH --output=logs/%x-%J.out
#SBATCH --mem=32G
#SBATCH --cpus-per-task=32

source activate snakemake_env

singularity exec --bind /mnt/shared/,/home/kmarians/ seqx_latest.sif ./run_seqpower.sh