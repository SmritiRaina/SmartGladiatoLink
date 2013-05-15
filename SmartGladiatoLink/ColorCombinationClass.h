//
//  ColorCombinationClass.h
//  SmartGladiatoLink
//
//  Created by Smriti Raina on 16/04/13.
//  Copyright (c) 2013 Smriti Raina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorCombinationClass : UITableViewController
{
    NSString *colorAsString;
}

@property(strong,nonatomic)NSIndexPath *indexP_colorcomb;
@property (strong, nonatomic) IBOutlet UITableView *colorCombination_tableView;

@property (strong, nonatomic) IBOutlet UISlider *redValueSlider;
- (IBAction)redValueChanged:(UISlider *)sender;

@property (strong, nonatomic) IBOutlet UISlider *greenValueSlider;
- (IBAction)greenValueChanged:(UISlider *)sender;

@property (strong, nonatomic) IBOutlet UISlider *blueValueSlider;
- (IBAction)blueValueChanged:(UISlider *)sender;

@property (strong, nonatomic) IBOutlet UIView *resultColorView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButton;

- (IBAction)saveResultedColor:(UIBarButtonItem *)sender;


@end
