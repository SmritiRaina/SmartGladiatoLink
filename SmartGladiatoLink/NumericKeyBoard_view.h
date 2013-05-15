//
//  NumericKeyBoard_view.h
//  Link
//
//  Created by Smriti Raina on 29/04/13.
//  Copyright (c) 2013 Smriti Raina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@protocol NumericKeyPressedDelegate <NSObject>

-(void)numericKeyPressed:(int)keyCode;

@end

@interface NumericKeyBoard_view : UIView{
    AVAudioPlayer *fieldExitBeep;
    
    int buttonTag;
}

@property (strong, nonatomic) IBOutlet UIButton *comma_btn;

@property (strong, nonatomic) IBOutlet UIButton *btn_seven;
@property (strong, nonatomic) IBOutlet UIButton *btn_eight;
@property (strong, nonatomic) IBOutlet UIButton *btn_nine;
@property (strong, nonatomic) IBOutlet UIButton *btn_delete;
@property (strong, nonatomic) IBOutlet UIButton *btn_plus;
@property (strong, nonatomic) IBOutlet UIButton *btn_four;
@property (strong, nonatomic) IBOutlet UIButton *btn_five;
@property (strong, nonatomic) IBOutlet UIButton *btn_six;
@property (strong, nonatomic) IBOutlet UIButton *btn_Ins;
@property (strong, nonatomic) IBOutlet UIButton *btn_minus;
@property (strong, nonatomic) IBOutlet UIButton *btn_one;
@property (strong, nonatomic) IBOutlet UIButton *btn_two;
@property (strong, nonatomic) IBOutlet UIButton *btn_three;
@property (strong, nonatomic) IBOutlet UIButton *btn_enter;
@property (strong, nonatomic) IBOutlet UIButton *btn_dot;
@property (strong, nonatomic) IBOutlet UIButton *btn_zero;
@property (strong, nonatomic) IBOutlet UIButton *btn_done;
@property (assign, nonatomic) id <NumericKeyPressedDelegate> delegate;
- (IBAction)commaPressed:(UIButton *)sender;
- (IBAction)sevenPressed:(UIButton *)sender;
- (IBAction)eightPressed:(UIButton *)sender;
- (IBAction)ninePressed:(UIButton *)sender;
- (IBAction)deleteCharPressed:(UIButton *)sender;

- (IBAction)plusPressed:(UIButton *)sender;
- (IBAction)fourPressed:(UIButton *)sender;
- (IBAction)fivePressed:(UIButton *)sender;
- (IBAction)sixPressed:(UIButton *)sender;
- (IBAction)insertPressed:(UIButton *)sender;
- (IBAction)minusPressed:(UIButton *)sender;
- (IBAction)onepressed:(UIButton *)sender;
- (IBAction)twoPressed:(UIButton *)sender;

- (IBAction)threePressed:(UIButton *)sender;

- (IBAction)enterPressed:(UIButton *)sender;
- (IBAction)dotPressed:(UIButton *)sender;
- (IBAction)zeroPressed:(UIButton *)sender;
- (IBAction)donePressed:(UIButton *)sender;










@end
