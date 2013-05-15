//
//  ConnectAS400.h
//  SmartGladiatoLink
//
//  Created by Smriti Raina on 16/04/13.
//  Copyright (c) 2013 Smriti Raina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AsyncSocket.h"
#import "ConnectedScreenVC.h"
#import <AVFoundation/AVFoundation.h>
#import "NumericKeyBoard_view.h"
#import "AlphaKeyBoard_view.h"
#import "FunctionalKeyBoard_view.h"
#import "CursorKeyBoard_view.h"
#import "TelnetView.h"
#import "TerminalResources.h"

// negotiating commands
static SignedByte IAC = -1; // 255 FF
static SignedByte DONT =  -2; //254 FE
static SignedByte DO =  -3; //253 FD
static SignedByte WONT =  -4; //252 FC
static SignedByte WILL =  -5; //251 FB
static SignedByte SB =  -6; //250 Sub Begin FA
static SignedByte SE =  -16; //240 Sub End F0
static SignedByte EOR =  -17; //239 End of Record EF
static SignedByte TERMINAL_TYPE =  24; // 18
static SignedByte OPT_END_OF_RECORD =  25; // 19
static SignedByte TRANSMIT_BINARY =  0; // 0
static SignedByte QUAL_IS =  0; // 0
static SignedByte TIMING_MARK =  6; // 6
static SignedByte NEW_ENVIRONMENT =  39; // 27
static SignedByte IS =  0; // 0
static SignedByte SEND =  1; // 1
static SignedByte INFO =  2; // 2
static SignedByte VAR =  0; // 0
static SignedByte VALUE =  1; // 1
static SignedByte NEGOTIATE_ESC =  2; // 2
static SignedByte USERVAR =  3; // 3

// miscellaneous
static SignedByte ESC = 0x04; // 04

@interface UIDevice (PrivateOrientation)
- (void)setOrientation:(UIInterfaceOrientation)orientation;
@end


@interface ConnectAS400 : UIViewController<UIActionSheetDelegate,UIScrollViewDelegate,NumericKeyPressedDelegate,AlphaKeyBoardDelegate,FunctionalKeysDelegate,CursorKeysDelegate,IosKeyBoardDelegate>

{
    AVAudioPlayer *enterBeep;
    //NSMutableString *textStringToDisplay;
    NSString *documentDirPath_conn;
    NSString *path_conn;
    NSMutableDictionary *hostDict_conn;
    NSMutableArray *hostlisttoDeleteArray_conn;

    int opCode;
    int currentIndex;
    int currentRow;
    int currentcol;
    
    Byte txtAttribute24[24][80];
    BOOL isValid24[24][80];
    char screen24[24][80];
    
    Byte txtAttribute27[27][132];
    BOOL isValid27[27][132];
    char screen27[27][132];

}

@property(nonatomic,strong)NSIndexPath *indexPath_connectAS400;
@property(nonatomic,strong)NSString *hostNameString;
@property(nonatomic,strong)NSString *portString;

@property(nonatomic,assign) BOOL isconnected;
 
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
 

@property (strong, nonatomic) IBOutlet UIButton *nextKbButton;
@property (strong, nonatomic) IBOutlet UIButton *statusButton;
@property (strong, nonatomic) IBOutlet UIButton *enterButton;
@property (strong, nonatomic) IBOutlet UIButton *alphaKbButton;


@property (strong, nonatomic) IBOutlet UIButton *iosKBbutton;
@property (strong, nonatomic) IBOutlet UIButton *fxxButton;
@property (strong, nonatomic) IBOutlet UIButton *menuButton;
@property (strong, nonatomic) IBOutlet UIButton *numericKBbutton;
@property (strong, nonatomic) IBOutlet UIButton *cursorKbButton;
@property (strong, nonatomic) IBOutlet UIButton *lockScreenButton;





- (IBAction)nextKbButtonPressed:(UIButton *)sender;
- (IBAction)statusButtonPressed:(UIButton *)sender;
- (IBAction)enterPressed:(UIButton *)sender;
- (IBAction)alphakbButtonPressed:(UIButton *)sender;


- (IBAction)iosKbPressed:(UIButton *)sender;
- (IBAction)fxxButtonPressed:(UIButton *)sender;
- (IBAction)menuButtonPressed:(UIButton *)sender;
- (IBAction)numericKeyboardPressed:(UIButton *)sender;
- (IBAction)cursorKbButtonPressed:(UIButton *)sender;
- (IBAction)lockScreenPressed:(UIButton *)sender;

 
@property (strong, nonatomic) IBOutlet UIView *graybackgroundView;
@property (strong, nonatomic) IBOutlet UIView *blackSquareView;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *actIndicator;
@property (strong, nonatomic) IBOutlet UILabel *connectingHostName;
@property (strong, nonatomic) IBOutlet UIButton *cancelBtn;

@property (strong, nonatomic) IBOutlet TelnetView *telnetView;
@property (strong, nonatomic) IBOutlet UIView *cursorView;

- (IBAction)cancelBtnclicked:(UIButton *)sender;
- (IBAction)telnetViewTapped:(UITapGestureRecognizer *)sender;



@end
