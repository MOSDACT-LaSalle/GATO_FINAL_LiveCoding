void oscEvent(OscMessage msg) {
  // Check if the message address is "/CHANGE_SIZE"
  if (msg.checkAddrPattern("/CHANGE_SIZE")) { 
     if (msg.get(0).floatValue() == 1) {   
        println("OSC message received: " + msg.addrPattern());
        // Change the target size of the circle randomly between 50 and 200
        targetSize = random(1, 200);
        println("Target circle size changed to: " + targetSize); // Debug message
     }
  }
  
  // Check if the message address is "/CHANGE_COLOR"
  else if (msg.checkAddrPattern("/CHANGE_COLOR")) {
     if (msg.get(0).floatValue() == 1) { 
        println("OSC message received: " + msg.addrPattern());
        // Change the target color of the circle to a random color
        targetColor = colors[int(random(colors.length))]; // Random RGB color
        println("Target circle color changed to: " + targetColor); // Debug message
     }
  }
  

   // "/MAKE_SQUARE" OSC message
  else if (msg.checkAddrPattern("/MAKE_SQUARE")) {
    if (msg.get(0).floatValue() == 1) { 
      println("OSC message received: " + msg.addrPattern());
      shouldDrawSquare = true;  // Activate square drawing
      squareDrawn = false;  // Reset the flag to allow drawing a new square
    } else {  
      shouldDrawSquare = false;  // Deactivate square drawing
    }
  }
  
   // "/MAKE_SQUARE" OSC message
  else if (msg.checkAddrPattern("/MAKE_LINE")) {
    if (msg.get(0).floatValue() == 1) { 
      println("OSC message received: " + msg.addrPattern());
      shouldDrawLine = true;  // Activate square drawing
      LineDrawn = false;  // Reset the flag to allow drawing a new square
    } else {  
      shouldDrawLine = false;  // Deactivate square drawing
    }
  }
  
  if (msg.checkAddrPattern("/SET_TRANSPARENCY")) { 
     float receivedValue = msg.get(0).floatValue();  // Get the first value of the message
     // Assuming the received value is between 0 and 1, map it to the range 0 - 255
     transparency = int(receivedValue);
     println("Transparency set to: " + transparency);  // Debug message
  }
  
   // Check if the message address is "/IS_PLAY"
  if (msg.checkAddrPattern("/IS_PLAY")) {
    float value = msg.get(0).floatValue();
    
    if (value == 1) {
      isPlaying = true;  // Start moving the circle
      println("OSC /IS_PLAY received: Circle will move.");
    } else {
      isPlaying = false;  // Stop the circle from moving
      println("OSC /IS_PLAY received: Circle will stop.");
    }
  }
  
  // Check if the message has an integer and if the value is 1
  else if (msg.checkAddrPattern("/SAVE_IMAGE")) {
     if (msg.get(0).floatValue() == 1){
    saveImage();
  }
  }
   if (msg.checkAddrPattern("/PLANET_QUANTITY")) { 
     float receivedValue = msg.get(0).floatValue();  // Get the first value of the message
     // Assuming the received value is between 0 and 1, map it to the range 0 - 255
     Quantity = int(receivedValue);
     println("Transparency set to: " + Quantity);  // Debug message
  }
   
  
}
