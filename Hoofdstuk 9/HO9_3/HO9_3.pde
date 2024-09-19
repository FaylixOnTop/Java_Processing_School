float som1;

void setup(){
  som1 = rekensom1(9.3, 5.2, 2);
  println(som1);
  
}

float rekensom1 (float getal1, float getal2, float getal3){
  float berekeningsom1 = getal1 + getal2 / getal3;
  return berekeningsom1;
}
