//
//  LYLMenuView.h
//  BasicFramework
//
//  Created by Rainy on 16/10/10.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^didSelectRowAtIndexPath)(id cell, NSIndexPath *indexPath);

@interface LYLMenuView : UIView

@property (nonatomic, strong) NSArray *items;

+(instancetype)menuView;
-(void)didSelectRowAtIndexPath:(didSelectRowAtIndexPath)didSelectRowAtIndexPath;

@end
