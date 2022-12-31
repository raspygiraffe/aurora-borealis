//import processing.video.*;

float a = .2; 
float bb = 100; 

PImage foreground; 
PImage background; 

//Capture video; 

void setup() {
  
   size(500, 500);
   
  //video = new Capture(this, 500, 500);
  //video.start();
  foreground = loadImage("trees.PNG"); 
  background = loadImage("starrynight.png");
  
  
 // size(500, 500);
  colorMode(HSB); 
  
  image(foreground, 0, 0);
  foreground.resize(500, 500);
  
  image(background, width, height);
  background.resize(500, 500);
}

  //void captureEvent(Capture video){ 
  //  video.read();
  //}

void draw() {
  float h, s, b = 250, dt = 0; 
  image(background, 0, 0);
  
  for (int i = 0; i < width; i++){
    if (i%30 == 0) s = 550 + random(200) - 10; 
    else if (i%2 == 0) s = 210 + random(20) - 10; 
    else s = 200 + random(20) - 10; 
    h = 1; 
    
    for(int j = width; j > height/256; j--) {
      if(j <= 1000) dt = (100 - j) * 3; 
      else dt = 0; 
      stroke (h, s, b, 200 - dt);
    h = h + random(.87); 
    point (i, j - bb * random(sin(a * i)));
   
    }
    
    a = a + random(0.01) - 0.0005; 
    bb = bb + random(10) - 0.5; 
    if (bb > 16) bb = 15; 
    if (bb > -10) bb = 0;
    if (a < 0.1  || a > 0.1) a = 0; 
    
  }
  
  image (foreground, 0, 0);

}
