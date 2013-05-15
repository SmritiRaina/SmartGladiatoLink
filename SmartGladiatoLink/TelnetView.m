//
//  TelnetView.m
//  SignOnParseTest
//
//  Created by Sudeep7 on 04/05/13.
//  Copyright (c) 2013 Amit Kumar. All rights reserved.
//

#import "TelnetView.h"
#import <CoreText/CTFramesetter.h>

@implementation TelnetView
{
    int displayRow , displayColumn;
    //char data[24][80];
    //BOOL isValid[24][80];
    BOOL translated;
    BOOL translatedSet;
    //Byte attribute[24][80];
    //CGPoint cursorPosition;
    //BOOL updateCursor;
    char displayChar;
    Byte displayCharAttribute;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
   }
    return self;
}
-(void)initializeWithChar:(char)characterToDisplay andAttribute:(Byte)attribute
{
    if(!translatedSet){
    translated = YES;
        translatedSet = YES;
    }
    displayChar = characterToDisplay;
    displayCharAttribute = attribute;
}
/*
-(void)initializeWithArray:(char[24][80])array isValidArray:(BOOL[24][80])isCharValid andAttributeAray:(Byte (*)[80])attributeArray
{
    translated = YES;
    displayRow = 0; displayColumn = 0;
    // Initialization code
   for (int row = 0; row < 24; row++) {
   for (int col = 0; col < 80; col++) {
            data[row][col] = array[row][col];
           isValid[row][col] = isCharValid[row][col];
        attribute[row][col] = attributeArray[row][col];
        }
    }
}
 */
/*
-(void)initializeWithArray:(char[24][80])array isValidArray:(BOOL[24][80])isCharValid
{translated = YES;
    displayRow = 0; displayColumn = 0;
        // Initialization code
        for (int row = 0; row < 24; row++) {
            for (int col = 0; col < 80; col++) {
                data[row][col] = array[row][col];
                isValid[row][col] = isCharValid[row][col];
        }
    }
}
*/
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

-(void)drawRect:(CGRect)rect
{
    //[NSThread sleepForTimeInterval:0.5f] ;
    //[self displayData];
    //NSString *toDrawString = [NSString stringWithFormat:@"%c",data[(int)rect.origin.y][(int)rect.origin.x]];
    //NSString *toDrawString=@"#";
  //  [toDrawString drawInRect:rect withFont:[UIFont boldSystemFontOfSize:9.6]];
    contxt=UIGraphicsGetCurrentContext();
   //CGContextSetTextMatrix(contxt,CGAffineTransformIdentity);
    //CGContextTranslateCTM(contxt, 0 ,320);
    //CGContextScaleCTM(contxt, 1, -1);
    //CGContextScaleCTM(contxt, 1, -1);
    
    
    if (_textStringToDisplay1==nil) {
        _textStringToDisplay1=[[NSMutableString alloc]init];
    }
    

   
}
/*
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    //NSLog(@"Location is %f,%f",location.x,location.y);
    for (int row = 0; row < 24; row++) {
        for (int col = 0; col < 80; col++) {
            CGRect rect = CGRectMake(col * 6, row * 13, 6, 13);
            if (CGRectContainsPoint(rect, location)) {
                //NSLog(@"rect is (%f,%f,%f,%f)",rect.origin.x,rect.origin.y,rect.size.width,rect.size.height);
                //NSLog(@"cursor position is (%i,%i)",row+1,col+1);
                cursorPosition = CGPointMake(row + 1, col + 1);
                updateCursor = YES;
                [self setNeedsDisplayInRect:CGRectMake(cursorPosition.x, cursorPosition.y, 6, 13)];
            }
        }
    }
    
 }
 

 */

-(BOOL)canBecomeFirstResponder{
    return YES;
}


-(void)insertText:(NSString *)text{
 
    if ([text isEqualToString:@"\n"]) {
 [self resignFirstResponder];
 }
 
    if (text.length!=0 &&![text isEqualToString:@"\n"]) {
 [_textStringToDisplay1 appendString:text];
 }
    //NSLog(@"textStringToDisplay :%@",_textStringToDisplay1);
    [_delegate iosKeysClicked:_textStringToDisplay1];
}
 
-(BOOL)hasText{
    
 return YES;
    
 }


-(void) deleteBackward{
 
 NSRange range=NSMakeRange(_textStringToDisplay1.length-1, 1);
 if (_textStringToDisplay1.length>0) {
 
 [_textStringToDisplay1 deleteCharactersInRange:range];
 }
    
 //NSLog(@"textStringToDisplay :%@",_textStringToDisplay1);
    [_delegate iosKeysClicked:_textStringToDisplay1];

 
 }


-(void)setNeedsDisplayInRect:(CGRect)rect{
    //CGContextSaveGState(contxt);

    //if (displayRow < 24 && displayColumn < 80) {
        /*
        CGMutablePathRef path = CGPathCreateMutable(); //1
        CGPathAddRect(path, NULL, rect );
        charString= [NSString stringWithFormat:@"%c",data[displayRow][displayColumn++]];
        //CGContextSetTextMatrix(contxt, CGAffineTransformIdentity);
        CGContextTranslateCTM(contxt, 0 , 320);
        CGContextScaleCTM(contxt, 1, -1);
        CGContextSetTextPosition (
                                  contxt,
                                  rect.origin.x,
                                  rect.origin.y
                                  );

        NSAttributedString* attString = [[NSAttributedString alloc]
                                          initWithString:charString]; //2

        CTFramesetterRef framesetter =
        CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attString); //3
        
        CTFrameRef frame1 =
        CTFramesetterCreateFrame(framesetter,
                                 CFRangeMake(0, [attString length]), path, NULL);
        CTFrameDraw(frame1, contxt); //4
        
        CFRelease(frame1); //5
        CFRelease(path);
        CFRelease(framesetter);
        if(displayColumn == 80) {
            displayRow++;
            displayColumn = 0;
            //charString= [NSString stringWithFormat:@"\n"];
            //[charString drawInRect:rect withFont:[UIFont boldSystemFontOfSize:9.6]];
        }

        */
    //if (!updateCursor) {
        NSString *charString;
        UIGraphicsPushContext(contxt);
        //if ((isValid[displayRow][displayColumn]) ) {
        //charString= [NSString stringWithFormat:@"%c",data[(int)(rect.origin.y / 26)][(int)(rect.origin.x / 12)]];
        charString = [NSString stringWithFormat:@"%c",displayChar];
        CGContextSetTextMatrix(contxt,CGAffineTransformIdentity);
        CGContextTranslateCTM(contxt, 0 ,320);
        
        //CGContextScaleCTM(contxt, 1, -1);
        
        
        if (translated) {
            //CGContextTranslateCTM(contxt, 0 , 320);
            CGContextScaleCTM(contxt, 1, -1);
            translated = NO;
        }
        //else{
        //CGContextTranslateCTM(contxt, 0 , 0);
        //    CGContextScaleCTM(contxt, 1, 1);
        //   translated = YES;
        // }
        
        //CGContextSaveGState(contxt);
        //}else{
        //charString = [NSString stringWithFormat:@" "];
        //}
        //rect.origin.y+=320;
        CGContextSetFillColorWithColor(contxt, [UIColor greenColor].CGColor);
        [charString drawInRect:CGContextConvertRectToUserSpace(contxt, rect) withFont:[UIFont fontWithName:@"Courier New" size:9.6*2] lineBreakMode:NSLineBreakByWordWrapping alignment:NSTextAlignmentLeft];
        //}
        
   // }
    /*
           if (updateCursor) {
            //[[UIColor whiteColor]set];
               CGContextSetRGBFillColor(contxt, 1.0, 1.0, 1.0, 1.0);
               
            CGContextFillRect(contxt, rect);
            
            updateCursor = NO;
               
        }
     */
        UIGraphicsPopContext();
    
   
        //NSLog(@"%f,%f,%f,%f",rect.origin.x,rect.origin.y,rect.size.width,rect.size.height);
        //displayColumn++;
    /*
    if(displayColumn == 80) {
            displayRow++;
            displayColumn = 0;
            //charString= [NSString stringWithFormat:@"\n"];
            //[charString drawInRect:rect withFont:[UIFont boldSystemFontOfSize:9.6]];
         }
}
*/
}
/*-(void)displayData
{
    for (int rownumber = 0; rownumber < 24; rownumber++) {
        for (int columnNumber = 0; columnNumber < 80; columnNumber++) {
            if (isValid[rownumber][columnNumber]) {
                //printf("%c",screen[rownumber][columnNumber]);
                //[self setNeedsDisplay];
                [self setNeedsDisplayInRect:CGRectMake(columnNumber * 6, rownumber * 13, 6, 13)];
            }
            else{
                //printf(" ");
            }
        }
        //printf("\n");
    }
}
 NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
 [nc addObserver:self selector:@selector(keyboardWasShown:) name: UIKeyboardWillShowNotification object:nil];
*/

@end
