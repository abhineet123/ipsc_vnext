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

pip install -r requirements.txt
pip install -e .
pip install shapely==1.7.1
pip install git+https://github.com/youtubevos/cocoapi.git#"egg=pycocotools&subdirectory=PythonAPI"

python3 -m pip install pycocotools

## cuda_operators       @ install-->vnext
cd projects/IDOL/idol/models/ops/
python3 setup.py build install

git clone https://github.com/youtubevos/cocoapi
cd cocoapi/PythonAPI
python3 setup.py build_ext install


# idol
## all_frames_roi_g2_0_38_swinL       @ idol-->vnext
python3 projects/IDOL/train_net.py --config-file projects/IDOL/configs/ipsc-all_frames_roi_g2_0_38_swinL.yaml --num-gpus 3 




















