#!/usr/bin/env sh

sudo apt update
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws
sudo apt install python-catkin-tools
catkin build

cd src

git clone https://github.com/Yuki-Narita/turtlebot.git
git clone https://github.com/turtlebot/turtlebot_msgs.git
git clone https://github.com/turtlebot/turtlebot_apps.git
git clone https://github.com/turtlebot/turtlebot_simulator

git clone https://github.com/yujinrobot/kobuki_msgs.git
git clone https://github.com/yujinrobot/kobuki.git
mv kobuki/kobuki_description kobuki/kobuki_node \
  kobuki/kobuki_keyop kobuki/kobuki_safety_controller \
  kobuki/kobuki_bumper2pc ./
rm -rf kobuki

git clone https://github.com/yujinrobot/yujin_ocs.git
mv yujin_ocs/yocs_cmd_vel_mux yujin_ocs/yocs_controllers .
rm -rf yujin_ocs

sudo apt install ros-melodic-kobuki-* -y
sudo apt install ros-melodic-ecl-streams -y

#追加分
sudo apt install -y ros-melodic-urdf ros-melodic-xacro ros-melodic-diagnostic-updater ros-melodic-joy ros-melodic-robot-state-publisher ros-melodic-diagnostic-aggregator
catkin build
