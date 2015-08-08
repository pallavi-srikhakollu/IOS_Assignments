
#import <UIKit/UIKit.h>

@interface InfoDisplayViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lableFirstName;
@property (weak, nonatomic) IBOutlet UILabel *lableLastName;
@property (weak, nonatomic) IBOutlet UILabel *labelCity;
@property (weak, nonatomic) IBOutlet UILabel *labelState;
@property NSString * firstname;
@property NSString * lastname;
@property NSString * city;
@property NSString * state;



@end
