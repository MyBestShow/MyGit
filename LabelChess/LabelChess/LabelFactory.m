//
//  LabelFactory.m
//  LabelChess
//
//  Created by qianfeng on 15/7/27.
//  Copyright (c) 2015年 汪岩. All rights reserved.
//

#import "LabelFactory.h"

@implementation LabelFactory
+(UILabel *)createLabelWithTitle:(NSString *)title frame:(CGRect)frame side:(UpOrDown)upOrDown
{
    //创建label，并且实例化
    UILabel *label=[[UILabel alloc]initWithFrame:frame];
    //设置label的title
    label.text=title;
    //设置文本居中
    label.textAlignment=NSTextAlignmentCenter;
    //如果是上边的棋子，就设置为红色
    if (upOrDown==upSide) {
        label.textColor=[UIColor redColor];
        
    }
    //如果是下边的棋子，就设置为绿色
    else if (upOrDown==downSide){
        label.textColor=[UIColor greenColor];
    }
    //testgithub
    //返回一个label，由于有alloc init 所以需要调用autorelease
    return [label autorelease];
}
@end
