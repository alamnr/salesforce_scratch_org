
public with sharing class ApexUtils {
  
  // This method is used to return a map of object api name and it's label
  public static Map<STring,String> getObjectApiNameToLabel(){
    public static Map<String,String> objectApiNameToLabelMap = new Map<String,String>();

    // Getting all sObject Metadata
    Map<String,Schema.SObjectType> globalDescribeMap = Schema.getGlobalDescribe();
    // Processing each object one by one 
    for(String globalDescribeKey: globalDescribeMap.keySet()){
        // Getting the current object type
        Schema.SObjectType currentSObjectType = globalDescribeMap.get(globalDescribeKey);
        // Getting the current sObject Description result from sObject Type
        Schema.DescribeSObjectResult currentSObjectResult = currentSObjectType.getDescribe();
        // Getting the Api name  and value of current sObject and adding it to the map
        objectApiNameToLabelMap.put(currentSObjectResult.getName(), currentSObjectResult.getLabel());
        
    }
    return objectApiNameToLabelMap;
    
  }
  

}