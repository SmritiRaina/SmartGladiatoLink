//
//  FunctionalKeyBoard_view.h
//  Link
//
//  Created by Smriti Raina on 30/04/13.
//  Copyright (c) 2013 Smriti Raina. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AVFoundation/AVFoundation.h>

@protocol FunctionalKeysDelegate <NSObject>

-(void)functionalKeysPressed:(int)keyCode;

@end
@interface FunctionalKeyBoard_view : UIView{
    AVAudioPlayer *singleBeep;
    NSString *beepFileStr;
    NSURL *url;
    int buttonTag;
}

@property(assign,nonatomic) id <FunctionalKeysDelegate> delegate;

@property (strong, nonatomic) IBOutlet UIButton *f1_btn;
- (IBAction)f1Pressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *f2_btn;
- (IBAction)f2Pressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *f3_btn;
- (IBAction)f3Pressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *f4_btn;
- (IBAction)f4Pressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *f5_btn;
- (IBAction)f5Pressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *f6_btn;
- (IBAction)f6Pressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *f7_btn;
- (IBAction)f7Pressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *f8_btn;
- (IBAction)f8pressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *f9_btn;
- (IBAction)f9Pressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *f10_btn;
- (IBAction)f10Pressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *f11_btn;
- (IBAction)f11Pressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *f12_btn;
- (IBAction)f12Pressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *f13_btn;
- (IBAction)f13Pressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *f14_btn;
- (IBAction)f14Pressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *f15_btn;
- (IBAction)f15Pressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *f16_btn;
- (IBAction)f16Pressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *f17_btn;
- (IBAction)f17Pressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *f18_btn;
- (IBAction)f18Pressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *f19_btn;
- (IBAction)f19Pressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *f20_btn;
- (IBAction)f20Pressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *f21_btn;
- (IBAction)f21Pressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *f22_btn;
- (IBAction)f22Pressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *f23_btn;
- (IBAction)f23Pressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *f24_btn;
- (IBAction)f24Pressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *done_func_btn;
- (IBAction)doneBtnPressed:(UIButton *)sender;


@end
