int minmax(int board[], int player){
  
  int winner = win(board);
  if(winner != 0) return winner*player;
  
  int move = -1;
  int score = -2;
  
  for(int i = 0; i < 9; i++){
    if(board[i] == 0){
       board[i] = player;
       int thisScore = -minmax(board, player*-1);
       if(thisScore > score){
          score = thisScore;
          move = i;
       }
       board[i] = 0;
    }
  }
  
  if(move == -1) return 0;
  return score;
}

void computerMove(int board[]){
  jogador = 1;                // atualiza jogador 
  int val = -1;
  int score = -2;
  
  if (!finish) {              // jogo não acabou?
    
   for(int i = 0; i < 9; i++){
     if(board[i] == 0){           // testa se a casa não foi jogada
          board[i] = jogador;
          int tempScore = -minmax(board, -1);
          board[i] = 0;
          if(tempScore > score){
             score = tempScore;
             val = i;
          }
     }
   }
      
      drawPlay(jogador, val);    // desenha 'X'
      game[val] = jogador;       // atualiza matriz(tabuleiro) do jogo
      
      jogadas++;                 // incrementa nº de jogadas 
      DRAW(game);

      if(win(game) != 0){                        // alguém ganhou?
        fill(#FF0000);                                          // preenchimento vermelho                  
        text(checkPlay(win(game)) + " WIN!", width/2, height/2);// escreve na tela
        finish = true;                                          // finaliza jogo
      }else if(jogadas == 9 && win(game) == 0){  // empate? 
        fill(#FF0000);
        text("DRAW!", width/2, height/2); 
        finish = true;
      } 
    firstPlayer = true;  // desabilita jogada da máquina
  }
}