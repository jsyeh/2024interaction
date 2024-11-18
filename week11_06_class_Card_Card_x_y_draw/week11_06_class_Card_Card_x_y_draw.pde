// week11_06_class_Card_Card_x_y_draw
class Card { // 發明一種類別 class 叫大寫的卡片
  int x, y;
  Card(int _x, int _y) { // 建構函式
    x = _x;  y = _y;
  }
  void draw() {
    rect(x, y, 100, 150);
  }
} // 下面: 照著卡片類別, 發明1個物件 card1 
Card card1 = new Card(100, 100); //座標在 100,100
void setup(){
  size(500, 400);
}
void draw(){
  card1.draw();
}
