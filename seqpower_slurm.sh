#!/bin/bash
#SBATCH --job-name=seqpower
#SBATCH --output=logs/%x-%J.out
#SBATCH --mem=32G
#SBATCH --cpus-per-task=32

source activate snakemake_env

BASE_DIR="./outputs"
ARCHIVE_DIR="$BASE_DIR/archive"
CURRENT_DATE=$(date +%Y-%m-%d)
NEW_DIR="$ARCHIVE_DIR/$CURRENT_DATE"
mkdir -p "$NEW_DIR"
find "$BASE_DIR" -maxdepth 1 -type f -exec mv {} "$NEW_DIR" \;

singularity exec --bind /mnt/shared/,/home/kmarians/ seqx_latest.sif ./run_seqpower.sh