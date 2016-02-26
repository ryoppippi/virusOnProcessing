int radius = 60;
int windowSize = 700;
int scene = 0;
int virusDistance = 100;
int virusX, virusY;
int[] centerX = {};
int[] centerY = {};
boolean[] virusCircle = {};
int numberCircle = 0;

void setup() {
    size(700, 700);
    frameRate(15);
    colorMode(RGB);
}

void draw(){
    if(scene == 0){
        int a = int(random(radius,(windowSize - radius)));
        int b = int(random(radius,(windowSize - radius)));
        fill(255,255,255);
        ellipse(a,b,radius,radius);
        //作った円の中心座標を記録する
        centerX = (int[])append(centerX,a);
        centerY = (int[])append(centerY,b);
        virusCircle = (boolean[])append(virusCircle,false);
        numberCircle++;
    }
    if(scene == 1){
    }
    if(scene == 2){
        stroke(255,0,255);
        fill(255,0,255);
        virusX = mouseX;
        virusY = mouseY;
        ellipse(virusX,virusY,20,20);
        frameRate(5);
        for(int i = 0;i < numberCircle; i++){
            if(dist(virusX,virusY,centerX[i],centerY[i]) <= virusDistance){
                stroke(255,0,0);
                fill(255,0,0);
                ellipse(centerX[i],centerY[i],radius,radius);
                line(virusX,virusY,centerX[i],centerY[i]);
                virusCircle[i] = true;
            }
        }
        noLoop();
    }
    if(scene >= 3){
        int numberYarareta = 0;
        int[] yarareta = {};
        for(int i = 0;i < numberCircle; i++){
            if(virusCircle[i] == true){
                for(int j = 0;j < numberCircle; j++){
                    if(dist(centerX[i],centerY[i],centerX[j],centerY[j]) <= virusDistance && virusCircle[j] == false){
                        stroke(#FFFF00);
                        fill(#FFFF00);
                        ellipse(centerX[j],centerY[j],radius,radius);
                        line(centerX[i],centerY[i],centerX[j],centerY[j]);
                        noLoop();
                        numberYarareta++;
                        yarareta = (int[])append(yarareta,j);
                    }
                }
            }
        }
        for(int k = 0;k < numberYarareta; k++){
            virusCircle[yarareta[k]] = true;
        }
        noLoop();
    }
}

void mousePressed() {
    loop();
    scene++;
}
