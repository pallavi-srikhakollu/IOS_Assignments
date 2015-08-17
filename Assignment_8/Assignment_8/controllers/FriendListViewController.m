

#import "FriendListViewController.h"

@interface FriendListViewController ()
{
    NSString *CellIdentifier;
    NSArray *fetchedObjects;
    
    __weak IBOutlet UITableView *tableViewFriendsList;
}
@end

@implementation FriendListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self fetchFromCoreData];
    CellIdentifier = @"cell";
    [tableViewFriendsList registerNib:[UINib nibWithNibName:@"CustomizedTableViewCell" bundle:nil] forCellReuseIdentifier:CellIdentifier];
    
   // [tableViewFriendsList reloadData];
}
-(void)viewWillAppear:(BOOL)animated{
     [self fetchFromCoreData];
    [tableViewFriendsList reloadData];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonAddDetails:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AddDetailsViewController*addDetailsViewController=  [storyboard instantiateViewControllerWithIdentifier:@"AddDetailsViewController"];
    addDetailsViewController.isFriends = YES;
    [self.navigationController pushViewController:addDetailsViewController animated:true];
}


- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}


-(void)fetchFromCoreData {
    
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Friend" inManagedObjectContext:context];
    
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    fetchedObjects = [[NSArray alloc]init];
    fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
}


#pragma mark -TableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [fetchedObjects count];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 61;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomizedTableViewCell * cell;
    
    if (cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    }
    Friend *friend  =[fetchedObjects objectAtIndex:indexPath.row];
    cell.labelContactOrLocation.text = [NSString stringWithFormat:@"%@",friend.contactNo];
    cell.labelNameOrOrganisation.text = friend.name;
    
    
    return cell;
}


@end
