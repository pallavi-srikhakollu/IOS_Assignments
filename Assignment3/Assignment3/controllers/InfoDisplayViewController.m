

#import "InfoDisplayViewController.h"

@interface InfoDisplayViewController ()

@end

@implementation InfoDisplayViewController
@synthesize lableFirstName;
@synthesize labelCity;
@synthesize labelState;
@synthesize lableLastName;
@synthesize firstname;
@synthesize lastname;
@synthesize city;
@synthesize state;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Details";
    //Assigning detils to label
    
    lableFirstName.text = firstname;
    lableLastName.text = lastname;
    labelCity.text = city;
    labelState.text = state;
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
