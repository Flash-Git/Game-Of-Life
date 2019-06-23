EntityManager entityManager;
FoodManager foodManager;
int gridNum;
int offset;
int screenSize;
boolean showGrid;

void setup() {
  size(700, 700);
  screenSize = width;
  frameRate(500);
  ellipseMode(CORNER); 
  gridNum = 20;
  offset = 70;
  showGrid = false;
  int entityCount = 20;
  int foodCount = 5;
  entityManager = new EntityManager(entityCount);
  foodManager = new FoodManager(foodCount);
}

int g = 0;
void draw() { 
  background(0);
  grid(offset);
  g++;
  if(g%50 == 0){
    tickEntities();
  }
}

void tickEntities() {
  for(Entity e : entityManager.entities){
    e.move(new PVector(int(random(4)-2), int(random(4)-2)));
  }
}

void grid(int offset) {
  int tileSize = (screenSize-offset*2)/gridNum;
  
  if(showGrid){
     stroke(255);
    for(int i = offset; i < screenSize-offset+1; i += tileSize){
      line(i, offset, i, screenSize-offset);
      line(offset, i, screenSize-offset, i);
    }
  }
  
  ArrayList<Entity> entities = entityManager.entities;
  stroke(0);
  for(int i = 0; i < entities.size(); i++){
    fill(entities.get(i).colour);
    rect(entities.get(i).location.x*tileSize + offset, entities.get(i).location.y*tileSize + offset, tileSize, tileSize);
  }
  
  ArrayList<Food> foods = foodManager.foods;
  stroke(0);
  for(int i = 0; i < foods.size(); i++){
    fill(foods.get(i).colour);
    ellipse(foods.get(i).location.x*tileSize + offset+1, foods.get(i).location.y*tileSize + offset+1, tileSize-1, tileSize-1);
  }
}
