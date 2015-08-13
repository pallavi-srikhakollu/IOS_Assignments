

#import "ViewController.h"
#define BASE_URL @"http://api.openweathermap.org/data/2.5/weather?q=%@"
@interface ViewController ()

@end

@implementation ViewController
@synthesize receivedData;
@synthesize  connection;
@synthesize responseDictionary;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self connectionEstablishment:@"Pune"];
    
}

-(void)connectionEstablishment:(NSString *) cityName{
    
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:[[NSString stringWithFormat:BASE_URL,cityName] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    
    connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)printDetails{
    NSLog(@"Place is :%@",[responseDictionary valueForKey:@"name"]);
    NSLog(@"Lontitude value is %@",[[responseDictionary objectForKey:@"coord"] valueForKey:@"lon"] );
    NSLog(@"Latitude value is %@",[responseDictionary valueForKeyPath:@"coord.lat"]);
    NSLog(@"Wind speed is %@",[responseDictionary valueForKeyPath:@"wind.speed"]);
    NSLog(@"Wind deg is %@",[responseDictionary valueForKeyPath:@"wind.deg"]);
    
}

#pragma mark- connectionFunction

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
    receivedData =[[NSMutableData alloc]init];
    NSLog(@"connection receive response");
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    
    [receivedData appendData:data];
    }

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    responseDictionary=[NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingMutableContainers error:nil];
    [self printDetails];
    
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"something very bad happened here");
}



@end
