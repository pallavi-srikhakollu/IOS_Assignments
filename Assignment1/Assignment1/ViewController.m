

#import "ViewController.h"
#import "CalculateSimpleInterest.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    //initializing calculatesimpleinterest object
    CalculateSimpleInterest *calculateSimpleInterestInstance=[[CalculateSimpleInterest alloc]init];
    
    //calling method to calculate simple interest
    float simpleInterestAmountToBePaid=[calculateSimpleInterestInstance simpleInterestCalculatorWithAmount:10000 withinterest:10 withtime:10];
    
    NSLog(@"the amount is %f",simpleInterestAmountToBePaid);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
