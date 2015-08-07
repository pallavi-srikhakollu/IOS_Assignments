

#import <Foundation/Foundation.h>
#import "Person.h"
#import "InformationDicitonary.h"


@interface Employee : Person

@property int employeeId;
@property int experience;
@property NSMutableArray* technology;
@property NSMutableArray *arrayOfEmployeeObjects;


-(Employee *)initWithValuesOfFirstName:(NSString*)firstName withLastName :(NSString*)lastName withCity :(NSString*)city withState:(NSString*)state withEmployeeId:(int)employeeId    withExperience :(int)experience;


-(void) arrayOfEmployeeInformation;
-(void)print;
-(void)selectedEmployeeWithLessExperience:(int)userExperienceInput;
-(void)selectedEmployeeWithMoreExperience:(int)userExperienceInput;
-(void)selectedEmployeeWithEqualExperience:(int)userExperienceInput;
-(void)employeeWithHighestExperienceInGivenTechnology:(NSString*)givenTechnology;
@end
