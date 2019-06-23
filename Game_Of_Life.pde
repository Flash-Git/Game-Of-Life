ArrayList<Entity> entities = new ArrayList<Entity>();
int gridNum;
int offset;

void setup() {
  size(700, 700);
  stroke(255);
  frameRate(144);
  gridNum = 20;
  offset = 70;
  generateEntities(50);
}

void draw() { 
  background(0);
  grid(offset);
}

void generateEntities(int number) {
  for(int i = 0; i < number; i++){
    Entity e = generateEntity(0);
    if(e == null) return;
    entities.add(e);
  }
}

Entity generateEntity(int escapeCount) {
  if(escapeCount > 10) return null;
  
  PVector loc = new PVector(int(random(0, gridNum)), int(random(0, gridNum)));
  color colour = color(int(random(55, 250)), int(random(55, 250)), int(random(55, 250)));
  
  if(checkSlot(loc)) return new Entity(loc, colour);
  return generateEntity(escapeCount++);
}

boolean checkSlot(PVector slot) {
  for(Entity e: entities){
    if(e.location == slot) return false;
  }
  return true;
}

void grid(int offset) {
  int tileSize = (width-offset*2)/gridNum;
  for(int i = offset; i < width-offset+1; i += tileSize) {
    line(i, offset, i, height-offset);
    line(offset, i, width-offset, i);
  }
  for(int i = 0; i < entities.size(); i++){
    fill(entities.get(i).colour);
    rect(entities.get(i).location.x*tileSize + offset, entities.get(i).location.y*tileSize + offset, tileSize, tileSize);
  }
}
