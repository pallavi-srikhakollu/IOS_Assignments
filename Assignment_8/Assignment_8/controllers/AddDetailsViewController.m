

#import "AddDetailsViewController.h"


@interface AddDetailsViewController ()
{
    
    __weak IBOutlet UITextField *textFieldNameOrOrganisation;
    __weak IBOutlet UITextField *textFieldContactOrLocation;
    __weak IBOutlet UILabel *labelNameOrOrganisation;
    __weak IBOutlet UILabel *labelContactOrLocation;
}

@end

@implementation AddDetailsViewController
@synthesize isFriends;

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if(isFriends){
        labelContactOrLocation.text =@"ContactNo";
        labelNameOrOrganisation.text = @"First Name";
        
    }
    else{
        labelContactOrLocation.text =@"Location";
        labelNameOrOrganisation.text = @"Organisation Name";
    }
    
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (IBAction)buttonSaveDetails:(id)sender {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    NSManagedObject *newManagedObject;
    
    
    if(isFriends){
        
        newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:@"Friend" inManagedObjectContext:context];
        
        
        [newManagedObject setValue:textFieldNameOrOrganisation.text forKey:@"name"];
        NSNumber *contact = [NSNumber numberWithInt:[(textFieldContactOrLocation.text) intValue]];
        [newManagedObject setValue:contact  forKey:@"contactNo"];
           }
    
    
    else{
    
        newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:@"Organisation" inManagedObjectContext:context];
        
        
        [newManagedObject setValue:textFieldNameOrOrganisation.text forKey:@"organisationName"];
        
        [newManagedObject setValue:textFieldContactOrLocation.text forKey:@"location"];
        
           }
    
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    

    
    [self.navigationController popViewControllerAnimated:true];
    
    
}



@end




