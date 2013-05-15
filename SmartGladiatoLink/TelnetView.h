//
//  TelnetView.h
//  SignOnParseTest
//
//  Created by Sudeep7 on 04/05/13.
//  Copyright (c) 2013 Amit Kumar. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol IosKeyBoardDelegate <NSObject>

-(void)iosKeysClicked:(NSMutableString *)str;

@end
@interface TelnetView : UIView<UIKeyInput>
{
    CGContextRef contxt;
    
    //CGRect frame;
}
@property (nonatomic,strong)NSMutableString  *textStringToDisplay1;
@property(nonatomic,assign) id<IosKeyBoardDelegate> delegate;

-(void)callDrawRect;
//-(id)initWithArray:(char[24][80])array andFrame:(CGRect)frame;
//-(void)initializeWithArray:(char[24][80])array isValidArray:(BOOL[24][80])isCharValid;
//-(void)displayDataWithArray:(char[24][80])data andValidArray:(BOOL[24][80])isValid;
//-(void)initializeWithArray:(char[24][80])array isValidArray:(BOOL[24][80])isCharValid andAttributeAray:(Byte (*)[80])attributeArray;
-(void)initializeWithChar:(char)characterToDisplay andAttribute:(Byte)attribute;
@end
