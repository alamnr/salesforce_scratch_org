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