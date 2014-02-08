//
//  ChatViewController.m
//  flashShopping
//
//  Created by Width on 14-1-2.
//  Copyright (c) 2014年 chinawidth. All rights reserved.
//

#import "ChatViewController.h"



@interface ChatViewController ()<UITableViewDataSource,UITableViewDelegate,NSURLConnectionDataDelegate>
{
    UITableView *testView ;
    NSMutableData *receiveData ;
}
@end

@implementation ChatViewController

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
    self.titleLabel.text = @"闪聊";

  
    
    testView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 400) style:UITableViewStylePlain];
    testView.dataSource = self ;
    testView.delegate = self ;
    [self.view addSubview:testView];
    [self post];
    
}
- (void)post
{
   // http://192.168.1.16:8080/Assistant/app
    NSString *postString =@"{\"companyId\":\"\",\"createDate\":\"\",\"descs\":\"\",\"goodsCode\":\"\",\"id\":\"\",\"limit\":10,\"marketPrice\":\"\",\"merchantCode\":\"\",\"name\":\"\",\"num\":\"\",\"page\":1,\"price\":\"\",\"productId\":\"\",\"sellCount\":\"\",\"state\":\"\"}";
    //NSString *postString =@"{\"actionCode\":\"441\",\"appType\":\"\",\"companyId\":\"\"}";
    
    NSURL *url = [NSURL URLWithString:
                  @"http://192.168.1.83:9000"];//http://192.168.1.83:9000
                  NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
                  NSString *msgLength = [NSString stringWithFormat:@"%d", [postString length]];
                  [req addValue:@"application/json"
             forHTTPHeaderField:@"Content-Type"];
                  [req addValue:msgLength forHTTPHeaderField:@"Content-Length"];
                  [req setHTTPMethod:@"POST"];
                  [req setHTTPBody: [postString dataUsingEncoding:NSUTF8StringEncoding]];
    
    
                NSURLConnection  *conn = [[NSURLConnection alloc] initWithRequest:req delegate:self];
                  if (conn) {    
                      receiveData = [NSMutableData new];
                  }
}
//接收到服务器回应的时候调用此方法
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
    NSLog(@"%@",[res allHeaderFields]);
    
    
}
//接收到服务器传输数据的时候调用，此方法根据数据大小执行若干次
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [receiveData appendData:data];
}
//数据传完之后调用此方法
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *receiveStr = [[NSString alloc]initWithData:receiveData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",receiveStr);
}
//网络请求过程中，出现任何错误（断网，连接超时等）会进入此方法
-(void)connection:(NSURLConnection *)connection
 didFailWithError:(NSError *)error
{
    NSLog(@"%@",[error localizedDescription]);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    CGRect frame = testView.frame ;
    frame.size.height = 10;
    testView.tableHeaderView = [[UIView alloc]initWithFrame:frame];
}
#pragma mark---UITableViewDataSource
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5 ;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.backgroundColor = [UIColor redColor];
    }
    return cell ;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
