

#import <UIKit/UIKit.h>

@interface FrontViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *buttonAddFriend;
@property (weak, nonatomic) IBOutlet UITableView *tableViewFriendList;

@end
