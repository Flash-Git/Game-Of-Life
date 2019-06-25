abstract class Entity {
  public static final int FOOD = 0;
  public static final int MOVER = 1;
  
  public PVector location;
  public int colour[] = new int[3];
  public int size;
  
  public int type;
  
  public int health;
  public boolean dead;
  

  Entity(PVector location, int[] colour, int size) {
    this.location = location;
    this.colour = colour;
    this.size = size;
    this.dead = false;
  }
  
  abstract void tick();

  public void render() {
    stroke(0);
    fill(colour[0], colour[1], colour[2]);
  }
  
  public void die() {
    dead = true;
  }
}
