//
//  CursorKeyBoard_view.m
//  Link
//
//  Created by Smriti Raina on 01/05/13.
//  Copyright (c) 2013 Smriti Raina. All rights reserved.
//

#import "CursorKeyBoard_view.h"

@implementation CursorKeyBoard_view

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    NSString *path_c=[[NSBundle mainBundle]pathForResource:@"Normal Single Beep - Short beep-7" ofType:@"wav"];
    NSURL *url=[[NSURL alloc]initFileURLWithPath:path_c];
    cursorBeeps=[[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    [cursorBeeps setVolume:2.0];
    [cursorBeeps prepareToPlay];

}
- (IBAction)leftKeyPressed:(UIButton *)sender {
    [cursorBeeps prepareToPlay];
    [cursorBeeps play];
}
- (IBAction)rightKeyPressed:(UIButton *)sender {
    [cursorBeeps prepareToPlay];
    [cursorBeeps play];
}
- (IBAction)upKeyPressed:(UIButton *)sender {
    [cursorBeeps prepareToPlay];
    [cursorBeeps play];
}
- (IBAction)downKeyPressed:(UIButton *)sender {
    [cursorBeeps prepareToPlay];
    [cursorBeeps play];
}
- (IBAction)attentionKeyPressed:(UIButton *)sender {
    [cursorBeeps prepareToPlay];
    [cursorBeeps play];
}
- (IBAction)systemReqKeyPressed:(UIButton *)sender {
    [cursorBeeps prepareToPlay];
    [cursorBeeps play];
}
- (IBAction)eraseKeyPressed:(UIButton *)sender {
}
- (IBAction)clearKeyPressed:(UIButton *)sender {
}
- (IBAction)resetKeyPressed:(UIButton *)sender {
    [cursorBeeps prepareToPlay];
    [cursorBeeps play];
}
- (IBAction)stopCursorKeyPressed:(UIButton *)sender {
    [cursorBeeps prepareToPlay];
    [cursorBeeps play];
}
- (IBAction)quietKeyPressed:(UIButton *)sender {
}
- (IBAction)fPlusKeyPressed:(UIButton *)sender {
}
- (IBAction)fMinusKeyPressed:(UIButton *)sender {
}
- (IBAction)tabKeyPressed:(UIButton *)sender {
}
- (IBAction)reverseTabKeyPressed:(UIButton *)sender {
}
- (IBAction)doneKeyPressed:(UIButton *)sender {
    
    [_delegate cursorKeysPressed:0];
    [self removeFromSuperview];
}
@end
