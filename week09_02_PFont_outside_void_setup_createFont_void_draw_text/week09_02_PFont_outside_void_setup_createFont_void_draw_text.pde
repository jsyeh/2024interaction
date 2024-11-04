// week09_02_PFont_outside_void_setup_createFont_void_draw_text
PFont font0, font, font2; // 3種字型: 英文、中文、注音文 (外面宣告,兩個函式都看得到)
void setup() {
  size(500, 500); //大視窗
  font0 = createFont("Algerian", 50); // Arial 或 Times New Roman
  font = createFont("微軟正黑體", 50);
  font2 = createFont("elffont-rock.otf", 50); //字型檔,也要拉近來哦!
  // println(PFont.list()); // 印出現在能用的系統的所有的字型
}
void draw() {
  background(0); //黑色背景
  textSize(50);
  //PFont font0 = createFont("Ariel", 50); 不能寫在裡面,建幾萬次字型電腦會亂掉
  textFont(font0);
  text("Hello", 50, 50);

  //PFont font = createFont("標楷體", 50);  不能寫在裡面
  textFont(font);
  text("中文看到了", 50, 150);

  //PFont font2 = createFont("elffont-rock.otf", 50);  不能寫在裡面
  textFont(font2); //記得先把點兩下安裝字型,才能順利 createFont()
  text("ㄇㄉㄈㄎ", 50, 250);
}
