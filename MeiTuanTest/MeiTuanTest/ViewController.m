//
//  ViewController.m
//  MeiTuanTest
//
//  Created by chenYangWang on 16/4/6.
//  Copyright © 2016年 zhiyou. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_titleArray;
    NSArray *_priceArray;
    NSArray *_kindArray;
    NSArray *_distanceArray;
    NSArray *_gradeArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.整理数据
    _titleArray = [[NSArray alloc] initWithObjects:@"老家大锅台",@"和丰源滋补烩面",@"一品汤王",@"重庆八爷香辣鸡煲", nil];
    _priceArray = [[NSArray alloc]initWithObjects:@"¥69",@"¥8.9",@"¥69.8",@"¥35", nil];
    _kindArray = [[NSArray alloc] initWithObjects:@"特色菜 福田太阳城",@"小吃快餐 经开区",@"粤菜 经开区",@"川湘菜 管城回族区", nil];
    _distanceArray = [[NSArray alloc] initWithObjects:@"0.5km",@"0.9km",@"0.9km",@"1.4km", nil];
    _gradeArray = [[NSArray alloc] initWithObjects:@"3.4",@"4",@"2.6",@"1.5", nil];
    
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 100;
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil)
    {
        NSArray *cellArray = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:nil options:nil];
        cell = [cellArray objectAtIndex:0];
    }
    
    //1.大图片
    cell.bigImgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"image%d",indexPath.row+1]];
    
    //2.标题
    cell.titleLab.text = [_titleArray objectAtIndex:indexPath.row];
    
    //3.重置 "团"图片的位置
    CGSize size = [cell.titleLab.text sizeWithFont:[UIFont systemFontOfSize:17]];
    CGRect rect = cell.tuanImgView.frame;
    rect.origin.x = cell.titleLab.frame.origin.x + size.width + 5;
    cell.tuanImgView.frame = rect;
    
    //4.重置 价格lab 的frame以及text
    NSString *price = [_priceArray objectAtIndex:indexPath.row];
    CGSize priceSize = [price sizeWithFont:[UIFont systemFontOfSize:16]];
    cell.priceLab.frame = CGRectMake(294-priceSize.width, 40, priceSize.width, priceSize.height);
    cell.priceLab.text = price;
    
    //5.重置优惠价的 frame
    CGRect cheapRect = cell.cheapLab.frame;
    cheapRect.origin.x = cell.priceLab.frame.origin.x - 50 - 10;
    cell.cheapLab.frame = cheapRect;
    
    //6.设置 种类和位置lab 的text属性
    cell.kindLab.text = [_kindArray objectAtIndex:indexPath.row];
    
    //7.设置 距离lab 的text属性
    cell.distanceLab.text = [_distanceArray objectAtIndex:indexPath.row];
    
    
    //8.设置星星图片
    
    float grade = [[_gradeArray objectAtIndex:indexPath.row] floatValue];
    
    for (int i = 1; i < 6; i++)
    {
        UIImageView *starImageView = [cell.contentView viewWithTag:i];
        if (i <= grade)
        {
            starImageView.image = [UIImage imageNamed:@"star_full"];
        }
        else if (i > grade && i - 1 < grade)
        {
            starImageView.image = [UIImage imageNamed:@"star_half"];
        }
        else
        {
            starImageView.image = [UIImage imageNamed:@"star_empty"];
        }
        
    }
        
    return cell;
}



@end
