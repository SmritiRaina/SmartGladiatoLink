//
//  DeleteAndMoveVC.h
//  SmartGladiatoLink
//
//  Created by Smriti Raina on 16/04/13.
//  Copyright (c) 2013 Smriti Raina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeleteAndMoveVC : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSString *documentDirPath;
    NSString *path;
    NSMutableDictionary *hostDict;
    NSMutableArray *hostlisttoDeleteArray;
    
}

@property (strong, nonatomic) IBOutlet UITableView *deleteAndmove_tableView;

@end
