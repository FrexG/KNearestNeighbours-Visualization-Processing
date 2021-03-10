/* 
    @author: Fraol Gelana
    @Organization:Artificial Intelligence Center
    @Date:March,2021
*/

class KNN{
  DataPoint dp;
  float xMouse,yMouse;
  PVector[] clussterCenter = new PVector[3];
  private float[] distanceFromCenter = new float[3];
  private FloatList arrayOfDistance = new FloatList(3);
  
  public KNN(DataPoint dp,float xMouse,float yMouse){
    this.dp = dp; // Initialize DataPoint
    this.xMouse = xMouse; // mouse click X position
    this.yMouse = yMouse; // mouse click Y position
    ClussterCenter();
  }
  
  // Calculate the center(Mean) of each cluster
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
    
    clussterCenter[index] = center; // Store the center of each cluster into an array
  }

  public void distanceToCenter(){
    // Calculate the distance from the center of each 
    // cluster to the new data point
    
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
    float sumOfDistance = 0; // Sum of distance from K points in the cluster
                             // to the new datapoint.
                             // The best cluster will be the one that minimizes
                             // the value of this variable
                             
    float K = 5;              // Number of points in cluster ( Neighbours )
      if(index == 0){
        c = dp.getClusterOne();
      }
      else if(index == 1){
         c = dp.getClusterTwo();
      }
      else {
        c = dp.getClusterThree();
      }
        // The K points will be choosen, such that the distance
        // from the new point to the K points (individually) is less 
        // than the distance from the new point to the center of the
        // corresponding cluster
        
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
