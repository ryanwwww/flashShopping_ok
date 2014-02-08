//
//  AllGoodsViewController.m
//  flashShopping
//
//  Created by Width on 14-1-16.
//  Copyright (c) 2014年 chinawidth. All rights reserved.
//

#import "orderManagmentViewController.h"
#import "TestData.h"
#import "OrderManagerDataModle.h"
#import "PublicTableView.h"

#import "CustomNavigationBar.h"

@interface orderManagmentViewController ()

@end

@implementation orderManagmentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self _initSubview];
    
 }
- (void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
- (void)_initSubview
{
    //添加下拉菜单（导航栏自定义）
  self.navigationController.navigationBar.hidden = YES;
  NSArray *titleArr = @[@"所有订单",@"待付款订单",@"待发货订单",@"已发货订单",@"退款中订单",@"已成功订单",@"已关闭订单"];
    CustomNavigationBar *navigationBar = [[CustomNavigationBar alloc]initWithFrame:CGRectMake(0, 0, SCREENMAIN_WIDTH, 44) andTitleArr:titleArr];
    [self.view addSubview:navigationBar];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(returnView) name:RETURN object:nil];

    //收索框
    //[orderTabelView setTableHeaderView:_searchView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}
- (void)returnView
{
    [self.navigationController popViewControllerAnimated:NO];
}
- (IBAction)searchButton:(id)sender {
}
@end
