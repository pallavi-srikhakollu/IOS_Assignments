

#import "CalculateSimpleInterest.h"

@implementation CalculateSimpleInterest



@synthesize rate;
@synthesize timePeriod;

simpleInterestDivisor=100;

-(float)simpleInterestCalculatorWithAmount:(float)principalAmount withinterest:(float)rate withtime:(float)timePeriod  {
    
    float amount=(principalAmount*rate*timePeriod)/(simpleInterestDivisor);
    return amount;
    
}

@end
