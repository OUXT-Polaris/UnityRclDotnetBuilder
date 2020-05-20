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
RUN vcs import src < ros2_dotnet.repos
WORKDIR /ros2_dotnet_ws/src
# ToDo : add git clone lines for the custom message
WORKDIR /ros2_dotnet_ws
RUN rosdep install -y -r -i --from-paths src --ignore-src --rosdistro eloquent
RUN ["/bin/bash", "-c", "source /opt/ros/eloquent/setup.bash && colcon build --event-handlers console_cohesion+ console_package_list+"]
RUN mkdir /UnityRclDotnet
# copy files from rcldotnet
RUN cp /ros2_dotnet_ws/install/rcldotnet/lib/rcldotnet/dotnet/builtin_interfaces_assemblies.dll /UnityRclDotnet
RUN cp /ros2_dotnet_ws/install/rcldotnet/lib/librcldotnet_native.so /UnityRclDotnet
RUN cp /ros2_dotnet_ws/install/rcldotnet/lib/librcldotnet_node_native.so /UnityRclDotnet
RUN cp /ros2_dotnet_ws/install/rcldotnet/lib/librcldotnet_publisher_native.so /UnityRclDotnet
RUN cp /ros2_dotnet_ws/install/rcldotnet/lib/rcldotnet/dotnet/rcldotnet_assemblies.dll /UnityRclDotnet
RUN cp /ros2_dotnet_ws/install/rcldotnet/lib/rcldotnet/dotnet/rcldotnet_common.dll /UnityRclDotnet
# copy files from std_msgs
RUN cp /ros2_dotnet_ws/install/std_msgs/lib/std_msgs/dotnet/std_msgs_assemblies.dll /UnityRclDotnet
RUN cp /ros2_dotnet_ws/install/std_msgs/lib/libstd_msgs__dotnetext_native.so /UnityRclDotnet
# copy files from actionlib_msgs
RUN cp /ros2_dotnet_ws/install/actionlib_msgs/lib/actionlib_msgs/dotnet/actionlib_msgs_assemblies.dll /UnityRclDotnet
RUN cp /ros2_dotnet_ws/install/actionlib_msgs/lib/libactionlib_msgs__dotnetext_native.so /UnityRclDotnet
# copy files from diagnostic_msgs
RUN cp /ros2_dotnet_ws/install/diagnostic_msgs/lib/diagnostic_msgs/dotnet/diagnostic_msgs_assemblies.dll /UnityRclDotnet
RUN cp /ros2_dotnet_ws/install/diagnostic_msgs/lib/libdiagnostic_msgs__dotnetext_native.so /UnityRclDotnet
# copy files from geometry_msgs
RUN cp /ros2_dotnet_ws/install/geometry_msgs/lib/geometry_msgs/dotnet/geometry_msgs_assemblies.dll /UnityRclDotnet
RUN cp /ros2_dotnet_ws/install/geometry_msgs/lib/libgeometry_msgs__dotnetext_native.so /UnityRclDotnet
# copy files from nav_msgs
RUN cp /ros2_dotnet_ws/install/nav_msgs/lib/nav_msgs/dotnet/nav_msgs_assemblies.dll /UnityRclDotnet
RUN cp /ros2_dotnet_ws/install/nav_msgs/lib/libnav_msgs__dotnetext_native.so /UnityRclDotnet
# copy files from sensor_msgs
RUN cp /ros2_dotnet_ws/install/sensor_msgs/lib/sensor_msgs/dotnet/sensor_msgs_assemblies.dll /UnityRclDotnet
RUN cp /ros2_dotnet_ws/install/sensor_msgs/lib/libsensor_msgs__dotnetext_native.so /UnityRclDotnet
# copy files from shape_msgs
RUN cp /ros2_dotnet_ws/install/shape_msgs/lib/shape_msgs/dotnet/shape_msgs_assemblies.dll /UnityRclDotnet
RUN cp /ros2_dotnet_ws/install/shape_msgs/lib/libshape_msgs__dotnetext_native.so /UnityRclDotnet
# copy files from stereo_msgs
RUN cp /ros2_dotnet_ws/install/stereo_msgs/lib/stereo_msgs/dotnet/stereo_msgs_assemblies.dll /UnityRclDotnet
RUN cp /ros2_dotnet_ws/install/stereo_msgs/lib/libstereo_msgs__dotnetext_native.so /UnityRclDotnet
# copy files from trajectory_msgs
RUN cp /ros2_dotnet_ws/install/trajectory_msgs/lib/trajectory_msgs/dotnet/trajectory_msgs_assemblies.dll /UnityRclDotnet
RUN cp /ros2_dotnet_ws/install/trajectory_msgs/lib/libtrajectory_msgs__dotnetext_native.so /UnityRclDotnet
# copy files from visualization_msgs
RUN cp /ros2_dotnet_ws/install/visualization_msgs/lib/visualization_msgs/dotnet/visualization_msgs_assemblies.dll /UnityRclDotnet
RUN cp /ros2_dotnet_ws/install/visualization_msgs/lib/libvisualization_msgs__dotnetext_native.so /UnityRclDotnet
# copy files from unique_identifier_msgs
RUN cp /ros2_dotnet_ws/install/unique_identifier_msgs/lib/unique_identifier_msgs/dotnet/unique_identifier_msgs_assemblies.dll /UnityRclDotnet
RUN cp /ros2_dotnet_ws/install/unique_identifier_msgs/lib/libunique_identifier_msgs__dotnetext_native.so /UnityRclDotnet
