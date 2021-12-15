class Point {
  float x, y;
  float diameter;
  String name;
  
  boolean over = false;
  
  Point(float x_, float y_, float diameter_, String s) {
    x = x_;
    y = y_;
    diameter = diameter_;
    name = s;
  }
  
  void rollover(float px, float py) {
    float d = dist(px, py, x, y);
    if (d < diameter/2) {
      over = true;
    } else {
      over = false;
    }
  }
  
  void display() {
    stroke(0);
    fill(255,0,0);
    ellipse(x, y, diameter, diameter);
    if(over){
      fill(0);
      textAlign(CENTER);
      text(name, x, y+diameter/2+20);
    }
  }
}
