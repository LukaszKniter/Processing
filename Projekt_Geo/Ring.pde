class Ring {
  float x, y;  //współrzędne x i y okręgów
  //int[] kol;
  int reds;
  int blues;
  float diameter;      //średnica okręgu
  float a;
  boolean on = true; 
 float transparency;// = 150;
  void start(float xpos, float ypos,float diam, int[] kolor,float transparent) {
    x = xpos;
    transparency = transparent;
    y = ypos;
    reds = kolor[0];
    blues = kolor[2];
    float fade = 0;
    diameter = diam;
    on = true;
    a = 50;
  }

  void grow() {
    if (on == true) {
      diameter += 0.5;
      /*if (diameter > 50) {
        on = false;
        diameter = 1;
      }*/
    }
  }
  
  
 /* void transparency(){
    if(on == true) {
      a-=5;
      if ( a < 0) {
        on = false;
        a = 50;
    }
    }
  } */
  
  void display() {
      noFill();
      strokeWeight(2);
      if (transparency > 0) { transparency -= 1; }
      float h = reds;
      stroke(h*2,100,159-h, transparency); ellipse(x, y, diameter, diameter);
      ellipse(x, y, diameter*0.75, diameter*0.75);
      ellipse(x, y, diameter*0.5, diameter*0.5);

     }
}
