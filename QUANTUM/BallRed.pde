class BallRed {

  float x;//ellipse x position
  float y;//ellipse y position
  float radius; //radius of ellipse
  float colour; //color of balls


  BallRed() {

    x = random(width);
    y = random(height);
    radius = 10;
    colour = 255;
  }

  void display() { //Topları göster


    fill(colour, 0, 0);
    //stroke(0);
    //strokeWeight(random(3, 6));
    ellipse(x, y, radius, radius);
  }

  void move(float ellipseX, float ellipseY) { //Topları yüzlerden dışarı doğru hareket ettir

    float eX = ellipseX; //Yüzün orta noktası
    float eY = ellipseY; //Yüzün orta noktasının Y koordinatları
    float total = dist(ellipseX, ellipseY, x, y); //Yüz ve op arası uzaklık
    if ( total < radius + 50) { //Eğer uzaklık radius+50 den az ise(yörünge), daha fazla yaklaşma
      x = x;
    } else {
      if (eX < x && eX + radius < width) { //Eğer toplar yörüngenin dışında ise, yörüngeye doğru x doğrultusunda yaklaş
        x = x - 200/total;
      } else if (eX - radius > 0) { // Yörüngede ise, yörüngeden çık
        x = x + 200/total;
      }

      if (eY < y && eY + radius < height) {
        y = y - 200/total;
      } else if (eY - radius > 0) {
        y = y + 200/total;
      }
    }
  }
  
  void gravity(BallBlue other) {
    if (other.x > x) {
      x = x + 1;
    } else if(other.x < x) {
      x = x - 1;
    }

    if (other.y > y) {
      y = y + 1;
    } else if(other.y < y) {
      y = y - 1;
    }
  }
  
      boolean prox (BallBlue other) {
    float d = dist(x, y, other.x, other.y);
    if (d < 100 && 15 < d){
      return true;
    } else {
      return false;
    }
  }
  
  
}
