

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Employee *employee=[[Employee alloc]init];
    [employee arrayOfEmployeeInformation];
    //NSLog(@"%@",[employee arrayOfEmployeeObjects]);
   [employee selectedEmployeeWithLessExperience:3];
    [employee selectedEmployeeWithMoreExperience:1];
    [employee selectedEmployeeWithEqualExperience:1];
    NSArray *requiredTechnologies = @[@"c++",@"java",@"html",@"ios"];
    for(int i=0;i<requiredTechnologies.count;i++)
    {
       // NSLog(@"inside for");
        [employee employeeWithHighestExperienceInGivenTechnology:[requiredTechnologies objectAtIndex:i]];
        
    }
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
