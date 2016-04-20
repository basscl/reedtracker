//
//  PropertyDetailViewController.h
//  MyStore
//
//  Created by Eileen Mack on 2/16/16.
//  Copyright (c) 2016 Eileen Mack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reed.h"
#import "ReedPropertyBundle.h"


@interface PropertyDetailViewController : UIViewController
@property (strong) ReedPropertyBundle *property;
@property (strong) Reed *reed;
@property (weak, nonatomic) IBOutlet UITextField *Date;
@property (weak, nonatomic) IBOutlet UITextField *Judgement;

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;


@end
