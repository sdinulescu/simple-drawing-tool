float stroke_weight = 1.0;
int counter = 1; // for unique filename every time a capture is taken

boolean red = false;
boolean green = false;
boolean blue = false;
float[] c = new float[3];

void setup() {
  fullScreen();
  background(255);
  
  for (int i = 0; i < c.length; i++) { c[i] = 0; } // start at black
}

void draw() {}

void mouseDragged() {
  if (stroke_weight < 0) { stroke_weight = 0; }
  strokeWeight(stroke_weight);
  if (red || green || blue) { stroke(c[0], c[1], c[2]); }
  line(pmouseX, pmouseY, mouseX, mouseY);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) { stroke_weight += 1.0; } 
    else if (keyCode == DOWN) { stroke_weight -= 1.0; } 
    
    if (keyCode == RIGHT) { 
      if (red) {
         c[0] += 10.0;
      } else if (green) {
        c[1] += 10.0;
      } else if (blue) {
        c[2] += 10.0;
      } 
    } else if (keyCode == LEFT) { 
      if (red) {
        c[0] -= 10.0;
      } else if (green) {
        c[1] -= 10.0;
      } else if (blue) {
        c[2] -= 10.0;
      } 
    }
  }
  
  if (key == ' ') {
    String n = "drawing_" + counter + ".jpg";
    save(n);
    counter++;
  } 
  else if (key == 'r') { red = true;  green = false; blue = false; }
  else if (key == 'g') { red = false; green = true;  blue = false; }
  else if (key == 'b') { red = false; green = false; blue = true;  }
  else if (key == 'a') { red = false; green = false; blue = false; }
  else if (key == '0') { for (int i = 0; i < c.length; i++) { c[i] = 0; } } // reset to black
  else if (key == 'c') { background(255); }
  
  println(c[0] + " " + c[1] + " " + c[2] + " stroke_weight: " + stroke_weight);
}
