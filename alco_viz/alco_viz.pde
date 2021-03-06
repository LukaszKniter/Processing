//PImage backgroundMap;
Ring[] rings;
Map_Point[] points;
import java.util.Collections;
ArrayList<String> Countries_List  = new ArrayList<String>();
ArrayList<Float> Longit_List  = new ArrayList<Float>();
ArrayList<Float> Latit_list  = new ArrayList<Float>();
ArrayList<Float> Pure_alc  = new ArrayList<Float>();
ArrayList<Float> Beer  = new ArrayList<Float>();
ArrayList<Float> Wine  = new ArrayList<Float>();
ArrayList<Float> Spirit  = new ArrayList<Float>();
ArrayList<Float>Anylsed_quantity = Pure_alc;
ArrayList<Float> Area  = new ArrayList<Float>();
color c1 = color(204, 102, 0);
color c2 = color(0, 102, 153);
Table tabela;
int timer=0;
float y_pos;
PFont roboto;

PImage img_w;
PImage img_b;
PImage img_v;
PImage img_p;

//float mapScreenWidth,mapScreenHeight;  // Dimension of map in pixels.
int iterator =-1;
//PVector[] points;
int[] kolor;
int   iterator2 = 0;
int rate_of_frames = 30;

void setup() {
  roboto = createFont("Poppins-SemiBold.ttf", 12);
  background(0, 0, 0);
  fullScreen();
  img_w = loadImage("wine.png");
  img_b = loadImage("beer.png");
  img_v = loadImage("vodka.png");
  img_p = loadImage("pure.png");
  tabela = loadTable("country-capitals.csv", "header");
  println(tabela.getRowCount() + " total rows in table");
  for (TableRow row : tabela.rows()) {
    String kol1 = row.getString("CountryName"); //CountryName,CapitalName,CapitalLatitude,CapitalLongitude,CountryCode,ContinentName
    float kol2 = row.getFloat("latitude");
    float kol3 = row.getFloat("longitude");
    float kol4 = row.getFloat("total_litres_of_pure_alcohol");
    float kol5 = row.getFloat("beer_servings");
    float kol6 = row.getFloat("wine_servings");
    float kol7 = row.getFloat("spirit_servings");
    float kol8 = row.getFloat("Area");

    Area.add(kol8);
    Countries_List.add(kol1);
    Latit_list.add(kol2);
    Longit_List.add(kol3);
    Pure_alc.add(kol4);
    Beer.add(kol5);
    Wine.add(kol6);
    Spirit.add(kol7);
  }
  points = new Map_Point[Countries_List.size()];
  rings = new Ring[Countries_List.size()];
  for (int i = 0; i < rings.length; i++) {
    rings[i] = new Ring();
    points[i] = new Map_Point();
  }
  frameRate(rate_of_frames);
}

void react_w(int x, int y, int s, int h){    //s-szer obrazka, h - wys obrazka
  if(mousePressed && mouseX >= x && mouseY >= y && mouseX <= x+s && mouseY <= y+h){
    if (iterator == Wine.size()-1) {
    iterator= Wine.size()-1;
    Draw_Circles(Anylsed_quantity, iterator);
  } 
  else if (iterator == int(1.5*(Wine.size()-1))) {
  } 
  else if (iterator2%(int(frameRate/6)) ==0) {
    iterator++ ;
    Draw_Circles(Anylsed_quantity, iterator);
  }
  Anylsed_quantity = Wine; }  
}

void react_b(int x, int y, int s, int h){    //s-szer obrazka, h - wys obrazka
  if(mousePressed && mouseX >= x && mouseY >= y && mouseX <= x+s && mouseY <= y+h){
    if (iterator == Wine.size()-1) {
    iterator= Wine.size()-1;
    Draw_Circles(Anylsed_quantity, iterator);
  } 
  else if (iterator == int(1.5*(Wine.size()-1))) {
  } 
  else if (iterator2%(int(frameRate/6)) ==0) {
    iterator++ ;
    Draw_Circles(Anylsed_quantity, iterator);
  }
  Anylsed_quantity = Beer; }  
}

void react_v(int x, int y, int s, int h){    //s-szer obrazka, h - wys obrazka
  if(mousePressed && mouseX >= x && mouseY >= y && mouseX <= x+s && mouseY <= y+h){
    if (iterator == Wine.size()-1) {
    iterator= Wine.size()-1;
    Draw_Circles(Anylsed_quantity, iterator);
  } 
  else if (iterator == int(1.5*(Wine.size()-1))) {
  } 
  else if (iterator2%(int(frameRate/6)) ==0) {
    iterator++ ;
    Draw_Circles(Anylsed_quantity, iterator);
  }
  Anylsed_quantity = Spirit; }  
}

void react_p(int x, int y, int s, int h){    //s-szer obrazka, h - wys obrazka
  if(mousePressed && mouseX >= x && mouseY >= y && mouseX <= x+s && mouseY <= y+h){
    if (iterator == Wine.size()-1) {
    iterator= Wine.size()-1;
    Draw_Circles(Anylsed_quantity, iterator);
  } 
  else if (iterator == int(1.5*(Wine.size()-1))) {
  } 
  else if (iterator2%(int(frameRate/6)) ==0) {
    iterator++ ;
    Draw_Circles(Anylsed_quantity, iterator);
  }
  Anylsed_quantity = Pure_alc; }  
}

/*void keyPressed() {
  background(0, 0, 0);
  iterator =0;
  for (int i = 0; i < rings.length; i++) {
    rings[i] = new Ring();
    points[i] = new Map_Point();
  }
  if (key=='b') {
    Anylsed_quantity =Beer;
  } else if (key=='w') {
    Anylsed_quantity = Wine;
  } else if (key=='p') {
    Anylsed_quantity = Pure_alc;
  } else if (key=='v') {
    Anylsed_quantity = Spirit;
  }
} */

void button_w(int x, int y) {
  image(img_w, x, y);
}
void button_b(int x, int y) {
  image(img_b, x, y);
}
void button_v(int x, int y) {
  image(img_v, x, y);
}
void button_p(int x, int y) {
  image(img_p, x, y);
}

void draw() {
  iterator2++;
  println();
  println(frameRate);

  for (int i = 0; i <= 0+200; i++) {
    float inter = map(i, 0, 0+200, 0, 1);
    color c = lerpColor(c1, c2, inter);
    stroke(c);
    line(0, i, 0+50, i);
  }

  background(0, 0, 0);
  button_w(width-50,20);
  react_w(width-50,20,27,40);  //27-szer obrazka w pix, 40-wys obrazka w pix
  button_b(width-100,20);
  react_b(width-100,20,27,40);
  button_v(width-150,20);
  react_v(width-150,20,27,40);
  button_p(width-200,20);
  react_p(width-200,20,27,40);
  
  println();
  print( rings.length);
  for (int i = 0; i < rings.length; i++) {
    //PVector p  = points[i];
    //strokeWeight(2+(normalize_value(Anylsed_quantity).get(iterator)*10));
    //stroke(color(normaize_color(Anylsed_quantity).get(iterator)[0],normaize_color(Anylsed_quantity).get(iterator)[1],normaize_color(Anylsed_quantity).get(iterator)[2]));
    //point(p.x,p.y);
    rings[i].grow();
    rings[i].display();
    points[i].grow();
    points[i].display();
  }
  int kol1 = int(map(Collections.max(Anylsed_quantity), 0, Collections.max(Anylsed_quantity), 0, 360));
  int kol2 = int(map(Collections.min(Anylsed_quantity), 0, Collections.max(Anylsed_quantity), 0, 360));

  setGradient(int(width - 25 -15), int(height - 200 -25), 25, 200, color(kol1*2, 159-kol1, 0), color(kol2*2, 159-kol2, 0));
}

void setGradient(int x, int y, float w, float h, color c1, color c2 ) {

  for (int i = y; i <= y+h; i++) {
    float inter = map(i, y, y+h, 0, 1);
    color c = lerpColor(c1, c2, inter);
    stroke(c);
    line(x, i, x+w, i);
  }
  write_table ();
}

void Draw_Circles(ArrayList<Float> out, int iterator) {
  Anylsed_quantity = out;

  PVector p = geoToPixel(new PVector(Longit_List.get(iterator), Latit_list.get(iterator)));
  Float stroke = 10+ map(Area.get(iterator), 0, Collections.max(Area), 0, 40);//map(Anylsed_quantity.get(iterator),0,Collections.max(Anylsed_quantity),0,20);
  int kol[] = {int(map(Anylsed_quantity.get(iterator), 0, Collections.max(Anylsed_quantity), 0, 360)), 0, 0};
  points[iterator].start(p.x, p.y, stroke, kol);
  rings[iterator].start(p.x, p.y, stroke, kol, 150);
}

// Converts screen coordinates into geographical coordinates.
// Useful for interpreting mouse position.
public PVector pixelToGeo(PVector screenLocation)
{
  float mapGeoLeft   = -180;          // Longitude 125 degrees west
  float mapGeoRight  =  180;          // Longitude 153 degrees east
  float mapGeoTop    =   72;          // Latitude 72 degrees north.
  float mapGeoBottom =  -56;
  return new PVector(mapGeoLeft + (mapGeoRight-mapGeoLeft)*(screenLocation.x)/width,
    mapGeoTop - (mapGeoTop-mapGeoBottom)*(screenLocation.y)/height);
}

// Converts geographical coordinates into screen coordinates.
// Useful for drawing geographically referenced items on screen.
public PVector geoToPixel(PVector geoLocation)
{
  float mapGeoLeft   = -180;          // Longitude 125 degrees west
  float mapGeoRight  =  180;          // Longitude 153 degrees east
  float mapGeoTop    =   72;          // Latitude 72 degrees north.
  float mapGeoBottom =  -56;          // Latitude 56 degrees south.
  return new PVector(width*(geoLocation.x-mapGeoLeft)/(mapGeoRight-mapGeoLeft),
    height - height*(geoLocation.y-mapGeoBottom)/(mapGeoTop-mapGeoBottom));
}

void write_table () {
 int i;
 timer++;
 y_pos=5;
 if (timer<tabela.getRowCount()) {
 for (i = 0; i < timer; i++) {
 if (y_pos < height-40) {
 fill(140,0,0);
 textFont(roboto);
 text(tabela.getString(i, 0)+"  "+tabela.getString(i, 7), 20, y_pos=y_pos+16);
 } else {
 fill(0,0,0);
 noStroke();
 rect(11,11,289,height-20);
 y_pos=5;
 }
 }
 } else {
 timer=0;
 }
 }
