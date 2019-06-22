void setup() {
  size(700, 700);
  stroke(255);
  frameRate(144);
}

void draw() { 
  background(0);
  grid(50);
}

void grid(int offset) {
  for(int i = offset; i < width-offset+1; i += (width-offset*2)/50){
    line(i, offset, i, height-offset);
    line(offset, i, width-offset, i);
  }
}
