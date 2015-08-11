

#import "FrontViewController.h"
#import "AddFriendViewController.h"
#import "CustomizedTableViewCell.h"
#import"AppDelegate.h"

@interface FrontViewController (){
    NSString *CellIdentifier;
}

@end

@implementation FrontViewController
@synthesize tableViewFriendList;
- (void)viewDidLoad {
    [super viewDidLoad];
    CellIdentifier = @"cell";
    [tableViewFriendList registerNib:[UINib nibWithNibName:@"CustomizedTableViewCell" bundle:nil] forCellReuseIdentifier:CellIdentifier];
}

-(void)viewWillAppear:(BOOL)animated{
    [tableViewFriendList reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






- (IBAction)addFriend:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AddFriendViewController *myListVCntrl =  [storyboard instantiateViewControllerWithIdentifier:@"AddFriendViewController"];
    
    [self.navigationController pushViewController:myListVCntrl animated:true];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [((AppDelegate *)[UIApplication sharedApplication].delegate).arrayOfFriendsInformation count];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 74;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    CustomizedTableViewCell *cell;
    
    if (cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    }
    
    Person *person = [[Person alloc]init];
    
    person = [((AppDelegate *)[UIApplication sharedApplication].delegate).arrayOfFriendsInformation objectAtIndex:indexPath.row];
    
    cell.labelFirstName.text = person.firstName;
    cell.labelLastName.text =person.lastName;
    cell.uiImageProfilePicture.image = [UIImage imageNamed:@"Image"];
    return cell;
    
}


@end
