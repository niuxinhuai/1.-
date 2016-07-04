//
//  CustomCell.h
//  MeiTuanTest
//
//  Created by chenYangWang on 16/4/6.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UIImageView *bigImgView;

@property (retain, nonatomic) IBOutlet UILabel *titleLab;
@property (retain, nonatomic) IBOutlet UIImageView *tuanImgView;
@property (retain, nonatomic) IBOutlet UILabel *cheapLab;

@property (retain, nonatomic) IBOutlet UILabel *priceLab;

@property (retain, nonatomic) IBOutlet UILabel *kindLab;

@property (retain, nonatomic) IBOutlet UILabel *distanceLab;


@end
