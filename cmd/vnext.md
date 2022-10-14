<!-- MarkdownTOC -->

- [idol](#ido_l_)
    - [ipsc       @ idol](#ipsc___idol_)
        - [all_frames_roi_g2_0_38_swinL       @ ipsc/idol](#all_frames_roi_g2_0_38_swinl___ipsc_ido_l_)
        - [all_frames_roi_g2_0_38_swinL-ytvis       @ ipsc/idol](#all_frames_roi_g2_0_38_swinl_ytvis___ipsc_ido_l_)
            - [on-all_frames_roi_g2_39_53       @ all_frames_roi_g2_0_38_swinL-ytvis/ipsc/idol](#on_all_frames_roi_g2_39_53___all_frames_roi_g2_0_38_swinl_ytvis_ipsc_idol_)
    - [mj_rocks       @ idol](#mj_rocks___idol_)
        - [db3_part12_ytvis_swinL       @ mj_rocks/idol](#db3_part12_ytvis_swinl___mj_rocks_ido_l_)
        - [db3_2_to_17_except_6_with_syn_ytvis_swinL       @ mj_rocks/idol](#db3_2_to_17_except_6_with_syn_ytvis_swinl___mj_rocks_ido_l_)
        - [db3_2_to_17_except_6_ytvis_swinL       @ mj_rocks/idol](#db3_2_to_17_except_6_ytvis_swinl___mj_rocks_ido_l_)

<!-- /MarkdownTOC -->
<a id="ido_l_"></a>
# idol

<a id="ipsc___idol_"></a>
## ipsc       @ idol-->vnext
scp -r -P 9738 abhineet@greyshark.cs.ualberta.ca:~/all_frames_roi_grs_221007.zip ./
scp -r -P 9738 abhineet@greyshark.cs.ualberta.ca:pretrained_cocopretrain_SWINL_pth_grs_221007_224219.zip ./

ln -s /data/ipsc ./datasets/ipsc
ln -s /data/ipsc/well3/all_frames_roi /data/ipsc/well3/all_frames_roi/ytvis19/JPEGImages
__cc__
ln -s ~/projects/def-nilanjan/asingh1/data/ipsc ./datasets/ipsc
ln -s  ~/projects/def-nilanjan/asingh1/data/ipsc/well3/all_frames_roi  ~/projects/def-nilanjan/asingh1/data/ipsc/well3/all_frames_roi/ytvis19/JPEGImages
Running scp -r -i ~/.ssh/id_rsa -P 22 asingh1@narval.computecanada.ca:"/home/asingh1/ipsc-all_frames_roi_g2_0_38_ytvis_swinL_10278087.out" "/home/Tommy"


<a id="all_frames_roi_g2_0_38_swinl___ipsc_ido_l_"></a>
### all_frames_roi_g2_0_38_swinL       @ ipsc/idol-->vnext
```
python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/ipsc-all_frames_roi_g2_0_38_swinL.yaml --num-gpus 2 
```
<a id="all_frames_roi_g2_0_38_swinl_ytvis___ipsc_ido_l_"></a>
### all_frames_roi_g2_0_38_swinL-ytvis       @ ipsc/idol-->vnext
mv ipsc/well3/all_frames_roi/ytvis19/all_frames_roi_g2_0_38-train.json ipsc/well3/all_frames_roi/ytvis19/ipsc-all_frames_roi_g2_0_38-train.json

mv ipsc/well3/all_frames_roi/ytvis19/all_frames_roi_g2_0_38-val.json ipsc/well3/all_frames_roi/ytvis19/ipsc-all_frames_roi_g2_0_38-val.json

__cc__
salloc --nodes=1 --time=0:15:0 --account=def-nilanjan --gpus-per-node=1 --mem=16000M --cpus-per-task=4
salloc --nodes=1 --time=0:15:0 --account=def-nilanjan --gpus-per-node=2 --mem=16000M --cpus-per-task=4

ln -s ~/scratch/ipsc_vnext_log/idol-ipsc-all_frames_roi_g2_0_38/ .

sbatch cmd/ipsc-all_frames_roi_g2_0_38_ytvis_swinL.sh
MAX_JOBS=1

```
CUDA_VISIBLE_DEVICES=0,1 python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/ipsc-all_frames_roi_g2_0_38_ytvis_swinL.yaml --num-gpus 2 
```

<a id="on_all_frames_roi_g2_39_53___all_frames_roi_g2_0_38_swinl_ytvis_ipsc_idol_"></a>
#### on-all_frames_roi_g2_39_53       @ all_frames_roi_g2_0_38_swinL-ytvis/ipsc/idol-->vnext
mv ipsc-all_frames_roi_g2_39_53-train.json ipsc-all_frames_roi_g2_39_53-test.json
```
python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/ipsc-all_frames_roi_g2_0_38_ytvis_swinL.yaml --num-gpus 1 --eval-only

python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/ipsc-all_frames_roi_g2_39_53_ytvis_swinL.yaml --num-gpus 1 --eval-only
```

<a id="mj_rocks___idol_"></a>
## mj_rocks       @ idol-->vnext
```
ln -s ~/data/mojow_rock ./datasets/mojow_rock
ln -s ~/data/mojow_rock/rock_dataset3 ~/data/mojow_rock/rock_dataset3/ytvis19/JPEGImages
```
<a id="db3_part12_ytvis_swinl___mj_rocks_ido_l_"></a>
### db3_part12_ytvis_swinL       @ mj_rocks/idol-->vnext
```
python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/db3_part12_ytvis_swinL.yaml --num-gpus 2
```

```
CUDA_VISIBLE_DEVICES=1 python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/db3_part12_ytvis_swinL.yaml --num-gpus 1 
```
<a id="db3_2_to_17_except_6_with_syn_ytvis_swinl___mj_rocks_ido_l_"></a>
### db3_2_to_17_except_6_with_syn_ytvis_swinL       @ mj_rocks/idol-->vnext
```
python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/db3_2_to_17_except_6_with_syn_ytvis_swinL.yaml --num-gpus 2
```
<a id="db3_2_to_17_except_6_ytvis_swinl___mj_rocks_ido_l_"></a>
### db3_2_to_17_except_6_ytvis_swinL       @ mj_rocks/idol-->vnext
```
python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/db3_2_to_17_except_6_ytvis_swinL.yaml --num-gpus 2
```












