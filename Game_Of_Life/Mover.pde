class Mover extends Entity {
  public int damage;
  
  Mover(PVector location, int[] colour, int tileSize) {
    super(location, colour, tileSize);
    type = Entity.MOVER;
    health = 100;
    damage = 5;
  }
    
  public void tick() {
    health-=3;
    colour[0]-=2;
    colour[1]-=2;
    colour[2]-=2;
    if(health < 1) die();
    println(colour);
  }
  
  public void render() {
    super.render();
    rect(location.x*size + offset, location.y*size + offset, size, size);
  }
  
  public void move(PVector direction) {
    location.add(direction);
  }
  
  public void eat() {
    health += 50;
    
    colour[0]+=50;
    colour[1]+=50;
    colour[2]+=50;
  }
}
