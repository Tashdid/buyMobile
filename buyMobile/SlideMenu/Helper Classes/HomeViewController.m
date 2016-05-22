//
//  HomeViewController.m
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "HomeViewController.h"
#import "LeftMenuViewController.h"
#import "ORGDetailViewController.h"
#import "ORGContainerCell.h"
#import "ORGContainerCellView.h"

@implementation HomeViewController
@synthesize sampleData;
@synthesize table;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.sampleData = @[ @{ @"description": @"Section A",
                            @"articles": @[ @{ @"title": @"Article A1" },
                                            @{ @"title": @"Article A2" },
                                            @{ @"title": @"Article A3" },
                                            @{ @"title": @"Article A4" },
                                            @{ @"title": @"Article A5" }
                                            ]
                            },
                         @{ @"description": @"Section B",
                            @"articles": @[ @{ @"title": @"Article B1" },
                                            @{ @"title": @"Article B2" },
                                            @{ @"title": @"Article B3" },
                                            @{ @"title": @"Article B4" },
                                            @{ @"title": @"Article B5" }
                                            ]
                            },
                         @{ @"description": @"Section C",
                            @"articles": @[ @{ @"title": @"Article C1" },
                                            @{ @"title": @"Article C2" },
                                            @{ @"title": @"Article C3" },
                                            @{ @"title": @"Article C4" },
                                            @{ @"title": @"Article C5" }
                                            ]
                            },
                         @{ @"description": @"Section D",
                            @"articles": @[ @{ @"title": @"Article D1" },
                                            @{ @"title": @"Article D2" },
                                            @{ @"title": @"Article D3" },
                                            @{ @"title": @"Article D4" },
                                            @{ @"title": @"Article D5" }
                                            ]
                            },

                         ];
    // Register the table cell
    [table registerClass:[ORGContainerCell class] forCellReuseIdentifier:@"ORGContainerCell"];
    
    // Add observer that will allow the nested collection cell to trigger the view controller select row at index path
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didSelectItemFromCollectionView:) name:@"didSelectItemFromCollectionView" object:nil];
}

#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
	return YES;
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.sampleData count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ORGContainerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ORGContainerCell"];
    NSDictionary *cellData = [self.sampleData objectAtIndex:[indexPath section]];
    NSArray *articleData = [cellData objectForKey:@"articles"];
    [cell setCollectionData:articleData];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // This code is commented out in order to allow users to click on the collection view cells.
    //    if (!self.detailViewController) {
    //        self.detailViewController = [[ORGDetailViewController alloc] initWithNibName:@"ORGDetailViewController" bundle:nil];
    //    }
    //    NSDate *object = _objects[indexPath.row];
    //    self.detailViewController.detailItem = object;
    //    [self.navigationController pushViewController:self.detailViewController animated:YES];
}

#pragma mark UITableViewDelegate methods

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)] ;
    [headerView setBackgroundColor:[UIColor blackColor]];
    return headerView;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {

        UIButton *button = [[UIButton alloc]init];
        button.frame = CGRectMake(view.frame.size.width - 160.0, 0, 160.0, view.frame.size.height); // x,y,width,height
        [button setTitle:@"View All" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(sectionHeaderButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:button];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *header = @"Phones";
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180.0;
}

#pragma mark - NSNotification to select table cell

- (void) didSelectItemFromCollectionView:(NSNotification *)notification
{
    NSDictionary *cellData = [notification object];
    if (cellData)
    {
        if (!self.detailViewController)
        {
            self.detailViewController = [[ORGDetailViewController alloc] initWithNibName:@"ORGDetailViewController" bundle:nil];
        }
        self.detailViewController.detailItem = cellData;
        [self.navigationController pushViewController:self.detailViewController animated:YES];
    }
}

-(void) sectionHeaderButtonPressed
{
    NSLog(@"Button clicked !!");
}
@end
