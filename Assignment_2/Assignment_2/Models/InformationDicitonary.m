

#import "InformationDicitonary.h"

@implementation InformationDicitonary
@synthesize arrayOfInformationDicitonary;

-(InformationDicitonary*)  init{
    
   arrayOfInformationDicitonary =[[NSMutableArray alloc]init];
    
    
    arrayOfInformationDicitonary= [NSMutableArray arrayWithObjects:
                                [NSDictionary dictionaryWithObjectsAndKeys:
                                 @"pallavi",@"firstname",
                                 @"srikhakollu",@"lastname",
                                 [NSDictionary dictionaryWithObjectsAndKeys:
                                  @"pune",@"city",@"maharashtra",@"state",nil],@"address",
                                 @1  ,@"employeeId",
                                 @2 ,@"experience",
                                 @"c++",@"technolgies",nil],
                                   
                                   
                                [NSDictionary dictionaryWithObjectsAndKeys:
                                 @"rakshith",@"firstname",
                                 @"nandish",@"lastname",
                                 [NSDictionary dictionaryWithObjectsAndKeys:
                                  @"pune",@"city",@"maharashtra",@"state",nil],@"address",
                                 @2 ,@"employeeId",
                                 @4 ,@"experience",
                                 @"java",@"technolgies",nil],
                                   
                                   
                                [NSDictionary dictionaryWithObjectsAndKeys:
                                 @"sweta",@"firstname",
                                 @"srikhakollu",@"lastname",
                                 [NSDictionary dictionaryWithObjectsAndKeys:
                                  @"hyderabad",@"city",@"andhrapradesh",@"state",nil],@"address",
                                 @3 ,@"employeeId",
                                 @5 ,@"experience",
                                 @"html",@"technolgies",nil]
                                
                                
                                ,nil];
    

    return self;

}



@end
