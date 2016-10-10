//
//  LYLMenuView.m
//  BasicFramework
//
//  Created by Rainy on 16/10/10.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "LYLMenuView.h"
#import "LYLMenuCell.h"
@interface LYLMenuView ()<UITableViewDelegate,UITableViewDataSource>
{
    didSelectRowAtIndexPath _didSelectRowAtIndexPath;
}
@property (weak, nonatomic) IBOutlet UIImageView *headerImg;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end
@implementation LYLMenuView

+(instancetype)menuView
{
    LYLMenuView *result = nil;
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
    
    result = nibView[0];
    result.headerImg.image = [UIImage imageNamed:@"headerImg.jpg"];
    [APPSINGLE addBorderOnView:result.headerImg cornerRad:result.headerImg.Sw/2 lineCollor:[UIColor greenColor] lineWidth:1];
    [result.myTableView registerNib:[UINib nibWithNibName:@"LYLMenuCell" bundle:nil] forCellReuseIdentifier:@"LYLMenuCell"];
    result.myTableView.tableFooterView = [[UIView alloc]init];
    result.myTableView.separatorColor = [UIColor clearColor];
    
    return result;
}

-(void)didSelectRowAtIndexPath:(void (^)(id cell, NSIndexPath *indexPath))didSelectRowAtIndexPath{
    _didSelectRowAtIndexPath = [didSelectRowAtIndexPath copy];
}
-(void)setItems:(NSArray *)items{
    _items = items;
}


#pragma -mark tableView Delegates

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_items count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_didSelectRowAtIndexPath) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        _didSelectRowAtIndexPath(cell,indexPath);
    }
    [self.myTableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    LYLMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LYLMenuCell"];
    cell.lable.text = [self.items[indexPath.row] objectForKey:@"title"];
    cell.icon.image = [UIImage imageNamed:[self.items[indexPath.row] objectForKey:@"imagename"]];

    
    return cell;
}
- (IBAction)OutLoginAction:(id)sender {
    
    NSLog(@"退出登录");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
