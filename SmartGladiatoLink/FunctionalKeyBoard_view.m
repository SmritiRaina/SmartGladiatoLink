//
//  FunctionalKeyBoard_view.m
//  Link
//
//  Created by Smriti Raina on 30/04/13.
//  Copyright (c) 2013 Smriti Raina. All rights reserved.
//

#import "FunctionalKeyBoard_view.h"

@implementation FunctionalKeyBoard_view

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
//singleBeep

- (void)drawRect:(CGRect)rect
{
    beepFileStr=[[NSBundle mainBundle]pathForResource:@"Normal Single Beep - Short beep-7" ofType:@"wav"];
    
    url=[[NSURL alloc]initFileURLWithPath:beepFileStr];
    singleBeep=[[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    
    singleBeep.volume=2.0;
    
    //singleBeep.delegate=self;
    
    // Drawing code
}


- (IBAction)f1Pressed:(UIButton *)sender {
    [singleBeep prepareToPlay];
    [singleBeep play];
}
- (IBAction)f2Pressed:(UIButton *)sender {
    [singleBeep prepareToPlay];
    [singleBeep play];
}
- (IBAction)f3Pressed:(UIButton *)sender {
    [singleBeep prepareToPlay];
    [singleBeep play];
}
- (IBAction)f4Pressed:(UIButton *)sender {
    [singleBeep prepareToPlay];
    [singleBeep play];
}
- (IBAction)f5Pressed:(UIButton *)sender {
    [singleBeep prepareToPlay];
    [singleBeep play];
}
- (IBAction)f6Pressed:(UIButton *)sender {
    [singleBeep prepareToPlay];
    [singleBeep play];
}
- (IBAction)f7Pressed:(UIButton *)sender {
    [singleBeep prepareToPlay];
    [singleBeep play];
}
- (IBAction)f8pressed:(UIButton *)sender {
    [singleBeep prepareToPlay];
    [singleBeep play];
}
- (IBAction)f9Pressed:(UIButton *)sender {
    [singleBeep prepareToPlay];
    [singleBeep play];
}
- (IBAction)f10Pressed:(UIButton *)sender {
    [singleBeep prepareToPlay];
    [singleBeep play];
}
- (IBAction)f11Pressed:(UIButton *)sender {
    [singleBeep prepareToPlay];
    [singleBeep play];
}
- (IBAction)f12Pressed:(UIButton *)sender {
    [singleBeep prepareToPlay];
    [singleBeep play];
}
- (IBAction)f13Pressed:(UIButton *)sender {
    [singleBeep prepareToPlay];
    [singleBeep play];
}
- (IBAction)f14Pressed:(UIButton *)sender {
    [singleBeep prepareToPlay];
    [singleBeep play];
}
- (IBAction)f15Pressed:(UIButton *)sender {
    [singleBeep prepareToPlay];
    [singleBeep play];
}
- (IBAction)f16Pressed:(UIButton *)sender {
    [singleBeep prepareToPlay];
    [singleBeep play];
}
- (IBAction)f17Pressed:(UIButton *)sender {
    [singleBeep prepareToPlay];
    [singleBeep play];
}

- (IBAction)f18Pressed:(UIButton *)sender {
    [singleBeep prepareToPlay];
    [singleBeep play];
}
- (IBAction)f19Pressed:(UIButton *)sender {
    [singleBeep prepareToPlay];
    [singleBeep play];
}
- (IBAction)f20Pressed:(UIButton *)sender {
    [singleBeep prepareToPlay];
    [singleBeep play];
}
- (IBAction)f21Pressed:(UIButton *)sender {
    [singleBeep prepareToPlay];
    [singleBeep play];
}
- (IBAction)f22Pressed:(UIButton *)sender {
    [singleBeep prepareToPlay];
    [singleBeep play];
}
- (IBAction)f23Pressed:(UIButton *)sender {
    [singleBeep prepareToPlay];
    [singleBeep play];
}
- (IBAction)f24Pressed:(UIButton *)sender {
    [singleBeep prepareToPlay];
    [singleBeep play];
}
- (IBAction)doneBtnPressed:(UIButton *)sender {
    
    [_delegate functionalKeysPressed:0];
    
    [self removeFromSuperview];
}
@end
