
final int cellSize = 10;
final int Width = 800;
final int Height = 800;
int rowNum = Height / cellSize;
int columnNum = Width / cellSize;
int cellNum = rowNum * columnNum;
Cell[][] cells = new Cell[rowNum][columnNum];
boolean isRunning = false;

int stop = 0;


void settings() {
  size(Width, Height);
}

void setup() {
  frameRate(20);
  //background(255);
  for (int i = 0; i < rowNum; i++) {
    for (int j = 0; j < columnNum; j++){
      int posX = j * cellSize;
      int posY = i * cellSize;
      cells[i][j] = new Cell(posX, posY, false);
    }
  }
  
}

void draw() {
  if (isRunning) {
    check();
  }
  for (int i = 0; i < rowNum; i++) {
    for (int j = 0; j < columnNum; j++) {
      cells[i][j].appear();
    }
  }
  if (isRunning) {
    delay(stop);
  }
  fill(250, 0, 0, 200);
  textSize(30);
  textAlign(RIGHT);
  if (isRunning) {
    text("Run", Width - 10, 40);
  }else {
    text("Stop", Width - 10, 40);
  }
  textSize(18);
  text("Delay:" + stop, Width - 10, 60);
}

void mouseClicked() {
  int cellColumn = mouseX / cellSize;
  int cellRow = mouseY / cellSize;
  cells[cellRow][cellColumn].changeState();
}

void mouseDragged() {
  int cellColumn = mouseX / cellSize;
  int cellRow = mouseY / cellSize;
  //if (cells[cellRow][cellColumn].mouseisStay) {
  if (0 < mouseX && mouseX < Width && 0 < mouseY && mouseY < Height) {
    cells[cellRow][cellColumn].changeState();
  }
}

void keyReleased() {
  if (key == ' ') {
    isRunning = !isRunning;
  }else if (key == 'r' || key == 'R') {
    randomSetup();
  }else if (key == 'c' || key == 'C') {
    setup();
  }else if (keyCode == UP) {
    stop += 100;
  }else if (keyCode == DOWN) {
    if (stop != 0) {
      stop -= 100;
    }
  }
}