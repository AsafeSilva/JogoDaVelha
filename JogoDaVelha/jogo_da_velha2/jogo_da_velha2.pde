/*=================  TIC TAC TOE - MINMAX =================*/

int[] game = new int[9];       // jogo atual
int jogador;                   //-1 --> "O"  e  1 --> "X"
int jogadas;                   // quantidade de jogadas
boolean finish = false;        // testar se o jogo acabou

// mudar esta variável para trocar o jogador à começar
boolean firstPlayer = true;   // 0 --> MÁQUINA; 1 --> JOGADOR     

PFont font;                    // cria objeto para usar fonte

void setup() {
  size(400,400);        // tamanho da janela
  background(255);      // cor de fundo
  noFill();             // sem preenchimento 
  
  font = loadFont("Arial-Black-48.vlw");  // carrega fonte
  textSize(width/6.6);                    // tamanho da fonte em função da tela
  textAlign(CENTER);                      // alinhamento do texto 

  //=============== CRIA LINHAS DO JOGO (TABULEIRO)
  // horizontal
  line(0, height/3, height, height/3);
  line(0, height*2/3, height, height*2/3);
  
  // vertical
  line(width/3, 0, width/3, width);
  line(width*2/3, 0, width*2/3, width);
  //===============
}

void draw() {
  
  // se for a vez da máquina
  if(!firstPlayer){
    computerMove(game);
  }  

}


int win(int board[]){

  int[][] wins = {{0,1,2},
                  {3,4,5},
                  {6,7,8},
                  {0,3,6},
                  {1,4,7},
                  {2,5,8},
                  {0,4,8},
                  {2,4,6}};
  
  for(int i = 0; i < 8; i++){
    if(board[wins[i][0]] != 0 &&
       board[wins[i][0]] == board[wins[i][1]] &&
       board[wins[i][1]] == board[wins[i][2]])
       return board[wins[i][2]];  // retorna vencedor (1 ou -1)
  }
        
  return 0; 
}

void mousePressed() {
    jogador = -1;               // atualiza jogador 
    if (!finish) {              // jogo não acabou?
      int val = checkCasa();    // lê a casa que clicou
      
      if(game[val] == 0){       // testa se a casa não esta ocupada
         
              
        drawPlay(jogador, val); // desenha 'O'
        game[val] = jogador;    // atualiza matriz(tabuleiro) do jogo
        
        jogadas++;              // incrementa nº de jogadas  
        //DRAW(game);
            
        if(win(game) != 0){                        // alguém ganhou?
          fill(#FF0000);                                          // preenchimento vermelho                  
          text(checkPlay(win(game)) + " WIN!", width/2, height/2);// escreve na tela
          finish = true;                                          // finaliza jogo
        }else if(jogadas == 9 && win(game) == 0){  // empate? 
          fill(#FF0000);
          text("DRAW!", width/2, height/2); 
          finish = true;
        }
        firstPlayer = false;  // habilita jogada da máquina
      } 
    }   
}