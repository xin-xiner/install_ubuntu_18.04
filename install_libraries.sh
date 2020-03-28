uname=xin
cores=14
#update to newest kernel if it's neccessary.
sudo apt-get -y install linux-headers-generic-hwe-18.04-edge
sudo apt-get install linux-image-generic-hwe-18.04-edge
sudo apt-get install xserver-xorg-hwe-18.04

#basic tools
#install ssh
sudo apt-get install openssh-server

#install git
sudo apt-get install git

#install cmake
sudo apt-get install  cmake


cd /home/$uname
mkdir Libraries
mkdir Programs

#basic libraries-----------------------
cd Libraries

#Eigen
git clone https://gitlab.com/libeigen/eigen.git
mkdir eigen/build&cd eigen/build
cmake .. & make -j $cores
sudo make install
cd ../..

#Sophus
git clone https://github.com/strasdat/Sophus.git
mkdir Sophus/build && cd Sophus/build
cmake ..& make -j $cores
sudo make install
cd ../..

#ceres solver
sudo apt-get -y install libgflags-dev
sudo apt-get -y install libgoogle-glog-dev
sudo apt-get -y install libatlas-base-dev libopenblas-dev
sudo apt-get -y install libsuitesparse-dev
git clone https://github.com/ceres-solver/ceres-solver.git
mkdir ceres-solver/build && cd ceres-solver/build
cmake ..
make -j $cores
sudo make install 
cd ../..

#opencv
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git
cd opencv
mkdir build && cd build
##opencv dependencies
sudo apt-get -y install libgtk-3-dev
sudo apt-get -y install libjpeg-dev libpng12-dev libtiff5-dev libopenexr-dev
sudo apt-get -y install libdc1394-22-dev libraw1394-dev
sudo apt-get -y install ffmpeg libavcodec-dev libavutil-dev libavformat-dev libswscale-dev libavdevice-dev libv4l-dev
sudo apt-get install libxvidcore-dev libx264-dev
sudo apt-get install libatlas-base-dev gfortran


cmake -DOPENCV_EXTRA_MODULES_PATH=/home/$uname/Libraries/opencv_contrib/modules -DOPENCV_ENABLE_NONFREE:BOOL=ON ..
make -j $cores
sudo make install
cd ../..


#3D Graphic
sudo apt install libgl1-mesa-dev libglu1-mesa-dev libglfw3-dev libglm-dev freeglut3-dev
sudo apt install libglew-dev
##pangolin
git clone https://github.com/stevenlovegrove/Pangolin.git
mkdir Pangolin/build && cd Pangolin/build
cmake ..
make -j $cores
sudo make install
cd ../..
#If there is a error about "/usr/lib/x86_64-linux-gnu/libGL.so", reinstall cuda and skip libgl1-mesa-dev
#It looks like a confict between cuda and mesa.


#ros
sudo sh -c '. /etc/lsb-release && echo "deb http://mirrors.ustc.edu.cn/ros/ubuntu/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt update
sudo apt install ros-melodic-desktop-full



#Camera Drivers
##Intel Realsense
sudo apt-key adv --keyserver keys.gnupg.net --recv-key C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key C8B3A55A6F3EFCDE
sudo add-apt-repository "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo bionic main" -u
sudo apt update
sudo apt-get install librealsense2-dkms
sudo apt-get install librealsense2-utils
sudo apt-get install librealsense2-dev
sudo apt-get install librealsense2-dbg


#texlive
sudo apt-get install texlive-full

#Remote desk applications
##install x2go server
sudo add-apt-repository ppa:x2go/stable
sudo apt-get update
sudo apt-get install x2goserver x2goserver-xsession
##virtual gl
https://sourceforge.net/projects/virtualgl/files/




#install sogou input
#https://blog.csdn.net/weixin_42445727/article/details/81270916


#WineHQ
sudo dpkg --add-architecture i386
sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main' 
sudo apt update
sudo apt install --install-recommends winehq-stable






#Recommended applications
##clion
##pycharm
##Mathematica
##Remmina
##TexStudio


##matlab
#mkdir /home/$uname/temp
#sudo mount -t auto -o loop matlab_xxxxx.iso /home/$uname/temp
#cd /home/$uname/temp 
#sudo /home/$uname/temp/install




