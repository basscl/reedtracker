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
    [self addNReeds:10];
}

- (void)add5Reeds{
    [self addNReeds:5];
}

- (void)addNReeds:(int) n{

    //set the sort key for this box
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; //date should prob be assigned in a custom constructor
    [dateFormatter setDateFormat:@"yyyyMMddHHmm"];
    NSString *dateString = [dateFormatter stringFromDate:self.dateStarted];
    NSString *sortKey = [dateString stringByAppendingString:self.brand];
    sortKey = [sortKey stringByAppendingString:@" "];
    sortKey = [sortKey stringByAppendingString:self.size];
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
        newReed.dateCreated = self.dateStarted;
        newReed.boxSort = sortKey;
        
        
        // Add reed to box
        newReed.box = self;
    }
}


@end
