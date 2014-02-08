//
//  AllGoodsViewController.h
//  flashShopping
//
//  Created by Width on 14-1-16.
//  Copyright (c) 2014年 chinawidth. All rights reserved.
//

#import "BaseViewController.h"

@interface orderManagmentViewController : BaseViewController

@property (strong, nonatomic) IBOutlet UIView *searchView;

@property (unsafe_unretained, nonatomic) IBOutlet UITextField *textField;

@property (strong, nonatomic) IBOutlet UITableViewCell *customCell;

- (IBAction)searchButton:(id)sender;

@end
