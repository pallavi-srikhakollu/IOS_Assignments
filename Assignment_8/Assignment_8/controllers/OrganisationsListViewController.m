
#import "OrganisationsListViewController.h"



@interface OrganisationsListViewController ()
{
    __weak IBOutlet UITableView *tableViewOrganisationList;
    NSString *CellIdentifier;
    NSArray *fetchedObjects;
    
}
@end

@implementation OrganisationsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CellIdentifier = @"cell";
    [tableViewOrganisationList registerNib:[UINib nibWithNibName:@"CustomizedTableViewCell" bundle:nil] forCellReuseIdentifier:CellIdentifier];
    }

-(void)viewWillAppear:(BOOL)animated{
    [self fetchFromCoreData];
    [tableViewOrganisationList reloadData];
}


-(void)fetchFromCoreData {
    
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Organisation" inManagedObjectContext:context];
    
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    fetchedObjects = [[NSArray alloc]init];
    fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)buttonAddDetails:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AddDetailsViewController *addDetailsViewController=  [storyboard instantiateViewControllerWithIdentifier:@"AddDetailsViewController"];
    addDetailsViewController.isFriends = NO;
    [self.navigationController pushViewController:addDetailsViewController animated:true];
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
    Organisation *organisation  = [fetchedObjects objectAtIndex:indexPath.row];
    
    cell.labelNameOrOrganisation.text = organisation.organisationName;
    cell.labelContactOrLocation.text = organisation.location;
    
    return cell;
}

@end
