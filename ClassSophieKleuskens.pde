float agitation = 0;

void setup() {
    size(400, 400);
}

void setAgitation(float newAgitation) {
    agitation = newAgitation;
}

void draw() {
    background(0);                            // black background
    stroke(255);                              // every outline will be white
    strokeWeight(5);                          // every outline will be 5 pixels wide
    noFill();                                 // the inside of a shape will not have a color
    
    setAgitation(map(mouseX, 0, width, 0, 1));
    
    float phase = frameCount * 0.015;
    float phaseAddition = map(sin(phase), -1, 1, 0, 0.25);
    for(int i = 0; i < 10; i++){ 
      float x = sin(phase);                   
      float radius = map(x, -1, 1, 40, 300);  
      float lineWidth = map(x, -1, 1, 0, 5);  
      float r = map(x, -1, 1, 0, 0);
      float g = map(x, -1, 1, 255, 125);
      float b = map(x, -1, 1, 0, 255);
      
      r = lerp(255, r, agitation);
      g = lerp(255, g, agitation);
      b = lerp(255, b, agitation);
      stroke(r, g, b);
      
      float lineWidthAddition = random(map(agitation, 0, 1, 5, 50));
      strokeWeight(lineWidth + lineWidthAddition);                
    
      ellipse(width / 2, height / 2, radius, radius);   // draw a circle in the center of the screen
      phase = phase + phaseAddition; 
      phaseAddition += 0.1;
    }
}