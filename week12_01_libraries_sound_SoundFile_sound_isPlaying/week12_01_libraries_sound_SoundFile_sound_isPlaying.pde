// week12_01_libraries_sound_SoundFile_sound_isPlaying
// 官網-Documentation文件-Libraries函式庫(圖書館)-Sound聲音部分
// https://processing.org/reference/libraries/sound/index.html
// 我們教過 play() stop() pause(), 今天想要試 isPlaying() 是不是在播放
import processing.sound.*;
SoundFile sound1, sound2; //兩段音樂
int playing = 2;
void setup(){
  size(640,360);
  background(255);
  sound1 = new SoundFile(this, "Intro Song_Final.mp3"); // week09_04 可下載
  sound2 = new SoundFile(this, "In Game Music.mp3"); // week09_04 可下載
}
void draw(){
  if(sound1.isPlaying()){//音樂1有沒有在播放
    playing=1;
  }else if(sound2.isPlaying()){ // 音樂2有沒有在播放
    playing=2;
  }else{ // 沒有任何音樂在播放
    if(playing==1) sound2.play(); // 換另外一首
    else sound1.play();
  }
}
