class BallBlue {

  float x;//ellipse x position
  float y;//ellipse y position
  float radius; //radius of ellipse
  float colour; //color of balls
  final float spring = 0.05;



  BallBlue() {

    x = random(width);
    y = random(height);
    radius = 10;
    colour = 255;
  }

  void display() { //Topları göster


    fill(0, 0, colour);
    //stroke(0);
    //strokeWeight(random(3, 6));
    ellipse(x, y, radius, radius);
  }

  void move(float ellipseX, float ellipseY) { //Topları yüzlerden dışarı doğru hareket ettir

    float eX = ellipseX; //Yüzün orta noktası
    float eY = ellipseY; //Yüzün orta noktasının Y koordinatları
    float total = dist(ellipseX, ellipseY, x, y); //Yüz ve top arası uzaklık
    if ( total < radius + 50 && total>300) { //Eğer uzaklık radius+50 den az ise(yörünge), daha fazla yaklaşma
    } else {
      if (eX < x && eX + radius < width) { //Eğer toplar yörüngenin dışında ise, yörüngeye doğru x doğrultusunda yaklaş
        x = x + 200/total;
      } else if (eX - radius > 0) { // Yörüngede ise, yörüngeden çık
        x = x - 200/total;
      } 
      if (x>width) {
        x= x - 50;
      } else if (x<0) {
        x= x + 50;
      }


      if (eY < y && eY + radius < height) { //Eğer toplar yörüngenin dışında ise, yörüngeye doğru y doğrultusunda yaklaş
        y = y + 200/total;
      } else if (eY - radius > 0) {// Yörüngede ise, yörüngeden çık
        y = y - 200/total;
      }
      if (y > width) {
        y= y - 50;
      } else if (y < 0) {
        y= y + 50;
      }
    }
  }

  void gravity(BallRed other) {
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
  boolean collide(BallRed collide) {

    float d = dist (collide.x, collide.y, x, y);
    if ( d < collide.radius/2 + radius/2) {
      return true;
    } else {
      return false;
    }
  }





  //boolean isCollidingWith(BallBlue ball)
  //{
  //  if(dist(x, y, ball.x, ball.y) < (radius + ball.radius) ){
  //  return true;  
  //  }else{
  //    return false;
  //  }
  //}




  //void bounceWith(BallBlue ball)
  //{
  //  if (dist(x, y, ball.x, ball.y) < (radius + ball.radius) ) {





  //    float dx = ball.x - x;
  //    float dy = ball.y - y;
  //    float minDist = (ball.radius + radius) / 2;
  //    float angle = atan2(dy, dx);
  //    float targetX = x + cos(angle) * minDist;
  //    float targetY = y + sin(angle) * minDist;
  //    float ax = (targetX - ball.x) * spring;
  //    float ay = (targetY - ball.y) * spring;
  //    x -= ax;
  //    y -= ay;
  //    ball.x += ax;
  //    ball.y += ay;
  //  }
  //}


  //void overlaps() {
  //    for (int i = id + 1; i < numBalls; i++) {
  //      float dx = others[i].x - x;
  //      float dy = others[i].y - y;
  //      float distance = sqrt(dx*dx + dy*dy);
  //      float minDist = others[i].diameter/2 + diameter/2;
  //      if (distance < minDist) { 
  //        float angle = atan2(dy, dx);
  //        float targetX = x + cos(angle) * minDist;
  //        float targetY = y + sin(angle) * minDist;
  //        float ax = (targetX - others[i].x) * spring;
  //        float ay = (targetY - others[i].y) * spring;
  //        vx -= ax;
  //        vy -= ay;
  //        others[i].vx += ax;
  //        others[i].vy += ay;
  //      }
  //    }   
  //  }


  boolean prox (BallRed other) {
    float d = dist(x, y, other.x, other.y);
    if (d < 100 && 15 < d) {
      return true;
    } else {
      return false;
    }
  }
}
