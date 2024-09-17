String[] namen = {"geert", "piet", "jan", "myrthe"};  
void setup() {
  
  for (String naam : namen) {
    if (naam == "myrthe") { 
      println("klopt");
      return;  
    }
  }
  println("klopt niet");  
}
