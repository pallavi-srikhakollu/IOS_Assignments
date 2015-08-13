

#import "InfoDisplayViewController.h"

@interface InfoDisplayViewController ()

@end

@implementation InfoDisplayViewController
@synthesize lableFirstName;
@synthesize labelCity;
@synthesize labelState;
@synthesize lableLastName;
@synthesize person;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Details";
    //Assigning detils to label
    
    self.lableFirstName.text = person.firstname;
    lableLastName.text = person.lastname;
    labelCity.text = person.city;
    labelState.text = person.state;
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
