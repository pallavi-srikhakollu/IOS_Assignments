
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSURLConnectionDelegate>
@property NSMutableData * receivedData;
@property   NSURLConnection *connection;
@property NSDictionary *responseDictionary;
-(void)printDetails ;
@end

