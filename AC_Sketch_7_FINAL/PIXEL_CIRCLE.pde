
// Function to draw the grid and pixelated circle
void drawGridWithCircle() {
  //background(255); // Clear the background
   // Center of the circle
  float centerX = int(random(0, width));
  float centerY = int(random(0, height));
  
  for (int i = 0; i < Ballcols; i++) {
    for (int j = 0; j < Ballrows; j++) {
      // Calculate the center position of each grid cell
      float cellCenterX = i * BallGridSize + BallGridSize / 2;
      float cellCenterY = j * BallGridSize + BallGridSize / 2;
      
      // Calculate the distance from the center of the circle
      float distance = dist(cellCenterX, cellCenterY, centerX, centerY);
      
      // If the distance is less than the circle's radius, draw a pixel (grid cell)
      if (distance < circleRadius) {
        fill(circleColor2,Quantity); // Set the color for the circle
        rect(i * BallGridSize, j * BallGridSize, BallGridSize, BallGridSize);
      }
    }
  }
}
