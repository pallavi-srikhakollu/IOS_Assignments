

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "FrontViewController.h"
@interface AddFriendViewController : UIViewController<UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textFieldFirstName;

@property (weak, nonatomic) IBOutlet UITextField *textFieldLastName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCity;
@property (weak, nonatomic) IBOutlet UITextField *textFieldState;
@property (weak, nonatomic) IBOutlet UIButton *buttonSaveData;

@property (nonatomic,strong) NSString *stringFirstName;
@property (nonatomic,strong) NSString *stringLastName;
@property (nonatomic,strong) NSString *stringCity;
@property (nonatomic,strong) NSString *stringState;
@property BOOL isEdit;
@property long int rowIndex;
@end
