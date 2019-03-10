class BallRed {

  float x;//ellipse x position
  float y;//ellipse y position
  float radius; //radius of ellipse
  float colour; //color of balls
  final float spring = 0.05;


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
    if ( total < radius + 50 && total>300) { //Eğer uzaklık radius+50 den az ise(yörünge), daha fazla yaklaşma
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
    } else if (other.x < x) {
      x = x - 1;
    }

    if (other.y > y) {
      y = y + 1;
    } else if (other.y < y) {
      y = y - 1;
    }
  }

  boolean prox (BallBlue other) {
    float d = dist(x, y, other.x, other.y);
    if (d < 100 && 15 < d) {
      return true;
    } else {
      return false;
    }
  }
  boolean collide(BallBlue collide) {

    float d = dist (collide.x, collide.y, x, y);
    if ( d < collide.radius/2 + radius/2) {
      return true;
    } else {
      return false;
    }
  }





  //boolean isCollidingWith(BallRed ball)
  //{
  //  return dist(x, y, ball.x, ball.y) < (radius + ball.radius) / 2;
  //}
  
  
  
  //  void bounceWith(BallBlue ball)
  //{
  //  float dx = ball.x - x;
  //  float dy = ball.y - y;
  //  float minDist = (ball.radius + radius) / 2;
  //  float angle = atan2(dy, dx);
  //  float targetX = x + cos(angle) * minDist;
  //  float targetY = y + sin(angle) * minDist;
  //  float ax = (targetX - ball.x) * spring;
  //  float ay = (targetY - ball.y) * spring;
  //  x -= ax;
  //  y -= ay;
  //  ball.x += ax;
  //  ball.y += ay;
  //}
}
