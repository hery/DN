//
//  ViewController.h
//  DN
//
//  Created by Hery Ratsimihah on 4/7/14.
//  Copyright (c) 2014 Hery Ratsimihah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    NSArray *titles;
    NSArray *numberOfPoints;
    NSArray *numberOfComments;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
