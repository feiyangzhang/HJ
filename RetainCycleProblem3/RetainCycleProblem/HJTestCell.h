//
//  HJTestCell.h
//  RetainCycleProblem
//
//  Created by Leon on 15/9/22.
//  Copyright (c) 2015年 Feiyang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HJTestCell;
typedef void(^TouchBlock) (HJTestCell *cell);

@interface HJTestCell : UITableViewCell

@property (nonatomic, copy) TouchBlock touchBlock;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end
