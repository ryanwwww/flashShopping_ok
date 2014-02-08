//
//  GoodsManaMentViewController.h
//  flashShopping
//
//  Created by Width on 14-1-20.
//  Copyright (c) 2014年 chinawidth. All rights reserved.
//

#import "BaseViewController.h"

@interface GoodsManamentViewController : BaseViewController <UITableViewDataSource,UITableViewDelegate , UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIView *searchView;
@property (unsafe_unretained, nonatomic) IBOutlet UITextField *textField;

@end
