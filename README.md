# SEQpower

This repository contains resources and instructions for running SEQpower, a tool for power analysis and sample size estimation for sequence-based association studies.

## Prerequisites

Before running SEQpower, ensure you have the following installed:
- [Singularity](https://sylabs.io/singularity/)
- SLURM (for job scheduling on HPC systems)

## Setup Instructions

1. **Pull the Singularity container**  
   Use the following command to pull the SEQpower Singularity container:
   ```bash
   singularity pull docker://gaow/seqx
   ```

2. **Download and extract the SFS files**
```bash
wget http://bioinformatics.org/spower/download/data/SRV/sfs.tar.gz
tar -xzf sfs.tar.gz -C sfs_files/
```

3. **Submit the SLURM job**
```bash
sbatch seqpower_slurm.sh
```