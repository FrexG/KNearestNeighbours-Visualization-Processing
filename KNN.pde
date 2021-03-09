
class KNN{
  DataPoint dp;
  float xMouse,yMouse;
  PVector[] clussterCenter = new PVector[3];
  private float[] distanceFromCenter = new float[3];
  private FloatList arrayOfDistance = new FloatList(3);
  
  public KNN(DataPoint dp,float xMouse,float yMouse){
    this.dp = dp;
    this.xMouse = xMouse;
    this.yMouse = yMouse;
    ClussterCenter();
  }
  
  private void ClussterCenter(){
    int count = 2;
    ArrayList<PVector> c;
    while(count >= 0){
      if(count == 0){
         c = dp.getClusterOne();
         calculateCenter(c,count);
      }
      
      else if(count == 1){
        c = dp.getClusterTwo();
        calculateCenter(c,count);
      }
      
      else{
        c = dp.getClusterThree();
        calculateCenter(c,count);
      }
      count --;
    }
    distanceToCenter();
    
  }
  private void calculateCenter(ArrayList<PVector> clusters,int index){
    float xSum = 0;
    float ySum = 0;
    float numOfPoints = clusters.size();
    
    for(PVector p : clusters){
      ySum = ySum + p.y;
      xSum = xSum + p.x;      
    }
    PVector center = new PVector(xSum/numOfPoints,ySum/numOfPoints);
    
    clussterCenter[index] = center;
  }
  
  public void distanceToCenter(){
    for(int i = 0;i<clussterCenter.length;i++){
      PVector p = clussterCenter[i];
      float d = dist(p.x,p.y,xMouse,yMouse);
      
      stroke(255);
      line(xMouse,yMouse,p.x,p.y);
      
      distanceFromCenter[i] = d;
      addToCluster(i,d);
     }  
     float minValue = arrayOfDistance.min();
     for(int i = 0;i<=arrayOfDistance.size();i++){
       if(arrayOfDistance.get(i) == minValue){
         dp.addToCluster(i,xMouse,yMouse);
         break;
       }
       continue;
     }
     
  }
  
  public void addToCluster(int index,float d){
    ArrayList<PVector> c;
    float sumOfDistance = 0;
    float K = 5;
      if(index == 0){
        c = dp.getClusterOne();
      }
      else if(index == 1){
         c = dp.getClusterTwo();
      }
      else {
        c = dp.getClusterThree();
      }
        
        for(PVector p : c){
          float distance = dist(p.x,p.y,xMouse,yMouse);
          if(distance < d && K > 0){
            sumOfDistance += distance;
            K--;
          }
          if(sumOfDistance == 0 && K == 0){
            sumOfDistance = d;
            break;
          }
        if(sumOfDistance != 0 && K == 0){
          break;
        }
      
      }
      arrayOfDistance.set(index,sumOfDistance);
      
  }
}
