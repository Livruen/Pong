/**
* Pong is one of the earliest arcade video games. See more at https://en.wikipedia.org/wiki/Pong
* ude arrows for right player and W,S-Keys for the left player
*
* @author Natasza Szczypien 2018
*/

void setup(){
  size(800,500);
  
  y_leftPong = 100;
  y_rightPong = 100;
  
  //Ball start position
  x_ball=400;
  y_ball=250;
  
  //Ball start direction 
  ball_direction_X=-3;
  ball_direction_Y=3;
}

//Pong konfigurations
final int x_leftPong= 50;
int y_leftPong;
final int x_rightPong= 750;
int y_rightPong;
final int PONG_WIDTH= 16;
final int PONG_LENGTH= 200;
final int PONG_SPEED= 7;

//Ball konfigurations
int x_ball;
int y_ball;
int ball_direction_X;
int ball_direction_Y;
final int CHANGE_DIRECTION= -1;

//Window Borders
final int UPPER_BORDER = 0;
final int DOWN_BORDER = 499;
final int LEFT_BORDER= 0;
final int RIGHT_BORDER= 800;

void draw(){
 background(0);

 ballTouchLeftPong();
 ballTouchRightPong();
 
 drawLeftPong(y_leftPong);
 drawRightPong(y_rightPong);
 
 x_ball+=ball_direction_X;
 y_ball+=ball_direction_Y;
 
 drawBall(x_ball,y_ball);
 checkIfWall();
 
 if(outOfBorder()){
   noLoop();
   theEnd();
 }
}

void ballTouchLeftPong() {
  if( ((x_rightPong < x_ball)&(x_ball < 766)) & ( (y_rightPong < y_ball)&(y_ball<(y_rightPong+PONG_LENGTH)) ) ){
    ball_direction_X*=CHANGE_DIRECTION;
 }
}

void ballTouchRightPong() {
 if( ((x_leftPong < x_ball)&(x_ball < 66)) & ( (y_leftPong < y_ball)&(y_ball<(y_leftPong+PONG_LENGTH)) ) ){
    ball_direction_X*=CHANGE_DIRECTION;
 }
}

void  checkIfWall(){
  if(y_ball<UPPER_BORDER) {
   ball_direction_Y*=CHANGE_DIRECTION;
  }else if(y_ball>DOWN_BORDER) {
   ball_direction_Y*=CHANGE_DIRECTION;
  }
}

boolean  outOfBorder() {
  return (RIGHT_BORDER<x_ball | x_ball<LEFT_BORDER);
}

void drawLeftPong(int y){
     rect(x_leftPong,y,PONG_WIDTH,PONG_LENGTH);
}

void drawRightPong(int y){
  rect(x_rightPong,y,PONG_WIDTH,PONG_LENGTH);
}

boolean pongOutOfBorderCEILILNG(int y){
  return (y < UPPER_BORDER);
}

boolean pongOutOfBorderFLOOR(int y){
  return  y+PONG_LENGTH > DOWN_BORDER;
}


void drawBall(int x, int y){
  rect(x,y,5,5);  
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
        if(!pongOutOfBorderCEILILNG(y_rightPong)){
           y_rightPong-=PONG_SPEED;
        }
    } else if (keyCode == DOWN) {
      if(!pongOutOfBorderFLOOR(y_rightPong)){
       y_rightPong+=PONG_SPEED; 
      }
    } 
  } else {
    if(key == 'w'){
      if(!pongOutOfBorderCEILILNG(y_leftPong)){
       y_leftPong-=PONG_SPEED;
      }
    } else if(key == 's'){
         if(!pongOutOfBorderFLOOR(y_leftPong)){
             y_leftPong+=PONG_SPEED;
         }
    }
  }
}

void theEnd() {
   fill(255,0,0);
   rect(200,150,400,200);
   fill(255);
   text("THE END", 370,250);
}
