

#import <Foundation/Foundation.h>

@interface CalculateSimpleInterest : NSObject{
    float const simpleInterestDivisor;
}
    

@property float principalAmount;
@property float rate,timePeriod;

-(float)simpleInterestCalculatorWithAmount :(float)principalAmount withinterest:(float) rate withtime : (float)timePeriod;

@end
