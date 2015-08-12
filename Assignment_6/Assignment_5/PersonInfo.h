//
//  PersonInfo.h
//  Assignment_5
//
//  Created by webonise on 12/08/15.
//  Copyright (c) 2015 webonise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface PersonInfo : NSManagedObject

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * state;
@end
