class Ellipses {

  float colour;
  float stroke;
  float eX; //X koordinatı orta noktası
  float eY; //Y koordinatı orta noktası
  float eD; //Yüzün boyutları
  float extra;

  Ellipses() {
    extra = 0;
    eD = 50 + extra;

    colour = random(255);
  }

  void display() {
    stroke = random(5);
    stroke(stroke);
    fill(colour, 100, 100, 255);
    ellipse(eX, eY, eD, eD);
  }
}
