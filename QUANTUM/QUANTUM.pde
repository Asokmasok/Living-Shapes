import processing.video.*;
import gab.opencv.*;
import java.awt.Rectangle;
OpenCV opencv;
Capture cam;
Rectangle[] faces;

ArrayList<BallRed> red = new ArrayList<BallRed>(); //Kırmızı toplar
ArrayList<BallBlue> blue = new ArrayList<BallBlue>(); //Mavi toplar
Ellipses[] e = new Ellipses[10];

int ellipseY; //Yüzün y koordinatı
int ellipseX; //Yüzün x koordinatı
float faceSize; //Yüz genişliği


void setup() {

  size(640, 480, P2D);
  cam = new Capture(this, width, height);
  cam.start();
  opencv = new OpenCV(this, cam.width, cam.height); 
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE); 
  ////
  faceSize = 50;
  for (int i = 0; i < 100; i++) { //Kırmızılar için 20 tane arraylist
    red.add(new BallRed());
  }
  for (int i = 0; i < 100; i++) { //Maviler için 20 tane arraylist
    blue.add(new BallBlue());
  }
  for (int i = 0; i < e.length; i++) { //Yuz elipsleri olusuyor
    e[i] = new Ellipses();
  }
}

void captureEvent(Capture cam) { // New images from camera
  cam.read();
}

void draw() {
  background(0);

  opencv.loadImage(cam);  // We have to always "load" the camera image into OpenCV 
  faces = opencv.detect();   // Detect the faces
  //image(cam, 0, 0);   // Draw the video

  for (int c = 0; c <blue.size(); c++) {
    //Mavileri göster  
    for (int d = 0; d <red.size(); d++) {
      red.get(d).display(); //kirmizilari göster
      blue.get(c).display();

    //blue.get(c).overlaps(); // to not collide with each other
    if (blue.get(c).prox(red.get(d))) {
      blue.get(c).gravity(red.get(d));
    }
    if (red.get(d).prox(blue.get(c))) {
      red.get(d).gravity(blue.get(c));
    }
    if (red.get(d).collide(blue.get(c))) {
      red.remove(d);
      blue.remove(c);
    }
    }
  }



  for (int a = 0; a < faces.length; a++) {  //İlk olarak yüzü çizmek için for statement
    e[a].eX = faces[a].width/2 + faces[a].x; //Yüzün orta notasının X kooridnatı
    e[a].eY = faces[a].height/2 + faces[a].y; //Yüzün orta noktasının Y koordinatı
    e[a].display(); //Yüzleri göster
    for (int i = red.size() - 1; i >= 0; i--) {//Daha sonra, her yüz için, bütün topları evaluate
      red.get(i).move(faces[a].width/2 + faces[a].x, faces[a].height/2 + faces[a].y); //Arraylistten kırmızı topları al
      red.get(i).display(); // Kırmızıları göster
      blue.get(i).move(faces[a].width/2 + faces[a].x, faces[a].height/2 + faces[a].y); //Arraylistten mavi topları al
      for (int c = blue.size()-1; c >= 0; c--) {
        blue.get(c).display(); //Mavileri göster
      }
      if (blue.get(w).prox(red.get(i))) {
        blue.get(w).gravity(red.get(i));
      }
      if (red.get(w).prox(blue.get(i))) {
        red.get(w).gravity(blue.get(i));
      }
      //if (red.get(i).collide(blue.get(c))) {
      //  red.remove(i);
      //  blue.remove(c);
      //}
    }
  }
}
