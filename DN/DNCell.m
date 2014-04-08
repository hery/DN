//
//  DNCell.m
//  DN
//
//  Created by Hery Ratsimihah on 4/7/14.
//  Copyright (c) 2014 Hery Ratsimihah. All rights reserved.
//

#import "DNCell.h"
#import <TTTAttributedLabel.h>

@implementation DNCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
