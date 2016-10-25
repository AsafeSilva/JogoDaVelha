// imprime no console o tabuleiro
void DRAW(int board[]) {
    println(str(checkPlay(board[0])) + "  | " + str(checkPlay(board[1])) + " | " + str(checkPlay(board[2])));
    println( "---+---+---");
    println(str(checkPlay(board[3])) + "  | " + str(checkPlay(board[4])) + " | " + str(checkPlay(board[5])));
    println("---+---+---");
    println(str(checkPlay(board[6])) + "  | " + str(checkPlay(board[7])) + " | " + str(checkPlay(board[8])));
    println();
}

// conversão de número p/ caractere
char checkPlay(int i){
    switch(i) {
        case 1:
            return 'X';
        case -1:
            return 'O';
        case 0:
            return ' ';
    }
  return ' ';
}

void drawPlay(int play, int pos) {
  byte x = 10; 
  noFill();
  
  if (play == -1) {
    // draw 'O'
      if(pos <= 2)       ellipse(width*(2*pos+1)/6, height*1/6, width/4, width/4);  
      else if(pos <= 5)  ellipse(width*(2*pos-5)/6, height*3/6, width/4, width/4); 
      else               ellipse(width*(2*pos-11)/6, height*5/6, width/4, width/4); 
        
    
  } else if (play == 1) {
    // draw 'X'
    
      if(pos <= 2){
          line(width*(pos)/3 + x, height*(0)/3+x, width*(pos+1)/3 - x, height*(1)/3 - x);
          line(width*(pos+1)/3 - x, height*(0)/3+x, width*(pos)/3 + x, height*(1)/3 - x);
      }else if(pos <= 5){
          line(width*(map(pos, 3, 5, 0, 2))/3 + x, height*(1)/3+x, width*(map(pos, 3, 5, 0, 2)+1)/3 - x, height*(2)/3 - x);
          line(width*(map(pos, 3, 5, 0, 2)+1)/3 - x, height*(1)/3+x, width*(map(pos, 3, 5, 0, 2))/3 + x, height*(2)/3 - x);
      }else{
          line(width*(map(pos, 6, 8, 0, 2))/3 + x, height*(2)/3+x, width*(map(pos, 6, 8, 0, 2)+1)/3 - x, height*(3)/3 - x);
          line(width*(map(pos, 6, 8, 0, 2)+1)/3 - x, height*(2)/3+x, width*(map(pos, 6, 8, 0, 2))/3 + x, height*(3)/3 - x);
      }

  }
}

int checkCasa() {
  int casa = 0;
  int[][] board = {{0,1,2},{3,4,5},{6,7,8}};
  /*
    \\x//
   1 --> x > width*0/3 AND x < width*1/3
       \\y//
       1 --> y >  height*0/3 AND y < height*1/3
       2 --> y >  height*1/3 AND y < height*2/3
       3 --> y >  height*2/3 AND y < height*3/3
   \\x//            
   2 --> x > width*1/3 AND x < width*2/3
       \\y//
       1 --> y >  height*0/3 AND y < height*1/3
       2 --> y >  height*1/3 AND y < height*2/3
       3 --> y >  height*2/3 AND y < height*3/3
   \\x//
   3 --> x > width*2/3 AND x < width*3/3
       \\y//
       1 --> y >  height*0/3 AND y < height*1/3
       2 --> y >  height*1/3 AND y < height*2/3
       3 --> y >  height*2/3 AND y < height*3/3            
   */

  for (int col = 0; col < 3; col++) {
    for (int lin = 0; lin < 3; lin++) {
      if (mouseX > width*(col)/3 && mouseX < width*(col+1)/3) {
        if (mouseY > height*(lin)/3 && mouseY < height*(lin+1)/3) {
          casa = board[lin][col];
        }
      }
    }
  }

  return casa;
}