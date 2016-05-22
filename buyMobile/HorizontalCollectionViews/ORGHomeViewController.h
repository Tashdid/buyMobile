//
//  ORGHomeViewController.h
//  
//
//  Created by Tashdid Jonayed on 5/10/16.
//
//

#import <UIKit/UIKit.h>

@class ORGDetailViewController;

@interface ORGHomeViewController : UIViewController<UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) ORGDetailViewController *detailViewController;


@end
