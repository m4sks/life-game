
class Cell {
  int x, y;
  boolean isLiving;
  boolean mouseisStay = false;
  
  Cell (int cellX, int cellY, boolean state) {
    x = cellX;
    y = cellY;
    isLiving = state;
  }
  
  void changeState() {
    isLiving = !isLiving;
  }
  
  void appear() {
    if (isLiving) {
      fill(255);
    } else {
      fill(50, 50, 50);
    }
    rect(x, y, cellSize, cellSize);
  }
  
  void mouseCheck() {
    if ((x - cellSize < mouseX &&  mouseX < x + cellSize) && (y - cellSize < mouseY && mouseY < y + cellSize)) {
      mouseisStay = true;
    }else {
      mouseisStay = false;
    }
  }
}

class Point {
  int row, column;
  Point(int cellRow, int cellColumn) {
    row = cellRow;
    column = cellColumn;
  }
  int getRow() {
    return row;
  }
  int getColumn() {
    return column;
  }
}