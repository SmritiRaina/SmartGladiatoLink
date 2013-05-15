//
//  ColorsListTableView.h
//  SmartGladiatoLink
//
//  Created by Smriti Raina on 16/04/13.
//  Copyright (c) 2013 Smriti Raina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorCustomCell.h"
#import "ColorCombinationClass.h"

@interface ColorsListTableView : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *colorNameArray;
    NSMutableArray *colorArray;
    NSArray *colorArray1;
    NSIndexPath *indexP_colorlist_tv;
    NSMutableArray *colorArrayFromPlist;
}

@property (strong, nonatomic) IBOutlet UITableView *color_tv;

- (IBAction)resetColorsPressed:(UIBarButtonItem *)sender;

@end
