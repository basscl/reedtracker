//
//  Reed.h
//  MyStore
//
//  Created by Eileen Mack on 3/8/16.
//  Copyright (c) 2016 Eileen Mack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Reed : NSManagedObject

@property (nonatomic, retain) NSString * reedBrand;
@property (nonatomic, retain) NSString * reedProperty;
@property (nonatomic, retain) NSString * reedSize;
@property (nonatomic, retain) NSString * reedIdMark;
@property (nonatomic, retain) NSString * reedNumber;
@property (nonatomic, retain) NSSet *reedProps;
@property (nonatomic, retain) NSManagedObject *box;
@end

@interface Reed (CoreDataGeneratedAccessors)

- (void)addReedPropsObject:(NSManagedObject *)value;
- (void)removeReedPropsObject:(NSManagedObject *)value;
- (void)addReedProps:(NSSet *)values;
- (void)removeReedProps:(NSSet *)values;

@end
