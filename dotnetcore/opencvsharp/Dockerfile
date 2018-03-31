FROM jingqian/aspnetcore-opencv-dockers:dotnetcore
MAINTAINER eilyyy <eilyyy@outlook.com>
RUN apt-get update && apt-get install -y git cmake g++ libgdiplus \
    && git clone https://github.com/shimat/opencvsharp.git \
    && mkdir opencvsharp/src/build \
    && cd opencvsharp/src/build \
    && cmake .. \
    && make \
    && make install \
    && rm -r /opencvsharp \
    && apt-get remove -y cmake git g++ && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*