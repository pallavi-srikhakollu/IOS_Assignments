
#import <UIKit/UIKit.h>
#import "Person.h"

@interface InfoDisplayViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lableFirstName;
@property (weak, nonatomic) IBOutlet UILabel *lableLastName;
@property (weak, nonatomic) IBOutlet UILabel *labelCity;
@property (weak, nonatomic) IBOutlet UILabel *labelState;
@property Person *person;

@end
