class Mover extends Entity {
  public int damage;
  
  Mover(PVector location, color colour, int tileSize) {
    super(location, colour, tileSize);
    type = Entity.MOVER;
    health = 100;
    damage = 5;
  }
    
  public void tick() {
    health--;
    if(health < 1) die();
  }
  
  public void render() {
    super.render();
    rect(location.x*size + offset, location.y*size + offset, size, size);
  }
  
  public void move(PVector direction) {
    location.add(direction);
  }
  
  public void eat() {
    health += 20;
  }
}
