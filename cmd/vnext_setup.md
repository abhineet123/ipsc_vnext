<!-- MarkdownTOC -->

- [virtualenv](#virtualen_v_)
    - [cc       @ virtualenv](#cc___virtualenv_)
        - [scp       @ cc/virtualenv](#scp___cc_virtualen_v_)
            - [from_grs       @ scp/cc/virtualenv](#from_grs___scp_cc_virtualen_v_)
            - [from_nrw       @ scp/cc/virtualenv](#from_nrw___scp_cc_virtualen_v_)
    - [windows       @ virtualenv](#windows___virtualenv_)
    - [cuda_version       @ virtualenv](#cuda_version___virtualenv_)
- [install](#install_)
    - [cocoapi       @ install](#cocoapi___instal_l_)
    - [cuda_operators       @ install](#cuda_operators___instal_l_)
        - [cc       @ cuda_operators/install](#cc___cuda_operators_install_)
- [bugs](#bug_s_)

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
## cc       @ virtualenv-->vnext_setup

module load python/3.8
module load gcc cuda cudnn
virtualenv vnext
source vnext/bin/activate
deactivate

alias vnxt='source vnext/bin/activate'

diskusage_report

<a id="scp___cc_virtualen_v_"></a>
### scp       @ cc/virtualenv-->vnext_setup
<a id="from_grs___scp_cc_virtualen_v_"></a>
#### from_grs       @ scp/cc/virtualenv-->vnext_setup
 scp -r -P 9738 abhineet@greyshark.cs.ualberta.ca:~/all_frames_roi_grs_221007.zip ./
 scp -r -P 9738 abhineet@greyshark.cs.ualberta.ca:/data/ipsc/well3/all_frames_roi/ytvis19 ./
 scp -r -P 9738 abhineet@greyshark.cs.ualberta.ca:~/scripts ~/
 scp -r -P 9738 abhineet@greyshark.cs.ualberta.ca:~/ipsc_vnext/pretrained ./
 scp -r -P 9738 abhineet@greyshark.cs.ualberta.ca:/data/ipsc/well3/all_frames_roi/ytvis19 ./

<a id="from_nrw___scp_cc_virtualen_v_"></a>
#### from_nrw       @ scp/cc/virtualenv-->vnext_setup
mkdir /data/vnxt_log
cd /data/vnxt_log
mkdir idol-ipsc-all_frames_roi_g2_0_38

scp -r asingh1@narval.computecanada.ca:~/scratch/ipsc_vnext_log/idol-ipsc-all_frames_roi_g2_0_38/model_0099999.pth ./

ln -s /data/vnxt_log/idol-ipsc-all_frames_roi_g2_0_38 ./

<a id="windows___virtualenv_"></a>
## windows       @ virtualenv-->vnext_setup
virtualenv vnext
cd vnext/Scripts
activate

<a id="cuda_version___virtualenv_"></a>
## cuda_version       @ virtualenv-->vnext_setup
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
## cocoapi       @ install-->vnext_setup
python3 -m pip uninstall pycocotools
git clone https://github.com/youtubevos/cocoapi
cd cocoapi/PythonAPI
python3 setup.py build_ext install
cd -

__buggy__
pip install git+https://github.com/youtubevos/cocoapi.git#"egg=pycocotools&subdirectory=PythonAPI"
python3 -m pip install pycocotools

<a id="cuda_operators___instal_l_"></a>
## cuda_operators       @ install-->vnext_setup
cd projects/IDOL/idol/models/ops/
python3 setup.py build install
cd -

<a id="cc___cuda_operators_install_"></a>
### cc       @ cuda_operators/install-->vnext_setup
salloc --nodes=1 --time=0:15:0 --account=def-nilanjan --gpus-per-node=1 --mem=4000M --cpus-per-task=4

module load cuda cudnn gcc python/3.8
source ~/vnext/bin/activate

cp -r projects/IDOL/idol/models/ops ~/
cd ~/ops/
python3 setup.py build install

<a id="bug_s_"></a>
# bugs
`AttributeError: module 'distutils' has no attribute 'version'`
python3 -m pip install setuptools==59.5.0

`RuntimeError: received 0 items of ancdata`
https://github.com/pytorch/pytorch/issues/973
torch.multiprocessing.set_sharing_strategy('file_system')
https://github.com/pytorch/pytorch/issues/973#issuecomment-459398189













