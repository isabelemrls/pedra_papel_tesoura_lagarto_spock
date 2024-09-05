import processing.sound.*;

float pedra, papel, tesoura, lagarto, spock;
boolean gameOn;
int computador; // Computador
int jogador;   // Jogador
int screen;    // Tela atual
SoundFile music;
boolean playing = true;
PFont minhaFonte;
PImage espaçoimg, planetaimg, finalimg, regrasimg, vsimg;
PImage pedraimg, papelimg, tesouraimg, lagartoimg, spockimg;

void setup() {
  size(600, 600);
  noStroke();
  colorMode(HSB, 360, 100, 100);

  minhaFonte = createFont("BigPixel.otf", 32);
  textFont(minhaFonte);

  music = new SoundFile(this, "startrek.mp3");

  //imagens:
  espaçoimg = loadImage("data/espaço.png");
  planetaimg = loadImage("data/planeta.png");
  finalimg = loadImage("data/final.png");
  regrasimg = loadImage("data/regras.png");
  vsimg = loadImage("data/vs.png");
  pedraimg = loadImage("data/pedra.png");
  papelimg = loadImage("data/papel.png");
  tesouraimg= loadImage("data/tesoura.png");
  lagartoimg= loadImage("data/lagarto.png");
  spockimg= loadImage("data/spock.png");

  screen = 0;
  gameOn = false;
  music.loop();
}

void draw() {
  // Tela 0: Menu inicial
  if (screen == 0) {
    
    textAlign(CENTER, CENTER);
    background(90, 98, 25);
    image(espaçoimg, 0, 0);

    // botão das regras
    if (mouseX > 525 && mouseX < 575 && mouseY > 15 && mouseY < 65) {
      fill(203, 56, 15);
    } else {
      fill(203, 56, 35);
    }
    ellipse(550, 40, 50, 50);
    fill(0, 0, 100);
    text("?", 550, 40);

    //botão da música
    if (playing) {
      fill(203, 56, 35);
    } else {
      line( 505, 15, 455, 65);
      fill(203, 56, 15);
    }

    ellipse(480, 40, 50, 50);
    textSize(13);
    fill(0, 0, 100);
    text("sound", 480, 40);


    //Título
    fill(0, 0, 100);
    textSize(35);
    text("Pedra • Papel • Tesoura", width/2, 200);
    text("Lagarto • Spock", width/2, 250);

    // Botão "Jogar"
    if (mouseX > 200 && mouseX < 400 && mouseY > 325 && mouseY < 385) {
      fill(203, 56, 15);
    } else {
      fill(203, 56, 35);
    }
    rect(200, 325, 200, 60, 20);
    textSize(35);
    fill(0, 0, 100);
    text("Jogar", width/2, 355);
  }


  // Tela 1: Seleção da jogada
  if (screen == 1 && gameOn) {

    background(0);
    image(planetaimg, 0, 0);
    fill(0, 0, 100);
    textSize(45);
    text("Faça sua jogada!", width/2, 90);

    // Botões de jogadada
    //Pedra
    if (mouseX > 210 && mouseX < 380 && mouseY > 150 && mouseY < 200) {
      fill(203, 56, 15);
    } else {
      fill(203, 56, 35);
    }
    rect(210, 150, 170, 50, 20);
    fill(0, 0, 100);
    textSize(30);
    text("Pedra", width/2, 175);
    
    //Papel
    if (mouseX > 210 && mouseX < 380 && mouseY > 220 && mouseY < 270) {
      fill(203, 56, 15);
    } else {
      fill(203, 56, 35);
    }
    rect(210, 220, 170, 50, 20);
    fill(0, 0, 100);
    text("Papel", width/2, 245);
    
    // tesoura
    if (mouseX > 210 && mouseX < 380 && mouseY > 290 && mouseY < 340) {
      fill(203, 56, 15);
    } else {
      fill(203, 56, 35);
    }
    rect(210, 290, 170, 50, 20);
    fill(0, 0, 100);
    text("Tesoura", width/2, 315);
    
    //lagarto
    if (mouseX > 210 && mouseX < 380 && mouseY > 360 && mouseY < 410) {
      fill(203, 56, 15);
    } else {
      fill(203, 56, 35);
    }
    rect(210, 360, 170, 50, 20);
    fill(0, 0, 100);
    text("Lagarto", width/2, 385);
    
    //Spock
    if (mouseX > 210 && mouseX < 380 && mouseY > 430 && mouseY < 480) {
      fill(203, 56, 15);
    } else {
      fill(203, 56, 35);
    }
    rect(210, 430, 170, 50, 20);
    fill(0, 0, 100);
    text("Spock", width/2, 455);
  }


  // Tela 2: Resultado
  if (screen == 2) {

    background(0, 0, 0);
    image(finalimg, 0, 0);
    fill(0, 0, 100);
    textSize(30);
    String resultado = "Empate!";

    //escolha pedra
    if (jogador == 0) {
      if (computador == 2 ) resultado = "Você ganhou!\n\nPedra quebra a tesoura";
      else if ( computador == 3) resultado = "Você ganhou!\n\nPedra esmaga o lagarto";
      else if (computador == 1 ) resultado = "Computador ganhou!\n\nPapel cobre a pedra";
      else if ( computador == 4) resultado = "Computador ganhou!\n\nSpock vaporiza a pedra";
    }
    //escolha papel
    else if (jogador == 1) {
      if (computador == 0 ) resultado = "Você ganhou!\n\nPapel cobre a pedra";
      else if ( computador == 4) resultado = "Você ganhou!\n\nPapel refuta o Spock";
      else if (computador == 2 ) resultado = "Computador ganhou!\n\nTesoura corta o papel";
      else if ( computador == 3) resultado = "Computador ganhou!\n\nLagarto come o papel";
    }
    //escolha Tesoura
    else if (jogador == 2) {
      if (computador == 1 ) resultado = " Você ganhou!\n\nTesoura corta o papel";
      else if ( computador == 3) resultado = "Você ganhou!\n\nTesoura mata o lagarto";
      else if (computador == 0) resultado = "Computador ganhou!\n\nPedra quebra a tesoura";
      else if ( computador == 4) resultado = "Computador ganhou!\n\nSpock quebra a tesoura";

      //escolha Lagarto
    } else if (jogador == 3) {
      if (computador == 1) resultado = "Você ganhou!\n\nLagarto come o papel";
      else if ( computador == 4) resultado = "Você ganhou!\n\nLagarto envenena o Spock";
      else if (computador == 2 ) resultado = "Computador ganhou!\n\nTesoura mata o lagarto";
      else if (computador == 0) resultado = "Computador ganhou!\n\nPedra esmaga o lagarto";

      //escolha Spock
    } else if (jogador == 4) {
      if (computador == 2 ) resultado = "Você ganhou!\n\nSpock quebra a tesoura";
      else if ( computador == 0) resultado = "Você ganhou!\n\nSpock vaporiza a pedra";
      else if (computador == 1 ) resultado = "Computador ganhou!\n\nPapel refuta o Spock";
      else if ( computador == 3) resultado = "Computador ganhou!\n\nLagarto envenena o Spock";
    }

    //Exibição do resultado
    textAlign(CENTER, CENTER);
    image(vsimg, 230, 110);
    ImgComputador();
    ImgJogador();
    text(resultado, width/2, height/1.6);
    textSize(28);
    text("JOGADOR", 120, 65);
    text("COMPUTADOR", 470, 65);

    //botão para jogar novamente
    if (mouseX > 190 && mouseX < 410 && mouseY > 500 && mouseY < 560) {
      fill(203, 56, 15);
    } else {
      fill(203, 56, 35);
    }
    rect(190, 500, 220, 60, 20);
    fill(0, 0, 100);
    textSize(20);
    text ("Jogar novamente", width/2, 530);
  } 
  // Tela 3: Regras
  else if (screen == 3 && gameOn==false) {
    background(0, 0, 0);
    image(regrasimg, 0, 0);
    if (mouseX > 25 && mouseX < 75 && mouseY > 25 && mouseY < 75) {
      fill(327, 92, 25);
    } else {
      fill(327, 92, 55);
    }
    ellipse(50, 50, 50, 50);
    fill(0, 0, 100);
    textSize(12);
    text("voltar", 50, 50);
  }
}

//Função de seleção dos botões
void mousePressed() {
  if (screen == 0 && gameOn==false) {
    if (mouseX > 200 && mouseX < 400 && mouseY > 325 && mouseY < 385) {
      screen = 1;
      gameOn = true;
    }
    if (mouseX > 525 && mouseX < 575 && mouseY > 15 && mouseY < 65) {
      screen=3;
      gameOn=false;
    }
    if (mouseX > 455 && mouseX < 505 && mouseY > 15 && mouseY < 65) {
      if (playing) {
        music.pause();
      } else {
        music.play();
      }
      playing = !playing;
    }
  } 
  else if (screen==3 && gameOn==false) {
    if (mouseX > 25 && mouseX < 75 && mouseY > 25 && mouseY < 75) {
      screen=0;
      gameOn= false;
    }
  } else if (screen == 1 && gameOn) {
    if (mouseX > 210 && mouseX < 380 && mouseY > 150 && mouseY < 200) {
      jogador = 0;
      computador = int(random(0, 5));
      screen = 2;
    } else if (mouseX > 210 && mouseX < 380 && mouseY > 220 && mouseY < 270) {
      jogador = 1;
      computador = int(random(0, 5));
      screen = 2;
    } else if (mouseX > 210 && mouseX < 380 && mouseY > 290 && mouseY < 340) {
      jogador = 2;
      computador = int(random(0, 5));
      screen = 2;
    } else if (mouseX > 210 && mouseX < 380 && mouseY > 360 && mouseY < 410) {
      jogador = 3;
      computador = int(random(0, 5));
      screen = 2;
    } else if (mouseX > 210 && mouseX < 380 && mouseY > 430 && mouseY < 480) {
      jogador = 4;
      computador = int(random(0, 5));
      screen = 2;
    }
  } 
  else if (screen==2) {
    if (mouseX > 190 && mouseX < 410 && mouseY > 500 && mouseY < 560) {
      screen = 0;
      gameOn = false;
    }
  }
}

//exibição de imagens do computador
void ImgComputador() {
  if (computador == 0) {
    image(pedraimg, 375, 80);
  }
  if (computador == 1) {
    image(papelimg, 375, 80);
  }
  if (computador == 2) {
    image(tesouraimg, 375, 80);
  }
  if (computador == 3) {
    image(lagartoimg, 375, 80);
  }
  if (computador == 4) {
    image(spockimg, 375, 80);
  }
}
//exibição de imagens do jogador
void ImgJogador() {
  if (jogador == 0) {
    image(pedraimg, 25, 80);
  }
  if (jogador == 1) {
    image(papelimg, 25, 80);
  }
  if (jogador == 2) {
    image(tesouraimg, 25, 80);
  }
  if (jogador == 3) {
    image(lagartoimg, 25, 80);
  }
  if (jogador == 4) {
    image(spockimg, 25, 80);
  }
}
