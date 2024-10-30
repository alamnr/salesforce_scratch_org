
public with sharing class ApexUtils {
  
  // This method is used to return a map of object api name and it's label
  public static Map<String,String> getObjectApiNameToLabel(){
    
    Map<String,String> objectApiNameToLabelMap = new Map<String,String>();

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

  // This method is used to return all accessible fields for an sObject

  public static Set<String> getSObjectFields(String sObjectName){

    Set<String> fieldNames = new Set<String>();
    // Getting metadata of all objects
    Map<String, Schema.SObjectType> sObjectMap = Schema.getGlobalDescribe();
    // Get reference to current sObject
    Schema.SObjectType sObjectTypeInstance = sObjectMap.get(sObjectName);

    if(sObjectTypeInstance != null){
       // Getting fields for current sObject
       Map<String,Schema.SObjectField> fieldMap = sObjectTypeInstance.getDescribe().fields.getMap();
       // checking each field one by one , if it is accessible adding its name to field set
       for(Schema.SObjectField field : fieldMap.values()){
        Schema.DescribeFieldResult fieldResult = field.getDescribe();
        if(fieldResult.isAccessible()){
          fieldNames.add(fieldResult.getName());
        }
       }
    }
    return fieldNames;
  }

 // This method is used to return SOQL query consisting of all fields for an object that is accessible by the current user 

 public static String getSOQL(String objectName){
    //  getting the field name using the object name
    Set<String> fieldNames = getSObjectFields(objectName);
    // Forming the SOQL query 
    String query = 'SELECT ';
    for(String fieldName : fieldNames){
      query += fieldName + ', ' ;
    }

    // Removing last  ',' from  SOQL query string 
    query = query.subString(0,query.lastIndexOf(','));

    query += '  FROM  ' + objectName;

    return query;
 }

 // This method return the picklist field values and the associated label for an object and field which are passed in parameter

 public static Map<String, String> getPicklistValuesMap(String objectApiName, String fieldApiName){

    Map<String,String> pickListFieldMap = new Map<String,String>();
    // Getting the field result for the current field
    Schema.DescribeFieldResult  fieldResult =  Schema.getGlobalDescribe().get(objectApiName)?.getDescribe()?.fields?.getMap()?.get(fieldApiName)?.getDescribe();
    // checking if the field type is picklist
    if((fieldResult != null) && (fieldResult.getType() == Schema.DisplayType.Picklist)){

      // Getting all picklist entries 
      List<Schema.PicklistEntry> picklistEntries = fieldResult.getPicklistValues();
      for(Schema.PicklistEntry picklistEntry : picklistEntries){
        // if the pick list entry is active getting the label and value and putting those in map
        if(picklistEntry.isActive()){
          String picklistLabel = picklistEntry.getLabel();
          String picklistValue = picklistEntry.getValue();
          pickListFieldMap.put(picklistValue,picklistLabel);
        }
      }
    }

    return pickListFieldMap;
 }

 // This method is going to return map of record type name with its id
    public static Map<String,Id> getRecordTypeIdsByName(String objectApiName){

      Map<String , Id> recordTypesMap = new Map<STring,Id>();
      // Getting the object result 
      Schema.DescribeSObjectResult objectResult = Schema.getGlobalDescribe().get(objectApiName)?.getDescribe();
      if(objectResult != null){
        // Get the record type info  list 
        List<Schema.RecordTypeInfo> recordTypeInfos = objectResult.getRecordTypeInfos();
        for(Schema.RecordTypeInfo info: recordTypeInfos){
          // if the current record type is active and available then add its name and id to the map
          if(info.isActive() && info.isAvailable()){
            recordTypesMap.put(info.getName(), info.getRecordTypeId());
          }
        }
      }
      return recordTypesMap;
    }


}