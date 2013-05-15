//
//  Configuration_Host.m
//  SmartGladiatoLink
//
//  Created by Smriti Raina on 16/04/13.
//  Copyright (c) 2013 Smriti Raina. All rights reserved.
//

#import "Configuration_Host.h"

@interface Configuration_Host ()
@end

@implementation Configuration_Host

//@synthesize hostIpAddressArray=_hostIpAddressArray;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    //NSLog(@"%@",self.checkConfigure_HostString);
    
    paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    docDirectory=[paths objectAtIndex:0];
    path = [docDirectory stringByAppendingPathComponent:@"ServerConnect.plist"];
    
    //switches default states
    [self.sslSwitch setOn:YES];
    sslON=@"Yes";
       
    [self.barcodeEnterSwitch setOn:YES];
    barcodeEnterON=@"Yes";
    [self.barcodeNextFieldSwitch setOn:YES];
    barcodeNextON=@"Yes";
    
    [self.closeSessionSwitch setOn:YES];
    closeSessionON=@"Yes";
    
    [self.sendFieldExitSwitch setOn:NO];
    sendFieldExitOn=@"No";
    
    [self.fieldExitOnNextSwitch setOn:YES];
    fieldExitonNextOn=@"Yes";
    
        /*removed ones
     [self.wirelessKB_switch setOn:NO];
     wirelessKbON=@"No";
     [self.opticonScannerSwitch setOn:YES];
     opticonScannerON=@"Yes";
     [self.barcodeIgnoreFirstSwitch setOn:NO];
     barcodeIgnFirstON=@"No";
     [self.barcodeIgnoreLastSwitch setOn:NO];
     barcodeIgnLastON=@"No";
     [self.startScannerSwitch setOn:YES];
     startScannerON=@"Yes";
     [self.lineaScannerSwitch setOn:NO];
     lineaScannerON=@"No";
     [self.keyClickSwitch setOn:YES];
     keyClickON=@"Yes";
     [self.autoLockSwitch setOn:YES];
      autolockON=@"Yes";

    */
    
    if (![self.addServerIdentifyingStr isEqualToString:@"AddNewHostString"]) {
        
        NSString *documentDirPath1=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) lastObject];
        NSString *path1 = [documentDirPath1 stringByAppendingPathComponent:@"ServerConnect.plist"];
        
        NSDictionary *hostDict1 = [NSDictionary dictionaryWithContentsOfFile:path1];
        NSMutableArray *hostDataArray1=[hostDict1 objectForKey:@"Hosts"];
        NSMutableDictionary *hostDataDictionary1=[hostDataArray1 objectAtIndex:self.indexP_configurehost.row];
        
        self.ipAddress_textField.text=[hostDataDictionary1 valueForKey:@"ipAddress"];
        self.port_textField.text=[hostDataDictionary1 valueForKey:@"port"];
        self.devicename_textField.text=[hostDataDictionary1 valueForKey:@"deviceName"];
        self.name_TextField.text=[hostDataDictionary1 valueForKey:@"nameforsession"];
        self.userName_textField.text=[hostDataDictionary1 valueForKey:@"userId"];
        self.passWord_textField.text=[hostDataDictionary1 valueForKey:@"password"];
        
        //added textfields
        self.barcodePostamble_textF.text=[hostDataDictionary1 valueForKey:@"postambleText"];
        self.barcodePreamble_textF.text=[hostDataDictionary1 valueForKey:@"preambleText"];
        
        sslON=[hostDataDictionary1 valueForKey:@"SSL"];
        if ([sslON isEqualToString:@"Yes"]) {
            [self.sslSwitch setOn:YES];
        }
        else [self.sslSwitch setOn:NO];
        
        
        
        barcodeEnterON=[hostDataDictionary1 valueForKey:@"barcodeEnterON"];
        if ([barcodeEnterON isEqualToString:@"Yes"]) {
            [self.barcodeEnterSwitch setOn:YES];
        }
        else [self.barcodeEnterSwitch setOn:NO];
        
        /*
         autolockON=[hostDataDictionary1 valueForKey:@"autolockON"];
         if ([autolockON isEqualToString:@"Yes"]) {
         [self.autoLockSwitch setOn:YES];
         }
         else [self.autoLockSwitch setOn:NO];
         
         barcodeIgnFirstON=[hostDataDictionary1 valueForKey:@"barcodeIgnFirstON"];
         if ([barcodeIgnFirstON isEqualToString:@"Yes"]) {
         [self.barcodeIgnoreFirstSwitch setOn:YES];
         }
         else [self.barcodeIgnoreFirstSwitch setOn:NO];
         
         barcodeIgnLastON=[hostDataDictionary1 valueForKey:@"barcodeIgnLastON"];
         if ([barcodeIgnLastON isEqualToString:@"Yes"]) {
         [self.barcodeIgnoreLastSwitch setOn:YES];
         }
         else [self.barcodeIgnoreLastSwitch setOn:NO];
         
         keyClickON=[hostDataDictionary1 valueForKey:@"keyClickON"];
         if ([keyClickON isEqualToString:@"Yes"]) {
         [self.keyClickSwitch setOn:YES];
         }
         else [self.keyClickSwitch setOn:NO];
         
         lineaScannerON=[hostDataDictionary1 valueForKey:@"lineaScannerON"];
         if ([lineaScannerON isEqualToString:@"Yes"]) {
         [self.lineaScannerSwitch setOn:YES];
         }
         else [self.lineaScannerSwitch setOn:NO];
         
         opticonScannerON=[hostDataDictionary1 valueForKey:@"opticonScannerON"];
         if ([opticonScannerON isEqualToString:@"Yes"]) {
         [self.opticonScannerSwitch setOn:YES];
         }
         else [self.opticonScannerSwitch setOn:NO];
         startScannerON=[hostDataDictionary1 valueForKey:@"startScannerON"];
         if ([startScannerON isEqualToString:@"Yes"]) {
         [self.startScannerSwitch setOn:YES];
         }
         else [self.startScannerSwitch setOn:NO];
         
         
         wirelessKbON=[hostDataDictionary1 valueForKey:@"wirelessKbON"];
         if ([wirelessKbON isEqualToString:@"Yes"]) {
         [self.wirelessKB_switch setOn:YES];
         }
         else [self.wirelessKB_switch setOn:NO];
         */
        
        
        barcodeNextON=[hostDataDictionary1 valueForKey:@"barcodeNextON"];
        if ([barcodeNextON isEqualToString:@"Yes"]) {
            [self.barcodeNextFieldSwitch setOn:YES];
        }
        else [self.barcodeNextFieldSwitch setOn:NO];
        
        
        
        closeSessionON=[hostDataDictionary1 valueForKey:@"closeSessionON"];
        if ([closeSessionON isEqualToString:@"Yes"]) {
            [self.closeSessionSwitch setOn:YES];
        }
        else [self.closeSessionSwitch setOn:NO];
        
        
        
        //added switches state
        sendFieldExitOn=[hostDataDictionary1 valueForKey:@"sendFieldExit"];
        if ([sendFieldExitOn isEqualToString:@"Yes"]) {
            [self.sendFieldExitSwitch setOn:YES];
        }
        else [self.sendFieldExitSwitch setOn:NO];

        fieldExitonNextOn=[hostDataDictionary1 valueForKey:@"fieldExitOnNext"];
        if ([fieldExitonNextOn isEqualToString:@"Yes"]) {
            [self.fieldExitOnNextSwitch setOn:YES];
        }
        else [self.fieldExitOnNextSwitch setOn:NO];
        
        

        
    }
    
    
    
    
    UIToolbar *toolbar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolbar.barStyle=UIBarStyleDefault;
    
    UIBarButtonItem *flexibleSpace=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *doneButton=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneClicked)];
    toolbar.items=[NSArray arrayWithObjects:flexibleSpace,doneButton,nil];
    
    self.ipAddress_textField.inputAccessoryView=toolbar;
    
    
    
    
    
         
}


-(void)doneClicked{
    [self.ipAddress_textField resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(BOOL)ipValidationUsingRegex:(NSString *)ipAddressStr
{
    NSString *ipValidStr = ipAddressStr;
    NSString *ipRegEx =
    @"^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.([01]?\\d\\d?|2[0-4]\\d|25[0-5])$";
    
    NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", ipRegEx];
    BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:ipValidStr];
    
    return myStringMatchesRegEx;
}


-(BOOL)checkMaxSixIPs:(NSString *)ipAddressStr{
    NSString *documentDirPath2=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) lastObject];
    NSString *path2 = [documentDirPath2 stringByAppendingPathComponent:@"ServerConnect.plist"];
   // NSMutableArray *savedIPaddressArray=[[NSMutableArray alloc]init];
    NSDictionary *hostDict2 = [NSDictionary dictionaryWithContentsOfFile:path2];
    NSMutableArray *hostDataArray2=[hostDict2 objectForKey:@"Hosts"];
    int i=0;
    for (NSDictionary *dictionary in hostDataArray2) {
        
        NSString *ipAddressValueStr=[dictionary valueForKey:@"ipAddress"];
         
        if ([ipAddressStr isEqualToString:ipAddressValueStr]) {
            i++;
            if (i==6) {
                return TRUE;
            }
        }
    
}
    
    return FALSE;
    
}

#pragma mark-TextField methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - UISwitch action
 
/*- (IBAction)wirelessKb_SwitchPressed:(UISwitch *)sender {
 if (sender.isOn) {
 [self.wirelessKB_switch setOn:YES animated:YES];
 wirelessKbON=@"Yes";
 }
 else{
 [self.wirelessKB_switch setOn:NO animated:YES];
 wirelessKbON=@"No";}}
 - (IBAction)autoLockSwitchPressed:(UISwitch *)sender {
 if (sender.isOn){
 [self.autoLockSwitch setOn:YES animated:YES];
 autolockON=@"Yes";
 }else{
 [self.autoLockSwitch setOn:NO animated:YES];
 autolockON=@"No";}}
 - (IBAction)keyClickSwitchPressed:(UISwitch *)sender {
 if (sender.isOn) {
 [self.keyClickSwitch setOn:YES animated:YES];
 keyClickON=@"Yes";
 }
 else{
 [self.keyClickSwitch setOn:NO animated:YES];
 keyClickON=@"No";}}
 - (IBAction)lineaScannerSwitchPressed:(UISwitch *)sender {
 if (sender.isOn) {
 [self.lineaScannerSwitch setOn:YES animated:YES];
 lineaScannerON=@"Yes";}
 else{
 [self.lineaScannerSwitch setOn:NO animated:YES];
 lineaScannerON=@"No";}}
 - (IBAction)startScannerSwitchPressed:(UISwitch *)sender {
 if (sender.isOn) {
 [self.startScannerSwitch setOn:YES animated:YES];
 startScannerON=@"Yes";
 }
 else
 {
 [self.startScannerSwitch setOn:NO animated:YES];
 startScannerON=@"No";
 }}
 - (IBAction)barcodeIgnoreLastSwitchPressed:(UISwitch *)sender {
 if (sender.isOn) {
 [self.barcodeIgnoreLastSwitch setOn:YES animated:YES];
 barcodeIgnLastON=@"Yes";}
 else{
 [self.barcodeIgnoreLastSwitch setOn:NO animated:YES];
 barcodeIgnLastON=@"No";}}
 - (IBAction)barcodeIgnoreFirstSwitchPressed:(UISwitch *)sender {
 if (sender.isOn) {
 [self.barcodeIgnoreFirstSwitch setOn:YES animated:YES];
 barcodeIgnFirstON=@"Yes";
 }else{
 [self.barcodeIgnoreFirstSwitch setOn:NO animated:YES];
 barcodeIgnFirstON=@"No";}}
 - (IBAction)opticonScannerSwitchPressed:(UISwitch *)sender {
 if (sender.isOn) {
 [self.opticonScannerSwitch setOn:YES animated:YES];
 opticonScannerON=@"Yes";
 }
 else{
 [self.opticonScannerSwitch setOn:NO animated:YES];
 opticonScannerON=@"No";
 }}- (IBAction)wirelessKB_switchPressed:(UISwitch *)sender {
 if (sender.isOn) {
 [self.wirelessKB_switch setOn:YES animated:YES];
 wirelessKbON=@"Yes";}
 else{
 [self.wirelessKB_switch setOn:NO animated:YES];
 wirelessKbON=@"No";}}
*/

- (IBAction)sendFieldExitPressed:(UISwitch *)sender {
    
    if (sender.isOn) {
        [self.sendFieldExitSwitch setOn:YES animated:YES];
        sendFieldExitOn=@"Yes";
        
    }
    else
    {
        [self.sendFieldExitSwitch setOn:NO animated:YES];
        sendFieldExitOn=@"No";
    }

    
}

- (IBAction)fieldExitOnNextPressed:(UISwitch *)sender {
    if (sender.isOn) {
        [self.fieldExitOnNextSwitch setOn:YES animated:YES];
        fieldExitonNextOn=@"Yes";
    }
    else
    {
        [self.fieldExitOnNextSwitch setOn:NO animated:YES];
        fieldExitonNextOn=@"No";
    }
}

- (IBAction)helpButtonPressed:(UIBarButtonItem *)sender {
    
}
- (IBAction)closeSessionSwitchPressed:(UISwitch *)sender{
    if (sender.isOn) {
        [self.closeSessionSwitch setOn:YES animated:YES];
        closeSessionON=@"Yes";
        
    }
    else
    {
        [self.closeSessionSwitch setOn:NO animated:YES];
        closeSessionON=@"No";
    }
}


- (IBAction)barcodeNextFieldSwitchPressed:(UISwitch *)sender {
    if (sender.isOn) {
        [self.barcodeNextFieldSwitch setOn:YES animated:YES];
        barcodeNextON=@"Yes";
    }
    else
    {
        [self.barcodeNextFieldSwitch setOn:NO animated:YES];
        barcodeNextON=@"No";
    }

}
- (IBAction)barcodeEnterSwitchPressed:(UISwitch *)sender {
    if (sender.isOn) {
        [self.barcodeEnterSwitch setOn:YES animated:YES];
        barcodeEnterON=@"Yes";
    }
    else{
        [self.barcodeEnterSwitch setOn:NO animated:YES];
        barcodeEnterON=@"No";
    }

}
- (IBAction)sslSwitchPressed:(UISwitch *)sender {
    if (sender.isOn) {
        [self.sslSwitch setOn:YES animated:YES];
         sslON=@"Yes";
    }
    else{
        [self.sslSwitch setOn:NO animated:YES];
         sslON=@"No";
    }
        


}
- (IBAction)pressToBack:(UIButton *)sender {

    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath: path])
    {
        path = [docDirectory stringByAppendingPathComponent:[NSString stringWithFormat: @"ServerConnect.plist"]];
    }
    
    
    
    
    if((self.ipAddress_textField.text.length==0||[self ipValidationUsingRegex:self.ipAddress_textField.text]==FALSE)&&self.port_textField.text.length==0){
        
        [self.navigationController popViewControllerAnimated:YES];
        }
    

    else if(self.ipAddress_textField.text.length!=0&&self.port_textField.text.length==0){
           [[[UIAlertView alloc]initWithTitle:@"" message:@"Empty Port" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        }
    
    else if (self.ipAddress_textField.text.length==0&&self.port_textField.text.length!=0){
        //[[[UIAlertView alloc]initWithTitle:@"" message:@"Please fill IP address." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        [[[UIAlertView alloc]initWithTitle:@"" message:@"Do you want to cancel this configuration?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil] show];
        
        
    }
    
    else if([self checkMaxSixIPs:self.ipAddress_textField.text]==TRUE&&![self.checkConfigure_HostString isEqualToString:@"inConfigureHostListView"]){
        
        [[[UIAlertView alloc]initWithTitle:@"" message:@"cannot save more than 6 IP addresses with same name." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
    
    else if([self ipValidationUsingRegex:self.ipAddress_textField.text]==TRUE){
        

        
        
        ipAdd=[NSString stringWithFormat:@"%@",self.ipAddress_textField.text];
        port=[NSString stringWithFormat:@"%@",self.port_textField.text];
        deviceName=[NSString stringWithFormat:@"%@",self.devicename_textField.text];
        nameforsession=[NSString stringWithFormat:@"%@",self.name_TextField.text];
        userId=[NSString stringWithFormat:@"%@",self.userName_textField.text];
        password=[NSString stringWithFormat:@"%@",self.passWord_textField.text];
        
        barcodePreambleText=[NSString stringWithFormat:@"%@",self.barcodePreamble_textF.text];
        barcodePostambleText=[NSString stringWithFormat:@"%@",self.barcodePostamble_textF.text];
        
        /*serverData_dict=[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:ipAdd,port,sslON,deviceName,nameforsession,userId,password,wirelessKbON,opticonScannerON,barcodeEnterON, barcodeNextON,barcodeIgnFirstON,barcodeIgnLastON,startScannerON,lineaScannerON,keyClickON,closeSessionON,autolockON,nil] forKeys:[NSArray arrayWithObjects:@"ipAddress",@"port",@"SSL",@"deviceName",@"nameforsession",@"userId",@"password",@"wirelessKbON",@"opticonScannerON",@"barcodeEnterON",@"barcodeNextON", @"barcodeIgnFirstON",@"barcodeIgnLastON",@"startScannerON",@"lineaScannerON",@"keyClickON",@"closeSessionON",@"autolockON",nil]];*/
        
        
        serverData_dict=[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:ipAdd,port,sslON,deviceName,nameforsession,userId,password,barcodeEnterON, barcodeNextON,closeSessionON,sendFieldExitOn,fieldExitonNextOn,barcodePreambleText,barcodePostambleText,nil] forKeys:[NSArray arrayWithObjects:@"ipAddress",@"port",@"SSL",@"deviceName",@"nameforsession",@"userId",@"password",@"barcodeEnterON",@"barcodeNextON",@"closeSessionON",@"sendFieldExit",@"fieldExitOnNext",@"preambleText",@"postambleText",nil]];
        
        paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
        docDirectory=[paths objectAtIndex:0];
        path = [docDirectory stringByAppendingPathComponent:@"ServerConnect.plist"];
      
        NSMutableDictionary *dict_host = [NSMutableDictionary dictionaryWithContentsOfFile:path];
      
        if (dict_host==nil) {
            dict_host=[[NSMutableDictionary alloc]init];
        }
        
        hostIpAddressArray = [dict_host objectForKey:@"Hosts"];
        
        if (hostIpAddressArray==nil) {
            hostIpAddressArray=[[NSMutableArray alloc]init];
        }
        
        if ([self.addServerIdentifyingStr isEqualToString:@"AddNewHostString"]) {
            [hostIpAddressArray addObject:serverData_dict];
        }
        
        else
            [hostIpAddressArray replaceObjectAtIndex:self.indexP_configurehost.row withObject:serverData_dict];
        
        [dict_host setObject:hostIpAddressArray forKey:@"Hosts"];
        [dict_host writeToFile:path atomically:YES];
      
        [self.navigationController popViewControllerAnimated:YES];        
    }
    
    
  else{
        [[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid IP Address!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil]show];
    }

}


-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}


- (void)viewDidUnload {
    [self setSendFieldExitSwitch:nil];
    [self setFieldExitOnNextSwitch:nil];
    [self setBarcodePreamble_textF:nil];
    [self setBarcodePostamble_textF:nil];
    [super viewDidUnload];
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    
    return toInterfaceOrientation!=UIInterfaceOrientationPortraitUpsideDown;
}

@end
