

void check() {
  ArrayList<Point> points = new ArrayList<Point>();
  for (int r = 0; r < rowNum; r++) {
    for (int c = 0; c < columnNum; c++) {
      int count = 0;
      for (int i = -1; i <= 1; i++) {
        for (int j = -1; j <= 1; j++) {
          if (r+i < 0 || r+i >= rowNum || c+j < 0 || c+j >= columnNum) {
            continue;
          }
          if (cells[r+i][c+j].isLiving) {
            count++;
          }
        }
      }
      if (cells[r][c].isLiving) {
        count--;
      }

      if (cells[r][c].isLiving) {
        if (count <= 1 || count >= 4) {
          points.add(new Point(r, c));
        }
      } else {
        if (count == 3) {
          points.add(new Point(r, c));
        }
      }
    }
  }
  for (int i = 0; i < points.size(); i++) {
    Point point = points.get(i);
    int pointRow = point.getRow();
    int pointColumn = point.getColumn();
    cells[pointRow][pointColumn].changeState();
  }
}

void randomSetup() {
  size(Width, Height);
  for (int i = 0; i < rowNum; i++) {
    for (int j = 0; j < columnNum; j++) {
      int posX = j * cellSize;
      int posY = i * cellSize;
      float coinSpeed = random(1);
      boolean coin;
      if (coinSpeed > 0.8) {
        coin = true;
      } else {
        coin = false;
      }
      cells[i][j] = new Cell(posX, posY, coin);
    }
  }
}