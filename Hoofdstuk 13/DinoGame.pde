PImage dinoImage; //Dit laadt de image
float dinoX, dinoY, VY; // Maakt een float aan voor de functie jump en de X pos
boolean jumping, gameOver; //Boolean voor de jumping / gameover
Cactus[] cactussen; //Dit is de array van de cactus!
Hitbox dinoHitbox;
int score;

void setup() {
  size(800, 400);
  dinoImage = loadImage("CPlayer.png");
  dinoX = 250;
  dinoY = height - 100;
  VY = 0;
  jumping = false;
  dinoHitbox = new Hitbox(dinoX + 10, dinoY + 5, dinoImage.width - 20, dinoImage.height - 10); //Hitbox systeem voor de dino
  score = 0; //gebruikt de INT voor de score

  //Hier maak ik een array aan
  cactussen = new Cactus[1];
  cactussen[0] = new Cactus(); //dit vult de array met de cactus
}

void draw() {
  background(255);
  frameRate(60);
  if (!gameOver) { // Dit is de gameOver logica
    image(dinoImage, dinoX, dinoY);
    applyGravity();

    //Dit werkt alleen met de cactus in de array
    Cactus cactus = cactussen[0];
    cactus.update();
    cactus.draw();

    if (cactus.x < -cactus.img.width) {
      score++; // zorgt ervoor dat de score omhoog gaat
      cactus.reset(); //reset de positie van de cactus
    }

    dinoHitbox.x = dinoX + 10;
    dinoHitbox.y = dinoY + 5;

    fill(0);
    textSize(24);
    text("Score: " + score, 10, 30);
  } else {
    textSize(32);
    fill(0);
    text("Game over press space to restart", width / 2 - 200, height / 2);
    textSize(24);
    text("Final score: " + score, width / 2 - 100, height / 2 + 40);
  }

  if (checkCollision()) {
    gameOver = true;
  }
}

void keyPressed() {
  if (key == ' ' && !jumping && !gameOver) {
    VY = -12.5;
    jumping = true;
  } else if (key == ' ' && gameOver) {
    resetGame();
  }
}

void applyGravity() {
  VY += 0.5;
  dinoY += VY;
  if (dinoY >= height - dinoImage.height) {
    dinoY = height - dinoImage.height;
    VY = 0;
    jumping = false;
  }
}

boolean checkCollision() {
  Cactus cactus = cactussen[0]; //dit werkt met de cactus in de array
  return dinoX + dinoImage.width > cactus.x && dinoX < cactus.x + cactus.img.width && dinoY + dinoImage.height > cactus.y;
}

void resetGame() {
  dinoX = 250;
  dinoY = height - dinoImage.height;
  VY = 0;
  jumping = false;
  cactussen[0] = new Cactus();
  gameOver = false;
  score = 0;
}

class Cactus {
  float x, y;
  float speed;
  PImage img;
  Hitbox hitbox;

  Cactus() {
    img = loadImage("Cactus1.png");
    x = width;
    y = 315;
    speed = 7;
    hitbox = new Hitbox(x + 5, y + 5, img.width - 10, img.height - 5);
  }

  void update() {
    x -= speed;
    if (x < -img.width) {
      reset(); //reset cactus wanneer hij buiten het scherm is
    }
    hitbox.x = x + 5;
    hitbox.y = y + 5;
  }

  void draw() {
    image(img, x, y);
  }

  void reset() {
    x = width;
    speed = 7 + (score / 3) * 0.5; //snelheid hoger op basis van score
  }
}

class Hitbox { //Hitbox class
  float x, y, width, height;
  Hitbox(float x, float y, float width, float height) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }

  boolean collidesWith(Hitbox other) { //dit is hoe de hitbox gemaakt wordt.
    return this.x < other.x + other.width &&
      this.x + this.width > other.x &&
      this.y < other.y + other.height &&
      this.y + this.height > other.y;
  }

  void draw() {
    noFill();
    stroke(255, 0, 0);
    rect(x, y, width, height);
  }
}
