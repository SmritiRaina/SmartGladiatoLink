//
//  ConnectTo_tableview.h
//  SmartGladiatoLink
//
//  Created by Smriti Raina on 15/04/13.
//  Copyright (c) 2013 Smriti Raina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddNewCustomCell.h"
#import "Configuration_Host.h"
#import "DeleteAndMoveVC.h"
#import "ConnectAS400.h"
#import "UIDevice+DeviceConnectivity.h"

@interface ConnectTo_tableview : UIViewController{
  
    NSArray *hosts_ListArray;
    NSString *hostNameStringForRow;
    BOOL showSwipetoDeleteIndicator;
}

@property (strong, nonatomic) IBOutlet UITableView *serverList_tableView;
@property(strong,nonatomic) NSMutableArray *serverlistArray;
@property(nonatomic,strong) NSString *addServerCellString;
@end
