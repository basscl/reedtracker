//
//  Reed.h
//  MyStore
//
//  Created by Eileen Mack on 3/8/16.
//  Copyright (c) 2016 Eileen Mack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Box.h"

@interface Reed : NSManagedObject

@property (nonatomic, retain) NSString * boxSort;
@property (nonatomic, retain) NSDate * dateCreated;
@property (nonatomic, retain) NSDate * sortDate;

@property (nonatomic, retain) NSString * reedBrand;
@property (nonatomic, retain) NSString * reedIdMark;
@property (nonatomic, retain) NSString * reedSize;
@property (nonatomic) int reedNumber;
@property (nonatomic, retain) NSSet *reedProps;
@property (nonatomic, retain) NSManagedObject *box;
@end

@interface Reed (CoreDataGeneratedAccessors)

- (void)addReedPropsObject:(NSManagedObject *)value;
- (void)removeReedPropsObject:(NSManagedObject *)value;
- (void)addReedProps:(NSSet *)values;
- (void)removeReedProps:(NSSet *)values;

- (id)initWithBox:(Box *)aBox;

@end
