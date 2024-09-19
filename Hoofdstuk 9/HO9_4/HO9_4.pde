void setup() {
  size(200, 200);
  background(255);
  Vierkant1(50, 50, 100, 100);
}
void Vierkant1(float x, float y, float breedte, float hoogte){
  line(150, 50, 150 + -100, 50);
  line(x + breedte, y, x + breedte, y + hoogte);  
  line(x + breedte, y + hoogte, x, y + hoogte);  
  line(x, y + hoogte, x, y); 
}
