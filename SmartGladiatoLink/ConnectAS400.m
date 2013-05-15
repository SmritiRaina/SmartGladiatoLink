 //
//  ConnectAS400.m
//  SmartGladiatoLink
//
//  Created by Smriti Raina on 16/04/13.
//  Copyright (c) 2013 Smriti Raina. All rights reserved.
//

#import "ConnectAS400.h"
#import "TerminalResources.h"
@interface ConnectAS400 ()<AsyncSocketDelegate>{
    //AsyncSocket *socket;
    
    TelnetView *telnetView;
    //CGPoint cursorPosition;
    int lastAttribute;
    NSInputStream *inputStream;
    NSOutputStream *outputStream;
    BOOL enhanced;

}

@end

@implementation ConnectAS400

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated {
    //socket.delegate=self;
   // self.scrollView setContentSize:CGSizeMake(640, <#CGFloat height#>)
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
       //socket.delegate=nil;
}

-(void)viewDidAppear:(BOOL)animated{
    
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    //isconnected=NO;
    //[self.scrollView setZoomScale:1.5];
    _telnetView.delegate=self;
    _scrollView.contentSize = CGSizeMake(480, 520);
    //[_scrollView scrollRectToVisible:CGRectMake(0, -50, _scrollView.frame.size.width, _scrollView.frame.size.height) animated:NO];
    [self.actIndicator startAnimating];
    self.actIndicator.color=[UIColor whiteColor];
    self.blackSquareView.backgroundColor=[UIColor colorWithWhite:0.0 alpha:0.7];
    self.blackSquareView.layer.cornerRadius=7.0;
    

    documentDirPath_conn=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) lastObject];
    path_conn = [documentDirPath_conn stringByAppendingPathComponent:@"ServerConnect.plist"];
    hostDict_conn =[NSMutableDictionary dictionaryWithContentsOfFile:path_conn];
    hostlisttoDeleteArray_conn = [hostDict_conn valueForKey:@"Hosts"];
    
    NSDictionary *hostListItemDict=[hostlisttoDeleteArray_conn objectAtIndex:self.indexPath_connectAS400.row];
    
    self.hostNameString=[hostListItemDict valueForKey:@"ipAddress"];
    self.portString=[hostListItemDict valueForKey:@"port"];
   [self.connectingHostName setText:[NSString stringWithFormat:@"IP: %@",_hostNameString]];
    self.graybackgroundView.backgroundColor=[UIColor lightGrayColor];
    
    
    [self.view addSubview:self.graybackgroundView];
   
    [[UIApplication sharedApplication]setStatusBarHidden:YES];
    
    enhanced = YES;
    [self connection:@"TCP" forIpAddress:self.hostNameString forPort:@"23"];

     //socket = [[AsyncSocket alloc] initWithDelegate:self];
     NSError *error;
    //[socket connectToHost:self.hostNameString onPort:23 error:&error];
    
     NSString *beepfilePath=[[NSBundle mainBundle]pathForResource:@"Normal Single Beep - Short beep-7" ofType:@"wav"];
     NSURL *url=[[NSURL alloc]initFileURLWithPath:beepfilePath];
     enterBeep=[[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
     enterBeep.volume=2.0;
    
     
}
    /*
     [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(KeyBoardDisplayStyle:)
     name:@"UIKeyboardWillShowNotification"
     object:nil];
     
     }
     
     -(void)KeyBoardDisplayStyle:(NSNotification *)notification{
     [self.screenData_textView resignFirstResponder];
     }
*/


- (void)showDisconnectionAlert{
    
    [self.actIndicator stopAnimating];
    self.graybackgroundView.backgroundColor=[UIColor grayColor];
    self.cancelBtn.hidden=YES;
    self.connectingHostName.hidden=YES;
    
    [[[UIAlertView alloc]initWithTitle:@"Connection Failed!!" message:[NSString stringWithFormat:@"Cannot connect to host %@,port %@",self.hostNameString,self.portString] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==0) {
        [self dismissModalViewControllerAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)cancelBtnclicked:(UIButton *)sender {
    //call close method to close connection if made
    [self close];
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)telnetViewTapped:(UITapGestureRecognizer *)sender {
    CGPoint location = [sender locationInView:_telnetView];
    for (int row = 0; row < 24; row++) {
        for (int col = 0; col < 80; col++) {
            CGRect rect = CGRectMake(col * 6, row * 13, 6, 13);
            if (CGRectContainsPoint(rect, location)) {
                [_statusButton setTitle:[NSString stringWithFormat:@" Status: %2i-%2i",(row + 1),(col + 1)] forState:UIControlStateNormal];
                //cursorPosition = CGPointMake(row + 1, col + 1);
                [_cursorView setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.7]];
                _cursorView.frame = rect;
            }
        }
    }
}

#pragma  mark-async socket methods

- (void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port {
    
    //isconnected=YES;
    [self.actIndicator stopAnimating];
    self.graybackgroundView.hidden=YES;
    self.cancelBtn.hidden=YES;
    self.connectingHostName.hidden=YES;
    
    [self.graybackgroundView removeFromSuperview];
    if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft){
        
    [[UIDevice currentDevice] setOrientation:UIInterfaceOrientationLandscapeLeft];
    }
    else if([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeRight)
    {
        [[UIDevice currentDevice] setOrientation:UIInterfaceOrientationLandscapeRight];
    }
    else
        [[UIDevice currentDevice] setOrientation:UIInterfaceOrientationLandscapeRight];
    
    
    //[[UIApplication sharedApplication]setStatusBarHidden:YES];

 }
#pragma  mark-ios 6 orientation support

-(BOOL)shouldAutorotate
{
    
    return YES;
    
}
-(NSUInteger)supportedInterfaceOrientations
{  
    if (_isconnected==YES) {
        return UIInterfaceOrientationMaskLandscape;
    }
     return UIInterfaceOrientationMaskAllButUpsideDown;
    
}
#pragma mark-ios 5 orientation support

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
     if (_isconnected==YES){
         return interfaceOrientation==UIInterfaceOrientationLandscapeLeft||interfaceOrientation==UIInterfaceOrientationLandscapeRight;
         // return interfaceOrientation == (UIInterfaceOrientationLandscapeLeft | UIInterfaceOrientationLandscapeRight);
    }
    else
        return interfaceOrientation!=UIInterfaceOrientationPortraitUpsideDown;
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    
    [_scrollView scrollRectToVisible:CGRectMake(0, 42, _scrollView.frame.size.width, _scrollView.frame.size.height) animated:NO];
    
}
#pragma mark-Button Action methods

- (IBAction)nextKbButtonPressed:(UIButton *)sender {
}

- (IBAction)statusButtonPressed:(UIButton *)sender {
}

- (IBAction)iosKbPressed:(UIButton *)sender{
    
    [self.telnetView becomeFirstResponder];
    
    //NSLog(@"%@",telnetView.textStringToDisplay1);
}

- (IBAction)fxxButtonPressed:(UIButton *)sender {

    [self hideAllDefaultButtons];
    
    FunctionalKeyBoard_view *functionalKBview=[[[NSBundle mainBundle]loadNibNamed:@"FunctionalKB" owner:self options:nil] objectAtIndex:0];
    functionalKBview.delegate=self;
    [self.view addSubview:functionalKBview];
    
}

- (IBAction)menuButtonPressed:(UIButton *)sender{
    
    UIActionSheet *actionSheet=[[UIActionSheet alloc] initWithTitle: nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Disconnect",nil];
    actionSheet.actionSheetStyle=UIActionSheetStyleDefault;
    [actionSheet dismissWithClickedButtonIndex:1 animated:YES];
    [actionSheet showInView:self.view];
}

- (IBAction)numericKeyboardPressed:(UIButton *)sender {
    [self hideAllDefaultButtons];
     
   NumericKeyBoard_view *numKBview=(NumericKeyBoard_view *)[[[NSBundle mainBundle]loadNibNamed:@"numericKB" owner:self options:nil] objectAtIndex:0];
    numKBview.delegate = self;
    //[self.view addSubview:numKBview];
    [self.view insertSubview:numKBview aboveSubview:self.view];
    
    
}


- (IBAction)cursorKbButtonPressed:(UIButton *)sender {
    [self hideAllDefaultButtons];
    CursorKeyBoard_view *cursorKBview=[[[NSBundle mainBundle]loadNibNamed:@"CursorKB" owner:self options:nil]objectAtIndex:0];
    cursorKBview.delegate=self;
    [self.view insertSubview:cursorKBview aboveSubview:self.view];
}

- (IBAction)lockScreenPressed:(UIButton *)sender {
}


- (IBAction)enterPressed:(UIButton *)sender {
    
    
    [enterBeep prepareToPlay];
    [enterBeep play];
    
}


- (IBAction)alphakbButtonPressed:(UIButton *)sender{
    [self hideAllDefaultButtons];
    AlphaKeyBoard_view *alphaKBview=[[[NSBundle mainBundle]loadNibNamed:@"AlphaKB" owner:self options:nil]objectAtIndex:0];
    alphaKBview.delegate=self;
    [self.view insertSubview:alphaKBview aboveSubview:self.view];
}



- (void)viewDidUnload {
    
    [self setMenuButton:nil];
    [self setBlackSquareView:nil];
    [self setFxxButton:nil];
    [self setIosKBbutton:nil];
    [self setNumericKBbutton:nil];
    [self setCursorKbButton:nil];
    [self setLockScreenButton:nil];
    [self setNextKbButton:nil];
    [self setEnterButton:nil];
    [self setStatusButton:nil];
    [self setAlphaKbButton:nil];
    [self setScrollView:nil];
    [self setTelnetView:nil];
    [self setCursorView:nil];
    [super viewDidUnload];
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex==0) {//Disconnect
        //close the available connection or session
        [self close];
        [self dismissModalViewControllerAnimated:NO];
    }
    /*if (buttonIndex==1) {//cancel
     [self dismissModalViewControllerAnimated:YES];
     }*/
}

/*-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return _screenData_textView;
}*/

-(void)hideAllDefaultButtons{
    [self.iosKBbutton setHidden:YES];
    [self.fxxButton setHidden:YES];
    [self.menuButton setHidden:YES];
    [self.numericKBbutton setHidden:YES];
    [self.cursorKbButton setHidden:YES];
    [self.lockScreenButton setHidden:YES];
    [self.nextKbButton setHidden:YES];
    [self.statusButton setHidden:YES];
    [self.enterButton setHidden:YES];
    [self.alphaKbButton setHidden:YES];
    
}

-(void)unhideAllDefaultButtons{
    [self.iosKBbutton setHidden:NO];
    [self.fxxButton setHidden:NO];
    [self.menuButton setHidden:NO];
    [self.numericKBbutton setHidden:NO];
    [self.cursorKbButton setHidden:NO];
    [self.lockScreenButton setHidden:NO];
    [self.nextKbButton setHidden:NO];
    [self.statusButton setHidden:NO];
    [self.enterButton setHidden:NO];
    [self.alphaKbButton setHidden:NO];
}

#pragma mark - KeyBoard Delegate  Methods

-(void)iosKeysClicked:(NSMutableString *)str{
    NSLog(@"iosKeysclicked....:%@",str);
}

-(void)numericKeyPressed:(int)keyCode{
    //NSLog(@"%c")
    switch (keyCode) {
        case 1:
            [self unhideAllDefaultButtons];
            break;
        case 43://Plus
            break;
        case 44://comma
            break;
        case 45://minus
            break;
        case 46://dot
            break;
        case 48://0
            break;
        case 49://1
            break;
        case 50://2
            break;
        case 51://3
            break;
        case 52://4
            break;
        case 53://5
            break;
        case 54://6
            break;
        case 55://7
            break;
        case 56://8
            break;
        case 57://9
            break;
        case 127://delete
            break;
        case 0://Insert
            break;
        case 13://enter
            break;
         
            
        default:
            break;
    }
    
    
    
}


-(void)alphaKeysPressed:(int)keyCode{
    
    NSLog(@"keyCode is :%d",keyCode);
    char c;
    switch (keyCode) {
        case 0 :
            [self unhideAllDefaultButtons];
            break;
        case 65:
            NSLog(@"%c",keyCode);
            break;
        case 66:
            NSLog(@"B");
            break;
        case 67:
            NSLog(@"C");
            break;
        case 68:
            NSLog(@"D");
            c = 'D';
            break;
        case 69:
            NSLog(@"E");
            break;
        case 70:
            NSLog(@"F");
            break;
        case 71:
            break;
        case 72:
            break;
        case 73:
            break;
        case 74:
            break;
        case 75:
            break;
        case 76:
            break;
        case 77:
            break;
        case 78:
            break;
        case 79:
            break;
        case 80:
            break;
        case 81:
            break;
        case 82:
            break;
        case 83:
            break;
        case 84:
            break;
        case 85:
            break;
        case 86:
            break;
        case 87:
            break;
        case 88:
            break;
        case 89:
            break;
        case 90:
            break;
        case 127:
            break;
        case 15:
            break;
        case 32:
            break;
        default:
            break;
            
    }
    
}

-(void)functionalKeysPressed:(int)keyCode{
    if (keyCode==0) {
        [self unhideAllDefaultButtons];
    }
}


-(void)cursorKeysPressed:(int)keyCode{
    if (keyCode==0) {
        [self unhideAllDefaultButtons];
    }
}


#pragma mark UserMethods

- (void)connection:(NSString*)serviceName forIpAddress:(NSString *)ipAddress
           forPort:(NSString *)portNo
{
    //if(inputStream && outputStream)
    //    [self close];
    NSString *urlString = [NSString stringWithFormat:@"http://%@", ipAddress];
    NSURL *website = [NSURL URLWithString:urlString];
    if (!website) {
        NSLog(@"%@ is not a valid URL", website);
    }
    
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    CFStreamCreatePairWithSocketToHost(NULL, (__bridge CFStringRef)[website host], [portNo
                                                                                    intValue], &readStream, &writeStream);
    CFReadStreamSetProperty(readStream, kCFStreamPropertyShouldCloseNativeSocket,
                            kCFBooleanTrue);
    CFWriteStreamSetProperty(writeStream, kCFStreamPropertyShouldCloseNativeSocket,
                             kCFBooleanTrue);
    inputStream = (__bridge NSInputStream *)readStream;
    outputStream = (__bridge NSOutputStream *)writeStream;
    [self open];
}

- (void)open
{
    [inputStream setDelegate:self];
    [outputStream setDelegate:self];
    [inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop]
                           forMode:NSDefaultRunLoopMode];
    [outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop]
                            forMode:NSDefaultRunLoopMode];
    [inputStream open];
    [outputStream open];
}


-(void)stream:(NSStream *)theStream handleEvent:(NSStreamEvent)streamEvent
{
    
    NSString *event;
    switch (streamEvent)
    {
        case NSStreamEventNone:
            event = @"NSStreamEventNone";
            break;
        case NSStreamEventOpenCompleted:
            event = @"NSStreamEventOpenCompleted";
            break;
        case NSStreamEventHasBytesAvailable:
            event = @"NSStreamEventHasBytesAvailable";
            
            if (theStream == inputStream)
            {
                SignedByte readByte[1920];
                //uint8_t readbyte2[1024];
                int len;
                
                while ([inputStream hasBytesAvailable])
                {
                    
                    
                    len = [inputStream read:readByte maxLength:1920];
                    
                    /*
                     NSLog(@"Received...");
                     
                     for (int n=0; n<len; n++) {
                     Byte c = readByte[n] >= 0 ? readByte[n]:(256 + readByte[n]);
                     //int c = readByte[n];
                     NSLog(@"dec = %i  hex = %x  char = %c codepade = %c ",readByte[n],readByte[n],readByte[n], codepage[c]);
                     
                     }
                     NSLog(@"Codepage data..");
                     for (int n=0; n<len; n++) {
                     Byte c = readByte[n] >= 0 ? readByte[n]:(256 + readByte[n]);
                     printf("%c", codepage[c]);
                     }
                     printf("\n");
                     
                     */
                    
                    if(readByte[0] == IAC){
                        [self negotiate:readByte byteWithLenth:len];
                        //[negotiationActivityIndicator removeFromSuperview];
                        //[negotiatingLabel removeFromSuperview];
                        if (_isconnected == NO) {
                            _isconnected=YES;
                            [self.actIndicator stopAnimating];
                            self.graybackgroundView.hidden=YES;
                            self.cancelBtn.hidden=YES;
                            self.connectingHostName.hidden=YES;
                            
                            [self.graybackgroundView removeFromSuperview];
                            
                            if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft){
                                
                                [[UIDevice currentDevice] setOrientation:UIInterfaceOrientationLandscapeRight];
                                           
                            }
                            else if([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeRight)
                            {
                                [[UIDevice currentDevice] setOrientation:UIInterfaceOrientationLandscapeLeft];
                                               }
                            else
                                [[UIDevice currentDevice] setOrientation:UIInterfaceOrientationLandscapeRight];
                            [_scrollView scrollRectToVisible:CGRectMake(0, 42, _scrollView.frame.size.width, _scrollView.frame.size.height) animated:NO];
                            
                        }
                     }else {
                        [self parseByteAray:readByte];
                        //[self parseData:readByte byteWithLength:len];
                    }
                    
                }
            }
            break;
        case NSStreamEventHasSpaceAvailable:
            event = @"NSStreamEventHasSpaceAvailable";break;
        case NSStreamEventErrorOccurred:
            event = @"NSStreamEventisErrorOccurred";
            [self close];
            [self showDisconnectionAlert];
            break;
        case NSStreamEventEndEncountered:
            event = @"NSStreamEventEndEncountered";
            [self close];
            [self showDisconnectionAlert];
            break;
        default:
            event = @"Unknown";
            break;
    }
    NSLog(@"event------%@",event);
}

- (void)close
{
    [inputStream close];
    [outputStream close];
    [inputStream removeFromRunLoop:[NSRunLoop currentRunLoop]
                           forMode:NSDefaultRunLoopMode];
    [outputStream removeFromRunLoop:[NSRunLoop currentRunLoop]
                            forMode:NSDefaultRunLoopMode];
    [inputStream setDelegate:nil];
    [outputStream setDelegate:nil];
    inputStream = nil;
    outputStream = nil;
}


-(BOOL) negotiate:(SignedByte [])readByte byteWithLenth:(int)len
{
    int i = 0;
    int writeIndex = 0;
    SignedByte writeByte[1920];
    
    // from server negotiations
    if(readByte[i] == IAC)
    { // -1
        //i < strlen((char *)readByte) &&
        while(i < len && readByte[i++] == -1)
            //         while(i < abyte0.length && (abyte0[i] == -1 || abyte0[i++] == 0x20))
            switch(readByte[i++]) {
                    
                    // we will not worry about what it WONT do
				case -4:   // WONT  -4
				default:
					break;
                    
				case -3: // DO  -3
                    
					// not sure why but since moving to V5R2 we are receiving a
					//   DO with no option when connecting a second session with
					//   device name.  Can not find the cause at all.  If anybody
					//   is interested please debug this until then this works.
                    
                    if (i <len) {
						switch(readByte[i]) {
                                
                            case 0: // 0 TRANSMIT_BINARY
                                
                                writeByte[writeIndex++] = IAC;
                                writeByte[writeIndex++] = WILL;
                                writeByte[writeIndex++] = TRANSMIT_BINARY;
                                [self sendByte:writeByte toIndex:writeIndex];
                                writeIndex = 0;  //baosp.reset();
                                
                                break;
                                
                            case 6: //TIMING_MARK 6   rfc860
                                //                        System.out.println("Timing Mark Received and notifying " +
                                //                        "the server that we will not do it");
                                writeByte[writeIndex++] = IAC;
                                writeByte[writeIndex++] = WONT;
                                writeByte[writeIndex++] = TIMING_MARK;
                                [self sendByte:writeByte toIndex:writeIndex];
                                writeIndex = 0;  //baosp.reset();
                                
                                break;
                                
                            case 24: // TERMINAL_TYPE 24
                                writeByte[writeIndex++] = IAC;
                                writeByte[writeIndex++] = WILL;
                                writeByte[writeIndex++] = TERMINAL_TYPE;
                                [self sendByte:writeByte toIndex:writeIndex];
                                writeIndex = 0;  //baosp.reset();
                                
                                break;
                                
                            case 25: //OPT_END_OF_RECORD  25
                                
                                writeByte[writeIndex++] = IAC;
                                writeByte[writeIndex++] = WILL;
                                writeByte[writeIndex++] = OPT_END_OF_RECORD;
                                [self sendByte:writeByte toIndex:writeIndex];
                                writeIndex = 0;  //baosp.reset();
                                break;
                                
                            case 39: //NEW_ENVIRONMENT 39 rfc1572, rfc4777
                                // allways send new environment vars ...
                                writeByte[writeIndex++] = IAC;
                                writeByte[writeIndex++] = WILL;
                                writeByte[writeIndex++] = NEW_ENVIRONMENT;
                                [self sendByte:writeByte toIndex:writeIndex];
                                writeIndex = 0;  //baosp.reset();
                                break;
                                
                            default:  // every thing else we will not do at this time
                                writeByte[writeIndex++] = IAC;
                                writeByte[writeIndex++] = WONT;
                                writeByte[writeIndex++] = readByte[i];
                                [self sendByte:writeByte toIndex:writeIndex];
                                writeIndex = 0;  //baosp.reset();
                                
                                break;
						}
					}
                    
					i++;
					break;
                    
				case -5: // WILL
                    
					switch(readByte[i]) {
                        case 25: // OPT_END_OF_RECORD 25
                            writeByte[writeIndex++] = IAC;
                            writeByte[writeIndex++] = DO;
                            writeByte[writeIndex++] = OPT_END_OF_RECORD;
                            [self sendByte:writeByte toIndex:writeIndex];
                            writeIndex = 0;  //baosp.reset();
                            
                            break;
                            
                        case 0: // TRANSMIT_BINARY 0
                            writeByte[writeIndex++] = IAC;
                            writeByte[writeIndex++] = DO;
                            writeByte[writeIndex++] = TRANSMIT_BINARY;
                            [self sendByte:writeByte toIndex:writeIndex];
                            writeIndex = 0;  //baosp.reset();
                            
                            
                            break;
					}
					i++;
					break;
                    
				case -6: //SB -6
                    
					if(readByte[i] == NEW_ENVIRONMENT && readByte[i + 1] == 1) {
						//negNewEnvironment();
                        writeIndex  = [self negNewEnvironmentWithWriteByte:writeByte andCurrentIndex:writeIndex];
						while (++i < len && readByte[i + 1] != IAC);
					}
                    
					if(readByte[i] == TERMINAL_TYPE && readByte[i + 1] == 1) {
						writeByte[writeIndex++] = IAC;
                        writeByte[writeIndex++] = SB;
                        writeByte[writeIndex++] = TERMINAL_TYPE;
                        writeByte[writeIndex++] = QUAL_IS;
                        writeIndex = [self convertFromString:@"IBM-3179-2" toBytesAndFillArray:writeByte withCurrentIndex:writeIndex];
                        writeByte[writeIndex++] = IAC;
                        writeByte[writeIndex++] = SE;
                        [self sendByte:writeByte toIndex:writeIndex];
                        writeIndex = 0;  //baosp.reset();
                        
						i++;
					}
					i++;
					break;
            }
        return true;
    }
    else {
        return false;
    }
}
-(int)negNewEnvironmentWithWriteByte:(SignedByte *)writeByte andCurrentIndex:(int)writeIndex
{
    writeByte[writeIndex++] = IAC;
    writeByte[writeIndex++] = SB;
    writeByte[writeIndex++] = NEW_ENVIRONMENT;
    writeByte[writeIndex++] = IS;
    
    // http://tools.ietf.org/html/rfc4777
    
    //if (kbdTypesCodePage != null) {
    writeByte[writeIndex++] = USERVAR;
    writeIndex = [self convertFromString:@"KBDTYPE" toBytesAndFillArray:writeByte withCurrentIndex:writeIndex];
    writeByte[writeIndex++] = VALUE;
    writeIndex = [self convertFromString:@"BRB" toBytesAndFillArray:writeByte withCurrentIndex:writeIndex];
    
    writeByte[writeIndex++] = USERVAR;
    writeIndex = [self convertFromString:@"CODEPAGE" toBytesAndFillArray:writeByte withCurrentIndex:writeIndex];
    writeByte[writeIndex++] = VALUE;
    writeIndex = [self convertFromString:@"37" toBytesAndFillArray:writeByte withCurrentIndex:writeIndex];
    
    writeByte[writeIndex++] = USERVAR;
    writeIndex = [self convertFromString:@"CHARSET" toBytesAndFillArray:writeByte withCurrentIndex:writeIndex];
    writeByte[writeIndex++] = VALUE;
    writeIndex = [self convertFromString:@"697" toBytesAndFillArray:writeByte withCurrentIndex:writeIndex];
    
    
    
    //}
    /*
     //if (devName != null) {
     writeByte[writeIndex++] = USERVAR;
     writeIndex = [self convertFromString:@"DEVNAME" toBytesAndFillArray:writeByte withCurrentIndex:writeIndex];
     writeByte[writeIndex++] = VALUE;
     writeIndex = [self convertFromString:@"AGICENT" toBytesAndFillArray:writeByte withCurrentIndex:writeIndex];
     
     //}
     
     //if (user != null) {
     writeByte[writeIndex++] = VAR;
     writeIndex = [self convertFromString:@"USER" toBytesAndFillArray:writeByte withCurrentIndex:writeIndex];
     writeByte[writeIndex++] = VALUE;
     writeIndex = [self convertFromString:@"AGICENT" toBytesAndFillArray:writeByte withCurrentIndex:writeIndex];
     
     //if (password != null) {
     writeByte[writeIndex++] = USERVAR;
     writeIndex = [self convertFromString:@"IBMRSEED" toBytesAndFillArray:writeByte withCurrentIndex:writeIndex];
     writeByte[writeIndex++] = VALUE;
     writeByte[writeIndex++] = NEGOTIATE_ESC;
     writeByte[writeIndex++] = 0x0;
     writeByte[writeIndex++] = 0x0;
     writeByte[writeIndex++] = 0x0;
     writeByte[writeIndex++] = 0x0;
     writeByte[writeIndex++] = 0x0;
     writeByte[writeIndex++] = 0x0;
     writeByte[writeIndex++] = 0x0;
     writeByte[writeIndex++] = 0x0;
     writeByte[writeIndex++] = USERVAR;
     writeIndex = [self convertFromString:@"IBMSUBSPW" toBytesAndFillArray:writeByte withCurrentIndex:writeIndex];
     writeByte[writeIndex++] = VALUE;
     writeIndex = [self convertFromString:@"AGICENT" toBytesAndFillArray:writeByte withCurrentIndex:writeIndex];
     //}
     
     
     if (library != null) {
     baosp.write(USERVAR);
     baosp.write("IBMCURLIB".getBytes());
     baosp.write(VALUE);
     baosp.write(library.getBytes());
     }
     
     if (initialMenu != null) {
     baosp.write(USERVAR);
     baosp.write("IBMIMENU".getBytes());
     baosp.write(VALUE);
     baosp.write(initialMenu.getBytes());
     }
     
     if (program != null) {
     baosp.write(USERVAR);
     baosp.write("IBMPROGRAM".getBytes());
     baosp.write(VALUE);
     baosp.write(program.getBytes());
     }
     */
    // }
    writeByte[writeIndex++] = IAC;
    writeByte[writeIndex++] = SE;
    [self sendByte:writeByte toIndex:writeIndex];
    writeIndex = 0;  //baosp.reset();
    
    return writeIndex;
}
-(void) sendByte:(SignedByte *) writeByte toIndex:(int) writeIndex{
    
    SignedByte sendByte[writeIndex];
    NSLog(@"Sending....");
    for (int index = 0; index < writeIndex; index++) {
        sendByte[index] = writeByte[index];
        NSLog(@"dec = %i  hex = %x  char = %c",sendByte[index],sendByte[index],sendByte[index]);
    }
    [outputStream write:sendByte maxLength:writeIndex];
}


-(int)convertFromString:(NSString *)string toBytesAndFillArray:(SignedByte *)writeByte withCurrentIndex:(int)writeIndex
{
    const char *charPtr = [string cStringUsingEncoding:NSUTF8StringEncoding];
    int length = strlen(charPtr);
    SignedByte localWriteByte[length];
    CFStringRef str;
    CFRange rangeToProcess ;
    str = CFStringCreateWithCString(NULL, charPtr, NSASCIIStringEncoding);
    
    rangeToProcess = CFRangeMake(0, CFStringGetLength(str));
    while (rangeToProcess.length > 0) {
        
        CFIndex usedBufferLength;
        
        CFIndex numChars = CFStringGetBytes(str, rangeToProcess, kCFStringEncodingUTF8, '?', FALSE, (UInt8 *)localWriteByte, 100, &usedBufferLength);
        
        if (numChars == 0) break;   // Failed to convert anything...
        //processCharacters(localWriteByte, usedBufferLength);
        rangeToProcess.location += numChars;
        rangeToProcess.length -= numChars;
    }
    
    //NSLog(@"Converting....");
    for (int k =0; k < length; k++) {
        writeByte[writeIndex] = localWriteByte[k];
        //  NSLog(@"dec = %i  hex = %x  char = %c",writeByte[writeIndex],writeByte[writeIndex],writeByte[writeIndex]);
        writeIndex++;
    }
    return writeIndex;
}

-(void)parseByteAray:(SignedByte *)byteArray{
    int length = (byteArray[0] & 0xff) << 8 | (byteArray[1] & 0xff);
    length = length+2;
    opCode = byteArray[9];
    
    if ([TerminalResources sharedTerminalResources].totalRows == 24) {
    for (int i=0; i<[TerminalResources sharedTerminalResources].totalRows; i++) {
        for (int j=0; j<[TerminalResources sharedTerminalResources].totalCols; j++) {
            isValid24[i][j]=NO;
            txtAttribute24[i][j] = 0;
        }
    }
    }else{
        for (int i=0; i<[TerminalResources sharedTerminalResources].totalRows; i++) {
            for (int j=0; j<[TerminalResources sharedTerminalResources].totalCols; j++) {
                isValid27[i][j]=NO;
                txtAttribute27[i][j] = 0;
            }
        }
}
    
    switch (opCode) {
        case 0: // No Oprations;
            NSLog(@"No Opration");
            break;
        case 1: // Invite Operation
            NSLog(@"Invite Operation");
            break;
        case 2: // Output Only
            NSLog(@"Output Only");
            break;
        case 3://Put/Get Operation
            NSLog(@"Put/Get Operation");
            [self parseIncoming:byteArray];
            break;
        case 4:
            NSLog(@"Save Screen Operation");
            break;
        case 5:
            NSLog(@"Restore Screen Operation");
            break;
        case 6:
            NSLog(@"Read Immediate");
            break;
        case 7:
            NSLog(@"Reserved");
            break;
        case 8:
            NSLog(@"Read Screen Operation");
            break;
            
        case 9:
            NSLog(@"Reserved");
            break;
            
        case 10:
            NSLog(@"Cancel Invite Operation");
            break;
            
        case 11:
            NSLog(@"Turn on message light");
            break;
        case 12:
            NSLog(@"Turn off Message light");
            break;
        default:
            break;
    }
    
}

-(void)parseIncoming:(SignedByte *)byteArray{
    int length = (byteArray[0] & 0xff) << 8 | (byteArray[1] & 0xff);
    length = length;
    BOOL done = NO;
    
    while ((currentIndex < length) && !done) {
        int b = byteArray[currentIndex++];
        switch (b) {
            case 0:
            case 1:
                break;
            case 2: // 0x02 2 Save Screen //CMD_SAVE_SCREEN
            case 3: // 0x03 3 Save Partial Screen
                NSLog(@"save screen partial");
                break;
                
            case 4: // ESCAPE 4 //ESC
                break;
            case 7: // audible bell
                
                currentIndex++;
                currentIndex++;
                break;
                
            case 17:
                [self writeToDisplay:byteArray andControl:YES];
                // 0x11 17 write to display //CMD_WRITE_TO_DISPLAY
                // WVL - LDC : TR.000300 : Callback scenario from 5250
                // Only scan when WRITE_TO_DISPLAY operation (i.e. refill
                // screen buffer)
                // has been issued!
                break;
            case 18: // 0x12 18 Restore Screen //CMD_RESTORE_SCREEN
            case 13: // 0x13 19 Restore Partial Screen
                NSLog(@"restore screen partial");
                break;
                
            case 32: // 0x20 32 clear unit alternate //CMD_CLEAR_UNIT_ALTERNATE
            {
                int param = byteArray[currentIndex++];
                if (param != 0) {
                    NSLog(@" clear unit alternate error ");
                    done = true;
                } else {
                    //Set Rows Col 27x137.
                }
            }
                break;
                
            case 33: // 0x21 33 Write Error Code //CMD_WRITE_ERROR_CODE
                //error = writeToDisplay(false);
                break;
            case 34: // 0x22 34 //CMD_WRITE_ERROR_CODE_TO_WINDOW
                // Write Error Code to window
                [self writeToDisplay:byteArray andControl:NO];
                break;
                
            case 98: // 0x62 98 //CMD_READ_SCREEN_IMMEDIATE
            case 102: // 0x66 102 read screen to print //CMD_READ_SCREEN_TO_PRINT
                break;
                
            case 64: // 64 0x40 clear unit //CMD_CLEAR_UNIT
                // set rows col 24x80 and clear.
                break;
                
            case 80: // 80 0x50 Clear format table //CMD_CLEAR_FORMAT_TABLE
                break;
                
            case 66: //0x42 66 read input fields //CMD_READ_INPUT_FIELDS
            case 82: // 0x52 82 read MDT Fields //CMD_READ_MDT_FIELDS
                currentIndex++;
                currentIndex++;
                
                // do nothing with the cursor here it is taken care of
                //   in the main loop.
                break;
            case 83: // 0x53 83 //CMD_READ_MDT_IMMEDIATE_ALT
                break;
            case 243: // 243 0xF3 -13 Write //CMD_WRITE_STRUCTURED_FIELD
                // structured field
                //writeStructuredField();
                break;
            case 35: // 0x23 35 Roll Not sure what it does right now //CMD_ROLL
            {
                currentIndex++;
                currentIndex++;
                currentIndex++;
            }
                break;
                
            default:
                //done = true;
                break;
        }
    }
}

-(void)writeToDisplay:(SignedByte*) byteArray andControl:(BOOL) exist{
    
    char codepage[] = { 0x00, 0x01, 0x02,
        0x03, 0x9C, '\t', 0x86, 0x7F, 0x97, 0x8D,
        0x8E, 0x0B, '\f', '\r', 0x0E, 0x0F, 0x10,
        0x11, 0x12, 0x13, 0x9D, 0x85, 0x08,
        0x87, 0x18, 0x19, 0x92, 0x8F, 0x1C,
        0x1D, 0x1E, 0x1F, 0x80, 0x81, 0x82,
        0x83, 0x84, '\n', 0x17, 0x1B, 0x88, 0x89,
        0x8A, 0x8B, 0x8C, 0x05, 0x06, 0x07,
        0x90, 0x91, 0x16, 0x93, 0x94, 0x95,
        0x96, 0x04, 0x98, 0x99, 0x9A, 0x9B,
        0x14, 0x15, 0x9E, 0x1A, ' ', 0xA0, 0xE2,
        0xE4, 0xE0, 0xE1, 0xE3, 0xE5, 0xE7,
        0xF1, 0xA2, '.', '<', '(', '+', '|', '&', 0xE9,
        0xEA, 0xEB, 0xE8, 0xED, 0xEE, 0xEF,
        0xEC, 0xDF, '!', '$', '*', ')', ';', 0xAC, '-', '/',
        0xC2, 0xC4, 0xC0, 0xC1, 0xC3, 0xC5,
        0xC7, 0xD1, 0xA6, ',', '%', '_', '>', '?', 0xF8,
        0xC9, 0xCA, 0xCB, 0xC8, 0xCD, 0xCE,
        0xCF, 0xCC, '`', ':', '#', '@', '\'', '=', '"', 0xD8,
        'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 0xAB, 0xBB,
        0xF0, 0xFD, 0xFE, 0xB1, 0xB0, 'j', 'k', 'l',
        'm', 'n', 'o', 'p', 'q', 'r', 0xAA, 0xBA, 0xE6,
        0xB8, 0xC6, 0xA4, 0xB5, '~', 's', 't', 'u', 'v',
        'w', 'x', 'y', 'z', 0xA1, 0xBF, 0xD0, 0xDD,
        0xDE, 0xAE, '^', 0xA3, 0xA5, 0xB7, 0xA9,
        0xA7, 0xB6, 0xBC, 0xBD, 0xBE, '[', ']',
        0xAF, 0xA8, 0xB4, 0xD7, '{', 'A', 'B', 'C', 'D',
        'E', 'F', 'G', 'H', 'I', 0xAD, 0xF4, 0xF6, 0xF2,
        0xF3, 0xF5, '}', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q',
        'R', 0xB9, 0xFB, 0xFC, 0xF9, 0xFA, 0xFF,
        '\\', 0xF7, 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 0xB2,
        0xD4, 0xD6, 0xD2, 0xD3, 0xD5, '0', '1', '2',
        '3', '4', '5', '6', '7', '8', '9', 0xB3, 0xDB, 0xDC,
        0xD9, 0xDA, 0x9F, };
    
    
    int length = (byteArray[0] & 0xff) << 8 | (byteArray[1] & 0xff);
    length = length;
    BOOL done = NO;
    BOOL error = NO;
    int attr;
    Byte control0 = 0;
    Byte control1 = 0;
    int saRows = 24;
    int saCols = 80;
    
    if (exist){
        control0 = byteArray[currentIndex++];
        control1 = byteArray[currentIndex++];
    }
    while ((currentIndex < length) && !done) {
        
        //pos = bk.getCurrentPos();
        
        int rowc = currentRow;
        int colc = currentcol;
        
        int bytebk = byteArray[currentIndex++];
        
        switch (bytebk) {
                
            case 1: // SOH - Start of Header Order
                NSLog(@"SOH - Start of Header Order");
                error = [self processSOH:byteArray];
                
                break;
            case 02: // RA - Repeat to address
                NSLog(@"RA - Repeat to address");
                int row = currentRow;
                int col = currentcol;
                
                int toRow = byteArray[currentIndex++];
                int toCol = byteArray[currentIndex++] & 0xff;
                if (toRow >= row) {
                    int repeat = byteArray[currentIndex++];
                    
                    // a little intelligence here I hope
                    if (row == 1 && col == 2 && toRow == 24
                        && toCol == 80)
                        // clear screen
                        ;
                    else {
                        if (repeat != 0) {
                            //LDC - 13/02/2003 - convert it to unicode
                            Byte c = repeat >= 0 ? repeat:(256 + repeat);
                            repeat = codepage[c];
                        }
                        
                        int times = ((toRow * 80) + toCol)
                        - ((row * 80) + col);
                        while (times-- >= 0) {
                            // set char to 2D array with Index.
                        }
                        
                    }
                } else {
                    error = true;
                }
                break;
                
            case 03: // EA - Erase to address
                NSLog(@"EA - Erase to address");
                int EArow = currentRow;
                int EAcol = currentcol;
                
                int toEARow = byteArray[currentIndex++];
                int toEACol = byteArray[currentIndex++] & 0xff;
                int EALength = byteArray[currentIndex++] & 0xff;
                while (--EALength > 0) {
                    
                    currentIndex++;
                    
                }
                char EAAttr = (char) 0;
                
                // a little intelligence here I hope
                if (EArow == 1 && EAcol == 2
                    && toEARow == 24
                    && toEACol == 80)
                    // clear screen
                    ;
                else {
                    int times = ((toEARow * 80) + toEACol)
                    - ((EArow * 80) + EAcol);
                    while (times-- >= 0) {
                        // set char to 2D array with Index
                    }
                }
                break;
            case 04: // Command - Escape
                NSLog(@"Command - Escape");
                //done = true;
                break;
                
            case 16: // TD - Transparent Data
                NSLog(@"TD - Transparent Data");
                int j = ((byteArray[currentIndex++] & 0xff) << 8) | (byteArray[currentIndex++] & 0xff); // length
                break;
                
            case 17: // SBA - set buffer address order (row column)
                NSLog(@"SBA - set buffer address order (row column)");
                int saRow = byteArray[currentIndex++];
                int saCol = byteArray[currentIndex++] & 0xff;
                // make sure it is in bounds
                if (saRow >= 0 && saRow <= 24 && saCol >= 0
                    && saCol <= 80) {
                    currentRow = saRow;
                    currentcol = saCol;
                    // now set screen
                    // position for output
                    
                } else {
                    
                    error = true;
                    
                }
                break;
                
            case 18: // WEA - Extended Attribute
                NSLog(@"WEA - Extended Attribute");
                currentIndex++;
                currentIndex++;
                break;
                
            case 19: // IC - Insert Cursor
                NSLog(@"IC - Insert Cursor");
                int icX = byteArray[currentIndex++];
                int icY = byteArray[currentIndex++] & 0xff;
                if (icX >= 0 && icX <= saRows && icY >= 0 && icY <= saCols) {
                    
                    NSLog(@" IC ");
                    //screen52.setPendingInsert(true, icX, icY);
                } else {
                    error = true;
                }
                
                break;
                
            case 20: // MC - Move Cursor
                NSLog(@"MC - Move Cursor");
                int imcX = byteArray[currentIndex++];
                int imcY = byteArray[currentIndex++] & 0xff;
                if (imcX >= 0 && imcX <= saRows && imcY >= 0
                    && imcY <= saCols) {
                    
                    //NSLog(@" MC " + imcX + " " + imcY);
                    //screen52.setPendingInsert(false, imcX, imcY);
                } else {
                    error = true;
                }
                
                break;
                
            case 21: // WTDSF - Write To Display Structured Field order
                NSLog(@"WTDSF - Write To Display Structured Field order");
                //byte[] seg = bk.getSegment();
                //error = sfParser.parseWriteToDisplayStructuredField(seg);
                
                //                  error = writeToDisplayStructuredField();
                break;
                
            case 29: // SF - Start of Field
                NSLog(@"SF - Start of Field");
                int fcw1 = 0;
                int fcw2 = 0;
                int ffw1 = 0;
                int ffw0 = byteArray[currentIndex++] & 0xff; // FFW
                
                if ((ffw0 & 0x40) == 0x40) {
                    ffw1 = byteArray[currentIndex++] & 0xff; // FFW 1
                    
                    fcw1 = byteArray[currentIndex++] & 0xff; // check for field
                    // control word
                    
                    // check if the first fcw1 is an 0x81 if it is then get
                    // the
                    // next pair for checking
                    if (fcw1 == 0x81) {
                        currentIndex++;
                        fcw1 = byteArray[currentIndex++] & 0xff; // check for field
                        // control word
                    }
                    
                    if (!([self isAttribute:fcw1])) {
                        
                        fcw2 = byteArray[currentIndex++] & 0xff; // FCW 2
                        attr = byteArray[currentIndex++] & 0xff; // attribute field
                        
                        while (!([self isAttribute:attr])) {
                            // log.info(Integer.toHexString(fcw1) + " "
                            //         + Integer.toHexString(fcw2)
                            //         + " ");
                            //log.info(Integer.toHexString(attr)
                            //        + " "
                            //+ Integer.toHexString(bk.getNextByte() & 0xff));
                            currentIndex++;
                            //                           byteArray[currentIndex++];
                            attr = byteArray[currentIndex++] & 0xff; // attribute
                            // field
                        }
                    } else {
                        attr = fcw1; // attribute of field
                        fcw1 = 0;
                    }
                } else {
                    attr = ffw0;
                }
                
                int fLength = ((byteArray[currentIndex++] & 0xff) << 8)
                | (byteArray[currentIndex++] & 0xff);
                //screen52.addField(attr, fLength, ffw0, ffw1, fcw1, fcw2);
                
                break;
                // WVL - LDC : 05/08/2005 : TFX.006253 - Support STRPCCMD
            case -128: //STRPCCMD
            {
                //          if (screen52.getCurrentPos() == 82) {
                NSLog(@"STRPCCMD got a -128 command at ");
                //StringBuffer value = new StringBuffer();
                /*
                 int b;
                 char c;
                 int[] pco = new int[9];
                 int[] pcoOk = {0xfc, 0xd7, 0xc3, 0xd6, 0x40, 0x83, 0x80, 0xa1, 0x80};
                 
                 for (int i = 0; i < 9; i++)
                 {
                 b = byteArray[currentIndex++];
                 pco[i] = ((b & 0xff));
                 c = codepage[b];
                 value.append(c);
                 }
                 
                 // Check "PCO-String"
                 if (Arrays.equals(pco, pcoOk)) {
                 strpccmd = true;
                 }
                 // we return in the stream to have all chars
                 // arrive at the screen for later processing
                 for (int i = 0; i < 9; i++)
                 bk.setPrevByte();
                 //}
                 // no break: so every chars arrives
                 // on the screen for later parsing
                 */
                //break;
                
            default: // all others must be output to screen
                printf("");//all others must be output to screen\n
                Byte byte0 = byteArray[--currentIndex];
                currentIndex++;
                
                if ([self isAttribute:byte0]) {
                    //screen52.setAttr(byte0);
                    // set attribute of chars.
                    lastAttribute = byte0;
                    
                } else {
                    //printf("%c",codepage[byte0]);
                    if ([TerminalResources sharedTerminalResources].totalRows==24) {
                        txtAttribute24[currentRow - 1][currentcol] = lastAttribute;
                        isValid24[currentRow - 1][currentcol] = YES;
                        screen24[currentRow - 1][currentcol++] = codepage[byte0];
                        

                    }
                    else{
                        txtAttribute27[currentRow - 1][currentcol] = lastAttribute;
                        isValid27[currentRow - 1][currentcol] = YES;
                        screen27[currentRow - 1][currentcol++] = codepage[byte0];
                        

                    }
                                        /*
                     screen[currentRow][currentcol++] = codepage[byte0];
                     //if (byte0 == 0) {
                     //    screen[currentRow][currentcol++] = byte0;
                     //}else
                     isValid[currentRow][currentcol] = YES;
                     */
                }
                
                break;
            }
                
                if (error)
                    done = true;
        }
    }
    if (!done) {
        //display parsed data from matrix on view
        //telnetView = [[TelnetView alloc]initWithArray:screen andValidArray:isValid andFrame:CGRectMake(0, 0, 480, 320)];
        // telnetView = [[TelnetView alloc]initWithFrame:CGRectMake(0, 0, 480, 320)];
        //  telnetView.frame = CGRectMake(0, 0, 480, 320);
        //telnetView.backgroundColor = [UIColor whiteColor];
        //[self.view addSubview: telnetView];
        
        if ([TerminalResources sharedTerminalResources].totalRows==24) {
           // [_telnetView initializeWithArray:screen24 isValidArray:isValid24 andAttributeAray:txtAttribute24];
            // [telnetView displayData];
            for (int rownumber = 0; rownumber < 24; rownumber++) {
                for (int columnNumber = 0; columnNumber < 80; columnNumber++) {
                    if (isValid24[rownumber][columnNumber]) {
                        //    printf("%c",screen[rownumber][columnNumber]);
                        [_telnetView initializeWithChar:screen24[rownumber][columnNumber] andAttribute:txtAttribute24[rownumber][columnNumber]];
                        [_telnetView setNeedsDisplayInRect:CGRectMake(columnNumber * 6 *2 , rownumber * 13 *2 , 6 *2, 13 *2)];
                    }
                    //else{
                    // printf(" ");
                    // }
                }
                //printf("\n");
            }
        }
        else{
            //[_telnetView initializeWithArray:screen27 isValidArray:isValid27 andAttributeAray:txtAttribute27];
            // [telnetView displayData];
            /*for (int rownumber = 0; rownumber < 24; rownumber++) {
                for (int columnNumber = 0; columnNumber < 80; columnNumber++) {
                    if (isValid24[rownumber][columnNumber]) {
                        //    printf("%c",screen[rownumber][columnNumber]);
                        [_telnetView initializeWithChar:screen24[rownumber][columnNumber] andAttribute:txtAttribute24[rownumber][columnNumber]];
                        [_telnetView setNeedsDisplayInRect:CGRectMake(columnNumber * 6 *2 , rownumber * 13 *2 , 6 *2, 13 *2)];
                    }
             */
                    //else{
                    // printf(" ");
                    // }
                //}
                //printf("\n");
           // }
        }
        
    }
    //[self.parseButton setHidden:YES];
}

-(BOOL)processSOH:(SignedByte *)byteArray{
    int l = byteArray[currentIndex++]; // length
    NSLog(@" byte 0 ");
    
    if (l > 0 && l <= 7) {
        currentIndex++; // flag byte 2
        currentIndex++; // reserved
        currentIndex++; // resequence fields
        
        //screen52.clearTable();
        
        // well that is the first time I have seen this. This fixes a
        // problem
        // with S/36 command line. Finally got it.
        if (l <= 3)
            return false;
        
        //screen52.setErrorLine(byteArray[currentIndex++]); // error row
        currentIndex++;
        
        int byte1 = 0;
        if (l >= 5) {
            byte1 = byteArray[currentIndex++];
            /*
             dataIncluded[23] = (byte1 & 0x80) == 0x80;
             dataIncluded[22] = (byte1 & 0x40) == 0x40;
             dataIncluded[21] = (byte1 & 0x20) == 0x20;
             dataIncluded[20] = (byte1 & 0x10) == 0x10;
             dataIncluded[19] = (byte1 & 0x8) == 0x8;
             dataIncluded[18] = (byte1 & 0x4) == 0x4;
             dataIncluded[17] = (byte1 & 0x2) == 0x2;
             dataIncluded[16] = (byte1 & 0x1) == 0x1;*/
            
        }
        
        if (l >= 6) {
            byte1 = byteArray[currentIndex++];
            /*
             dataIncluded[15] = (byte1 & 0x80) == 0x80;
             dataIncluded[14] = (byte1 & 0x40) == 0x40;
             dataIncluded[13] = (byte1 & 0x20) == 0x20;
             dataIncluded[12] = (byte1 & 0x10) == 0x10;
             dataIncluded[11] = (byte1 & 0x8) == 0x8;
             dataIncluded[10] = (byte1 & 0x4) == 0x4;
             dataIncluded[9] = (byte1 & 0x2) == 0x2;
             dataIncluded[8] = (byte1 & 0x1) == 0x1;*/
        }
        
        if (l >= 7) {
            byte1 = byteArray[currentIndex++];
            /*
             dataIncluded[7] = (byte1 & 0x80) == 0x80;
             dataIncluded[6] = (byte1 & 0x40) == 0x40;
             dataIncluded[5] = (byte1 & 0x20) == 0x20;
             dataIncluded[4] = (byte1 & 0x10) == 0x10;
             dataIncluded[3] = (byte1 & 0x8) == 0x8;
             dataIncluded[2] = (byte1 & 0x4) == 0x4;
             dataIncluded[1] = (byte1 & 0x2) == 0x2;
             dataIncluded[0] = (byte1 & 0x1) == 0x1;*/
        }
        return false;
    } else {
        return true;
    }
    
}

-(BOOL) isAttribute:(Byte) byteAttr{
    if (byteAttr >= 32 && byteAttr <64) {
        return YES;
    }else
        return  NO;
}

@end
