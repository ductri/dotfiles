#!/bin/bash

#SBATCH -J ours-slurm
#SBATCH --time=0-12:00:00
#SBATCH -p eecs,share,dgx2,dgxs,dgxh,gpu
#SBATCH -A eecs
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=15

line=$(nvidia-smi | grep CUDA)
if [[ $line = *'12'* ]]; then
    echo 'Using cuda12'
    module load cuda/12.2
    source envs/cuda12/bin/activate
else
    echo 'Using cuda11'
    module load cuda/11.4
    source envs/cuda11/bin/activate
fi

# This is the main command
./scripts/start_ray.sh && sleep 5 && ray status && echo "run python ..." && python src/parallel_train_ours.py

