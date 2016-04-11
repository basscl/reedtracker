//
//  ReedPropertyBundle.h
//  MyStore
//
//  Created by Eileen Mack on 4/11/16.
//  Copyright (c) 2016 Eileen Mack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Reed;

@interface ReedPropertyBundle : NSManagedObject

@property (nonatomic, retain) NSString * date;
@property (nonatomic, retain) NSString * judgement;
@property (nonatomic, retain) Reed *reed;

@end
