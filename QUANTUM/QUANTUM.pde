import processing.video.*;
import gab.opencv.*;
import java.awt.Rectangle;
OpenCV opencv;
Capture cam;
Rectangle[] faces;

int iFace; //to use in the array of faces
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
  for (int i = 0; i < 30; i++) { //Kırmızılar için 20 tane arraylist
    red.add(new BallRed());
  }
  for (int i = 0; i < 30; i++) { //Maviler için 20 tane arraylist
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





  for (int a = 0; a < faces.length; a++) {  //İlk olarak yüzü çizmek için for statement
    e[a].eX = faces[a].width/2 + faces[a].x; //Yüzün orta notasının X kooridnatı
    e[a].eY = faces[a].height/2 + faces[a].y; //Yüzün orta noktasının Y koordinatı
    e[a].display(); //Yüzleri göster
    for (int i = red.size() - 1; i >= 0; i--) {//Daha sonra, her yüz için, bütün topları evaluate
      red.get(i).move(faces[a].width/2 + faces[a].x, faces[a].height/2 + faces[a].y); //Arraylistten kırmızı topları al
      red.get(i).display(); // Kırmızıları göster
      blue.get(i).display(); //Mavileri göster
      for (int c = blue.size()-1; c >= 0; c--) {
        blue.get(i).move(faces[a].width/2 + faces[a].x, faces[a].height/2 + faces[a].y); //Arraylistten mavi topları al
        blue.get(i).display(); //Mavileri göster
        if (blue.get(i).prox(red.get(c))) {
          blue.get(i).gravity(red.get(c));
        }
      }
    }
  }
}
