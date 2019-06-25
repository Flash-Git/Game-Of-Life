abstract class Entity {
  public PVector location;
  public color colour;
  public int size;
  public int type;
  public boolean dead;
  
  public static final int FOOD = 0;
  public static final int MOVER = 1;
  
  Entity(PVector location, color colour, int size) {
    this.location = location;
    this.colour = colour;
    this.size = size;
    this.dead = false;
  }
  
  abstract void tick();

  public void render() {
    stroke(0);
    fill(colour);
  }
  
  public void die() {
    dead = true;
  }
}
