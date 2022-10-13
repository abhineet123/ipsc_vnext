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


<a id="windows___virtualenv_"></a>
## windows       @ virtualenv-->vnext
virtualenv vnext
cd vnext/Scripts
activate

## cuda_version       @ virtualenv-->vnext
nvcc --version
/usr/local/cuda/bin/nvcc --version

# install

python3 -m pip install torch==1.10.2+cu113 torchvision==0.11.3+cu113 torchaudio===0.10.2+cu113 -f https://download.pytorch.org/whl/torch_stable.html

python3 -m pip install -r requirements.txt
python3 -m pip install -e .
python3 -m pip install imagesize
python3 -m pip install shapely==1.7.1

## cocoapi       @ install-->vnext
python3 -m pip uninstall pycocotools
git clone https://github.com/youtubevos/cocoapi
cd cocoapi/PythonAPI
python3 setup.py build_ext install
__buggy__
pip install git+https://github.com/youtubevos/cocoapi.git#"egg=pycocotools&subdirectory=PythonAPI"
python3 -m pip install pycocotools

# bugs
`AttributeError: module 'distutils' has no attribute 'version'`
python3 -m pip install setuptools==59.5.0

`RuntimeError: received 0 items of ancdata`
https://github.com/pytorch/pytorch/issues/973
torch.multiprocessing.set_sharing_strategy('file_system')

https://github.com/pytorch/pytorch/issues/973#issuecomment-459398189

## cuda_operators       @ bugs-->vnext
cd projects/IDOL/idol/models/ops/
python3 setup.py build install

# idol

## ipsc       @ idol-->vnext
scp -r -P 9738 abhineet@greyshark.cs.ualberta.ca:~/all_frames_roi_grs_221007.zip ./
scp -r -P 9738 abhineet@greyshark.cs.ualberta.ca:pretrained_cocopretrain_SWINL_pth_grs_221007_224219.zip ./

ln -s /data/ipsc ./datasets/ipsc
ln -s /data/ipsc/well3/all_frames_roi /data/ipsc/well3/all_frames_roi/ytvis19/JPEGImages

### all_frames_roi_g2_0_38_swinL       @ ipsc/idol-->vnext
python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/ipsc-all_frames_roi_g2_0_38_swinL.yaml --num-gpus 2 

#### ytvis       @ all_frames_roi_g2_0_38_swinL/ipsc/idol-->vnext

 

mv ipsc/well3/all_frames_roi/ytvis19/all_frames_roi_g2_0_38-train.json ipsc/well3/all_frames_roi/ytvis19/ipsc-all_frames_roi_g2_0_38-train.json

mv ipsc/well3/all_frames_roi/ytvis19/all_frames_roi_g2_0_38-val.json ipsc/well3/all_frames_roi/ytvis19/ipsc-all_frames_roi_g2_0_38-val.json

CUDA_VISIBLE_DEVICES=0,1 python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/ipsc-all_frames_roi_g2_0_38-ytvis_swinL.yaml --num-gpus 2 


## mj_rocks       @ idol-->vnext

ln -s ~/data/mojow_rock ./datasets/mojow_rock
ln -s ~/data/mojow_rock/rock_dataset3 ~/data/mojow_rock/rock_dataset3/ytvis19/JPEGImages

### db3_part12_ytvis_swinL       @ mj_rocks/idol-->vnext
python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/db3_part12_ytvis_swinL.yaml --num-gpus 2

CUDA_VISIBLE_DEVICES=1 python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/db3_part12_ytvis_swinL.yaml --num-gpus 1 

### db3_2_to_17_except_6_with_syn_ytvis_swinL       @ mj_rocks/idol-->vnext
python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/db3_2_to_17_except_6_with_syn_ytvis_swinL.yaml --num-gpus 2


### db3_2_to_17_except_6_ytvis_swinL       @ mj_rocks/idol-->vnext
python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/db3_2_to_17_except_6_ytvis_swinL.yaml --num-gpus 2













