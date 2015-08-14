

#import "InformationDicitonary.h"

@implementation InformationDicitonary


+(NSArray*)dicitonaryOfEmployee{
    NSArray *arrayOfInformationDicitonary;
    arrayOfInformationDicitonary= [NSMutableArray arrayWithObjects:
                                   @{@"firstname": @"pallavi",
                                     @"lastname" : @"srikhakollu",
                                     @"address" : @{
                                             @"city": @"pune",
                                             @"state" : @"maharashtra"},
                                     @"employeeId" : @1,
                                     @"experience" : @1,
                                     @"technology" : @"java"
                                     },
                                   @{@"firstname": @"rakshith",
                                     @"lastname" : @"nandish",
                                     @"address" : @{
                                                     @"city": @"pune",
                                                     @"state" : @"maharashtra"},
                                     @"employeeId" : @2,
                                     @"experience" : @3,
                                     @"technology" : @"c++"
                                     },
                                   @{@"firstname": @"nitesh",
                                     @"lastname" : @"kumar",
                                     @"address" : @{
                                             @"city": @"pune",
                                             @"state" : @"maharashtra"},
                                     @"employeeId" : @3,
                                     @"experience" : @3,
                                     @"technology" : @"ios"
                                     },
                                   @{@"firstname": @"sweta",
                                     @"lastname" : @"srikhakollu",
                                     @"address" : @{
                                             @"city": @"hyderabad",
                                             @"state" : @"andhrapradesh"},
                                     @"employeeId" : @4,
                                     @"experience" : @3,
                                     @"technology" : @"html"
                                     },
                                   @{@"firstname": @"abc",
                                     @"lastname" : @"abc",
                                     @"address" : @{
                                             @"city": @"nagpur",
                                             @"state" : @"maharashtra"},
                                     @"employeeId" : @5,
                                     @"experience" : @6,
                                     @"technology" : @"javascript"
                                     },
                                   @{@"firstname": @"sakshi",
                                     @"lastname" : @"saxena",
                                     @"address" : @{
                                             @"city": @"mumbai",
                                             @"state" : @"maharashtra"},
                                     @"employeeId" : @6,
                                     @"experience" : @1,
                                     @"technology" : @"andriod"
                                     }
                            
                                ,nil];
    

    return arrayOfInformationDicitonary;

}



@end
