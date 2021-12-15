class Map_Point {
  float x, y;  //współrzędne x i y okręgów
  //int[] kol;
  int reds;
  int blues;
  
  String CountryName;

  float diam2;
  float diameter;//średnica okręgu
  float a;
  boolean on = true;
  boolean over = false;
  void start(float xpos, float ypos,float diam, int[] kolor, String s) {
    x = xpos;
    y = ypos;

    reds = kolor[0];
    blues = kolor[2];
    diameter = diam;
    diam2 =1;
    on = true;
    a = 50;
    CountryName = s;
  }

  void grow() {
    if (on == true) {
      diam2 += diameter/30;
    }
    else
      diam2 = diameter;
  }
  
  void rollover(float px, float py) {
    float d = dist(px, py, x, y);
    if(d < diameter/2) {
      over = true;
    } else {
      over = false;
    }
  }
  
  void display() {
      //noFill();
      if (diam2 > diameter){
        on = false;
      }
     
      noStroke();
      point(x,y);
      
      float h=reds+100;
      int radius = int(diam2);
      
      fill(reds*3,159-reds,0);
      ellipse(x, y, radius, radius);
      
      if(over) {
        fill(0);
        textAlign(CENTER);
        text(CountryName, x, y+diameter/2+20);
      }
        
      }
}
