
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Organisation : NSManagedObject

@property (nonatomic, retain) NSString * organisationName;
@property (nonatomic, retain) NSString * location;

@end
