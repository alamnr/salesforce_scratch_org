// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

string tempvar = 'Enter_your_name_here';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);


public enum DaysOfWeek{
    MONDAY,
    TUESDAY,
    WEDNESDAY,
    THURSDAY,
    FRIDAY,
    SATURDAY,
    SUNDAY
}

DaysOfWeek currentDay = DaysOfWeek.MONDAY;
System.debug('Current day of week is: '+ currentDay);

List<DaysOfWeek> daysOfWeekValues = DaysOfWeek.values();
System.debug('Values of days of week enum : '+ daysOfWeekValues);

String monday = DaysOfWeek.MONDAY.name();
System.debug('Converting monday from enum to string: ' + monday);

DaysOfWeek mondayEnum = DaysOfWeek.valueOf('tuesday');
System.debug('Converting value from string to enum :  '+ mondayEnum);

Integer thursDayIndex = DaysOfWeek.THURSDAY.ordinal();
System.debug('Ordinal of THURSDAY enum: ' + thursDayIndex);

System.debug('Is monday enum is equal to monday  : '+ DaysOfWeek.MONDAY.equals(mondayEnum));

System.debug(LoggingLevel.NONE,'Logging level set to NONE in this log');
System.debug(LoggingLevel.ERROR,'Logging level set to ERROR in this log');
System.debug(LoggingLevel.WARN,'Logging level set to WARN in this log');
System.debug(LoggingLevel.INFO,'Logging level set to INFO in this log');
System.debug(LoggingLevel.DEBUG,'Logging level set to DEBUG in this log');
System.debug(LoggingLevel.FINE,'Logging level set to FINE in this log');
System.debug(LoggingLevel.FINER,'Logging level set to FINER in this log');
System.debug(LoggingLevel.FINEST,'Logging level set to FINEST in this log');

System.debug(ApexUtils.getObjectApiNameToLabel());

System.debug(ApexUtils.getSObjectFields('Account'));

for(String field : ApexUtils.getSObjectFields('Lead')){
    System.debug(field);
}

System.debug(ApexUtils.getSOQL('Account'));

List<SObject> records = Database.query(ApexUtils.getSOQL('Account'));
System.debug(records);

System.debug(ApexUtils.getPicklistValuesMap('Account','Type'));

System.debug(ApexUtils.getRecordTypeIdsByName('Account'));

Schema.SObjectType currentObjectType = Account.getSObjectType();
Schema.DescribeSObjectResult currentSObjectResult = currentObjectType.getDescribe();
System.debug('Api Name :   ' + currentSObjectResult.getName());
System.debug('Is custom object :   '+ currentSObjectResult.isCustom());
System.debug('Is accessible :    ' + currentSObjectResult.isAccessible());
System.debug('Is creatable :  '+ currentSObjectResult.isCreateable());
System.debug('Is updatable :  '+ currentSObjectResult.isUpdateable());
System.debug('Is deletable : ' + currentSObjectResult.isDeletable());