<!-- MarkdownTOC -->

- [virtualenv](#virtualen_v_)
    - [cc       @ virtualenv](#cc___virtualenv_)
    - [windows       @ virtualenv](#windows___virtualenv_)
    - [cuda_version       @ virtualenv](#cuda_version___virtualenv_)
- [install](#install_)
    - [cocoapi       @ install](#cocoapi___instal_l_)
    - [cuda_operators       @ install](#cuda_operators___instal_l_)
- [bugs](#bug_s_)
- [idol](#ido_l_)
    - [ipsc       @ idol](#ipsc___idol_)
        - [all_frames_roi_g2_0_38_swinL       @ ipsc/idol](#all_frames_roi_g2_0_38_swinl___ipsc_ido_l_)
            - [ytvis       @ all_frames_roi_g2_0_38_swinL/ipsc/idol](#ytvis___all_frames_roi_g2_0_38_swinl_ipsc_idol_)
    - [mj_rocks       @ idol](#mj_rocks___idol_)
        - [db3_part12_ytvis_swinL       @ mj_rocks/idol](#db3_part12_ytvis_swinl___mj_rocks_ido_l_)
        - [db3_2_to_17_except_6_with_syn_ytvis_swinL       @ mj_rocks/idol](#db3_2_to_17_except_6_with_syn_ytvis_swinl___mj_rocks_ido_l_)
        - [db3_2_to_17_except_6_ytvis_swinL       @ mj_rocks/idol](#db3_2_to_17_except_6_ytvis_swinl___mj_rocks_ido_l_)

<!-- /MarkdownTOC -->

<a id="virtualen_v_"></a>
# virtualenv
sudo pip3 install virtualenv virtualenvwrapper

nano ~/.bashrc

export PATH=$PATH:/usr/local/cuda/bin

export WORKON_HOME=$HOME/.virtualenvs  
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3  
source /usr/local/bin/virtualenvwrapper.sh  

source ~/.bashrc

mkvirtualenv vnext
workon vnext

alias vnxt='workon vnext'

<a id="cc___virtualenv_"></a>
## cc       @ virtualenv-->vnext

 scp -r -P 9738 abhineet@greyshark.cs.ualberta.ca:~/all_frames_roi_grs_221007.zip ./
 scp -r -P 9738 abhineet@greyshark.cs.ualberta.ca:/data/ipsc/well3/all_frames_roi/ytvis19 ./
 scp -r -P 9738 abhineet@greyshark.cs.ualberta.ca:~/scripts ~/

module load python/3.8
module load gcc cuda cudnn
virtualenv vnext
source vnext/bin/activate
deactivate

alias vnxt='source vnext/bin/activate'

diskusage_report

<a id="windows___virtualenv_"></a>
## windows       @ virtualenv-->vnext
virtualenv vnext
cd vnext/Scripts
activate

<a id="cuda_version___virtualenv_"></a>
## cuda_version       @ virtualenv-->vnext
nvcc --version
/usr/local/cuda/bin/nvcc --version

<a id="install_"></a>
# install
python3 -m pip install torch==1.10.2+cu113 torchvision==0.11.3+cu113 torchaudio===0.10.2+cu113 -f https://download.pytorch.org/whl/torch_stable.html

python3 -m pip install torch==1.10.2+cu114 torchvision==0.11.3+cu114 torchaudio===0.10.2+cu114 -f https://download.pytorch.org/whl/torch_stable.html

python3 -m pip uninstall -y torch torchvision torchaudio

python3 -m pip install --no-index torch torchvision torchaudio


python3 -m pip install -r requirements.txt
python3 -m pip install -e .
python3 -m pip install imagesize shapely==1.7.1

<a id="cocoapi___instal_l_"></a>
## cocoapi       @ install-->vnext
python3 -m pip uninstall pycocotools
git clone https://github.com/youtubevos/cocoapi
cd cocoapi/PythonAPI
python3 setup.py build_ext install
__buggy__
pip install git+https://github.com/youtubevos/cocoapi.git#"egg=pycocotools&subdirectory=PythonAPI"
python3 -m pip install pycocotools

<a id="cuda_operators___instal_l_"></a>
## cuda_operators       @ install-->vnext
cd projects/IDOL/idol/models/ops/
python3 setup.py build install

<a id="bug_s_"></a>
# bugs
`AttributeError: module 'distutils' has no attribute 'version'`
python3 -m pip install setuptools==59.5.0

`RuntimeError: received 0 items of ancdata`
https://github.com/pytorch/pytorch/issues/973
torch.multiprocessing.set_sharing_strategy('file_system')
https://github.com/pytorch/pytorch/issues/973#issuecomment-459398189


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

<a id="all_frames_roi_g2_0_38_swinl___ipsc_ido_l_"></a>
### all_frames_roi_g2_0_38_swinL       @ ipsc/idol-->vnext
python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/ipsc-all_frames_roi_g2_0_38_swinL.yaml --num-gpus 2 

<a id="ytvis___all_frames_roi_g2_0_38_swinl_ipsc_idol_"></a>
#### ytvis       @ all_frames_roi_g2_0_38_swinL/ipsc/idol-->vnext
mv ipsc/well3/all_frames_roi/ytvis19/all_frames_roi_g2_0_38-train.json ipsc/well3/all_frames_roi/ytvis19/ipsc-all_frames_roi_g2_0_38-train.json

mv ipsc/well3/all_frames_roi/ytvis19/all_frames_roi_g2_0_38-val.json ipsc/well3/all_frames_roi/ytvis19/ipsc-all_frames_roi_g2_0_38-val.json
```
CUDA_VISIBLE_DEVICES=0,1 python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/ipsc-all_frames_roi_g2_0_38_ytvis_swinL.yaml --num-gpus 2 
```
sbatch cmd/ipsc-all_frames_roi_g2_0_38_ytvis_swinL.sh

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
python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/db3_2_to_17_except_6_with_syn_ytvis_swinL.yaml --num-gpus 2

<a id="db3_2_to_17_except_6_ytvis_swinl___mj_rocks_ido_l_"></a>
### db3_2_to_17_except_6_ytvis_swinL       @ mj_rocks/idol-->vnext
python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/db3_2_to_17_except_6_ytvis_swinL.yaml --num-gpus 2













