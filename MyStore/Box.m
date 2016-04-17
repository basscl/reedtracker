//
//  Box.m
//  MyStore
//
//  Created by Eileen Mack on 4/15/16.
//  Copyright (c) 2016 Eileen Mack. All rights reserved.
//

#import "Box.h"
#import "Reed.h"


@implementation Box

@dynamic numReeds;
@dynamic brand;
@dynamic dateStarted;
@dynamic size;
@dynamic locationStarted;
@dynamic reeds;

- (id)initWithnumReeds:(int )num{
    self = [super init];
    if (self) {
        // Any custom setup work goes here
        for (int i = 1; i <= num; i++) {
            Reed *newReed = [[Reed alloc] initWithBox:self];
            newReed.reedNumber = i;
        }
        
    }
    return self;
}



- (id)initBoxOf5{
    Box *newBox = [[Box alloc]initWithnumReeds:5];
    return newBox;
}

- (id)initBoxOf10{
    Box *newBox = [[Box alloc]initWithnumReeds:10];
    return newBox;
}

- (void)add10Reeds{
    //for 1 to 10 make a new reed that has this box
    for (int i = 1; i <= 10; i++) {
        //make a reed
        NSEntityDescription *entityReed = [NSEntityDescription entityForName:@"Reed" inManagedObjectContext:self.managedObjectContext];
        Reed *newReed = [[Reed alloc] initWithEntity:entityReed insertIntoManagedObjectContext:self.managedObjectContext];
        
        // Set Properties
        newReed.reedSize = self.size;
        newReed.reedNumber = i;
        newReed.reedBrand = self.brand;
        
        // Add reed to box
        newReed.box = self;
    }
}

- (void)add5Reeds{
    //for 1 to 10 make a new reed that has this box
    for (int i = 1; i <= 5; i++) {
        //make a reed
        NSEntityDescription *entityReed = [NSEntityDescription entityForName:@"Reed" inManagedObjectContext:self.managedObjectContext];
        Reed *newReed = [[Reed alloc] initWithEntity:entityReed insertIntoManagedObjectContext:self.managedObjectContext];
        
        // Set Properties
        newReed.reedSize = self.size;
        newReed.reedNumber = i;
        newReed.reedBrand = self.brand;
        
        // Add reed to box
        newReed.box = self;
    }
}


@end
