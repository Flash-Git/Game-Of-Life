EntityManager entityManager;
int gridNum;
int offset;
int screenSize;
boolean showGrid;
int tileSize;

void setup() {
  size(700, 700);
  screenSize = width;
  frameRate(100);
  ellipseMode(CORNER); 
  gridNum = 20;
  offset = 70;
  showGrid = false;
  tileSize = (screenSize-offset*2)/gridNum;
  int moverCount = 20;
  int foodCount = 5;
  entityManager = new EntityManager(moverCount, foodCount, tileSize);
}

int ticks = 0;
void draw() { 
  background(0);
  grid(offset, tileSize);
  entityManager.render();
  ticks++;
  if(ticks%25 == 0){
    tickEntities();
  }
}

void tickEntities() {
  for(Mover mover : entityManager.movers){
    mover.move(new PVector(int(random(4)-2), int(random(4)-2)));
  }
}

void grid(int offset, int tileSize) {
  if(showGrid){
     stroke(255);
    for(int i = offset; i < screenSize-offset+1; i += tileSize){
      line(i, offset, i, screenSize-offset);
      line(offset, i, screenSize-offset, i);
    }
  }
}
