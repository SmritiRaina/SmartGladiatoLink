//
//  NumericKeyBoard_view.m
//  Link
//
//  Created by Smriti Raina on 29/04/13.
//  Copyright (c) 2013 Smriti Raina. All rights reserved.
//

#import "NumericKeyBoard_view.h"

@implementation NumericKeyBoard_view

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

*/

- (void)drawRect:(CGRect)rect
{
    NSString *beepPath=[[NSBundle mainBundle]pathForResource:@"Normal Single Beep - Short beep-7" ofType:@"wav"];
    
    NSURL *url=[[NSURL alloc]initFileURLWithPath:beepPath];
    
    fieldExitBeep=[[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    fieldExitBeep.volume=2.0;
   // fieldExitBeep.delegate=self;
    
}


- (IBAction)commaPressed:(UIButton *)sender {
    buttonTag=self.comma_btn.tag;
    [_delegate numericKeyPressed:buttonTag];
}

- (IBAction)sevenPressed:(UIButton *)sender {
      buttonTag=self.btn_seven.tag;
    [_delegate numericKeyPressed:buttonTag];
}

- (IBAction)eightPressed:(UIButton *)sender {
      buttonTag=self.btn_eight.tag;
    [_delegate numericKeyPressed:buttonTag];
}

- (IBAction)ninePressed:(UIButton *)sender {
      buttonTag=self.btn_nine.tag;
    [_delegate numericKeyPressed:buttonTag];
}

- (IBAction)deleteCharPressed:(UIButton *)sender {
    buttonTag=self.btn_delete.tag;
    [_delegate numericKeyPressed:buttonTag];
}

- (IBAction)plusPressed:(UIButton *)sender {
    buttonTag=self.btn_plus.tag;
    [_delegate numericKeyPressed:buttonTag];
}

- (IBAction)fourPressed:(UIButton *)sender {
    buttonTag=self.btn_four.tag;
    [_delegate numericKeyPressed:buttonTag];
}

- (IBAction)fivePressed:(UIButton *)sender {
    buttonTag=self.btn_five.tag;
    [_delegate numericKeyPressed:buttonTag];
}

- (IBAction)sixPressed:(UIButton *)sender {
    buttonTag=self.btn_six.tag;
    [_delegate numericKeyPressed:buttonTag];
}

- (IBAction)insertPressed:(UIButton *)sender {
    buttonTag=self.btn_Ins.tag;
    [_delegate numericKeyPressed:buttonTag];
}

- (IBAction)minusPressed:(UIButton *)sender {
    buttonTag=self.btn_minus.tag;
    [_delegate numericKeyPressed:buttonTag];
}

- (IBAction)onepressed:(UIButton *)sender {
    buttonTag=self.btn_one.tag;
    [_delegate numericKeyPressed:buttonTag];
}

- (IBAction)twoPressed:(UIButton *)sender {
    buttonTag=self.btn_two.tag;
    [_delegate numericKeyPressed:buttonTag];
}

- (IBAction)threePressed:(UIButton *)sender {
    buttonTag=self.btn_three.tag;
    [_delegate numericKeyPressed:buttonTag];
}

- (IBAction)enterPressed:(UIButton *)sender {
    buttonTag=self.btn_enter.tag;
    
    
    [fieldExitBeep prepareToPlay];
    [fieldExitBeep play];
    [_delegate numericKeyPressed:buttonTag];
    
    
}

- (IBAction)dotPressed:(UIButton *)sender {
    buttonTag=self.btn_dot.tag;
    [_delegate numericKeyPressed:buttonTag];
}

- (IBAction)zeroPressed:(UIButton *)sender {
    buttonTag=self.btn_zero.tag;
    [_delegate numericKeyPressed:buttonTag];
}

- (IBAction)donePressed:(UIButton *)sender {
    buttonTag=self.btn_done.tag;
    [_delegate numericKeyPressed:buttonTag];
    [self removeFromSuperview];
}
@end
