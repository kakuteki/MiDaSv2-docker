# NVIDIAのCUDAベースイメージを使用
FROM nvidia/cuda:11.8.0-base-ubuntu20.04

# パッケージリストの更新と基本的なツールのインストール
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    curl \
    wget \
    python3 \
    python3-pip \
    vim \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Pythonとpipのアップグレード
RUN python3 -m pip install --upgrade pip

# Pythonパッケージのインストール
RUN pip install \
    timm \
    torch \
    torchvision \
    opencv-python

# 作業ディレクトリの設定
WORKDIR /app

# コンテナ起動時に実行されるデフォルトのコマンド
CMD ["bash"]
