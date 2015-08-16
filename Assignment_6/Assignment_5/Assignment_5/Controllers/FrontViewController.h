

#import <UIKit/UIKit.h>
#import "PersonInfo.h"
#import "FrontViewController.h"
#import "AddFriendViewController.h"
#import "CustomizedTableViewCell.h"

@interface FrontViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *buttonAddFriend;
@property (weak, nonatomic) IBOutlet UITableView *tableViewFriendList;
@end
