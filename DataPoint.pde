class DataPoint{
  private float x;
  private float y;
  private int INITIAL_SIZE = 50;
  
  private ArrayList<PVector> cluster_One = new ArrayList<PVector>(50);
  private ArrayList<PVector> cluster_Two = new ArrayList<PVector>(50);
  private ArrayList<PVector> cluster_Three = new ArrayList<PVector>(50);
  
  
  public DataPoint(){
    for(int i =0;i < INITIAL_SIZE;i++){      
        x = random(20,100);
        y = random(20,100);
        cluster_One.add(new PVector(x,y));
    }
    for(int i =0;i < INITIAL_SIZE;i++){      
        x = random(300,450);
        y = random(200,300);
        cluster_Two.add(new PVector(x,y));
    }
    for(int i =0;i < INITIAL_SIZE;i++){      
        x = random(20,100);
        y = random(310,450);
        cluster_Three.add(new PVector(x,y));
    }
  }
  
  public void show(){
    stroke(0);
    for(PVector p : cluster_One){    
      fill(255,0,0);
       circle(p.x,p.y,20);
       
    }
    for(PVector p : cluster_Two){  
      fill(0,255,0);
      circle(p.x,p.y,20);
       
    }
    for(PVector p : cluster_Three){ 
      fill(222,250,15);
       circle(p.x,p.y,20);
       
    }
    
  }
  public ArrayList<PVector> getClusterOne(){
    return cluster_One;
  }
  
  public ArrayList<PVector> getClusterTwo(){
    return cluster_Two;
  }
  
  public ArrayList<PVector> getClusterThree(){
    return cluster_Three;
  }
  public void addToCluster(int index,float x,float y){
    if(index == 0){
      cluster_One.add(new PVector(x,y));
    }
    else if(index == 1){
      cluster_Two.add(new PVector(x,y));
    }
    else{
      cluster_Three.add(new PVector(x,y));
    }
  }
}
