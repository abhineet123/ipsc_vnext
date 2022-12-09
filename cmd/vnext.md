<!-- MarkdownTOC -->

- [idol](#ido_l_)
    - [ipsc       @ idol](#ipsc___idol_)
        - [all_frames_roi_g2_0_38_swinL       @ ipsc/idol](#all_frames_roi_g2_0_38_swinl___ipsc_ido_l_)
        - [all_frames_roi_g2_0_38_swinL-ytvis       @ ipsc/idol](#all_frames_roi_g2_0_38_swinl_ytvis___ipsc_ido_l_)
            - [on-all_frames_roi_g2_39_53       @ all_frames_roi_g2_0_38_swinL-ytvis/ipsc/idol](#on_all_frames_roi_g2_39_53___all_frames_roi_g2_0_38_swinl_ytvis_ipsc_idol_)
            - [on-all_frames_roi_g2_seq_1_39_53       @ all_frames_roi_g2_0_38_swinL-ytvis/ipsc/idol](#on_all_frames_roi_g2_seq_1_39_53___all_frames_roi_g2_0_38_swinl_ytvis_ipsc_idol_)
        - [ext_reorg_roi_g2_0_38       @ ipsc/idol](#ext_reorg_roi_g2_0_38___ipsc_ido_l_)
            - [on-ext_reorg_roi_g2_39_53       @ ext_reorg_roi_g2_0_38/ipsc/idol](#on_ext_reorg_roi_g2_39_53___ext_reorg_roi_g2_0_38_ipsc_ido_l_)
        - [ext_reorg_roi_g2_0_38-max_length-10       @ ipsc/idol](#ext_reorg_roi_g2_0_38_max_length_10___ipsc_ido_l_)
        - [ext_reorg_roi_g2_0_38-max_length-20       @ ipsc/idol](#ext_reorg_roi_g2_0_38_max_length_20___ipsc_ido_l_)
            - [on-ext_reorg_roi_g2_39_53       @ ext_reorg_roi_g2_0_38-max_length-20/ipsc/idol](#on_ext_reorg_roi_g2_39_53___ext_reorg_roi_g2_0_38_max_length_20_ipsc_ido_l_)
    - [mj_rocks       @ idol](#mj_rocks___idol_)
        - [db3_part12_ytvis_swinL       @ mj_rocks/idol](#db3_part12_ytvis_swinl___mj_rocks_ido_l_)
        - [db3_2_to_17_except_6_with_syn_ytvis_swinL       @ mj_rocks/idol](#db3_2_to_17_except_6_with_syn_ytvis_swinl___mj_rocks_ido_l_)
        - [db3_2_to_17_except_6_ytvis_swinL       @ mj_rocks/idol](#db3_2_to_17_except_6_ytvis_swinl___mj_rocks_ido_l_)
            - [on-september_5_2020       @ db3_2_to_17_except_6_ytvis_swinL/mj_rocks/idol](#on_september_5_2020___db3_2_to_17_except_6_ytvis_swinl_mj_rocks_idol_)
        - [db3_2_to_17_except_6_large_huge_ytvis_swinL       @ mj_rocks/idol](#db3_2_to_17_except_6_large_huge_ytvis_swinl___mj_rocks_ido_l_)
            - [on-september_5_2020       @ db3_2_to_17_except_6_large_huge_ytvis_swinL/mj_rocks/idol](#on_september_5_2020___db3_2_to_17_except_6_large_huge_ytvis_swinl_mj_rocks_ido_l_)
- [seqformer-ipsc       @ seqformer](#seqformer_ipsc___seqforme_r_)
    - [all_frames_roi_g2_0_38_swinL-ytvis       @ seqformer-ipsc](#all_frames_roi_g2_0_38_swinl_ytvis___seqformer_ipsc_)
        - [on-all_frames_roi_g2_39_53       @ all_frames_roi_g2_0_38_swinL-ytvis/seqformer-ipsc](#on_all_frames_roi_g2_39_53___all_frames_roi_g2_0_38_swinl_ytvis_seqformer_ips_c_)
            - [model_0049999       @ on-all_frames_roi_g2_39_53/all_frames_roi_g2_0_38_swinL-ytvis/seqformer-ipsc](#model_0049999___on_all_frames_roi_g2_39_53_all_frames_roi_g2_0_38_swinl_ytvis_seqformer_ipsc_)
    - [ext_reorg_roi_g2_0_38_swinL-ytvis       @ seqformer-ipsc](#ext_reorg_roi_g2_0_38_swinl_ytvis___seqformer_ipsc_)
- [seqformer-mj_rocks       @ seqformer-ipsc](#seqformer_mj_rocks___seqformer_ipsc_)
        - [db3_2_to_17_except_6_ytvis_swinL       @ seqformer-mj_rocks/](#db3_2_to_17_except_6_ytvis_swinl___seqformer_mj_rocks__)

<!-- /MarkdownTOC -->
<a id="ido_l_"></a>
# idol

<a id="ipsc___idol_"></a>
## ipsc       @ idol-->vnext
<a id="all_frames_roi_g2_0_38_swinl___ipsc_ido_l_"></a>
### all_frames_roi_g2_0_38_swinL       @ ipsc/idol-->vnext
python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/idol-ipsc-all_frames_roi_g2_0_38_swinL.yaml --num-gpus 2 


<a id="all_frames_roi_g2_0_38_swinl_ytvis___ipsc_ido_l_"></a>
### all_frames_roi_g2_0_38_swinL-ytvis       @ ipsc/idol-->vnext
__cc__
salloc --nodes=1 --time=0:15:0 --account=def-nilanjan --gpus-per-node=1 --mem=16000M --cpus-per-task=4
salloc --nodes=1 --time=0:15:0 --account=def-nilanjan --gpus-per-node=2 --mem=16000M --cpus-per-task=4
exit

ln -s ~/scratch/ipsc_vnext_log/idol-ipsc-all_frames_roi_g2_0_38/ .

sbatch cmd/ipsc-all_frames_roi_g2_0_38_ytvis_swinL.sh
scancel

MAX_JOBS=1

python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/idol-ipsc-all_frames_roi_g2_0_38_ytvis_swinL.yaml --num-gpus 1 --resume

<a id="on_all_frames_roi_g2_39_53___all_frames_roi_g2_0_38_swinl_ytvis_ipsc_idol_"></a>
#### on-all_frames_roi_g2_39_53       @ all_frames_roi_g2_0_38_swinL-ytvis/ipsc/idol-->vnext
python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/idol-ipsc-all_frames_roi_g2_0_38_ytvis_swinL.yaml --num-gpus 1 --eval-only MODEL.WEIGHTS log/idol-ipsc-all_frames_roi_g2_0_38/model_0056999.pth


<a id="on_all_frames_roi_g2_seq_1_39_53___all_frames_roi_g2_0_38_swinl_ytvis_ipsc_idol_"></a>
#### on-all_frames_roi_g2_seq_1_39_53       @ all_frames_roi_g2_0_38_swinL-ytvis/ipsc/idol-->vnext
python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/idol-ipsc-ext_reorg_roi_g2_0_38_ytvis_swinL.yaml --num-gpus 1 --eval-only MODEL.WEIGHTS log/idol-ipsc-all_frames_roi_g2_0_38/model_0056999.pth DATASETS.TEST ('ytvis-ipsc-all_frames_roi_g2_seq_1_39_53-test',)


<a id="ext_reorg_roi_g2_0_38___ipsc_ido_l_"></a>
### ext_reorg_roi_g2_0_38       @ ipsc/idol-->vnext
python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/idol-ipsc-ext_reorg_roi_g2_0_38_ytvis_swinL.yaml --num-gpus 2 

sbatch cmd/ipsc-ext_reorg_roi_g2_0_38_ytvis_swinL.sh

<a id="on_ext_reorg_roi_g2_39_53___ext_reorg_roi_g2_0_38_ipsc_ido_l_"></a>
#### on-ext_reorg_roi_g2_39_53       @ ext_reorg_roi_g2_0_38/ipsc/idol-->vnext
python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/idol-ipsc-ext_reorg_roi_g2_0_38_ytvis_swinL.yaml --num-gpus 1 --eval-only MODEL.WEIGHTS log/idol-ipsc-ext_reorg_roi_g2_0_38/model_0099999.pth

<a id="ext_reorg_roi_g2_0_38_max_length_10___ipsc_ido_l_"></a>
### ext_reorg_roi_g2_0_38-max_length-10       @ ipsc/idol-->vnext
python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/idol-ipsc-ext_reorg_roi_g2_0_38-max_length-10_ytvis_swinL.yaml --num-gpus 2 

sbatch cmd/ipsc-ext_reorg_roi_g2_0_38-max_length-10_ytvis_swinL.sh

<a id="ext_reorg_roi_g2_0_38_max_length_20___ipsc_ido_l_"></a>
### ext_reorg_roi_g2_0_38-max_length-20       @ ipsc/idol-->vnext
python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/idol-ipsc-ext_reorg_roi_g2_0_38-max_length-20_ytvis_swinL.yaml --num-gpus 2 

sbatch cmd/ipsc-ext_reorg_roi_g2_0_38-max_length-20_ytvis_swinL.sh

<a id="on_ext_reorg_roi_g2_39_53___ext_reorg_roi_g2_0_38_max_length_20_ipsc_ido_l_"></a>
#### on-ext_reorg_roi_g2_39_53       @ ext_reorg_roi_g2_0_38-max_length-20/ipsc/idol-->vnext
python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/idol-ipsc-ext_reorg_roi_g2_0_38-max_length-20_ytvis_swinL.yaml --num-gpus 1 --eval-only MODEL.WEIGHTS log/idol-ipsc-ext_reorg_roi_g2_0_38-max_length-20/model_0099999.pth


<a id="mj_rocks___idol_"></a>
## mj_rocks       @ idol-->vnext

<a id="db3_part12_ytvis_swinl___mj_rocks_ido_l_"></a>
### db3_part12_ytvis_swinL       @ mj_rocks/idol-->vnext
python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/idol-db3_part12_ytvis_swinL.yaml --num-gpus 2

CUDA_VISIBLE_DEVICES=1 python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/idol-db3_part12_ytvis_swinL.yaml --num-gpus 1 

<a id="db3_2_to_17_except_6_with_syn_ytvis_swinl___mj_rocks_ido_l_"></a>
### db3_2_to_17_except_6_with_syn_ytvis_swinL       @ mj_rocks/idol-->vnext
python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/idol-db3_2_to_17_except_6_with_syn_ytvis_swinL.yaml --num-gpus 2

<a id="db3_2_to_17_except_6_ytvis_swinl___mj_rocks_ido_l_"></a>
### db3_2_to_17_except_6_ytvis_swinL       @ mj_rocks/idol-->vnext
python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/idol-db3_2_to_17_except_6_ytvis_swinL.yaml --num-gpus 2


<a id="on_september_5_2020___db3_2_to_17_except_6_ytvis_swinl_mj_rocks_idol_"></a>
#### on-september_5_2020       @ db3_2_to_17_except_6_ytvis_swinL/mj_rocks/idol-->vnext
PYTORCH_NO_CUDA_MEMORY_CACHING=1 python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/idol-db3_2_to_17_except_6_ytvis_swinL.yaml --num-gpus 1 --eval-only MODEL.WEIGHTS log/idol-ytvis-mj_rock-db3_2_to_17_except_6/model_0151999.pth SOLVER.IMS_PER_BATCH 1


<a id="db3_2_to_17_except_6_large_huge_ytvis_swinl___mj_rocks_ido_l_"></a>
### db3_2_to_17_except_6_large_huge_ytvis_swinL       @ mj_rocks/idol-->vnext
python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/idol-db3_2_to_17_except_6_large_huge_ytvis_swinL.yaml --num-gpus 2


<a id="on_september_5_2020___db3_2_to_17_except_6_large_huge_ytvis_swinl_mj_rocks_ido_l_"></a>
#### on-september_5_2020       @ db3_2_to_17_except_6_large_huge_ytvis_swinL/mj_rocks/idol-->vnext
python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/idol-db3_2_to_17_except_6_large_huge_ytvis_swinL.yaml --num-gpus 1 --eval-only MODEL.WEIGHTS log/idol-ytvis-mj_rock-db3_2_to_17_except_6_large_huge/model_0209999.pth SOLVER.IMS_PER_BATCH 1


<a id="seqformer_ipsc___seqforme_r_"></a>
# seqformer-ipsc       @ seqformer-->vnext
<a id="all_frames_roi_g2_0_38_swinl_ytvis___seqformer_ipsc_"></a>
## all_frames_roi_g2_0_38_swinL-ytvis       @ seqformer-ipsc-->vnext
sbatch cmd/seqformer-ipsc-all_frames_roi_g2_0_38_ytvis_swinL.sh

python3 projects/SeqFormer/train_net.py --config-file projects/SeqFormer/configs/seqformer-ipsc-all_frames_roi_g2_0_38_ytvis_swinL.yaml --num-gpus 2

<a id="on_all_frames_roi_g2_39_53___all_frames_roi_g2_0_38_swinl_ytvis_seqformer_ips_c_"></a>
### on-all_frames_roi_g2_39_53       @ all_frames_roi_g2_0_38_swinL-ytvis/seqformer-ipsc-->vnext
python3 projects/SeqFormer/train_net.py --config-file projects/SeqFormer/configs/seqformer-ipsc-all_frames_roi_g2_0_38_ytvis_swinL.yaml --num-gpus 1 --eval-only 

<a id="model_0049999___on_all_frames_roi_g2_39_53_all_frames_roi_g2_0_38_swinl_ytvis_seqformer_ipsc_"></a>
#### model_0049999       @ on-all_frames_roi_g2_39_53/all_frames_roi_g2_0_38_swinL-ytvis/seqformer-ipsc-->vnext
python projects/SeqFormer/train_net.py --config-file projects/SeqFormer/configs/seqformer-ipsc-all_frames_roi_g2_0_38_ytvis_swinL.yaml --num-gpus 1 --eval-only MODEL.WEIGHTS log/seqformer-ipsc-all_frames_roi_g2_0_38/model_0049999.pth

<a id="ext_reorg_roi_g2_0_38_swinl_ytvis___seqformer_ipsc_"></a>
## ext_reorg_roi_g2_0_38_swinL-ytvis       @ seqformer-ipsc-->vnext
sbatch cmd/seqformer-ipsc-ext_reorg_roi_g2_0_38_ytvis_swinL.sh

python3 projects/SeqFormer/train_net.py --config-file projects/SeqFormer/configs/seqformer-ipsc-ext_reorg_roi_g2_0_38_ytvis_swinL.yaml --num-gpus 2

<a id="seqformer_mj_rocks___seqformer_ipsc_"></a>
# seqformer-mj_rocks       @ seqformer-ipsc-->vnext
<a id="db3_2_to_17_except_6_ytvis_swinl___seqformer_mj_rocks__"></a>
### db3_2_to_17_except_6_ytvis_swinL       @ seqformer-mj_rocks/-->vnext
python3 projects/SeqFormer/train_net.py --config-file projects/SeqFormer/configs/seqformer-ipsc-db3_2_to_17_except_6_ytvis_swinL.yaml --num-gpus 2












