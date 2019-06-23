class FoodManager {
  public ArrayList<Food> foods = new ArrayList<Food>();
  
  FoodManager(int foodCount) {
    generateFoods(foodCount);
  }
  
  private void generateFoods(int number) {
    for(int i = 0; i < number; i++){
      Food e = generateFood(0);
      if(e == null){
        println("Food broke at " + i);
        return;
      }
      foods.add(e);
    }
  }
  
  private Food generateFood(int escapeCount) {
    if(escapeCount > 1) return null;
    
    PVector loc = new PVector(int(random(0, gridNum)), int(random(0, gridNum)));
    color colour = color(int(random(200, 255)), int(random(200, 250)), int(random(200, 255)));
    
    if(checkSlot(loc)) return new Food(loc, colour);
    return generateFood(++escapeCount);
  }
  
  private boolean checkSlot(PVector slot) {
    for(Food e: foods){
      if(e.location.x == slot.x && e.location.y == slot.y) return false;
    }
    for(Entity e: entityManager.entities){
      if(e.location.x == slot.x && e.location.y == slot.y) return false;
    }
    return true;
  }
}
