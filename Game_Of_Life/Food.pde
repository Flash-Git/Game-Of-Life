class Food extends Entity {
  Food(PVector location, color colour, int tileSize) {
    super(location, colour, tileSize);
  }
  
  public void render() {
    super.render();
    ellipse(location.x*size + offset+1, location.y*size + offset+1, size-1, size-1);
  }
}
