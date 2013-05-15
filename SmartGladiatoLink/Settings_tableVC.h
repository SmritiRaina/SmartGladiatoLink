//
//  Settings_tableVC.h
//  SmartGladiatoLink
//
//  Created by Smriti Raina on 16/04/13.
//  Copyright (c) 2013 Smriti Raina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Settings_tableVC : UITableViewController

@property (strong, nonatomic) IBOutlet UILabel *codePageValue_label;
@property (strong, nonatomic) IBOutlet UILabel *fontSelected_label;


@property (strong, nonatomic) IBOutlet UISwitch *terminalSwitch;
- (IBAction)terminalSwitchPressed:(UISwitch *)sender;


@property (strong, nonatomic) IBOutlet UISwitch *ignoreXhelpSwitch;
- (IBAction)ignoreXhelpSwitchPressed:(UISwitch *)sender;


/*@property (strong, nonatomic) IBOutlet UISwitch *supportFExitSwitch;
 - (IBAction)supportFExitSwitchPressed:(UISwitch *)sender;
 
 @property (strong, nonatomic) IBOutlet UISwitch *columnSepSwitch;
 - (IBAction)columnSepSwitchPressed:(UISwitch *)sender;
 @property (strong, nonatomic) IBOutlet UISwitch *autoConnectSwitch;
 - (IBAction)autoConnectSwitchPressed:(UISwitch *)sender;*/




@property (strong, nonatomic) IBOutlet UISwitch *cursorblinkSwitch;
- (IBAction)cursorblinkSwitchPressed:(UISwitch *)sender;


@property (strong, nonatomic) IBOutlet UISwitch *keepAliveSwitch;
- (IBAction)keepAliveSwitchPressed:(UISwitch *)sender;


@property (strong, nonatomic) IBOutlet UISwitch *allowblinkingSwitch;
- (IBAction)allowblinkingSwitchPressed:(UISwitch *)sender;





@end
