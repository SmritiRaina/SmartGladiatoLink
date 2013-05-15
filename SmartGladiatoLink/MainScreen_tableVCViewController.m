//
//  MainScreen_tableVCViewController.m
//  SmartGladiatoLink
//
//  Created by Smriti Raina on 15/04/13.
//  Copyright (c) 2013 Smriti Raina. All rights reserved.
//

#import "MainScreen_tableVCViewController.h"

@interface MainScreen_tableVCViewController ()

@end

@implementation MainScreen_tableVCViewController

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

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

/*- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 
 if(!([UIDevice wiFiConnected]||[UIDevice networkConnected]||[UIDevice cellularConnected])&&indexPath.row==0&&indexPath.section==0)
 {
 [[[UIAlertView alloc]initWithTitle:@"Error" message:@"There is no active network. Check Wi-Fi and phone settings." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
 
 return nil;
 }
 else
 return indexPath;
 return indexPath;
 
 }*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*if(!([UIDevice wiFiConnected]||[UIDevice networkConnected]||[UIDevice cellularConnected]))
     {
     [[[UIAlertView alloc]initWithTitle:@"Error" message:@"There is no active network.Check WiFi and phone settings." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
     }*/
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];//to fix black rectangle view hiding cell content area.
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    
    return toInterfaceOrientation==UIInterfaceOrientationPortrait||toInterfaceOrientation==UIInterfaceOrientationLandscapeRight||toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft;
}

@end
