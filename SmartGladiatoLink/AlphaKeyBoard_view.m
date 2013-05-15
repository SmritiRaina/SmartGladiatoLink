//
//  AlphaKeyBoard_view.m
//  Link
//
//  Created by Smriti Raina on 01/05/13.
//  Copyright (c) 2013 Smriti Raina. All rights reserved.
//

#import "AlphaKeyBoard_view.h"

@implementation AlphaKeyBoard_view

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
    [self.btn_Shift addTarget:self action:@selector(singleTap:withEvent:) forControlEvents:UIControlEventTouchDown];
    [self.btn_Shift addTarget:self action:@selector(multipleTap:withEvent:) forControlEvents:UIControlEventTouchDownRepeat];
        /* 
     NSArray *alphabetCharactersArray=[NSArray arrayWithObjects:_btn_Q,_btn_A,nil];
     for (UIButton *obj in alphabetCharactersArray) {
     
     [obj addTarget:self action:@selector(singleTap:withEvent:) forControlEvents:UIControlEventTouchDown];
     [obj addTarget:self action:@selector(multipleTap:withEvent:) forControlEvents:UIControlEventTouchDownRepeat];
     }*/
    
}


- (IBAction)qKeyPressed:(UIButton *)sender {
    buttonTag=self.btn_Q.tag;
    [_delegate alphaKeysPressed:buttonTag];
    
       
}
- (IBAction)wKeyPressed:(UIButton *)sender {
    buttonTag=self.btn_W.tag;
    [_delegate alphaKeysPressed:buttonTag];
    
}
- (IBAction)eKeyPressed:(UIButton *)sender {
    buttonTag=self.btn_E.tag;
    [_delegate alphaKeysPressed:buttonTag];
    
}
- (IBAction)rKeyPressed:(UIButton *)sender {
    buttonTag=self.btn_R.tag;
    [_delegate alphaKeysPressed:buttonTag];
   
}
- (IBAction)tKeyPressed:(UIButton *)sender {
    buttonTag=self.btn_T.tag;
    [_delegate alphaKeysPressed:buttonTag];
    
}
- (IBAction)yKeyPressed:(UIButton *)sender {
    buttonTag=self.btn_Y.tag;
    [_delegate alphaKeysPressed:buttonTag];
}
- (IBAction)uKeyPressed:(UIButton *)sender {
    buttonTag=self.btn_U.tag;
    [_delegate alphaKeysPressed:buttonTag];
}
- (IBAction)iKeyPressed:(UIButton *)sender {
    buttonTag=self.btn_i.tag;
    [_delegate alphaKeysPressed:buttonTag];
}
- (IBAction)oKeyPressed:(UIButton *)sender {
    buttonTag=self.btn_O.tag;
    [_delegate alphaKeysPressed:buttonTag];
}
- (IBAction)pKeyPressed:(UIButton *)sender {
    buttonTag=self.btn_P.tag;
    [_delegate alphaKeysPressed:buttonTag];
}
- (IBAction)aKeyPressed:(UIButton *)sender {
    buttonTag=self.btn_A.tag;
    [_delegate alphaKeysPressed:buttonTag];
}
- (IBAction)sKeyPressed:(UIButton *)sender {
    buttonTag=self.btn_S.tag;
    [_delegate alphaKeysPressed:buttonTag];
}
- (IBAction)dKeyPressed:(UIButton *)sender {
    buttonTag=self.btn_D.tag;
    [_delegate alphaKeysPressed:buttonTag];
}
- (IBAction)fKeyPressed:(UIButton *)sender {
    buttonTag=self.btn_F.tag;
    [_delegate alphaKeysPressed:buttonTag];
}
- (IBAction)gKeyPressed:(UIButton *)sender {
    buttonTag=self.btn_G.tag;
    [_delegate alphaKeysPressed:buttonTag];
}
- (IBAction)hKeyPressed:(UIButton *)sender {
    buttonTag=self.btn_H.tag;
    [_delegate alphaKeysPressed:buttonTag];
}
- (IBAction)jKeyPressed:(UIButton *)sender {
    buttonTag=self.btn_J.tag;
    [_delegate alphaKeysPressed:buttonTag];
}
- (IBAction)kKeyPressed:(UIButton *)sender {
    buttonTag=self.btn_K.tag;
    [_delegate alphaKeysPressed:buttonTag];
}
- (IBAction)lKeyPressed:(UIButton *)sender {
    buttonTag=self.btn_L.tag;
    [_delegate alphaKeysPressed:buttonTag];
}
- (IBAction)zKeyPressed:(UIButton *)sender {
    buttonTag=self.btn_Z.tag;
    [_delegate alphaKeysPressed:buttonTag];
}
- (IBAction)xKeyPressed:(UIButton *)sender {
    buttonTag=self.btn_X.tag;
    [_delegate alphaKeysPressed:buttonTag];
}
- (IBAction)cKeyPressed:(UIButton *)sender {
    buttonTag=self.btn_C.tag;
    [_delegate alphaKeysPressed:buttonTag];
}
- (IBAction)vKeyPressed:(UIButton *)sender {
    buttonTag=self.btn_V.tag;
    [_delegate alphaKeysPressed:buttonTag];
}
- (IBAction)bKeyPressed:(UIButton *)sender {
    buttonTag=self.btn_B.tag;
    [_delegate alphaKeysPressed:buttonTag];
}
- (IBAction)nKeyPressed:(UIButton *)sender {
    buttonTag=self.btn_N.tag;
    [_delegate alphaKeysPressed:buttonTag];
}
- (IBAction)mKeyPressed:(UIButton *)sender {
    buttonTag=self.btn_M.tag;
    [_delegate alphaKeysPressed:buttonTag];
}
- (IBAction)spaceKeyPressed:(UIButton *)sender {
    buttonTag=self.btn_Space.tag;
    [_delegate alphaKeysPressed:buttonTag];
}
- (IBAction)deleteKeyPressed:(UIButton *)sender {
    buttonTag=self.btn_delete.tag;
    [_delegate alphaKeysPressed:buttonTag];

}
- (IBAction)shiftKeyPressed:(UIButton *)sender {
    buttonTag=self.btn_Shift.tag;
    [_delegate alphaKeysPressed:buttonTag];
}



-(IBAction)singleTap:(id)sender withEvent:(UIEvent *)event{
    
    [self.btn_Q setImage:[UIImage imageNamed:@"btn_cursor_key_Q_lower_normal.png"] forState:UIControlStateNormal];
    [self.btn_Q setImage:[UIImage imageNamed:@"btn_cursor_key_Q_lower_over.png"] forState:UIControlStateHighlighted];
    [self.btn_W setImage:[UIImage imageNamed:@"btn_cursor_key_W_lower_normal.png"] forState:UIControlStateNormal];
    [self.btn_W setImage:[UIImage imageNamed:@"btn_cursor_key_W_lower_over.png"] forState:UIControlStateHighlighted];
    [self.btn_E setImage:[UIImage imageNamed:@"btn_cursor_key_E_lower_normal.png"] forState:UIControlStateNormal];
    [self.btn_E setImage:[UIImage imageNamed:@"btn_cursor_key_E_lower_over.png"] forState:UIControlStateHighlighted];
    [self.btn_R setImage:[UIImage imageNamed:@"btn_cursor_key_R_lower_normal.png"] forState:UIControlStateNormal];
    [self.btn_R setImage:[UIImage imageNamed:@"btn_cursor_key_R_lower_over.png"] forState:UIControlStateHighlighted];
    [self.btn_T setImage:[UIImage imageNamed:@"btn_cursor_key_T_lower_normal.png"] forState:UIControlStateNormal];
    [self.btn_T setImage:[UIImage imageNamed:@"btn_cursor_key_T_lower_over.png"] forState:UIControlStateHighlighted];
    [self.btn_Y setImage:[UIImage imageNamed:@"btn_cursor_key_Y_lower_normal.png"] forState:UIControlStateNormal];
    [self.btn_Y setImage:[UIImage imageNamed:@"btn_cursor_key_Y_lower_over.png"] forState:UIControlStateHighlighted];
    
    
    [self.btn_U setImage:[UIImage imageNamed:@"btn_cursor_key_U_lower_normal.png"] forState:UIControlStateNormal];
    [self.btn_U setImage:[UIImage imageNamed:@"btn_cursor_key_U_lower_over.png"] forState:UIControlStateHighlighted];
    [self.btn_i setImage:[UIImage imageNamed:@"btn_cursor_key_I_lower_normal.png"] forState:UIControlStateNormal];
    [self.btn_i setImage:[UIImage imageNamed:@"btn_cursor_key_I_lower_over.png"] forState:UIControlStateHighlighted];
    [self.btn_O setImage:[UIImage imageNamed:@"btn_cursor_key_O_lower_normal.png"] forState:UIControlStateNormal];
    [self.btn_O setImage:[UIImage imageNamed:@"btn_cursor_key_O_lower_over.png"] forState:UIControlStateHighlighted];
    [self.btn_P setImage:[UIImage imageNamed:@"btn_cursor_key_P_lower_normal.png"] forState:UIControlStateNormal];
    [self.btn_P setImage:[UIImage imageNamed:@"btn_cursor_key_P_lower_over.png"] forState:UIControlStateHighlighted];
    [self.btn_A setImage:[UIImage imageNamed:@"btn_cursor_key_A_lower_normal.png"] forState:UIControlStateNormal];
    [self.btn_A setImage:[UIImage imageNamed:@"btn_cursor_key_A_lower_over.png"] forState:UIControlStateHighlighted];
    [self.btn_S setImage:[UIImage imageNamed:@"btn_cursor_key_S_lower_normal.png"] forState:UIControlStateNormal];
    [self.btn_S setImage:[UIImage imageNamed:@"btn_cursor_key_S_lower_over.png"] forState:UIControlStateHighlighted];
    
    [self.btn_D setImage:[UIImage imageNamed:@"btn_cursor_key_D_lower_normal.png"] forState:UIControlStateNormal];
    [self.btn_D setImage:[UIImage imageNamed:@"btn_cursor_key_D_lower_over.png"] forState:UIControlStateHighlighted];
    [self.btn_F setImage:[UIImage imageNamed:@"btn_cursor_key_F_lower_normal.png"] forState:UIControlStateNormal];
    [self.btn_F setImage:[UIImage imageNamed:@"btn_cursor_key_F_lower_over.png"] forState:UIControlStateHighlighted];
    [self.btn_G setImage:[UIImage imageNamed:@"btn_cursor_key_G_lower_normal.png"] forState:UIControlStateNormal];
    [self.btn_G setImage:[UIImage imageNamed:@"btn_cursor_key_G_lower_over.png"] forState:UIControlStateHighlighted];
    [self.btn_H setImage:[UIImage imageNamed:@"btn_cursor_key_H_lower_normal.png"] forState:UIControlStateNormal];
    [self.btn_H setImage:[UIImage imageNamed:@"btn_cursor_key_H_lower_over.png"] forState:UIControlStateHighlighted];
    [self.btn_J setImage:[UIImage imageNamed:@"btn_cursor_key_J_lower_normal.png"] forState:UIControlStateNormal];
    [self.btn_J setImage:[UIImage imageNamed:@"btn_cursor_key_J_lower_over.png"] forState:UIControlStateHighlighted];
    [self.btn_K setImage:[UIImage imageNamed:@"btn_cursor_key_K_lower_normal.png"] forState:UIControlStateNormal];
    [self.btn_K setImage:[UIImage imageNamed:@"btn_cursor_key_K_lower_over.png"] forState:UIControlStateHighlighted];
    
    [self.btn_L setImage:[UIImage imageNamed:@"btn_cursor_key_L_lower_normal.png"] forState:UIControlStateNormal];
    [self.btn_L setImage:[UIImage imageNamed:@"btn_cursor_key_L_lower_over.png"] forState:UIControlStateHighlighted];
    [self.btn_Z setImage:[UIImage imageNamed:@"btn_cursor_key_Z_lower_normal.png"] forState:UIControlStateNormal];
    [self.btn_Z setImage:[UIImage imageNamed:@"btn_cursor_key_Z_lower_over.png"] forState:UIControlStateHighlighted];
    [self.btn_X setImage:[UIImage imageNamed:@"btn_cursor_key_X_lower_normal.png"] forState:UIControlStateNormal];
    [self.btn_X setImage:[UIImage imageNamed:@"btn_cursor_key_X_lower_over.png"] forState:UIControlStateHighlighted];
    [self.btn_C setImage:[UIImage imageNamed:@"btn_cursor_key_C_lower_normal.png"] forState:UIControlStateNormal];
    [self.btn_C setImage:[UIImage imageNamed:@"btn_cursor_key_C_lower_over.png"] forState:UIControlStateHighlighted];
    [self.btn_V setImage:[UIImage imageNamed:@"btn_cursor_key_V_lower_normal.png"] forState:UIControlStateNormal];
    [self.btn_V setImage:[UIImage imageNamed:@"btn_cursor_key_V_lower_over.png"] forState:UIControlStateHighlighted];
    [self.btn_B setImage:[UIImage imageNamed:@"btn_cursor_key_B_lower_normal.png"] forState:UIControlStateNormal];
    [self.btn_B setImage:[UIImage imageNamed:@"btn_cursor_key_B_lower_over.png"] forState:UIControlStateHighlighted];
    
    
    [self.btn_N setImage:[UIImage imageNamed:@"btn_cursor_key_N_lower_normal.png"] forState:UIControlStateNormal];
    [self.btn_N setImage:[UIImage imageNamed:@"btn_cursor_key_N_lower_over.png"] forState:UIControlStateHighlighted];
    [self.btn_M setImage:[UIImage imageNamed:@"btn_cursor_key_M_lower_normal.png"] forState:UIControlStateNormal];
    [self.btn_M setImage:[UIImage imageNamed:@"btn_cursor_key_M_lower_over.png"] forState:UIControlStateHighlighted];
    
    
}

-(IBAction)multipleTap:(id)sender withEvent:(UIEvent *)event{
    
    
    [self.btn_Q setImage:[UIImage imageNamed:@"btn_cursor_key_Q_upper_normal"] forState:UIControlStateNormal];
    [self.btn_Q setImage:[UIImage imageNamed:@"btn_cursor_key_Q_upper_over"] forState:UIControlStateHighlighted];
    [self.btn_W setImage:[UIImage imageNamed:@"btn_cursor_key_W_upper_normal"] forState:UIControlStateNormal];
    [self.btn_W setImage:[UIImage imageNamed:@"btn_cursor_key_W_upper_over"] forState:UIControlStateHighlighted];
    [self.btn_E setImage:[UIImage imageNamed:@"btn_cursor_key_E_upper_normal"] forState:UIControlStateNormal];
    [self.btn_E setImage:[UIImage imageNamed:@"btn_cursor_key_E_upper_over"] forState:UIControlStateHighlighted];
    [self.btn_R setImage:[UIImage imageNamed:@"btn_cursor_key_R_upper_normal"] forState:UIControlStateNormal];
    [self.btn_R setImage:[UIImage imageNamed:@"btn_cursor_key_R_upper_over"] forState:UIControlStateHighlighted];
    [self.btn_T setImage:[UIImage imageNamed:@"btn_cursor_key_T_upper_normal"] forState:UIControlStateNormal];
    [self.btn_T setImage:[UIImage imageNamed:@"btn_cursor_key_T_upper_over"] forState:UIControlStateHighlighted];
    [self.btn_Y setImage:[UIImage imageNamed:@"btn_cursor_key_Y_upper_normal"] forState:UIControlStateNormal];
    [self.btn_Y setImage:[UIImage imageNamed:@"btn_cursor_key_Y_upper_over"] forState:UIControlStateHighlighted];
    
    
    [self.btn_U setImage:[UIImage imageNamed:@"btn_cursor_key_U_upper_normal"] forState:UIControlStateNormal];
    [self.btn_U setImage:[UIImage imageNamed:@"btn_cursor_key_U_upper_over"] forState:UIControlStateHighlighted];
    [self.btn_i setImage:[UIImage imageNamed:@"btn_cursor_key_I_upper_normal"] forState:UIControlStateNormal];
    [self.btn_i setImage:[UIImage imageNamed:@"btn_cursor_key_I_upper_over"] forState:UIControlStateHighlighted];
    [self.btn_O setImage:[UIImage imageNamed:@"btn_cursor_key_O_upper_normal"] forState:UIControlStateNormal];
    [self.btn_O setImage:[UIImage imageNamed:@"btn_cursor_key_O_upper_over"] forState:UIControlStateHighlighted];
    [self.btn_P setImage:[UIImage imageNamed:@"btn_cursor_key_P_upper_normal"] forState:UIControlStateNormal];
    [self.btn_P setImage:[UIImage imageNamed:@"btn_cursor_key_P_upper_over"] forState:UIControlStateHighlighted];
    [self.btn_A setImage:[UIImage imageNamed:@"btn_cursor_key_A_upper_normal"] forState:UIControlStateNormal];
    [self.btn_A setImage:[UIImage imageNamed:@"btn_cursor_key_A_upper_over"] forState:UIControlStateHighlighted];
    [self.btn_S setImage:[UIImage imageNamed:@"btn_cursor_key_S_upper_normal"] forState:UIControlStateNormal];
    [self.btn_S setImage:[UIImage imageNamed:@"btn_cursor_key_S_upper_over"] forState:UIControlStateHighlighted];
    
    
    [self.btn_D setImage:[UIImage imageNamed:@"btn_cursor_key_D_upper_normal"] forState:UIControlStateNormal];
    [self.btn_D setImage:[UIImage imageNamed:@"btn_cursor_key_D_upper_over"] forState:UIControlStateHighlighted];
    [self.btn_F setImage:[UIImage imageNamed:@"btn_cursor_key_F_upper_normal"] forState:UIControlStateNormal];
    [self.btn_F setImage:[UIImage imageNamed:@"btn_cursor_key_F_upper_over"] forState:UIControlStateHighlighted];
    [self.btn_G setImage:[UIImage imageNamed:@"btn_cursor_key_G_upper_normal"] forState:UIControlStateNormal];
    [self.btn_G setImage:[UIImage imageNamed:@"btn_cursor_key_G_upper_over"] forState:UIControlStateHighlighted];
    [self.btn_H setImage:[UIImage imageNamed:@"btn_cursor_key_H_upper_normal"] forState:UIControlStateNormal];
    [self.btn_H setImage:[UIImage imageNamed:@"btn_cursor_key_H_upper_over"] forState:UIControlStateHighlighted];
    [self.btn_J setImage:[UIImage imageNamed:@"btn_cursor_key_J_upper_normal"] forState:UIControlStateNormal];
    [self.btn_J setImage:[UIImage imageNamed:@"btn_cursor_key_J_upper_over"] forState:UIControlStateHighlighted];
    [self.btn_K setImage:[UIImage imageNamed:@"btn_cursor_key_K_upper_normal"] forState:UIControlStateNormal];
    [self.btn_K setImage:[UIImage imageNamed:@"btn_cursor_key_K_upper_over"] forState:UIControlStateHighlighted];
    
    [self.btn_L setImage:[UIImage imageNamed:@"btn_cursor_key_L_upper_normal"] forState:UIControlStateNormal];
    [self.btn_L setImage:[UIImage imageNamed:@"btn_cursor_key_L_upper_over"] forState:UIControlStateHighlighted];
    [self.btn_Z setImage:[UIImage imageNamed:@"btn_cursor_key_Z_upper_normal"] forState:UIControlStateNormal];
    [self.btn_Z setImage:[UIImage imageNamed:@"btn_cursor_key_Z_upper_over"] forState:UIControlStateHighlighted];
    [self.btn_X setImage:[UIImage imageNamed:@"btn_cursor_key_X_upper_normal"] forState:UIControlStateNormal];
    [self.btn_X setImage:[UIImage imageNamed:@"btn_cursor_key_X_upper_over"] forState:UIControlStateHighlighted];
    [self.btn_C setImage:[UIImage imageNamed:@"btn_cursor_key_C_upper_normal"] forState:UIControlStateNormal];
    [self.btn_C setImage:[UIImage imageNamed:@"btn_cursor_key_C_upper_over"] forState:UIControlStateHighlighted];
    [self.btn_V setImage:[UIImage imageNamed:@"btn_cursor_key_V_upper_normal"] forState:UIControlStateNormal];
    [self.btn_V setImage:[UIImage imageNamed:@"btn_cursor_key_V_upper_over"] forState:UIControlStateHighlighted];
    [self.btn_B setImage:[UIImage imageNamed:@"btn_cursor_key_B_upper_normal"] forState:UIControlStateNormal];
    [self.btn_B setImage:[UIImage imageNamed:@"btn_cursor_key_B_upper_over"] forState:UIControlStateHighlighted];
    
    [self.btn_N setImage:[UIImage imageNamed:@"btn_cursor_key_N_upper_normal"] forState:UIControlStateNormal];
    [self.btn_N setImage:[UIImage imageNamed:@"btn_cursor_key_N_upper_over"] forState:UIControlStateHighlighted];
    [self.btn_M setImage:[UIImage imageNamed:@"btn_cursor_key_M_upper_normal"] forState:UIControlStateNormal];
    [self.btn_M setImage:[UIImage imageNamed:@"btn_cursor_key_M_upper_over"] forState:UIControlStateHighlighted];
    
    
    
    
}

- (IBAction)donKeyPressed:(UIButton *)sender {
    
    buttonTag=self.btn_don.tag;
    [_delegate alphaKeysPressed:buttonTag];
    [self removeFromSuperview];
}
@end
