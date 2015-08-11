

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Person.h"
#import "FrontViewController.h"
@interface AddFriendViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textFieldFirstName;

@property (weak, nonatomic) IBOutlet UITextField *textFieldLastName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCity;
@property (weak, nonatomic) IBOutlet UITextField *textFieldState;
@property (weak, nonatomic) IBOutlet UIButton *buttonSaveData;

@end
