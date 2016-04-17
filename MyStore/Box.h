//
//  Box.h
//  MyStore
//
//  Created by Eileen Mack on 4/15/16.
//  Copyright (c) 2016 Eileen Mack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Reed;

@interface Box : NSManagedObject

@property (nonatomic) int numReeds;
@property (nonatomic, retain) NSString * brand;
@property (nonatomic, retain) NSDate * dateStarted;
@property (nonatomic, retain) NSString * size;
@property (nonatomic, retain) NSString * locationStarted;
@property (nonatomic, retain) NSSet *reeds;
@end

@interface Box (CoreDataGeneratedAccessors)

- (void)addReedsObject:(Reed *)value;
- (void)removeReedsObject:(Reed *)value;
- (void)addReeds:(NSSet *)values;
- (void)removeReeds:(NSSet *)values;


- (id)initWithnumReeds:(int )num;
- (id)initBoxOf5;
- (id)initBoxOf10;
- (void)add10Reeds;
- (void)add5Reeds;




@end
