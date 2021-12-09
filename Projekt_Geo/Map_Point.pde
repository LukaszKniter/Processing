class Map_Point {
  float x, y;  //współrzędne x i y okręgów
  //int[] kol;
  int reds;
  int blues;

  float diam2;
  float diameter;//średnica okręgu
  float a;
  boolean on = true; 
  void start(float xpos, float ypos,float diam, int[] kolor) {
    x = xpos;

    y = ypos;

    reds = kolor[0];
    blues = kolor[2];
    diameter = diam;
    diam2 =1;
    on = true;
    a = 50;
  }

  void grow() {
    if (on == true) {
      diam2 += diameter/30;
    }
    else
      diam2 = diameter;
  }
  
  void display() {
      //noFill();
      if (diam2 > diameter){
        on = false;
      }
      noStroke();
      //

      //strokeWeight(diam2);
      //stroke(reds, 0, blues);
      point(x,y);
      float h=reds+100;
      int radius = int(diam2);
      for (int r = radius; r > 0; --r) {
        fill(h*2,100, 159);
        ellipse(x, y, r, r);
        h = (h - 25) % (reds+100);
      }
  }
      //ellipse(x, y, diameter, diameter);
 }
