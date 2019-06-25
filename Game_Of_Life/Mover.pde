class Mover extends Entity {
  Mover(PVector location, color colour, int tileSize) {
    super(location, colour, tileSize);
    type = Entity.MOVER;
  }
    
  public void tick() {}
  
  public void render() {
    super.render();
    rect(location.x*size + offset, location.y*size + offset, size, size);
  }
  
  public void move(PVector direction) {
    location.add(direction);
  }
  
  public void eat() {
    
  }
}
