#!/bin/bash
#SBATCH --account=def-nilanjan
#SBATCH --nodes=1
#SBATCH --mem=500M
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=1
#SBATCH --gpus-per-node=1


#SBATCH --job-name=ipsc-all_frames_roi_g2_0_38_ytvis_swinL
#SBATCH --output=%x_%j.out

#SBATCH --time=0-00:02            # time (DD-HH:MM)

#SBATCH --mail-user=asingh1@ualberta.ca
#SBATCH --mail-type=ALL

module load python/3.8
module load cuda cudnn
# module load arch/avx512 StdEnv/2018.3 gcc cuda cudnn opencv/3.4.3

source vnext/bin/activate
nvidia-smi

python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/ipsc-all_frames_roi_g2_0_38_ytvis_swinL.yaml --num-gpus 1