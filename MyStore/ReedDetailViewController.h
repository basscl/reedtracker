//
//  DeviceDetailViewController.h
//  MyStore
//
//  Created by Eileen Mack on 9/7/15.
//  Copyright (c) 2015 Eileen Mack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReedDetailViewController : UIViewController

@property (strong) NSManagedObject *reed;
@property (weak, nonatomic) IBOutlet UITextField *reedBrandTextField;
@property (weak, nonatomic) IBOutlet UITextField *reedSizeTextField;
@property (weak, nonatomic) IBOutlet UITextField *reedPropertyTextField;


- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end
