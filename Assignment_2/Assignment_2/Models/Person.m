

#import "Person.h"

@implementation Person
@synthesize address;
@synthesize firstName;
@synthesize lastName;

-(instancetype)init{
self.firstName=@"";
self.lastName=@"";
address =[[Address alloc]init];
return self;
}
@end
