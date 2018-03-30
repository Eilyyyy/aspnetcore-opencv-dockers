FROM microsoft/dotnet
MAINTAINER eilyyy <eilyyy@outlook.com>
ENV OPENCV_VERSION="3.4.1"
RUN apt-get update && apt-get install -y cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev unzip wget \
    && wget https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip -O opencv-${OPENCV_VERSION}.zip \
	&& wget https://github.com/opencv/opencv_contrib/archive/${OPENCV_VERSION}.zip -O opencv_contrib-${OPENCV_VERSION}.zip \
	&& unzip opencv-${OPENCV_VERSION}.zip \
	&& unzip opencv_contrib-${OPENCV_VERSION}.zip \
	&& mkdir /opencv-${OPENCV_VERSION}/cmake_binary \
	&& cd /opencv-${OPENCV_VERSION}/cmake_binary \
	&& cmake -DBUILD_TIFF=ON \
	-DBUILD_opencv_java=OFF \
	-DWITH_CUDA=OFF \
	-DENABLE_AVX=ON \
	-DWITH_OPENGL=ON \
	-DWITH_OPENCL=ON \
	-DWITH_IPP=ON \
	-DWITH_TBB=ON \
	-DWITH_EIGEN=ON \
	-DWITH_V4L=ON \
	-DBUILD_TESTS=OFF \
	-DBUILD_PERF_TESTS=OFF \
	-DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-{OPENCV_VERSION}/modules \
	-DCMAKE_BUILD_TYPE=RELEASE .. \
	&& make \
	&& make install \
	&& rm /opencv-${OPENCV_VERSION}.zip \
	&& rm /opencv_contrib-${OPENCV_VERSION}.zip \
	&& rm -r /opencv-${OPENCV_VERSION} \
	&& rm -r /opencv_contrib-${OPENCV_VERSION} \
	&& apt-get remove -y cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev unzip wget && apt-get autoremove\
	&& rm -rf /var/lib/apt/lists/*