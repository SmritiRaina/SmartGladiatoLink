//
//  AlphaKeyBoard_view.h
//  Link
//
//  Created by Smriti Raina on 01/05/13.
//  Copyright (c) 2013 Smriti Raina. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AlphaKeyBoardDelegate <NSObject>

-(void)alphaKeysPressed:(int)keyCode;

@end

@interface AlphaKeyBoard_view : UIView{
    int buttonTag;
}

@property(assign,nonatomic) id <AlphaKeyBoardDelegate> delegate;

@property (strong, nonatomic) IBOutlet UIButton *btn_Q;
- (IBAction)qKeyPressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *btn_W;
- (IBAction)wKeyPressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *btn_E;
- (IBAction)eKeyPressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *btn_R;
- (IBAction)rKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *btn_T;
- (IBAction)tKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *btn_Y;
- (IBAction)yKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *btn_U;
- (IBAction)uKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *btn_i;
- (IBAction)iKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *btn_O;
- (IBAction)oKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *btn_P;
- (IBAction)pKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *btn_A;
- (IBAction)aKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *btn_S;
- (IBAction)sKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *btn_D;
- (IBAction)dKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *btn_F;
- (IBAction)fKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *btn_G;
- (IBAction)gKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *btn_H;
- (IBAction)hKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *btn_J;
- (IBAction)jKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *btn_K;
- (IBAction)kKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *btn_L;
- (IBAction)lKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *btn_Z;
- (IBAction)zKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *btn_X;
- (IBAction)xKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *btn_C;
- (IBAction)cKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *btn_V;
- (IBAction)vKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *btn_B;
- (IBAction)bKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *btn_N;
- (IBAction)nKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *btn_M;
- (IBAction)mKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *btn_Space;
- (IBAction)spaceKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *btn_delete;
- (IBAction)deleteKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *btn_Shift;
- (IBAction)shiftKeyPressed:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *btn_don;
- (IBAction)donKeyPressed:(UIButton *)sender;







@end
