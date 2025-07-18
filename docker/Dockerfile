FROM nvidia/cuda:11.8.0-runtime-ubuntu22.04

# 设置环境变量，确保后续的命令不会等待用户输入
ENV DEBIAN_FRONTEND=noninteractive

### change the system source for installing libs
ARG USE_SRC_INSIDE=true
RUN sed -i s/archive.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list ;
RUN sed -i s/security.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list ;
RUN echo "Use aliyun source for installing libs" ;

# 更新包索引
RUN apt-get update
RUN apt-get install -y --no-install-suggests --no-install-recommends \
  vim wget curl dmidecode tzdata poppler-utils python3 python3-pip 

# make some useful symlinks that are expected to exist
RUN ln -sf /usr/bin/pydoc3 /usr/local/bin/pydoc
RUN ln -sf /usr/bin/python3 /usr/local/bin/python

RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

ADD requirements.txt requirements.txt
RUN pip install -r requirements.txt

# setup jupyter
RUN pip install jupyterlab
RUN pip install jupyter-core
RUN pip install --upgrade jupyter
RUN pip install --upgrade ipykernel
RUN pip install ipywidgets
COPY jupyter_lab_config.py /root/.jupyter/jupyter_lab_config.py

# alias
RUN echo "alias ll='ls $LS_OPTIONS -l'" >> /root/.bashrc

# timezone
RUN echo 'export LANG="C.UTF-8"'>>/root/.bashrc; \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime; \
    echo "Asia/Shanghai" > /etc/timezone

# RUN pip install flask flask-sqlalchemy flask_wtf wtforms[email] flask-sijax


WORKDIR /opt/code/
ENTRYPOINT ["jupyter-lab", "--port=8888", "--ip=0.0.0.0", "--no-browser", "--allow-root", "--NotebookApp.token=''"]