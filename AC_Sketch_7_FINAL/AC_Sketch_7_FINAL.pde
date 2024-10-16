import oscP5.*;
import netP5.*;

OscP5 oscP5;
float circleSize = 100; // Current size of the circle
float targetSize = 100; // Target size of the circle
color circleColor; // Current color of the circle
color targetColor; // Target color of the circle

// Position of Ball in the BG
PVector position;  // Current position of the circle
PVector target;    // Target position to move towards
float speed = 0.02; // Speed of movement (0.0 - 1.0, where 1.0 is instant movement)
int radius = 50;   // Radius of the circle
boolean isPlaying = false;  // Flag to control whether the circle should move

// Color Array
color[] colors;
color[] colors2;
color[] complementaryColors;

int transparency = 255;  // Default value for transparency (fully opaque)

// Grid Info
int gridSize = int(random(2, 6)); // Size of the grid cells
int cols, rows;
FloatList changeRate; // To change afterwards vertical lines or horizontal
float z;
boolean shouldDrawLine = false;  // Flag to control square drawing
boolean LineDrawn = false;  // Tracks whether the square has already been drawn


// Variables to store random square properties
int savedX, savedY, savedW, savedH;
color savedColor;  // Store the color for the square
boolean shouldDrawSquare = false;  // Flag to control square drawing
boolean squareDrawn = false;  // Tracks whether the square has already been drawn

//Balls
int BallGridSize; // Size of the grid cells
int Ballcols, Ballrows;
color circleColor2; // Color for the circle
float circleRadius;
int Planet = int(random(1,10)); // Circle Radius
int Quantity;

void setup() {
  //size(200, 350);
  fullScreen(2);
  //surface.setSize(900,350);
  //surface.setLocation(-1920,100);
  
  // Initialize oscP5 to listen for OSC messages on port 12000
  oscP5 = new OscP5(this, 12000);
  
  background(0);  // Set a black background
  println("Listening for OSC messages on port 12000...");
  
  // Position of the Circle
  position = new PVector(width / 2, height / 2);  // Start in the center
  target = new PVector(random(width), random(height)); // Random initial target

  // Set the initial color of the circle
  circleColor = color(255, 0, 0); // Red color
  targetColor = circleColor; // Initialize target color
  colors = new color[] {
    color(255, 0, 0),        // Bright Red
    color(200, 0, 0),        // Dark Red
    color(255, 100, 100),    // Light Red
    color(150, 0, 0),        // Maroon
    color(255, 50, 50),      // Salmon Red
    color(255, 150, 150),    // Soft Red
    color(255, 0, 100),      // Red-Pink
    color(220, 20, 60),      // Crimson
    color(178, 34, 34),      // Firebrick
    color(255, 99, 71),       // Tomato
    color(255, 69, 0),       // Orange Red
    color(255, 140, 0),      // Dark Orange
    color(255, 228, 196)     // Misty Rose
  };
  
   // Color Palette Array
  colors2 = new color[]{
    color(200, 200, 21),  // KINDA YELLOW
    color(184, 242, 108),   // SOFT YELLOW/GREEN
    color(6, 150, 248),  // SATURATED BLUE 2G
    color(14, 145, 170),    // TURQUOISE BLUE MID
    color(12, 76, 28),     // DARK OLIVE GREEN
    color(3, 242, 150),    // SATURATED GREEN TURQUOISE
    color(7, 108, 242),    // SATURATED BLUE
    color(33, 250, 103),   // SUPER SATURATED GREEN
    color(86, 120, 244),   // LIGHT BLUE
    color(0, 19, 16),      // KIND OF BLACK
    color(68, 250, 56),     // FOSFORESCENT GREEN
    color(228, 242, 221, 30),   // ALPHA TRANSPARENCY LIGHT
    color(16, 225, 255, 15),   // ALPHA TRANSPARENCY LIGHT 2
  };
  
  complementaryColors = new color[] {
   color(255, 0, 0),        // Bright Red (unchanged)
    color(200, 0, 0),        // Dark Red (unchanged)
    color(255, 100, 100),    // Light Red (unchanged)
    color(150, 0, 0),        // Maroon (unchanged)
    color(255, 50, 50),      // Salmon Red (unchanged)
    color(34, 139, 34),      // Dark Green (new dark green)
    color(255, 0, 100),      // Red-Pink (unchanged)
    color(75, 0, 130),       // Indigo (new dark purple)
    color(178, 34, 34),      // Firebrick (unchanged)
    color(255, 99, 71),      // Tomato (unchanged)
    color(139, 0, 0),        // Dark Red (new dark tone)
    color(72, 61, 139),      // Dark Slate Blue (new darker purple)
    color(255, 228, 196)     // Misty Rose (unchanged)
};

  
  cols = width / gridSize;
  rows = height / gridSize;
  // Draw the initial 1 grid
  //drawInitGrid();
  // Art Piece Info
  print("The Grid is " + gridSize + " . ");
  
   // List of possible rates of chance vertical or horizontal LINES
  changeRate = new FloatList(); 
  changeRate.append(0.0);
  changeRate.append(0.1);
  changeRate.append(0.5);
  changeRate.append(0.9);
  changeRate.append(1.5);
    // Declaring a Random value for Z
  z = changeRate.get(int(random(0, 5)));
  
  // Randomize Ball grid size
  BallGridSize = int(random(2, 15));
  
    // Initialize columns and Ballrows based on the BallGridSize
  Ballcols = width / BallGridSize;
  Ballrows = height / BallGridSize;
  
}

void draw() {
  // Clear the background
  //background(0);
  
  // Smooth transition for circle size
  circleSize = lerp(circleSize, targetSize, 0.1);
  
  // Smooth transition for circle color
  circleColor = lerpColor(circleColor, targetColor, 0.1);
  
  // Only move the circle if isPlaying is true
  if (isPlaying) {
    position.x = lerp(position.x, target.x, speed);
    position.y = lerp(position.y, target.y, speed);
  }
  
  
    // Set the fill color for the circle
    noStroke();
  fill(circleColor); // Use the current circle color
  
  // Draw the circle at the center of the canvas
  ellipse(position.x, position.y, circleSize, circleSize); 
  // If the circle is close to the target, pick a new random target
  if (dist(position.x, position.y, target.x, target.y) < 1) {
    target = new PVector(random(width), random(height)); // New random target
  }
  
   ///////////////// SQUARES ///////////////////////
  if (shouldDrawSquare && !squareDrawn) {
    // Call makeSquare() only once when shouldDrawSquare is true
    makeSquare();  
    squareDrawn = true;  // Set the flag to ensure it only draws once
  }

  // If you want the square to persist, draw it in every frame
  if (squareDrawn) {
    drawSavedSquare();  // Draw the saved square on subsequent frames
  }
  
    ///////////////// LINES ///////////////////////
  if (shouldDrawLine && !LineDrawn) {
    // Call makeSquare() only once when shouldDrawSquare is true
    makeLine();  
    LineDrawn = true;  // Set the flag to ensure it only draws once
  }

  // For the square to persist, draw it in every frame
  if (LineDrawn) {
    drawSavedSquare();  // Draw the saved square on subsequent frames
  }
  
  ///////////////// CIRCLES ///////////////////////
  if (frameCount % 24 == 0) {
    circleRadius = int(random(2,200)); // Randomize circle radius
    println("Circle Radius is " + circleRadius);
    circleColor2 = color(0); //colors[int(random(colors.length))];
    drawGridWithCircle(); // Redraw the circle
  }
  
     }


////////////////// SQUARES! //////////////////

void makeSquare() {
  // Generate and store random values for the square's properties
  savedColor = colors[int(random(colors.length))];
  savedX = int(random(cols));
  savedY = int(random(rows));
  savedW = int(random(1, 10));
  savedH = int(random(1, 10));
  
  // Draw the square once with the saved properties
  fill(savedColor);
  rect(savedX * gridSize, savedY * gridSize, savedW * gridSize / 4, savedH * gridSize / 4);
}

void drawSavedSquare() {
  // Draw the saved square in every frame to make it persistent
  fill(savedColor);
  rect(savedX * gridSize, savedY * gridSize, savedW * gridSize / 4, savedH * gridSize / 4);
}

////////////////// END OF SQUARES! //////////////////

////////////////// LINES! //////////////////

// Drawing a Line, with random length and random orientation (vertical/horizontal)
void makeLine() {
  // Choose a random color from the palette
  color c = colors2[int(random(colors2.length))];
  fill(c,transparency);
  
  // Randomly decide if the line is horizontal or vertical (float probability)
  boolean isHorizontal = random(1) < z;
  
  if (isHorizontal) {
    // Draw a horizontal line
    int y = int(random(rows)); // Random row
    int startX = int(random(cols)); // Random start column
    int length = int(random(1, cols)); // Random length for the line
    // Drawing the Line by filling each individual Grid Square
    for (int i = startX; i < min(startX + length, cols); i++) {
      rect(i * gridSize, y * gridSize, gridSize, gridSize);
    }
  } else {
    // Draw a vertical line
    int x = int(random(cols)); // Random column
    int startY = int(random(rows)); // Random start row
    int length = int(random(3, rows)); // Random length for the line
    
    for (int j = startY; j < min(startY + length, rows); j++) {
      rect(x * gridSize, j * gridSize, gridSize, gridSize);
    }
  }
}

// Save image function
void saveImage() {
  String fileName = "savedImage_" + year() + "_" + month() + "_" + day() + "_" + hour() + "_" + minute() + "_" + second() + ".png";
  save(fileName);
  println("Image saved: " + fileName);
}
