# SEQpower

This repository contains resources and instructions for running SEQpower, a tool for power analysis and sample size estimation for sequence-based association studies.

## Prerequisites

Before running SEQpower, ensure you have the following installed:
- [Singularity](https://sylabs.io/singularity/)
- SLURM (for job scheduling on HPC systems)

## Setup Instructions

1. **Clone and Navigate into the repository**
```bash
git clone https://github.com/kmarianski/SEQpower.git
cd SEQpower
```

2. **Create necessary directories**
```bash
mkdir -p notebooks/out_csv sfs_files outputs logs
```

3. **Pull the Singularity container**  
Use the following command to pull the SEQpower Singularity container:
```bash
singularity pull docker://gaow/seqx
```

4. **Download and extract the SFS files**
```bash
wget http://bioinformatics.org/spower/download/data/SRV/sfs.tar.gz
tar -xzf sfs.tar.gz -C sfs_files/
```

5. **Submit the SLURM job**
```bash
sbatch seqpower_slurm.sh
```