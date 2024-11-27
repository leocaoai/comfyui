FROM pytorch/pytorch:2.2.1-cuda12.1-cudnn8-runtime
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
ENV LANG=zh_CN.UTF-8
WORKDIR /app

RUN pip config set global.index-url http://mirrors.aliyun.com/pypi/simple
RUN pip config set install.trusted-host mirrors.aliyun.com

COPY ../comfyui/ /app/comfyui/
WORKDIR /app/comfyui

RUN pip install -r ./requirements.txt

EXPOSE 8188
CMD [ "python","main.py ","--port 8188"]

