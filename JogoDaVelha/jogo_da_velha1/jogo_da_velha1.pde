/*=================  TIC TAC TOE - MINMAX =================*/

int[][] game = new int[3][3];  // jogo atual
int jogador = -1;              //-1 --> "O"  e  1 --> "X"
int jogadas;                   // quantidade de jogadas
boolean finish = false;        // testar se o jogo acabou

PFont font;

void setup() {
  size(400,400);
  background(255);
  noFill();
  
  font = loadFont("Arial-Black-48.vlw");
  textSize(width/6.6);
  textAlign(CENTER);
   
  line(0, height/3, height, height/3);
  line(0, height*2/3, height, height*2/3);

  line(width/3, 0, width/3, width);
  line(width*2/3, 0, width*2/3, width);
}

void draw() {
}


void drawPlay(int play, int h, int v) {
  byte x = 10; 
  int raio = width/4;
  noFill();
  
  if (play == -1) {
    // draw 'O'
    ellipse(width*(2*h-1)/6, height*(2*v-1)/6, raio, raio);  
  } else if (play == 1) {
    // draw 'X'
    line(width*(h-1)/3+x, height*(v-1)/3+x, width*(h)/3 - x, height*(v)/3 - x);
    line(width*(h)/3-x, height*(v-1)/3+x, width*(h-1)/3+x, height*(v)/3-x);
  }
}

String checkCasa() {
  String casa = null;

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

  for (int x = 1; x < 4; x++) {
    for (int y = 1; y < 4; y++) {
      if (mouseX > width*(x-1)/3 && mouseX < width*(x)/3) {
        if (mouseY > height*(y-1)/3 && mouseY < height*(y)/3) {
          casa = Integer.toString(x) + Integer.toString(y);
        }
      }
    }
  }

  return casa;
}

int win(int board[][], int player){
  
  for (int k = 0; k < 2; k++) {
      if( (board[k][0] == player && board[k][1] == player && board[k][2] == player) ||  //testa horizontal
           (board[0][k] == player && board[1][k] == player && board[2][k] == player) )  //testa vertical
         return player;
  } 
  
  // testa as diagonais
  if( (board[0][0] == player && board[1][1] == player && board[2][2] == player) ||
      (board[0][2] == player && board[1][1] == player && board[2][0] == player))
        return player;
        
  return 0; 
}

String checkPlay(int i){
    switch(i) {
        case 1:
            return "X";
        case -1:
            return "O";
    }
    return null;
}

void mousePressed() {

  if (mousePressed && !finish) {              // mouse foi pressionado e jogo não acabou?
    int val = Integer.parseInt(checkCasa());  // lê a casa que clicou
    int x = val/10;
    int y = val%10;
    
    if(game[x-1][y-1] == 0){      // testa se a casa não foi jogada
      jogador = -jogador;         // troca jogador
      drawPlay(jogador, x, y);    // desenha 'X' ou 'O'
      game[x-1][y-1] = jogador;   // atualiza matriz do jogo
      jogadas++;
      
      println(str(x-1)+str(y-1));
/*      
  for (int h = 1; h < 4; h++) {
    println("\n");
    for (int v = 1; v < 4; v++) {
       print(game[v-1][h-1] + "  ");
    }
  }
*/      
      if(win(game, jogador) != 0){
        fill(#FF0000);
        text(checkPlay(win(game, jogador)) + " WIN!", width/2, height/2);
        finish = true;
      }else if(jogadas == 9){ 
        fill(#FF0000);
        text("DRAW!", width/2, height/2); 
        finish = true;
      }
   
    }
    
  }

}