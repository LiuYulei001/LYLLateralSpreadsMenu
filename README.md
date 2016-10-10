# LYLLateralSpreadsMenu
封装的比较简单的类似抽屉的左侧菜单栏！

菜单栏列表的点击回调：
    
    LYLMenuView *menu = [LYLMenuView menuView];
    
    [menu didSelectRowAtIndexPath:^(id cell, NSIndexPath *indexPath) {
        NSLog(@"click %ld",indexPath.row);
        [_sideSlipView hide];;
    }];
    
    
设置菜单栏列表的cell：
    
    menu.items = @[@{@"title":@"相册",@"imagename":@"shoujihao"},@{@"title":@"资料",@"imagename":@"shoujihao"},@{@"title":@"任务",@"imagename":@"shoujihao"},@{@"title":@"其它",@"imagename":@"shoujihao"}];
    
添加菜单栏到抽屉视图：

    _sideSlipView = [[LYLLateralSpreadsMenu alloc]initWithController:self];

    [_sideSlipView setContentView:menu];
