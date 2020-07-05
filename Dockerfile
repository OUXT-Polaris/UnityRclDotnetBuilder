FROM ros:eloquent-ros-core-bionic
RUN apt-get update
RUN apt-get install -y wget software-properties-common
RUN wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN add-apt-repository universe
RUN apt-get update
RUN apt-get install -y apt-transport-https dotnet-sdk-2.1
RUN mkdir -p /ros2_dotnet_ws/src
WORKDIR /ros2_dotnet_ws
RUN wget https://raw.githubusercontent.com/ros2-dotnet/ros2_dotnet/master/ros2_dotnet.repos
RUN apt-get -y install python3-vcstool python3-rosdep git python3-colcon-common-extensions
RUN vcs import src < ros2_dotnet.repos
RUN rm -rf /ros2_dotnet_ws/src/ros2_dotnet/ros2_dotnet
COPY *.py .
WORKDIR /ros2_dotnet_ws/src/ros2_dotnet/
RUN git clone https://github.com/OUXT-Polaris/ros2_dotnet.git
WORKDIR /ros2_dotnet_ws/src/ros2_dotnet/ros2_dotnet/
RUN git fetch --all
RUN git checkout feature/sequence_type
WORKDIR /ros2_dotnet_ws/src
# ToDo : add git clone lines for the additional message package
WORKDIR /ros2_dotnet_ws
RUN rosdep init
RUN rosdep update
RUN rosdep install -y -r -i --from-paths src --ignore-src --rosdistro eloquent
RUN apt-get install -y gcc g++
RUN ["/bin/bash", "-c", "source /opt/ros/eloquent/setup.bash && colcon build --event-handlers console_cohesion+ console_package_list+"]
RUN ["/bin/bash", "-c", "source /opt/ros/eloquent/setup.bash && source /ros2_dotnet_ws/install/local_setup.bash && python3 create_unity_plugin.py"]