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
- [seqformer](#seqformer_)
    - [ipsc       @ seqformer](#ipsc___seqforme_r_)
        - [all_frames_roi_g2_0_38_swinL-ytvis       @ ipsc/seqformer](#all_frames_roi_g2_0_38_swinl_ytvis___ipsc_seqformer_)
            - [on-all_frames_roi_g2_39_53       @ all_frames_roi_g2_0_38_swinL-ytvis/ipsc/seqformer](#on_all_frames_roi_g2_39_53___all_frames_roi_g2_0_38_swinl_ytvis_ipsc_seqforme_r_)

<!-- /MarkdownTOC -->
<a id="ido_l_"></a>
# idol

<a id="ipsc___idol_"></a>
## ipsc       @ idol-->vnext
<a id="all_frames_roi_g2_0_38_swinl___ipsc_ido_l_"></a>
### all_frames_roi_g2_0_38_swinL       @ ipsc/idol-->vnext
```
python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/ipsc-all_frames_roi_g2_0_38_swinL.yaml --num-gpus 2 
```
<a id="all_frames_roi_g2_0_38_swinl_ytvis___ipsc_ido_l_"></a>
### all_frames_roi_g2_0_38_swinL-ytvis       @ ipsc/idol-->vnext
__cc__
salloc --nodes=1 --time=0:15:0 --account=def-nilanjan --gpus-per-node=1 --mem=16000M --cpus-per-task=4
salloc --nodes=1 --time=0:15:0 --account=def-nilanjan --gpus-per-node=2 --mem=16000M --cpus-per-task=4

ln -s ~/scratch/ipsc_vnext_log/idol-ipsc-all_frames_roi_g2_0_38/ .

sbatch cmd/ipsc-all_frames_roi_g2_0_38_ytvis_swinL.sh

MAX_JOBS=1

```
python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/ipsc-all_frames_roi_g2_0_38_ytvis_swinL.yaml --num-gpus 1 --resume
```

<a id="on_all_frames_roi_g2_39_53___all_frames_roi_g2_0_38_swinl_ytvis_ipsc_idol_"></a>
#### on-all_frames_roi_g2_39_53       @ all_frames_roi_g2_0_38_swinL-ytvis/ipsc/idol-->vnext
```
python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/ipsc-all_frames_roi_g2_0_38_ytvis_swinL.yaml --num-gpus 1 --eval-only

python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/ipsc-all_frames_roi_g2_39_53_ytvis_swinL.yaml --num-gpus 1 --eval-only
```

<a id="mj_rocks___idol_"></a>
## mj_rocks       @ idol-->vnext
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

<a id="seqformer_"></a>
# seqformer

<a id="ipsc___seqforme_r_"></a>
## ipsc       @ seqformer-->vnext
<a id="all_frames_roi_g2_0_38_swinl_ytvis___ipsc_seqformer_"></a>
### all_frames_roi_g2_0_38_swinL-ytvis       @ ipsc/seqformer-->vnext
sbatch cmd/seqformer-ipsc-all_frames_roi_g2_0_38_ytvis_swinL.sh
```
python3 projects/SeqFormer/train_net.py --config-file projects/SeqFormer/configs/seqformer-ipsc-all_frames_roi_g2_0_38_ytvis_swinL.yaml --num-gpus 2
```

<a id="on_all_frames_roi_g2_39_53___all_frames_roi_g2_0_38_swinl_ytvis_ipsc_seqforme_r_"></a>
#### on-all_frames_roi_g2_39_53       @ all_frames_roi_g2_0_38_swinL-ytvis/ipsc/seqformer-->vnext
```
python3 projects/SeqFormer/train_net.py --config-file projects/SeqFormer/configs/seqformer-ipsc-all_frames_roi_g2_0_38_ytvis_swinL.yaml --num-gpus 1 --eval-only

python3 projects/SeqFormer/train_net.py --config-file projects/SeqFormer/configs/seqformer-ipsc-all_frames_roi_g2_39_53_ytvis_swinL.yaml --num-gpus 1 --eval-only
```











