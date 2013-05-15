//
//  TerminalResources.h
//  Link
//
//  Created by Amit Kumar on 10/05/13.
//  Copyright (c) 2013 Smriti Raina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TerminalResources : NSObject

@property (nonatomic, retain) NSString *fontStyle;
@property (nonatomic, retain) NSString *codePage;
@property (assign, nonatomic) BOOL terminalSwitch;
@property (assign, nonatomic) BOOL ignoreXhelpSwitch;
@property (assign, nonatomic) BOOL cursorblinkSwitch;
@property (assign, nonatomic) BOOL keepAliveSwitch;
@property (assign, nonatomic) BOOL allowblinkingSwitch;

@property (assign, nonatomic) int totalRows;
@property (assign, nonatomic) int totalCols;
@property (assign, nonatomic) CGPoint currentCursorPosition;



+(TerminalResources *) sharedTerminalResources;
@end
