//
//  ViewController.m
//  DN
//
//  Created by Hery Ratsimihah on 4/7/14.
//  Copyright (c) 2014 Hery Ratsimihah. All rights reserved.
//

#import "ViewController.h"
#import "DNCell.h"
#import <TTTAttributedLabel.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.contentOffset = CGPointMake(0, 0);
    // Hard-coded data source to prototype the layout
    titles = @[@"Comic Sans, meet Comic Neue",
               @"Post your ASCII Portrait",
               @"Show DN: Timely - THe Time Tracking App To End Time Tracking",
               @"Silicon Valley Season 1: Episode 1 Full Episode",
               @"The State of Car UI"];
    numberOfPoints = @[@90, @31, @29, @17, @10];
    numberOfComments = @[@20, @54, @20, @13, @10];
    
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [titles count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DNCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DNCell" forIndexPath:indexPath];
    CGRect newFrameForTitleButton = cell.titleButton.frame;
    newFrameForTitleButton.size.width = 200;
    cell.titleButton.frame = newFrameForTitleButton;
    cell.titleButton.titleLabel.text = titles[indexPath.row];
    NSString *subtitleString = [NSString stringWithFormat:@"%i points and %i comments", (int)numberOfPoints[indexPath.row], (int)numberOfComments[indexPath.row]];
    cell.subtitleLabel.text = subtitleString;
    NSRange commentsRange = [cell.subtitleLabel.text rangeOfString:[NSString stringWithFormat:@"%i comments", (int)numberOfComments[indexPath.row]]];
    [cell.subtitleLabel addLinkToURL:[NSURL URLWithString:@"http://domain.com"] withRange:commentsRange];
    cell.subtitleLabel.textColor = [UIColor darkGrayColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 86;
}

@end
