//
//  ORMoneyLabel.m
//  MyShop
//
//  Created by MacBook Air on 2018/4/24.
//  Copyright © 2018年 YH. All rights reserved.
//

#import "ORImage.h"

@implementation ORImage

+ (UIImage *)imageWithColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0, 0, 1.0f, 1.0f);
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 开启上下文
    CGContextRef ref = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(ref, color.CGColor);
    // 渲染上下文
    CGContextFillRect(ref, rect);
    // 从上下文中获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    return image;
}

@end
