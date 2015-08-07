

#import "Employee.h"

@implementation Employee
@synthesize employeeId;
@synthesize experience;
@synthesize technology;
@synthesize arrayOfEmployeeObjects;


-(Employee *)initWithValuesOfFirstName:(NSString*)firstName withLastName :(NSString*)lastName withCity :(NSString*)city withState:(NSString*)state withEmployeeId:(int)employeeId    withExperience :(int)experience  {
    
    self.firstName = firstName;
    self.lastName = lastName;
    self.address.city = city;
    self.address.state = state;
    self.employeeId = employeeId;
    self.experience = experience;
    
    return self;
    
}

-(void)arrayOfEmployeeInformation{
    
    NSInteger length;
    
    InformationDicitonary *informationDicitonary =[[InformationDicitonary alloc]init];
    
    NSMutableDictionary *localDicitonary=[[NSMutableDictionary alloc]init];
    
    length= informationDicitonary.arrayOfInformationDicitonary.count;
    arrayOfEmployeeObjects =[[NSMutableArray alloc]init];
    
    for (int i=0; i<length; i++) {
        
        localDicitonary=[informationDicitonary.arrayOfInformationDicitonary objectAtIndex:i];
        
        
        Employee *employee =[Employee alloc];
        technology=[[NSMutableArray alloc]init];
        
        employee= [employee initWithValuesOfFirstName:[localDicitonary objectForKey:@"firstname"] withLastName:[localDicitonary objectForKey:@"lastname"] withCity:@"bhopal" withState:@"mp" withEmployeeId:[[localDicitonary objectForKey:@"employeeId"] intValue]  withExperience:[[localDicitonary objectForKey:@"experience"] intValue]];
        
        //intialisting technologies
        
        self.technology = [localDicitonary objectForKey:@"technolgies"] ;
        
        [arrayOfEmployeeObjects addObject:employee];
        
        
    }
    
}


-(void)print{
    
    NSLog(@"%@",self.firstName);
    NSLog(@"%@",self.lastName);
    //NSLog(@"%d",self.experience);
    // NSLog(@"%@",self.address.city);
    // NSLog(@"%@",self.address.state);
    NSLog(@"%d",self.experience);
    NSLog(@"%d",self.employeeId);
    
}
-(void)selectedEmployeeWithLessExperience:(int)userExperienceInput{
    
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
    
    
    NSLog(@"inside function");
    
    for(int i=0;i<arrayOfEmployeeObjects.count;i++)
    {
        NSLog(@"inside function for 1");
        
        Employee *employeeTemp=[arrayOfEmployeeObjects objectAtIndex:i];
        
        NSLog(@"%@",[employeeTemp.technology objectAtIndex:i]);
        
        for(int j=0;i<employeeTemp.technology.count;i++){
            NSLog(@"inside function for 2");
            NSLog(@"%@",[employeeTemp.technology objectAtIndex:j]);
            
            if([employeeTemp.technology objectAtIndex:j]== givenTechnology)
            {
                NSLog(@"inside function comaprision");
                [employeeTemp print];
                
            }
        }
    }
    
    
}


@end
