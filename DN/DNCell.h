//
//  DNCell.h
//  DN
//
//  Created by Hery Ratsimihah on 4/7/14.
//  Copyright (c) 2014 Hery Ratsimihah. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TTTAttributedLabel;

@interface DNCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *titleButton;
@property (weak, nonatomic) IBOutlet TTTAttributedLabel *subtitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *upvoteButton;

@end
