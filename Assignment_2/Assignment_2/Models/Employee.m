

#import "Employee.h"

@implementation Employee
@synthesize employeeId;
@synthesize experience;
@synthesize technology;
@synthesize arrayOfEmployeeObjects;
@synthesize informationDicitonary;

-(instancetype)init{
    self = [super init];
    self.technology = @"";
    return self;
}

-(void)arrayOfEmployeeInformation{
    
    NSInteger length;
    
    informationDicitonary =[[InformationDicitonary alloc]init];
    
    NSMutableDictionary *localDicitonary=[[NSMutableDictionary alloc]init];
    NSMutableDictionary *localDicitonaryForAddress=[[NSMutableDictionary alloc]init];
    
    length= informationDicitonary.arrayOfInformationDicitonary.count;
    arrayOfEmployeeObjects =[[NSMutableArray alloc]init];
    
    for (int i=0; i<length; i++) {
        
        localDicitonary=[informationDicitonary.arrayOfInformationDicitonary objectAtIndex:i];
        
        Employee *employee = [[Employee alloc]init];
        localDicitonaryForAddress = [localDicitonary objectForKey:@"address"];
        employee.firstName = [localDicitonary objectForKey:@"firstname"];
        employee.lastName = [localDicitonary objectForKey:@"lastname"];
        employee.address.city = [localDicitonaryForAddress objectForKey:@"city"];
        employee.address.state = [localDicitonaryForAddress objectForKey:@"state"];
        employee.employeeId = [[localDicitonary objectForKey:@"employeeId"] intValue];
        employee.experience = [[localDicitonary objectForKey:@"experience"] intValue];
        employee.technology = [localDicitonary objectForKey:@"technolgies"];
        [arrayOfEmployeeObjects addObject:employee];

        
    }
    
}


-(void)print{
    
    NSLog(@"%@",self.firstName);
    NSLog(@"%@",self.lastName);
    NSLog(@"%@",self.address.city);
    NSLog(@"%@",self.address.state);
    NSLog(@"%d",self.experience);
    NSLog(@"%d",self.employeeId);
    NSLog(@"%@",self.technology);
    
}
-(void)selectedEmployeeWithLessExperience:(int)userExperienceInput{
    
    NSLog(@"Employee details with less expereinece then %d",userExperienceInput);
    for(int i=0;i<arrayOfEmployeeObjects.count;i++)
    {
        Employee *employeeTemp=[arrayOfEmployeeObjects objectAtIndex:i];
        
        if((int)employeeTemp.experience<userExperienceInput)
        {
            
            [employeeTemp print];
            
            
        }
        
    }
}

-(void)selectedEmployeeWithMoreExperience:(int)userExperienceInput{
    NSLog(@"Employee details with more expereinece then %d",userExperienceInput);
    for(int i=0;i<arrayOfEmployeeObjects.count;i++)
    {
        Employee *employeeTemp=[arrayOfEmployeeObjects objectAtIndex:i];
        
        if((int)employeeTemp.experience>userExperienceInput)
        {
            [employeeTemp print];
            
        }
        
    }
    
}

-(void)selectedEmployeeWithEqualExperience:(int)userExperienceInput{
    NSLog(@"Employee details with  expereinece equal to %d",userExperienceInput);
    for(int i=0;i<arrayOfEmployeeObjects.count;i++)
    {
        Employee *employeeTemp=[arrayOfEmployeeObjects objectAtIndex:i];
        
        if((int)employeeTemp.experience==userExperienceInput)
        {
            [employeeTemp print];
            
        }
    }
    
    
}
-(void)employeeWithHighestExperienceInGivenTechnology:(NSString*)givenTechnology{
    int maximumExperience=0;
    int employeeIdWithMaximumExperience = 0;
    
    for(int i=0;i<arrayOfEmployeeObjects.count;i++)
    {
        
        Employee *employeeTemp=[arrayOfEmployeeObjects objectAtIndex:i];
        
        
        if(employeeTemp.technology == givenTechnology)
        {
            if(maximumExperience<[employeeTemp experience] ){
                
                employeeIdWithMaximumExperience=i;
            }
        }
    }
    NSLog(@"Employee with highest experience in %@",givenTechnology);
    
    Employee *employeeTemp=[arrayOfEmployeeObjects objectAtIndex:employeeIdWithMaximumExperience];
    NSLog(@"%@",[employeeTemp firstName]);
    
    
}

@end
