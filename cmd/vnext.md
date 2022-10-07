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

cd projects/IDOL/idol/models/ops/
sh make.sh





















