
int w= 478, h = 900; 
float x=50 , y=550 ; //The location of the text
PFont roboto, ticketing; //place the .ttf file of any other fonts into the data file
String codeFileName = "code.txt";
String citiesFileName = "cities.txt";
String backGroundFileName = "test.png";
float fontSize = 140;
//below should not be changed unless necessary
PImage bg;
int index = 0, strDevider;
String[] cities, code;
float r, g, b;
float fontSizegg;

void setup(){
  size(478,900);//The diamentions of PNG file
  frameRate(260);//The speed of which the app will run
  
  code = loadStrings(codeFileName);
  cities = loadStrings(citiesFileName);
  bg= loadImage(backGroundFileName);
  roboto = createFont("roboto.ttf",300); //font 1
  ticketing = createFont("ticketing.ttf", fontSize); //font 2

}
void draw(){
  background(bg);
  barColor();
  leftBar();
  rightBar();
  mainName();
  initials();
  
  saveFrame(cities[index] +".png"); //to export the design
  
  fontSizegg = fontSize;
  index++; // counter to display 1 city per frame
  
  if (index > cities.length -1 || cities[index] == ""){ //tells the app to stop
     exit(); 
  }
}
//it displays the left bar
void leftBar(){
    noStroke();
    fill(r,g,b); 
    rect(0,100,w/15,700); 
}
//it displays the right bar
void rightBar(){
    noStroke();
    fill(r,g,b);
    rect((w-(w/15)),100,w/15,700); 
}
//prints the cities code
void initials(){
    fill(255);
    textFont(roboto,60);
    text(code[index], 315,230);
}
//prints the cities names
void mainName(){
  //it checks if city name is short so it does no devid it
  if(cities[index].length() <= 6){ 
    strDevider = 0;
  }else if(cities[index].length() >= 7 && cities[index].length() < 9){
    strDevider =3;
  }else if(cities[index].length() >= 9 && cities[index].length() < 11){
    strDevider =3;
    fontSizegg -= 20;
  }else if(cities[index].length() >= 11){
    strDevider =3;
    fontSizegg -= 40;
  }else{
   strDevider = 2; 
  }
  fill(0);
  textFont(ticketing,fontSizegg);
  text(cities[index].substring(0, strDevider), x,y);
  text(cities[index].substring(strDevider), x,y+125);
}
//sets the colour of the side bars
void barColor(){
    r = random(0,255);
    g = random(0,255);
    b = random(0,255); 
}
