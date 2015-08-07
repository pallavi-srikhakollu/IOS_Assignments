

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
                                 @1 ,@"experience",
                                 [NSArray arrayWithObjects:@"c++",@"java", nil ] ,@"technolgies",nil],
                                   
                                   
                                [NSDictionary dictionaryWithObjectsAndKeys:
                                 @"rakshith",@"firstname",
                                 @"nandish",@"lastname",
                                 [NSDictionary dictionaryWithObjectsAndKeys:
                                  @"pune",@"city",@"maharashtra",@"state",nil],@"address",
                                 @2 ,@"employeeId",
                                 @3 ,@"experience",
                                 [NSArray arrayWithObjects:@"c++",@"java", nil ] ,@"technolgies",nil],
                                   
                                   
                                [NSDictionary dictionaryWithObjectsAndKeys:
                                 @"sweta",@"firstname",
                                 @"srikhakollu",@"lastname",
                                 [NSDictionary dictionaryWithObjectsAndKeys:
                                  @"hyderabad",@"city",@"andhrapradesh",@"state",nil],@"address",
                                 [@3 intValue],@"employeeId",
                                 [@5 intValue],@"experience",
                                 [NSArray arrayWithObjects:@"c++",@"html",@"mainframe", nil ] ,@"technolgies",nil]
                                
                                
                                ,nil];
    
    
    
    
    
    
   // NSLog(@"%@",arrayOfInformationDicitonary);


    return self;



}



@end
