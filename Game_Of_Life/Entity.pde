class Entity {
  public PVector location;
  public color colour;
  public int size;
  
  Entity(PVector location, color colour, int size) {
    this.location = location;
    this.colour = colour;
    this.size = size;
  }

  void render() {
    stroke(0);
    fill(colour);
  }
}
