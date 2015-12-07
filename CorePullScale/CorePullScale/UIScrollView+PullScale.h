//
//  UIScrollView+PullScale.h
//  CorePullScale
//
//  Created by 沐汐 on 15-2-23.
//  Copyright (c) 2015年 沐汐. All rights reserved.
//
//  scrollView:(TableView+CollectionView) 下拉图片放大
//
//  作品时间： 2015.02.23日 11:21
//  版权信息：本作品由华西都市网iOS开发攻城狮Charlin出品


#import <UIKit/UIKit.h>
#import "CorePullScaleImageView.h"



@interface UIScrollView (PullScale)

@property (strong, nonatomic) CorePullScaleImageView *imageV;


/**
 *  添加一个下拉放大的功能
 *
 *  @param vc                   所属控制器
 *  @param originalHeight       imageView的初始高度（关系到contentInset及contentOffset）
 */
-(void)addPullScaleFuncInVC:(UIViewController *)vc originalHeight:(CGFloat)originalHeight hasNavBar:(BOOL)hasNavBar;



@end
