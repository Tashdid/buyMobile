//
//  ORGHomeViewController.m
//  
//
//  Created by Tashdid Jonayed on 5/10/16.
//
//

#import "ORGHomeViewController.h"
#import "ORGDetailViewController.h"
#import "ORGContainerCell.h"
#import "ORGContainerCellView.h"

@interface ORGHomeViewController ()
@property (strong, nonatomic) NSArray *sampleData;
@end

@implementation ORGHomeViewController
@synthesize tableView;




- (void)viewDidLoad {
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
                         
                         ];
    
    // Register the table cell
    [self.tableView registerClass:[ORGContainerCell class] forCellReuseIdentifier:@"ORGContainerCell"];
    
    // Add observer that will allow the nested collection cell to trigger the view controller select row at index path
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didSelectItemFromCollectionView:) name:@"didSelectItemFromCollectionView" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSDictionary *sectionData = [self.sampleData objectAtIndex:section];
    NSString *header = [sectionData objectForKey:@"description"];
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.0;
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

@end
