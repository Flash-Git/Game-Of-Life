EntityManager entityManager;
public int gridNum;
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
  
  int moverCount = 20;
  int foodCount = 5;
  tileSize = (screenSize-offset*2)/gridNum;
  
  entityManager = new EntityManager(tileSize);
  entityManager.generate(moverCount, foodCount);
}

int ticks = 0;
void draw() { 
  background(0);
  grid(offset, tileSize);
  entityManager.render();
  ticks++;
  if(ticks%25 == 0){
    entityManager.tick();
  }
}
 
  Entity checkTile(PVector tile) {
    for(Entity e : entityManager.entities){
      if(e.location.x == tile.x && e.location.y == tile.y) return e;
    }
    return null;
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
