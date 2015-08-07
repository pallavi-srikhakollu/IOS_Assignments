

#import "Person.h"

@implementation Person
@synthesize address;

-(Person*)initWithValuesOfCity:(NSString *) city withState :(NSString *) state{
    
    address =[[Address alloc]init];
    self.address.state = state;
    self.address.city=city;
    
    
    return self;
    
    
}

@end
