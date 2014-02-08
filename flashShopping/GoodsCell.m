//
//  GoodsCell.m
//  flashShopping
//
//  Created by Width on 14-1-20.
//  Copyright (c) 2014年 chinawidth. All rights reserved.
/*
@property ( nonatomic , retain )UIImageView         *goodsImgView;                      //商品图片
@property ( nonatomic , retain )UILabel                   *sellStatusLabel;                      //出售状态
@property ( nonatomic , retain )UILabel                   *directionsLabel;                     //商品描述
@property ( nonatomic , retain ) UILabel                   *priceLabel;                             //价格（字体）
@property ( nonatomic , retain ) UILabel                   *priceMoneyLabel;                  //价格
@property ( nonatomic , retain ) UILabel                   *numLabel;                               //库存 （字体）
@property ( nonatomic , retain ) UILabel                   *numNumberabel;                   //库存
*/

#import "GoodsCell.h"

@implementation GoodsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self _initSunView];
       
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)_initSunView
{
   
    _goodsModel = [[GoodsManamentModel alloc]init];
    //图片
    _goodsImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
    [self.contentView addSubview:_goodsImgView];
     //出售中
    _sellStatusLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    [self.contentView addSubview:_sellStatusLabel];
    //商品描述
    _directionsLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    [self.contentView addSubview:_directionsLabel];
     //价格（字体）
    _priceLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    [self.contentView addSubview:_priceLabel];
    //价格
    _priceMoneyLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    [self.contentView addSubview:_priceMoneyLabel];
     //库存
    _numLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    [self.contentView addSubview:_numLabel];
     //库存数量
    _numNumberabel = [[UILabel alloc]initWithFrame:CGRectZero];
    [self.contentView addSubview:_numNumberabel];
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //图片
    [_goodsImgView setFrame:CGRectMake(10, 10, 80, 60)];
    _goodsImgView.image = [UIImage imageNamed:_goodsModel.viewUrl];
    
    //出售中
    [_sellStatusLabel setFrame:CGRectMake(_goodsImgView.right, _goodsImgView.top, 0, 0)];
    _sellStatusLabel.textColor = [UIColor redColor];
    _sellStatusLabel.backgroundColor = [UIColor clearColor];
    _sellStatusLabel.text = @"[出售中]";
    [_sellStatusLabel sizeToFit];
    
    //商品描述
    CGSize size = [_goodsModel.directions sizeWithFont:[UIFont systemFontOfSize:16.0f] constrainedToSize:CGSizeMake( _sellStatusLabel.right , 300) lineBreakMode:NSLineBreakByCharWrapping];
    [_directionsLabel setFrame:CGRectMake(_sellStatusLabel.right,  _sellStatusLabel.top,  _sellStatusLabel.right+10 , size.height)];
    _directionsLabel.numberOfLines = 0 ;
    _directionsLabel.backgroundColor = [UIColor clearColor];
    _directionsLabel.text = _goodsModel.directions;
    
    //价格（字体）
    [_priceLabel setFrame:CGRectMake(_goodsImgView.right ,  _directionsLabel.bottom ,  0, 0)];
    _priceLabel.text = @"价格：";
    _priceLabel.backgroundColor = [UIColor clearColor];
    [_priceLabel sizeToFit];
    
    //价格
    [_priceMoneyLabel setFrame:CGRectMake(_priceLabel.right, _directionsLabel.bottom, 0, 0)];
    _priceMoneyLabel.text = [NSString stringWithFormat:@"%0.2f",_goodsModel.price];
    _priceMoneyLabel.textColor = [UIColor redColor];
    _priceMoneyLabel.backgroundColor = [UIColor clearColor];
    [_priceMoneyLabel sizeToFit];
    
    //库存
    [_numLabel setFrame:CGRectMake(_priceLabel.left, _priceLabel.bottom, 0, 0)];
    _numLabel.text = @"库存：";
    _numLabel.backgroundColor = [UIColor clearColor];
    [_numLabel sizeToFit];
    
    //库存数量
    [_numNumberabel setFrame:CGRectMake(_numLabel.right, _priceLabel.bottom, 0, 0)];
    _numNumberabel.text = [NSString stringWithFormat:@"%d",_goodsModel.num] ;
    _numNumberabel.backgroundColor = [UIColor clearColor];
    [_numNumberabel sizeToFit];
    
    
}
@end
