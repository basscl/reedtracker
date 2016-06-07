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
@dynamic idMark;
@dynamic size;
@dynamic locationStarted;
@dynamic reeds;

- (void)add10Reeds{
    //set the sort key for this box
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; //date should prob be assigned in a custom constructor
    [dateFormatter setDateFormat:@"yyyyMMddHHmm"];
    NSString *dateString = [dateFormatter stringFromDate:self.dateStarted];
    NSString *sortKey = [dateString stringByAppendingString:self.brand];
    //for 1 to 10 make a new reed that has this box
    for (int i = 1; i <= 10; i++) {
        //make a reed
        NSEntityDescription *entityReed = [NSEntityDescription entityForName:@"Reed" inManagedObjectContext:self.managedObjectContext];
        Reed *newReed = [[Reed alloc] initWithEntity:entityReed insertIntoManagedObjectContext:self.managedObjectContext];
        
        // Set Properties
        newReed.reedSize = self.size;
        newReed.reedNumber = i;
        newReed.reedBrand = self.brand;
        newReed.reedIdMark = self.idMark;
        newReed.boxSort = sortKey;
        
        
        // Add reed to box
        newReed.box = self;
    }
}

- (void)add5Reeds{
    //set the sort key for this box
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; //date should prob be assigned in a custom constructor
    [dateFormatter setDateFormat:@"yyyyMMddHHmm"];
    NSString *dateString = [dateFormatter stringFromDate:self.dateStarted];
    NSString *sortKey = [dateString stringByAppendingString:self.brand];
    //for 1 to 10 make a new reed that has this box
    for (int i = 1; i <= 5; i++) {
        //make a reed
        Reed *newReed = [[Reed alloc] init];
        //add it to the box
        [self addReedsObject:newReed];
        // Set Properties
        newReed.reedSize = self.size;
        newReed.reedNumber = i;
        newReed.reedBrand = self.brand;
        newReed.reedIdMark = self.idMark;
        newReed.boxSort = sortKey;

    }
}


@end
