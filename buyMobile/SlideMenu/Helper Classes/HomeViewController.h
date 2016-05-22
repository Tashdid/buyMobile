//
//  HomeViewController.h
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"

@class ORGDetailViewController;

@interface HomeViewController : UIViewController <SlideNavigationControllerDelegate,UITableViewDataSource,UITableViewDelegate>
{
    
}
@property(nonatomic,strong) IBOutlet UITableView *table;
@property (strong, nonatomic) ORGDetailViewController *detailViewController;
@property (strong, nonatomic) NSArray *sampleData;





@end
