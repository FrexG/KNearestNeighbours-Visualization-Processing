
/* 
    @author: Fraol Gelana
    @Organization:Artificial Intelligence Center
    @Date:March,2021
*/

/*
#########################
#                       #
#     RUN THIS FILE     #
#                       #
#########################
*/
DataPoint dp;
KNN knn;
void setup(){
  size(500,500);
  dp = new DataPoint();
  background(0);
}

void draw(){
dp.show();
}

void mousePressed(){
   knn = new KNN(dp,mouseX,mouseY);     
}
