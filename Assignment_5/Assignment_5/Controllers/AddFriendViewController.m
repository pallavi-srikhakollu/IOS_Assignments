
#import "AddFriendViewController.h"


@interface AddFriendViewController ()

@end

@implementation AddFriendViewController
@synthesize textFieldFirstName;
@synthesize textFieldLastName;
@synthesize textFieldCity;
@synthesize textFieldState;
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)saveFriendsDetalis:(id)sender {
    
    Person *person = [[Person alloc]init];
    person.firstName = textFieldFirstName.text;
    person.lastName = textFieldLastName.text;
    person.city = textFieldCity.text;
    person.state = textFieldState.text;
    
    
    [((AppDelegate *)[UIApplication sharedApplication].delegate).arrayOfFriendsInformation addObject:person];
    
    [self.navigationController popViewControllerAnimated:true];
    
    
}



@end
