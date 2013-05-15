//
//  TerminalResources.m
//  Link
//
//  Created by Amit Kumar on 10/05/13.
//  Copyright (c) 2013 Smriti Raina. All rights reserved.
//

#import "TerminalResources.h"
static TerminalResources *terminalResources = nil;
@implementation TerminalResources
@synthesize fontStyle;
@synthesize codePage;
@synthesize terminalSwitch;
@synthesize ignoreXhelpSwitch;
@synthesize cursorblinkSwitch;
@synthesize keepAliveSwitch;
@synthesize allowblinkingSwitch;

@synthesize totalRows;
@synthesize totalCols;
@synthesize currentCursorPosition;

+(TerminalResources *)sharedTerminalResources{
    if (!terminalResources) {
        terminalResources = [[TerminalResources alloc] init];
    }
    return terminalResources;
}

-(id)init{
    if (self = [super init]) {
        // initialise the value;
        NSString *documentDir_sett=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) lastObject];
        
        NSString *path_s = [documentDir_sett stringByAppendingPathComponent:@"Settings.plist"];
        NSMutableDictionary *dict1=[NSMutableDictionary dictionaryWithContentsOfFile:path_s];
       //**********************
        
        if (dict1==nil) {
            dict1=[[NSMutableDictionary alloc]init];
        }
        
        //[dict1 valueForKey:@"terminalSwitch"];
        fontStyle = [dict1 valueForKey:@"fontStyle"];
        codePage = [dict1 valueForKey:@"codePage"];
        terminalSwitch =  [[dict1 valueForKey:@"terminalSwitch"] boolValue];
        ignoreXhelpSwitch = [[dict1 valueForKey:@"ignoreXhelpSwitch"] boolValue];
        //[dict1 valueForKey:@"supportFExitSwitch"];
        //[dict1 valueForKey:@"columnSepSwitch"];
        cursorblinkSwitch = [[dict1 valueForKey:@"cursorblinkSwitch"] boolValue];
        keepAliveSwitch = [[dict1 valueForKey:@"keepAliveSwitch"] boolValue];
        allowblinkingSwitch = [[dict1 valueForKey:@"allowblinkingSwitch"] boolValue];
        //[dict1 valueForKey:@"autoConnectSwitch"];
        
        totalRows = 24;
        totalCols = 80;
        /*
        if (terminalSwitch==YES) {
            //totalRows = 27;
            //totalCols = 132;
            // 27x132 screen
            // show alert this screen size not supported in this version.
            
        }else{
            totalRows = 24;
            totalCols = 80;
        }*/
    currentCursorPosition = CGPointMake(0,0);
    }
    return self;
}
@end
