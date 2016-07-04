//
//  CustomCell.m
//  MeiTuanTest
//
//  Created by chenYangWang on 16/4/6.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_bigImgView release];
    [_titleLab release];
    [_tuanImgView release];
    [_cheapLab release];
    [_priceLab release];
    [_kindLab release];
    [_distanceLab release];
    [super dealloc];
}
@end
