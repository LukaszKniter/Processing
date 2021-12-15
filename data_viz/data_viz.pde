Point[] points;
Table table;

PImage img_w;
PImage img_b;
PImage img_v;
PImage img_p;

void setup(){
  fullScreen();
   
  //loadData_b();
  
  img_w = loadImage("wine.png");
  img_b = loadImage("beer.png");
  img_v = loadImage("vodka.png");
  img_p = loadImage("pure.png");
  
 
}

void draw() {
  background(0, 255, 0);
  image(img_w, width-50, 20);
  image(img_b, width-100, 20);
  image(img_v, width-150, 20);
  image(img_p, width-200, 20);
  
  loadData_b();
  
  for(int i = 0; i < points.length; i++) {
    points[i].display();
    points[i].rollover(mouseX, mouseY);
  }
     
}
  
void loadData_b() {
  table = loadTable("data.csv", "header");
  points = new Point[table.getRowCount()];
  
  for (int i = 0; i < table.getRowCount(); i++) {
    TableRow row = table.getRow(i);
    float x = map(row.getFloat("CapitalLongitude"), -180,180, 0, width);
    float y = map(row.getFloat("CapitalLatitude"),-90,90,height,0);
    float d = map(row.getFloat("beer_servings"), 0, 100, 0, 20);
    String n = row.getString("CountryName");
    points[i] = new Point(x, y, d, n);
  }
}
