//
//  DeleteAndMoveVC.m
//  SmartGladiatoLink
//
//  Created by Smriti Raina on 16/04/13.
//  Copyright (c) 2013 Smriti Raina. All rights reserved.
//

#import "DeleteAndMoveVC.h"

@interface DeleteAndMoveVC ()

@end

@implementation DeleteAndMoveVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.deleteAndmove_tableView setEditing:YES];
    [self.navigationItem setTitle:@"Delete and Move"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma  mark-TableView Delegate Methods

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
    hostlisttoDeleteArray = [hostDict valueForKey:@"Hosts"];
    NSDictionary *movedHost=[hostlisttoDeleteArray objectAtIndex:sourceIndexPath.row];
    [hostlisttoDeleteArray removeObjectAtIndex:sourceIndexPath.row];
    [hostlisttoDeleteArray insertObject:movedHost atIndex:destinationIndexPath.row];
    [hostDict setObject:hostlisttoDeleteArray forKey:@"Hosts"];
    [hostDict writeToFile:path atomically:YES];
    
}

 
- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    documentDirPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) lastObject];
    path = [documentDirPath stringByAppendingPathComponent:@"ServerConnect.plist"];
    hostDict =[NSMutableDictionary dictionaryWithContentsOfFile:path];
    
    hostlisttoDeleteArray = [hostDict valueForKey:@"Hosts"];
    return hostlisttoDeleteArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier=@"hostDelete";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSDictionary *dictn=[hostlisttoDeleteArray objectAtIndex:indexPath.row];
    cell.textLabel.text=[dictn valueForKey:@"ipAddress"];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        
        [tableView beginUpdates];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        [hostlisttoDeleteArray removeObjectAtIndex:indexPath.row];
        [hostDict setObject:hostlisttoDeleteArray forKey:@"Hosts"];
        
        [hostDict writeToFile:path atomically:YES];
        [tableView reloadData];
        [tableView endUpdates];
        
    }
}
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    
    return toInterfaceOrientation!=UIInterfaceOrientationPortraitUpsideDown;
}

@end
