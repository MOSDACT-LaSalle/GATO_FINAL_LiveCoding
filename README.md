# GATO_FINAL_LiveCoding
Pixel Universes

# Pixels Universe

## Concept Description

The main idea for this project was, **" How can a unique Generative Piece be created from a Musical Live Performance? "**. 
Getting to know a new medium of creation such as Coding made me want to try a new style, Pixel Art, instead of the traditionally 3D stuff I'm used to (Blender, Zbrush, Maya, to name a few).

The guidelines were to be able to show the visually difference between the instruments & FX while creting a Kind of universe on its own. Using simple shapes such as Squares, Circles or Lines. 

## Main Functionality:

The System works This Way: ABLETON > TOUCHDESIGNER > PROCESSING. 

- Ableton Sends Signal to Touchdesigner through TDAbleton, so the MIDI values can be customized and used. 
- TouchDesigner then transforms those values to OSC, and sends them to Processing with the correct naming convention. 
- Processing receives OSC Signal and activates functions, or change parameters such as opacity and others. 

NOTE: My initial idea was to use MIDI directly to processing but I was having a few issues with the MidiBus Library, that's why I had to use another way to be able to use a MIDI Controller. 


## Key Features:

1. **OSC Signaling**:  
   - In most cases I just wanted to activate an Effect when it received an OSC message of 1. Not continuously but just when the value was 1. This is why using      ==1 enabled me to read the messages correctly. 
   - Another function was to continuously read what was the message in float numbers, so it is dynamically changed. "See /PLANET_QUANTITY ". This way I was able to change the opacity of the Lines. 
   - The last problem solving was making the Circle Stop when the Song is not playing. By creating a Boolean, I could create a IsPlaying = True or False, so the Circle Movement would be activated. 

------------

2. **PIXEL GRID**:  
   - The Canvas is splited in a Randomized Grid, and every measurement is based on that. The Sketch has Two different Grids, the General Grid of the Canvas (For the Squares and Lines) and the BallGrid, which corresponds to the Big Planets that appear afterwards (to add diversity to the piece). 
   - Also, there's a list of Floats that can change the probability of the Lines being Drawn Vertical or Horitzontal, changing the perception of the painting. 

------------

  
3. **MOVEMENT OF THE CIRCLE**:  
   - One big trouble was to move the Circle. By creating an Initial Position always at the center, and creating a Target Position completely Randomized, the Circle can move using a Lerp Function. If the New Target Position is too close, the function will generate another Target point. 

------------


3. **COLOR PALETTE ARRAY**:  
   - Lastly, there are three different Color Palette Arrays that are assigned to the Squares, Lines and Circles. They are not Live Customizable but the piece can change greatly if the Artist were to change it. 



## How to Use:

- **SAVE TRACK:** When you either activate or deactivate the SAVE TRACK in Ableton it automatically saves a .png of the piece. 

- **BALL COLOR:** When the BALL COLOR track in ABleton is active, the main Circle will start changing color everytime it reads a Midi Signal. 

- **CIRCLE MOVEMENT:** When the CIRCLE MOVEMENT track in ABleton is active, the main Circle will start moving Position. It corresponds to the KICK of the Song. 

- **SNARE STARS:** When the SNARE STARS track in ABleton is active, It will generate random stars around the canvas. It corresponds to the SNARE of the Song.

- **BASS LINES:** When the BASS LINES track in ABleton changes Volume, It will change the Opacity of the Lines Generated. 0 Volumes == No Visibility.         100%Volume == 100%Opacity. 

- **FLUTES PLANETS:** When the FLUTES PLANETS track in ABleton changes Volume, It will change the Opacity of the Lines Generated. 0 Volumes == No Visibility.         100%Volume == 100%Opacity. 


######

To its Correct Use, I recommend opening Ableton First, afterwards TouchDesigner and Lastly Processing. 

Thanks for your Support and Guidance,
**GATO**. 

######




