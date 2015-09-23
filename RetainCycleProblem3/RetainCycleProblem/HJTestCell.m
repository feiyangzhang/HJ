//
//  HJTestCell.m
//  RetainCycleProblem
//
//  Created by Leon on 15/9/22.
//  Copyright (c) 2015年 Feiyang. All rights reserved.
//

#import "HJTestCell.h"

@implementation HJTestCell

- (void)awakeFromNib {
    // Initialization code
}

- (IBAction)touchMe:(id)sender {
    if (self.touchBlock) {
        self.touchBlock(self);
        self.touchBlock = nil;
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
