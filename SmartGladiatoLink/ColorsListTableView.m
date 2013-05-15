//
//  ColorsListTableView.m
//  SmartGladiatoLink
//
//  Created by Smriti Raina on 16/04/13.
//  Copyright (c) 2013 Smriti Raina. All rights reserved.
//

#import "ColorsListTableView.h"

@interface ColorsListTableView ()

@end

@implementation ColorsListTableView

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
    
    colorNameArray=[[NSArray alloc] initWithObjects:
                    @"Background",
                    @"Cursor",
                    @"Red",
                    @"Blue",
                    @"Green",
                    @"Turquoise",
                    @"White",
                    @"Yellow",
                    @"Pink",
                    @"Select", nil];
    
    colorArray=[[NSMutableArray alloc]init];
    UIColor *red=[UIColor redColor];
    UIColor *blue=[UIColor blueColor];
    UIColor *green=[UIColor greenColor];
    UIColor *yellow=[UIColor yellowColor];
    UIColor *select=[UIColor orangeColor];
    
    UIColor *black=[UIColor
                    colorWithRed:0.0/255.0
                    green:0.0/255.0
                    blue:0.0/255.0
                    alpha:1.0];
    
    UIColor *gray=[UIColor
                   colorWithRed:127.5/255.0
                   green:127.5/255.0
                   blue:127.5/255.0
                   alpha:1.0];
    
    UIColor *turquoise=[UIColor
                        colorWithRed:0.0/255.0
                        green:255.0/255.0
                        blue:255.0/255.0
                        alpha:1.0];
    
    UIColor *white=[UIColor
                    colorWithRed:255.0/255.0
                    green:255.0/255.0
                    blue:255.0/255.0
                    alpha:1.0];
    
    UIColor *pink=[UIColor
                   colorWithRed:255.0
                   green:0
                   blue:255.0
                   alpha:1.0];
    
    colorArray1=[NSArray arrayWithObjects:black,gray,red,blue,green,turquoise,white,yellow,pink,select,nil];
    
     NSString *path=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
     NSString *filepath=[path stringByAppendingPathComponent:@"SavedColors.plist"];
    
     NSMutableDictionary *colorDict=[NSDictionary dictionaryWithContentsOfFile:filepath];
    
     if(colorDict==nil){
        colorDict = [[NSMutableDictionary alloc] init];
        colorArrayFromPlist=[colorDict valueForKey:@"rows"];
        
         if (colorArrayFromPlist==nil) {
            colorArrayFromPlist = [[NSMutableArray alloc] init];
         }
         for (UIColor *color in colorArray1){
            [colorArrayFromPlist addObject:[self makeStringFromColor:color]];
         }
         
         [colorDict setObject:colorArrayFromPlist forKey:@"rows"];
         [colorDict writeToFile:filepath atomically:YES];
    }

}

-(void)viewDidAppear:(BOOL)animated{
    
     NSString *documentDirPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) lastObject];
     NSString *path = [documentDirPath stringByAppendingPathComponent:@"SavedColors.plist"];
     NSDictionary *hostDict = [NSDictionary dictionaryWithContentsOfFile:path];
     if (colorArray == nil) {
        colorArray = [[NSMutableArray alloc] init];
     }
    
       [colorArray removeAllObjects];
    
        colorArrayFromPlist = [hostDict valueForKey:@"rows"];
    for(NSMutableString *str in colorArrayFromPlist) {
        [colorArray addObject:[self makeColorFromString:str]];
    }
    
    [self.color_tv reloadData];
    
}


-(UIColor *)makeColorFromString:(NSString *)coloredString {
    
    NSArray *componentArray=[coloredString componentsSeparatedByString:@","];
    CGFloat r=[[componentArray objectAtIndex:0]floatValue];
    CGFloat g=[[componentArray objectAtIndex:1]floatValue];
    CGFloat b=[[componentArray objectAtIndex:2]floatValue];
    CGFloat alfa=[[componentArray objectAtIndex:3]floatValue];
    UIColor *makecolor=[UIColor colorWithRed:r green:g blue:b alpha:alfa];
    return makecolor;
}


-(NSString *)makeStringFromColor:(UIColor *)coloR{
    const CGFloat *components = CGColorGetComponents(coloR.CGColor);
    NSString *colorAsString = [NSString stringWithFormat:@"%f,%f,%f,%f", components[0], components[1], components[2], components[3]];
    return colorAsString;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
 
 #pragma mark- segue
 
 -(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
 
     ColorCombinationClass *colorObj=segue.destinationViewController;
 
     indexP_colorlist_tv=[self.color_tv indexPathForSelectedRow];
      colorObj.indexP_colorcomb=indexP_colorlist_tv;
 
 }
 

#pragma  mark-TableView Delegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [colorArray count];
    
}

-(void)configureCell:(ColorCustomCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    
    cell.colorLabel.text=[colorNameArray objectAtIndex:indexPath.row];
    cell.colorImageView.backgroundColor=[colorArray objectAtIndex:indexPath.row];
    
}

- (ColorCustomCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellidentifier=@"colorCell";
    
    ColorCustomCell *cell=[tableView dequeueReusableCellWithIdentifier:cellidentifier];
    
    if (cell==nil) {
        cell=[[ColorCustomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
    }
    
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
    
}


 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
     [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
 } 

- (IBAction)resetColorsPressed:(UIBarButtonItem *)sender {
    
    NSString *path=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]; 
    NSString *filepath=[path stringByAppendingPathComponent:@"SavedColors.plist"];
    NSMutableDictionary *colorDictn=[NSDictionary dictionaryWithContentsOfFile:filepath];
    NSMutableArray *colorArrayFromPlist1=[colorDictn valueForKey:@"rows"];
    [colorArrayFromPlist1 removeAllObjects];
    
    for (UIColor *color in colorArray1) {
        
        [colorArrayFromPlist1 addObject:[self makeStringFromColor:color]];
    }
    
    //[colorArrayFromPlist1 addObjectsFromArray:[NSArray arrayWithObjects:@"0.000000,0.000000,0.000000,1.000000",@"127.500000,128.000000,128.000000,1.000000",@"255.000000,0.000000,0.000000,1.000000",@"0.000000,0.000000,255.000000,1.000000",@"0.000000,255.000000,0.000000,1.000000",@"0.000000,255.000000,255.000000,1.000000",@"255.000000,255.000000,255.000000,1.000000",@"255.000000,255.000000,0.000000,1.000000",@"255.000000,0.000000,255.000000,1.000000",@"255.000000,140.000000,0.000000,1.000000", nil]];
    
    [colorDictn setObject:colorArrayFromPlist1 forKey:@"rows"];
   BOOL ret = [colorDictn writeToFile:filepath atomically:YES];
    ret?NSLog(@"Reset"):NSLog(@"Not Reset");
    [colorArray removeAllObjects];
    [colorArray addObjectsFromArray:colorArray1];
    
    [self.color_tv reloadData];
    
}


-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    
    return toInterfaceOrientation!=UIInterfaceOrientationPortraitUpsideDown;
}
@end
