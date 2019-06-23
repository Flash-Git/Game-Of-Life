class FoodManager {
  ArrayList<Food> foods = new ArrayList<Food>();
  int foodCount;
  
  FoodManager(int foodCount) {
    generateFoods(foodCount);
  }
  
  void generateFoods(int number) {
    for(int i = 0; i < number; i++){
      Food e = generateFood(0);
      if(e == null){
        println("Food broke at " + i);
        foodCount = i+1;
        return;
      }
      foods.add(e);
    }
  }
  
  Food generateFood(int escapeCount) {
    if(escapeCount > 1) return null;
    
    PVector loc = new PVector(int(random(0, gridNum)), int(random(0, gridNum)));
    color colour = color(int(random(200, 255)), int(random(200, 250)), int(random(200, 255)));
    
    if(checkSlot(loc)) return new Food(loc, colour);
    return generateFood(++escapeCount);
  }
  
  boolean checkSlot(PVector slot) {
    for(Food e: foods){
      if(e.location.x == slot.x && e.location.y == slot.y) return false;
    }
    for(Entity e: entityManager.entities){
      if(e.location.x == slot.x && e.location.y == slot.y) return false;
    }
    return true;
  }
}
