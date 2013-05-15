//
//  CursorKeyBoard_view.h
//  Link
//
//  Created by Smriti Raina on 01/05/13.
//  Copyright (c) 2013 Smriti Raina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@protocol CursorKeysDelegate <NSObject>

-(void)cursorKeysPressed:(int)keyCode;

@end

@interface CursorKeyBoard_view : UIView
{
    AVAudioPlayer *cursorBeeps;
}

@property (assign,nonatomic) id <CursorKeysDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIButton *key_left;
- (IBAction)leftKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *key_right;
- (IBAction)rightKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *key_Up;
- (IBAction)upKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *key_Down;
- (IBAction)downKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *key_Attention;
- (IBAction)attentionKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *key_SystemReq;
- (IBAction)systemReqKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *key_Erase;
- (IBAction)eraseKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *key_Clear;
- (IBAction)clearKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *key_Reset;
- (IBAction)resetKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *key_StopCursor;
- (IBAction)stopCursorKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *key_Quiet;
- (IBAction)quietKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *key_Fplus;
- (IBAction)fPlusKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *key_Fminus;
- (IBAction)fMinusKeyPressed:(UIButton *)sender;



@property (strong, nonatomic) IBOutlet UIButton *key_Tab;
- (IBAction)tabKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *key_RevTab;

- (IBAction)reverseTabKeyPressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *key_done;

- (IBAction)doneKeyPressed:(UIButton *)sender;














@end
