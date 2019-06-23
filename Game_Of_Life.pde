EntityManager entityManager;
int gridNum;
int offset;
int screenSize;
boolean showGrid;

void setup() {
  size(700, 700);
  screenSize = width;
  stroke(255);
  frameRate(144);
  gridNum = 20;
  offset = 70;
  showGrid = false;
  int entityCount = 20;
  entityManager = new EntityManager(entityCount);
}

void draw() { 
  background(0);
  grid(offset);
}

void grid(int offset) {
  int tileSize = (screenSize-offset*2)/gridNum;
  
  if(showGrid){
    for(int i = offset; i < screenSize-offset+1; i += tileSize) {
      line(i, offset, i, screenSize-offset);
      line(offset, i, screenSize-offset, i);
    }
  }
  
  ArrayList<Entity> entities = entityManager.entities;
  for(int i = 0; i < entities.size(); i++){
    fill(entities.get(i).colour);
    rect(entities.get(i).location.x*tileSize + offset, entities.get(i).location.y*tileSize + offset, tileSize, tileSize);
  }
}
