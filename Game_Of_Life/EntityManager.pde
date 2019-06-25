class EntityManager {
  public ArrayList<Entity> entities;
  public ArrayList<Food> foods;
  public ArrayList<Mover> movers;
  private int tileSize;

  EntityManager(int tileSize) {
    this.tileSize = tileSize;
    entities = new ArrayList<Entity>();
    foods = new ArrayList<Food>();
    movers = new ArrayList<Mover>();
  }
    
  public void generate(int moverCount, int foodCount) {
    generateMovers(moverCount);
    generateFoods(foodCount);
  }
  
  public void tick() {
    for(Mover mover : movers){
      PVector newLoc = new PVector(int(random(4)-2), int(random(4)-2));
      if(mover.location.x+newLoc.x > gridNum) newLoc.x*=(-1);
      if(mover.location.x+newLoc.x < 0) newLoc.x*=(-1);
      if(mover.location.y+newLoc.y > gridNum) newLoc.y*=(-1);
      if(mover.location.y+newLoc.y < 0) newLoc.y*=(-1);
      
      Entity e = checkTile(new PVector(newLoc.x+mover.location.x, newLoc.y+mover.location.y));
            
      if(e == null) {
        mover.move(newLoc);
        continue;
      }
      
      if(e == mover) continue;
      
      if(e.type == Entity.FOOD){
        mover.eat();
        e.die();
        mover.move(newLoc);
        continue;
      }
      
      if(e.type == Entity.MOVER){
        mover.eat();
        e.die();
        mover.move(newLoc);
        continue;
      }  
    }
    
    for(int i = entities.size()-1; i >= 0; i--){
      Entity e = entities.get(i);
      if(e.dead){
        if(e.type == Entity.MOVER) movers.remove(e);
        else if(e.type == Entity.FOOD) foods.remove(e);
        entities.remove(i);
      }else{
        e.tick();
      }
    }
  }
  
  public void render() {
    for(Entity e : entities){
      e.render();
    }
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
    int[] colour = { int(random(110, 250)), int(random(110, 250)), int(random(110, 250)) };
    if(checkTile(loc) == null) return new Mover(loc, colour, tileSize);
    return generateMover(++escapeCount);
  }
  
  private Food generateFood(int escapeCount) {
    if(escapeCount > 1) return null;
    
    PVector loc = new PVector(int(random(0, gridNum)), int(random(0, gridNum)));
    int[] colour = { int(random(200, 255)), int(random(200, 250)), int(random(200, 255)) };
    
    if(checkTile(loc) == null) return new Food(loc, colour, tileSize);
    return generateFood(++escapeCount);
  }
}
