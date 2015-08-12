

#import "FrontViewController.h"


@interface FrontViewController (){
    NSString *CellIdentifier;
    NSArray *fetchedObjects;
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
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"PersonInfo" inManagedObjectContext:context];
    
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    fetchedObjects = [[NSArray alloc]init];
    fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    
    [tableViewFriendList reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)tapAction:(id)sender {
    NSLog(@"Cell tapped");
}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}



- (IBAction)addFriend:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AddFriendViewController *myListVCntrl =  [storyboard instantiateViewControllerWithIdentifier:@"AddFriendViewController"];
    
    [self.navigationController pushViewController:myListVCntrl animated:true];
    
}
#pragma  table view

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [fetchedObjects count];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 74;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    CustomizedTableViewCell *cell;
    
    if (cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    }
    
    PersonInfo *person=[fetchedObjects objectAtIndex:indexPath.row];
    cell.labelFirstName.text = person.firstName;
    cell.labelLastName.text =person.lastName;
    cell.uiImageProfilePicture.image = [UIImage imageNamed:@"Image"];
    
    return cell;
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AddFriendViewController *addFriendViewController=  [storyboard instantiateViewControllerWithIdentifier:@"AddFriendViewController"];
    PersonInfo *person = [fetchedObjects objectAtIndex:indexPath.row];
    
    addFriendViewController.stringFirstName = person.firstName;
    addFriendViewController.stringLastName = person.lastName;
    addFriendViewController.stringCity = person.city;
    addFriendViewController.stringState = person.state;
    addFriendViewController.isEdit = YES;
    addFriendViewController.rowIndex = indexPath.row;
    [self.navigationController pushViewController:addFriendViewController animated:true];
}





@end
