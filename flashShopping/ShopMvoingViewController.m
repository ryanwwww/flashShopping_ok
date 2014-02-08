//
//  ShopMvoingViewController.m
//  flashShopping
//
//  Created by Width on 14-1-2.
//  Copyright (c) 2014年 chinawidth. All rights reserved.
//

#import "ShopMvoingViewController.h"
#import "BaseTableView.h"
#import "BaseNavViewController.h"
#import "RequestNetwork.h"

@interface ShopMvoingViewController ()

@end

@implementation ShopMvoingViewController

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
    
   
    self.titleLabel.text = @"店铺动态";
    BaseTableView *testView = [[BaseTableView alloc]initWithFrame:CGRectMake(0, 0, 320, 460) style:UITableViewStylePlain];
    testView.isAddRefresh = YES ;
   
    //[self.view addSubview:testView];
   
    [NSThread detachNewThreadSelector:@selector(startLoadNet) toTarget:self withObject:nil]; //开启另一个线程来获取网络数据
        
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
#pragma mark---获取网络数据
- (void)startLoadNet
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getData:) name:@"getData" object:nil];
    NSString *postString =@"{\"companyId\":\"\",\"createDate\":\"\",\"descs\":\"\",\"goodsCode\":\"\",\"id\":\"\",\"limit\":10,\"marketPrice\":\"\",\"merchantCode\":\"\",\"name\":\"\",\"num\":\"\",\"page\":1,\"price\":\"\",\"productId\":\"\",\"sellCount\":\"\",\"state\":\"\"}";
    [[RequestNetwork shareManager] requestNetwork:postString];
}
#pragma mark---NSNotificationCenter
- (void)getData:(NSNotification*)note
{
    NSLog(@"%@",[note object]);
}
@end
