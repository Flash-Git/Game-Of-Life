class Food extends Entity {
  Food(PVector location, int[] colour, int tileSize) {
    super(location, colour, tileSize);
    type = Entity.FOOD;
    health = 1;
  }
  
  public void tick() {}
  
  public void render() {
    super.render();
    ellipse(location.x*size + offset+2, location.y*size + offset+2, size-2, size-2);
  }
}
