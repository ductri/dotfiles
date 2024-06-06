#/bin/bash

# eecs,share,dgx2,dgxs,dgxh,gpu,preempt
srun -A eecs -p dgxh --gres=gpu:1 --cpus-per-task=10 --time=1-00:00:00  --mem=100G --pty bash 

