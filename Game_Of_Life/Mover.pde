class Mover extends Entity {
  Mover(PVector location, color colour, int tileSize) {
    super(location, colour, tileSize);
  }
    
  public void tick() {
  
  }
  
  public void render() {
    super.render();
    rect(location.x*size + offset, location.y*size + offset, size, size);
  }
  
  public void move(PVector direction) {
    if(location.x+direction.x > gridNum) direction.x*=(-1);
    if(location.x+direction.x < 0) direction.x*=(-1);
    if(location.y+direction.y > gridNum) direction.y*=(-1);
    if(location.y+direction.y < 0) direction.y*=(-1);
    
    location.add(direction);
  }
}
