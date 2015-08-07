

#import <Foundation/Foundation.h>
#import "Address.h"



@interface Person : NSObject
@property NSString * firstName;
@property NSString * lastName;
@property Address *address;

-(Person *)initWithValuesOfCity:(NSString *) city withState :(NSString *) state;
@end
