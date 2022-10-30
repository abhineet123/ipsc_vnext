#!/bin/bash
#SBATCH --account=def-nilanjan
#SBATCH --nodes=1
#SBATCH --mem=16000M
#SBATCH --gpus-per-node=2
#SBATCH --cpus-per-task=4

#SBATCH --job-name=ipsc-all_frames_roi_g2_0_38_ytvis_swinL
#SBATCH --output=%x_%j.out

#SBATCH --time=0-15:00            # time (DD-HH:MM)

#SBATCH --mail-user=asingh1@ualberta.ca
#SBATCH --mail-type=ALL

module load cuda cudnn gcc python/3.8

source ~/venv_vnext/bin/activate

nvidia-smi

python3 projects/SeqFormer/train_net.py --config-file projects/SeqFormer/configs/seqformer-ipsc-all_frames_roi_g2_0_38_ytvis_swinL.yaml --num-gpus 2 --resume MODEL.WEIGHTS seqformer-ipsc-all_frames_roi_g2_0_38/model_0012999.pth



