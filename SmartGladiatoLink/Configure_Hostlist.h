//
//  Configure_Hostlist.h
//  SmartGladiatoLink
//
//  Created by Smriti Raina on 16/04/13.
//  Copyright (c) 2013 Smriti Raina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Configuration_Host.h"

@interface Configure_Hostlist : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *hostnameArray;
}

@property(nonatomic,strong)NSString *checkConfigureListString;
@property (strong, nonatomic) IBOutlet UITableView *hostlist_tableview;
@property(nonatomic,strong)NSIndexPath *indexP_hostlist;

@end
