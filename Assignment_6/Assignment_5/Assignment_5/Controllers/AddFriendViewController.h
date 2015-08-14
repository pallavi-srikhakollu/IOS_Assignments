

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "FrontViewController.h"
#import "PersonInfo.h"
@interface AddFriendViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textFieldFirstName;

@property (weak, nonatomic) IBOutlet UITextField *textFieldLastName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCity;
@property (weak, nonatomic) IBOutlet UITextField *textFieldState;
@property (weak, nonatomic) IBOutlet UIButton *buttonSaveData;
@property PersonInfo *person;
@property BOOL isEdit;
@property long int rowIndex;
@end
