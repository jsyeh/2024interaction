// week09_04_multiple_sound_files_keyPressed_stop_play
import processing.sound.*;
SoundFile sound1, sound2, hit;
void setup(){
  size(500, 500);
  sound1 = new SoundFile(this, "In Game Music.mp3");
  sound2 = new SoundFile(this, "Intro Song_Final.mp3");
  hit = new SoundFile(this, "sword slash.mp3");
  sound2.play(); // 開始時, 先播放開場的音樂
}
void draw(){
  background(255);
}
void mousePressed(){
  hit.play(); // mouse按下時, 揮劍的聲音
}
void keyPressed(){
  if(key=='1') {
    sound2.stop();
    sound1.play();
  }else{
    sound1.stop();
    sound2.play();
  }
}
