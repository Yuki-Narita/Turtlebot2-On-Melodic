<!-- 
仮想環境のubuntu18でturtlebotのbringupまで出来たので手順をスクリプトにして書いておきました。
もし今の方法で動かなかったら試してみてください。　 
前に渡した探査パッケージのインストールも一緒にやってくれます。


コピペ用txtファイルも以下に置いておきます

短縮url版(多分使えるはず)
https://bit.ly/33dkNW2

フルurl版
https://tdu.box.com/s/l6w5r1eaw8fvz10dwahobb1dihj8oe87

-->
# インストール
catkin_wsにあるturtlebot関連のディレクトリを削除してから次のスクリプトを実行してください。
```
$ sudo apt install curl
$ bash <(curl -sL https://raw.githubusercontent.com/Yuki-Narita/Turtlebot2-On-Melodic/master/install_basic.sh)
```
上のコマンドを打つとインストールからコンパイルまで全部やってくれます(場合によってはそこそこ時間が掛かるかもしれません)。
多分エラー無しで行けると思います。
処理が終了したらターミナルを再起動（もしくは source ~/.bashrc ）してください。

bringupのコマンドが実行できると思います
```
$ roslaunch turtlebot_bringup  minimal.launch
```
# 以下,元のreadme

# Turtlebot2-On-Melodic
Make your [Turtlebot2](https://www.turtlebot.com/turtlebot2/) run on ROS Melodic (Ubuntu 18.04).

![](https://www.turtlebot.com/assets/images/turtlebot_2_lg.png)

This project referenced [this issue](https://github.com/turtlebot/turtlebot/issues/272). Thanks to the work of [bunchofcoders](https://github.com/bunchofcoders) and [ProfJust](https://github.com/ProfJust).

## Prerequisites

- ROS Melodic on Ubuntu 18
- Turtlebot2

## Build Turtlebot2 Workspace
Firstly, `cd` to your catkin workspace. 

If you don't have one, `cd` to somewhere you want to create it, and then run the following commands to create one
```
mkdir -p src
catkin_make
```

Now run the following command (inside the root of catkin workspace) to build up running environment for Turtlebot2
```
curl -sLf https://raw.githubusercontent.com/gaunthan/Turtlebot2-On-Melodic/master/install_basic.sh | bash
catkin_make
```

## Bring Up Turtlebot2
Now connect a turtlebot2 to the computer. After that, run this command to bring up the Turtlebot2
```
source ./devel/setup.bash
roslaunch turtlebot_bringup minimal.launch
```

If nothing wrong, you will hear the Turtlebot2 give out a reminder.

## Test Turtlebot2
If you want to use keyboard to control it, just run the following command
```
source ./devel/setup.bash
roslaunch turtlebot_teleop keyboard_teleop.launch
```

And it will output something like this

```
ROS_MASTER_URI=http://localhost:11311

process[turtlebot_teleop_keyboard-1]: started with pid [23757]

Control Your Turtlebot!
---------------------------
Moving around:
   u    i    o
   j    k    l
   m    ,    .

q/z : increase/decrease max speeds by 10%
w/x : increase/decrease only linear speed by 10%
e/c : increase/decrease only angular speed by 10%
space key, k : force stop
anything else : stop smoothly

CTRL-C to quit

currently:	speed 0.2	turn 1 
```

Now you should be able to use keyboard to control your Turtlebot2.
