#!/bin/bash
#normal cpu stuff: allocate cpus, memory
#SBATCH --ntasks=1 --cpus-per-task=1
#SBATCH -p gpu --gres=gpu:titanrtx:1 --mem=4GB
#We expect that our program should not run langer than 4 hours
# we run on the gpu partition and we allocate 2 titanx gpus
#Note that a program will be killed once it exceeds this time!
#SBATCH --time=15:00:00
#SBATCH --output=experiments/train_localbase-2.2.slurm
#SBATCH --mail-user=yova@di.ku.dk
#SBATCH --mail-type=ALL
source activate ubar

python train.py -mode train -cfg gpt_path=distilgpt2 lr=1e-4 warmup_steps=2000 gradient_accumulation_steps=16 batch_size=2 epoch_num=60 exp_no=best_model exp_path='./experiments/localbase-2.2'

