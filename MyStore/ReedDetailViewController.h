//
//  DeviceDetailViewController.h
//  MyStore
//
//  Created by Eileen Mack on 9/7/15.
//  Copyright (c) 2015 Eileen Mack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reed.h"
#import "Box.h"

@interface ReedDetailViewController : UIViewController

@property (strong) Reed *reed;
@property (strong) Box *box;
@property (weak, nonatomic) IBOutlet UITextField *reedBrandTextField;
@property (weak, nonatomic) IBOutlet UITextField *reedSizeTextField;
@property (weak, nonatomic) IBOutlet UITextField *reedPropertyTextField;

//collect source so can use for both ReedViewController and BoxViewController
@property (strong) UITableViewController *sourceView;


- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end
