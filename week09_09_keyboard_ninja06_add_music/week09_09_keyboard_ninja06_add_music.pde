// week09_09_keyboard_ninja06_add_music
import processing.sound.*;
SoundFile sound1, sound2, sound3;
PImage board; // 外面宣告變數
void setup() {
  size(600, 400);
  board = loadImage("board.png"); // 裡面修改變數
  randomApple();
  sound1 = new SoundFile(this, "Intro Song_Final.mp3");
  sound2 = new SoundFile(this, "Gong.mp3");
  sound3 = new SoundFile(this, "In Game Music.mp3");
  background(board); //先畫背景, 以免看起來像當機的灰色畫面
  sound1.play();
}
float appleX = 100, appleY = 500, appleVX = 5, appleVY= -30;
char appleKey; // 蘋果上面, 要秀的字母
void randomApple() {
  appleX = random(100, 500);
  appleY = 500;
  if (appleX<300) appleVX = random(0, 8);
  else appleVX = random(-8, 0);
  appleVY = random(-30, -25);
  appleKey = (char) ('a' + int(random(26)));
}
int score = 0;
void keyPressed() {
  if(state==0){
    state = 1; // 按任意鍵,會開始 3,2,1倒數
    sound1.stop();
    sound2.play(); // 3
  } else if(state==2){
    if (key==appleKey) {
      score += 100; //答對加分
    } else {
      score -= 20; //答錯扣少少分
    }
  }
}
int state = 0; //0: wait, 1: 3, 2, 1, GO, 2: Game
int countdown = 60*4; // 倒數計時3秒+GO1秒
void draw() {
  background(board); //裡面使用變數
  textSize(50);
  textAlign(CENTER,CENTER);
  fill(255,255,0);
  if (state==0) text("Press any Key to Start", 300, 200);
  else if(state==1){
    textSize(100);
    countdown--;
    if(countdown%60 == 0){
      sound2.stop(); // 同一個音樂關掉
      sound2.play(); // 再播一次, 有點像打鼓的節奏的感覺
    }
    if(countdown>60*3) text("3", 300, 200);
    else if(countdown>60*2) text("2", 300, 200);
    else if(countdown>60*1) text("1", 300, 200);
    else if(countdown>0) text("GO", 300, 200);
    else {
      state = 2; //時間用完, 就跳入新的畫面
      sound2.stop();
      sound3.loop();
    }
  } else {
    text("Score:"+score, 400, 50);
    fill(255, 0, 0);
    ellipse(appleX, appleY, 80, 80); // 紅色的蘋果
    fill(255, 255, 0);
    textSize(50);
    textAlign(CENTER, CENTER);
    text(appleKey, appleX, appleY);
    appleX += appleVX; // 照著運動的速度, X往右移
    appleY += appleVY; // 照著運動的速度, Y也會移動
    appleVY += 0.98; // 0.98 gravity 重力加速度 (移動的速度, 會受到「加速度」影響)
    if (appleX > 600 || appleX < 0 || appleY > 550) {
      randomApple(); // 當蘋果出界時, 重設新的蘋果的位置、速度
    }
  }
}
