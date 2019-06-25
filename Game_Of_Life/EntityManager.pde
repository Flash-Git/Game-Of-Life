class EntityManager {
  public ArrayList<Entity> entities = new ArrayList<Entity>();
  public ArrayList<Food> foods = new ArrayList<Food>();
  public ArrayList<Mover> movers = new ArrayList<Mover>();
  private int tileSize;

  EntityManager(int moverCount, int foodCount, int tileSize) {
    this.tileSize = tileSize;
    generateMovers(moverCount);
    generateFoods(foodCount);
  }
    
  public void tick() {
    for(Entity e : entities){
      e.tick();
    }
  }
   
  public void render() {
    for(Entity e : entities){
      e.render();
    }
  }
 
  Entity checkTile(PVector tile) {
    for(Entity e : entities){
      if(e.location.x == tile.x && e.location.y == tile.y) return e;
    }
    return null;
  }

  private void generateMovers(int moverCount) {
    for(int i = 0; i < moverCount; i++){
      Mover mover = generateMover(0);
      if(mover == null) {
        println("Movers broke at " + i);
        return;
      }
      movers.add(mover);
      entities.add(mover);
    }
  }
  
  private void generateFoods(int foodCount) {
    for(int i = 0; i < foodCount; i++){
      Food food = generateFood(0);
      if(food == null) {
        println("Foods broke at " + i);
        return;
      }
      foods.add(food);
      entities.add(food);
    }
  }
  
  private Mover generateMover(int escapeCount) {
    if(escapeCount > 10) return null;
    
    PVector loc = new PVector(int(random(0, gridNum)), int(random(0, gridNum)));
    color colour = color(int(random(55, 250)), int(random(55, 250)), int(random(55, 250)));
    
    if(checkTile(loc) == null) return new Mover(loc, colour, tileSize);
    return generateMover(++escapeCount);
  }
  
  private Food generateFood(int escapeCount) {
    if(escapeCount > 1) return null;
    
    PVector loc = new PVector(int(random(0, gridNum)), int(random(0, gridNum)));
    color colour = color(int(random(200, 255)), int(random(200, 250)), int(random(200, 255)));
    
    if(checkTile(loc) == null) return new Food(loc, colour, tileSize);
    return generateFood(++escapeCount);
  }
}
