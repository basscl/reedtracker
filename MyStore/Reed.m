//
//  Reed.m
//  MyStore
//
//  Created by Eileen Mack on 3/8/16.
//  Copyright (c) 2016 Eileen Mack. All rights reserved.
//

#import "Reed.h"


@implementation Reed

@dynamic boxSort;
@dynamic dateCreated;
@dynamic sortDate;
@dynamic reedBrand;
@dynamic reedIdMark;
@dynamic reedSize;
@dynamic reedNumber;
@dynamic reedProps;
@dynamic box;

- (id)initWithBox:(Box *)aBox {
    self = [super init];
    if (self) {
        // Any custom setup work goes here
        self.box = aBox;
        self.reedBrand = aBox.brand;
        self.reedSize = aBox.size;
        
    }
    return self;
}

@end
