

#import <Foundation/Foundation.h>
#import "Person.h"
#import "InformationDicitonary.h"


@interface Employee : Person

@property int employeeId;
@property int experience;
@property NSString * technology;
@property NSMutableArray *arrayOfEmployeeObjects;
@property  InformationDicitonary *informationDicitonary;

-(void) arrayOfEmployeeInformation;
-(void)print;
-(void)selectedEmployeeWithLessExperience:(int)userExperienceInput;
-(void)selectedEmployeeWithMoreExperience:(int)userExperienceInput;
-(void)selectedEmployeeWithEqualExperience:(int)userExperienceInput;
-(void)employeeWithHighestExperienceInGivenTechnology:(NSString*)givenTechnology;
@end
