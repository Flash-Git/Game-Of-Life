class EntityManager {
  ArrayList<Entity> entities = new ArrayList<Entity>();
  int entityCount;
  
  EntityManager(int entityCount) {
    generateEntities(entityCount);
  }
  
  void generateEntities(int number) {
    for(int i = 0; i < number; i++){
      Entity e = generateEntity(0);
      if(e == null) {
        println("Entity broke at " + i);
        entityCount = i+1;
        return;
      }
      entities.add(e);
    }
  }
  
  Entity generateEntity(int escapeCount) {
    if(escapeCount > 10) return null;
    
    PVector loc = new PVector(int(random(0, gridNum)), int(random(0, gridNum)));
    color colour = color(int(random(55, 250)), int(random(55, 250)), int(random(55, 250)));
    
    if(checkSlot(loc)) return new Entity(loc, colour);
    return generateEntity(++escapeCount);
  }
  
  boolean checkSlot(PVector slot) {
    for(Entity e: entities){
      if(e.location.x == slot.x && e.location.y == slot.y) return false;
    }
    return true;
  }
}
