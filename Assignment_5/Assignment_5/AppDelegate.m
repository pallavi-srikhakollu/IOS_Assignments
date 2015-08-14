

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize arrayOfFriendsInformation;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //Creating array of person objects to store information
    
    arrayOfFriendsInformation=[[NSMutableArray alloc]init];
    Person  * person = [[Person alloc]init];
    person.firstName = @"pallavi";
    person.lastName = @"murty";
    
    [arrayOfFriendsInformation addObject:person];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
