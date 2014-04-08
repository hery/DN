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

    titles = @[@"Comic Sans, meet Comic Neue",
               @"Post your ASCII Portrait",
               @"Show DN: Timely - The Time Tracking App To End Time Tracking",
               @"Silicon Valley Season 1: Episode 1 Full Episode",
               @"The State of Car UI"];
    numberOfPoints = @[@90, @31, @29, @17, @10];
    numberOfComments = @[@20, @54, @20, @13, @10];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:44/255.0f green:114/225.0f blue:217/225.0f alpha:1.0];
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:12/255.0f green:47/255.0f blue:100/255.0f alpha:1.0f];
//    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
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
    
    NSLog(@"==");
    
    cell.titleButton.titleLabel.text = titles[indexPath.row];
    NSLog(@"Button text: %@", cell.titleButton.titleLabel.text);
    
    NSString *subtitleString = [NSString stringWithFormat:@"%@ points and %@ comments", [numberOfPoints[indexPath.row] stringValue], [numberOfComments[indexPath.row] stringValue]];
    cell.subtitleLabel.text = subtitleString;
    
    NSString *targetString = [NSString stringWithFormat:@"%@ comments", [numberOfComments[indexPath.row] stringValue]];
    NSLog(@"Target string: %@", targetString);
    NSLog(@"Source string: %@", cell.subtitleLabel.text);
    
    NSRange commentsRange = [cell.subtitleLabel.text rangeOfString:targetString];
    NSLog(@"%li, %li", commentsRange.location, commentsRange.length);

    [cell.subtitleLabel addLinkToURL:[NSURL URLWithString:@"http://domain.com"] withRange:commentsRange];
    cell.subtitleLabel.textColor = [UIColor darkGrayColor];

    [cell.subtitleLabel setText:subtitleString afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        [mutableAttributedString addAttribute:NSForegroundColorAttributeName value:[UIColor darkGrayColor] range:commentsRange];
        [mutableAttributedString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:NSUnderlineStyleSingle] range:commentsRange];
        return mutableAttributedString;
    }];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 86;
}

@end
