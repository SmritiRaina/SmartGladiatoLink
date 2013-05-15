//
//  Configuration_Host.h
//  SmartGladiatoLink
//
//  Created by Smriti Raina on 16/04/13.
//  Copyright (c) 2013 Smriti Raina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Configuration_Host : UITableViewController<UITextFieldDelegate,UIAlertViewDelegate>
{
    NSArray *paths;
    NSString *docDirectory;
    NSString *path;
    NSMutableArray *hostIpAddressArray;
    NSMutableDictionary *root;
    NSMutableDictionary *serverData_dict;
    
    NSString *ipAdd;
    NSString *port;
    NSString *sslON;
    NSString *deviceName;
    NSString *nameforsession;
    NSString *userId;
    NSString *password;
    
    
    
   // NSString *wirelessKbON;
   // NSString *opticonScannerON;
    NSString *barcodeEnterON;
    NSString *barcodeNextON;
   // NSString *barcodeIgnFirstON;
    //NSString *barcodeIgnLastON;
    //NSString *startScannerON;
    //NSString *lineaScannerON;
    //NSString *keyClickON;
    NSString *closeSessionON;
    //NSString *autolockON;
    
    
    NSString *sendFieldExitOn;
    NSString *fieldExitonNextOn;
    NSString *barcodePreambleText;
    NSString *barcodePostambleText;
    
    
    
}

@property(nonatomic,strong)NSString *addServerIdentifyingStr;
@property(nonatomic,strong)NSString *checkConfigure_HostString;
@property(nonatomic,strong) NSMutableArray *hostIpAddressArray;

@property(nonatomic,strong)NSIndexPath *indexP_configurehost;

@property (strong, nonatomic) IBOutlet UIButton *customBtn_back;

- (IBAction)pressToBack:(UIButton *)sender;
 
@property (strong, nonatomic) IBOutlet UITableView *configuration_Host_tableview;
@property (strong, nonatomic) IBOutlet UITextField *ipAddress_textField;
@property (strong, nonatomic) IBOutlet UITextField *port_textField;

@property (strong, nonatomic) IBOutlet UISwitch *sslSwitch;
- (IBAction)sslSwitchPressed:(UISwitch *)sender;

@property (strong, nonatomic) IBOutlet UITextField *devicename_textField;
@property (strong, nonatomic) IBOutlet UITextField *name_TextField;
@property (strong, nonatomic) IBOutlet UITextField *userName_textField;
@property (strong, nonatomic) IBOutlet UITextField *passWord_textField;

/*removed fields
 @property (strong, nonatomic) IBOutlet UISwitch *wirelessKB_switch;
 - (IBAction)wirelessKB_switchPressed:(UISwitch *)sender;
 
 @property (strong, nonatomic) IBOutlet UISwitch *opticonScannerSwitch;
 - (IBAction)opticonScannerSwitchPressed:(UISwitch *)sender;

 @property (strong, nonatomic) IBOutlet UISwitch *barcodeIgnoreFirstSwitch;
 - (IBAction)barcodeIgnoreFirstSwitchPressed:(UISwitch *)sender;
 
 
 @property (strong, nonatomic) IBOutlet UISwitch *barcodeIgnoreLastSwitch;
 - (IBAction)barcodeIgnoreLastSwitchPressed:(UISwitch *)sender;
 
 @property (strong, nonatomic) IBOutlet UISwitch *startScannerSwitch;
 - (IBAction)startScannerSwitchPressed:(UISwitch *)sender;
 
 
 @property (strong, nonatomic) IBOutlet UISwitch *lineaScannerSwitch;
 - (IBAction)lineaScannerSwitchPressed:(UISwitch *)sender;

 
 @property (strong, nonatomic) IBOutlet UISwitch *keyClickSwitch;
 - (IBAction)keyClickSwitchPressed:(UISwitch *)sender;

 @property (strong, nonatomic) IBOutlet UISwitch *autoLockSwitch;
 - (IBAction)autoLockSwitchPressed:(UISwitch *)sender;
*/


@property (strong, nonatomic) IBOutlet UISwitch *barcodeEnterSwitch;
- (IBAction)barcodeEnterSwitchPressed:(UISwitch *)sender;


@property (strong, nonatomic) IBOutlet UISwitch *barcodeNextFieldSwitch;
- (IBAction)barcodeNextFieldSwitchPressed:(UISwitch *)sender;



@property (strong, nonatomic) IBOutlet UISwitch *closeSessionSwitch;
- (IBAction)closeSessionSwitchPressed:(UISwitch *)sender;


@property (strong, nonatomic) IBOutlet UISwitch *sendFieldExitSwitch;
- (IBAction)sendFieldExitPressed:(UISwitch *)sender;


@property (strong, nonatomic) IBOutlet UISwitch *fieldExitOnNextSwitch;

- (IBAction)fieldExitOnNextPressed:(UISwitch *)sender;

@property (strong, nonatomic) IBOutlet UITextField *barcodePreamble_textF;
@property (strong, nonatomic) IBOutlet UITextField *barcodePostamble_textF;

- (IBAction)helpButtonPressed:(UIBarButtonItem *)sender;


@end
