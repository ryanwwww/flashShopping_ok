//
//  GoodsManaMentViewController.m
//  flashShopping
//
//  Created by Width on 14-1-20.
//  Copyright (c) 2014年 chinawidth. All rights reserved.
//

#import "GoodsManamentViewController.h"
#import "CustomNavigationBar.h"
#import "GoodsManamentModel.h"
#import "GoodsCell.h"
#import "GoodsDetailViewController.h"

@interface GoodsManamentViewController ()
{
    NSMutableArray *goodsItem ;
    UITableView *_tableView ;
    
}
@end

@implementation GoodsManamentViewController

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
    
    self.view.backgroundColor = [UIColor clearColor];
    
    //添加下拉菜单（导航栏自定义）
    NSArray *titleArr = @[@"所有商品",@"橱窗中商品",@"出售中商品",@"仓库中商品",@"已下架商品"];
    CustomNavigationBar *navigationBar = [[CustomNavigationBar alloc]initWithFrame:CGRectMake(0, 0, SCREENMAIN_WIDTH, 44) andTitleArr:titleArr];
    [self.view addSubview:navigationBar];
    [self.view bringSubviewToFront:navigationBar];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(returnView) name:RETURN object:nil];
    
    //加载数据
    [self goodsInfoData];
    
    //添加tableView
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 50, SCREENMAIN_WIDTH, SCREENMAIN_HEIGHT - _tableView.right) style:UITableViewStylePlain];
    _tableView.dataSource = self ;
    _tableView.delegate = self ;
    [self.view insertSubview:_tableView atIndex:0];
    
    //添加搜索框
    [_tableView setTableHeaderView:_searchView];
    _textField.delegate = self ;
    
    
}
- (void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationController.navigationBar.hidden = YES ;
}
//加载测试数据
- (void)goodsInfoData
{
    
    for (int i = 0; i < 10; i++) {
        
        GoodsManamentModel *goodsModel = [[GoodsManamentModel alloc]init];
        goodsModel.directions = @"羊毛短款加厚男士羽绒服男装外套正品修身休闲2013冬装最新款男";
        goodsModel.Id = [[NSString stringWithFormat:@"001222320%d",i]intValue];
        goodsModel.name = @"羊毛短款";
        goodsModel.goodsCode = [NSString stringWithFormat:@"58946556%d",i];
        if (i % 2== 0) {
            goodsModel.viewUrl = @"testImg1" ;
        }else{
            goodsModel.viewUrl = @"testImg2" ;
        }
        goodsModel.price = [[NSString stringWithFormat:@"45%d",i]floatValue];
        goodsModel.num = [[NSString stringWithFormat:@"999"]integerValue];
        if (goodsItem == nil) {
            goodsItem = [NSMutableArray new];
        }
        [goodsItem addObject:goodsModel];
    }
    
}
#pragma mark---customAction
- (void)returnView
{
    [self.navigationController popViewControllerAnimated:NO];
}

#pragma mark---UITableViewDataSource
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return goodsItem.count ;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellID = @"cellID";
    GoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[GoodsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleGray ;
    }
    GoodsManamentModel *goodsModel = goodsItem[indexPath.row];
    cell.goodsModel = goodsModel ;
    return cell ;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GoodsManamentModel *goodsModel = goodsItem[indexPath.row];
    CGSize size = [goodsModel.directions sizeWithFont:[UIFont systemFontOfSize:16.0f] constrainedToSize:CGSizeMake(200, 300) lineBreakMode:NSLineBreakByCharWrapping];
    
    return 80+size.height;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%d",indexPath.row);
    GoodsDetailViewController  *goodsDetail = [[ GoodsDetailViewController alloc ]init ];
    goodsDetail.goodsModel = goodsItem[indexPath.row];
    [ self.navigationController pushViewController:goodsDetail animated:YES];
}
#pragma mark---textFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES ;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
     [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
