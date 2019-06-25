class EntityManager {
  public ArrayList<Entity> entities = new ArrayList<Entity>();
  
  EntityManager(int entityCount) {
    generateEntities(entityCount);
  }
  
  private void generateEntities(int number) {
    for(int i = 0; i < number; i++){
      Entity e = generateEntity(0);
      if(e == null) {
        println("Entity broke at " + i);
        return;
      }
      entities.add(e);
    }
  }
  
  private Entity generateEntity(int escapeCount) {
    if(escapeCount > 10) return null;
    
    PVector loc = new PVector(int(random(0, gridNum)), int(random(0, gridNum)));
    color colour = color(int(random(55, 250)), int(random(55, 250)), int(random(55, 250)));
    
    if(checkSlot(loc)) return new Entity(loc, colour);
    return generateEntity(++escapeCount);
  }
  
  private boolean checkSlot(PVector slot) {
    for(Entity e: entities){
      if(e.location.x == slot.x && e.location.y == slot.y) return false;
    }
    return true;
  }
}
