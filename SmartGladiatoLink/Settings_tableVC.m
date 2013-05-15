//
//  Settings_tableVC.m
//  SmartGladiatoLink
//
//  Created by Smriti Raina on 16/04/13.
//  Copyright (c) 2013 Smriti Raina. All rights reserved.
//

#import "Settings_tableVC.h"

@interface Settings_tableVC ()

@end

@implementation Settings_tableVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *documentDir_sett1=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) lastObject];
    
    NSString *path_sett = [documentDir_sett1 stringByAppendingPathComponent:@"Settings.plist"];
    
    NSMutableDictionary *dict2=[NSMutableDictionary dictionaryWithContentsOfFile:path_sett];
    
    [self.terminalSwitch setOn:YES animated:YES];
    [self.ignoreXhelpSwitch setOn:YES  animated:YES];
   // [self.supportFExitSwitch setOn:NO animated:YES];
   // [self.columnSepSwitch setOn:YES  animated:YES];
    [self.cursorblinkSwitch setOn:NO  animated:YES];
    [self.keepAliveSwitch setOn:NO  animated:YES];
    [self.allowblinkingSwitch setOn:NO  animated:YES];
   // [self.autoConnectSwitch setOn:NO  animated:YES];
    if (dict2!=nil) {
        
        
        [self.terminalSwitch setOn:[[dict2 objectForKey:@"terminalSwitch"] boolValue]  animated:YES];
        [self.ignoreXhelpSwitch setOn:[[dict2 objectForKey:@"ignoreXhelpSwitch"] boolValue]  animated:YES];
        //[self.supportFExitSwitch setOn:[[dict2 objectForKey:@"supportFExitSwitch"] boolValue]  animated:YES];
        //[self.columnSepSwitch setOn:[[dict2 objectForKey:@"columnSepSwitch"] boolValue]  animated:YES];
        [self.cursorblinkSwitch setOn:[[dict2 objectForKey:@"cursorblinkSwitch"] boolValue]  animated:YES];
        [self.keepAliveSwitch setOn:[[dict2 objectForKey:@"keepAliveSwitch"] boolValue]  animated:YES];
        [self.allowblinkingSwitch setOn:[[dict2 objectForKey:@"allowblinkingSwitch"] boolValue]  animated:YES];
        //[self.autoConnectSwitch setOn:[[dict2 objectForKey:@"autoConnectSwitch"] boolValue]  animated:YES];
               
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (IBAction)terminalSwitchPressed:(UISwitch *)sender {
     
    if (sender.isOn) 
          [self.terminalSwitch setOn:YES animated:YES];

    else
          [self.terminalSwitch setOn:NO animated:YES];
}


- (IBAction)ignoreXhelpSwitchPressed:(UISwitch *)sender {
    
    
    if (sender.isOn)
        [self.ignoreXhelpSwitch setOn:YES animated:YES];
    
    else
        [self.ignoreXhelpSwitch setOn:NO animated:YES];
}/*
  - (IBAction)supportFExitSwitchPressed:(UISwitch *)sender {
  
  
  if (sender.isOn)
  [self.supportFExitSwitch setOn:YES animated:YES];
  
  else
  [self.supportFExitSwitch setOn:NO animated:YES];
  }
  - (IBAction)columnSepSwitchPressed:(UISwitch *)sender {
  
  
  if (sender.isOn)
  [self.columnSepSwitch setOn:YES animated:YES];
  
  else
  [self.columnSepSwitch setOn:NO animated:YES];
  
  }
*/
- (IBAction)cursorblinkSwitchPressed:(UISwitch *)sender {
    
    
    if (sender.isOn)
        [self.cursorblinkSwitch setOn:YES animated:YES];
    
    else
        [self.cursorblinkSwitch setOn:NO animated:YES];
}
- (IBAction)keepAliveSwitchPressed:(UISwitch *)sender {
    
    
    if (sender.isOn)
        [self.keepAliveSwitch setOn:YES animated:YES];
    
    else
        [self.keepAliveSwitch setOn:NO animated:YES];
}
- (IBAction)allowblinkingSwitchPressed:(UISwitch *)sender {
    
    
    if (sender.isOn)
        [self.allowblinkingSwitch setOn:YES animated:YES];
    
    else
        [self.allowblinkingSwitch setOn:NO animated:YES];
}
/*- (IBAction)autoConnectSwitchPressed:(UISwitch *)sender {
 
 
 if (sender.isOn)
 [self.autoConnectSwitch setOn:YES animated:YES];
 
 else
 [self.autoConnectSwitch setOn:NO animated:YES];
 }
*/



-(void) viewWillDisappear:(BOOL)animated{
    
    NSString *documentDir_sett=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) lastObject];
    
    NSString *path_s = [documentDir_sett stringByAppendingPathComponent:@"Settings.plist"];
    NSMutableDictionary *dict1=[NSMutableDictionary dictionaryWithContentsOfFile:path_s];
    
    
    if (dict1==nil) {
        dict1=[[NSMutableDictionary alloc]init];
    }
    
    [dict1 setObject:@"" forKey:@"fontStyle"];
    [dict1 setObject:@"" forKey:@"codePage"];
    [dict1 setObject:[NSNumber numberWithBool:self.terminalSwitch.on] forKey:@"terminalSwitch"];
    [dict1 setObject:[NSNumber numberWithBool:self.ignoreXhelpSwitch.on] forKey:@"ignoreXhelpSwitch"];
    //[dict1 setObject:[NSNumber numberWithBool:self.supportFExitSwitch.on] forKey:@"supportFExitSwitch"];
    //[dict1 setObject:[NSNumber numberWithBool:self.columnSepSwitch.on] forKey:@"columnSepSwitch"];
    [dict1 setObject:[NSNumber numberWithBool:self.cursorblinkSwitch.on] forKey:@"cursorblinkSwitch"];
    [dict1 setObject:[NSNumber numberWithBool:self.keepAliveSwitch.on] forKey:@"keepAliveSwitch"];
    [dict1 setObject:[NSNumber numberWithBool:self.allowblinkingSwitch.on] forKey:@"allowblinkingSwitch"];
    //[dict1 setObject:[NSNumber numberWithBool:self.autoConnectSwitch.on] forKey:@"autoConnectSwitch"];
    
    [dict1 writeToFile:path_s atomically:YES];
    
}


-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    
    return toInterfaceOrientation!=UIInterfaceOrientationPortraitUpsideDown;
}
@end
