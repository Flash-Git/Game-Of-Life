class Entity {
  PVector location;
  color colour;
  
  Entity(PVector location, color colour) {
    this.location = location;
    this.colour = colour;
  }
  
  void move(PVector direction) {
    if(location.x+direction.x > gridNum) direction.x*=(-1);
    if(location.x+direction.x < 0) direction.x*=(-1);
    if(location.y+direction.y > gridNum) direction.y*=(-1);
    if(location.y+direction.y < 0) direction.y*=(-1);
    
    location.add(direction);
  }
}
