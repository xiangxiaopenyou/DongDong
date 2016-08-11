//
//  GoodsStyleView.m
//  DongDong
//
//  Created by 项小盆友 on 16/7/22.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "GoodsStyleView.h"
#import <Masonry.h>
#import <GJCFUitils.h>

@interface GoodsStyleView()
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UIView *imageContainView;
@property (strong, nonatomic) UIImageView *goodsImageView;
@property (strong, nonatomic) UIScrollView *contentScrollView;
@property (strong, nonatomic) UIView *colorView;
@property (strong, nonatomic) UIView *sizeView;
@property (strong, nonatomic) UIButton *addToShoppingCartButton;
@property (strong, nonatomic) UIButton *buyNowButton;
@property (strong, nonatomic) UILabel *priceLabel;
@property (strong, nonatomic) UILabel *stockLabel;
@property (strong, nonatomic) UIButton *closeButton;
@property (copy, nonatomic) NSArray *arrayOfColor;
@property (copy, nonatomic) NSArray *arrayOfSize;

@end

@implementation GoodsStyleView
- (instancetype)initWithFrame:(CGRect)frame color:(NSArray *)colorArray size:(NSArray *)sizeArray {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
        _arrayOfColor = [colorArray copy];
        _arrayOfSize = [sizeArray copy];
        [self setupContentView:colorArray size:sizeArray];
    }
    return self;
}
- (void)setupContentView:(NSArray *)colorArray size:(NSArray *)sizeArray {
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 0.7 * SCREEN_HEIGHT)];
    _contentView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_contentView];
    
    [_contentView addSubview:self.imageContainView];
    
    [self.imageContainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_contentView.mas_top).with.offset(- 30);
        make.left.equalTo(_contentView.mas_left).with.offset(10);
        make.height.mas_offset(100);
        make.width.mas_offset(80);
    }];
    
    [self.imageContainView addSubview:self.goodsImageView];
    
    [self.goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.imageContainView);
        make.height.mas_offset(80);
        make.width.mas_offset(60);
    }];
    
    [_contentView addSubview:self.priceLabel];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_contentView.mas_top).with.offset(12);
        make.left.equalTo(self.imageContainView.mas_right).with.offset(5);
    }];
    
    [_contentView addSubview:self.stockLabel];
    [self.stockLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.priceLabel.mas_bottom).with.offset(8);
        make.left.equalTo(self.imageContainView.mas_right).with.offset(5);
    }];
    
    //关闭按钮
    [_contentView addSubview:self.closeButton];
    [self.closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_contentView.mas_right);
        make.top.equalTo(_contentView.mas_top);
        make.width.height.mas_offset(40);
    }];
    
    UILabel *line1 = [[UILabel alloc] init];
    line1.backgroundColor = BREAK_LINE_COLOR;
    [_contentView addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageContainView.mas_bottom).with.offset(10);
        make.left.equalTo(_contentView.mas_left).with.offset(10);
        make.width.mas_offset(SCREEN_WIDTH - 20);
        make.height.mas_offset(0.5);
    }];

    //加入购物车和立即购买按钮
    [_contentView addSubview:self.addToShoppingCartButton];
    [_contentView addSubview:self.buyNowButton];
    [self.addToShoppingCartButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_contentView.mas_bottom);
        make.left.equalTo(_contentView.mas_left);
        make.height.mas_offset(40);
        make.width.equalTo(_contentView.mas_width).multipliedBy(0.5);
    }];
    [self.buyNowButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_contentView.mas_bottom);
        make.height.mas_offset(40);
        make.left.equalTo(self.addToShoppingCartButton.mas_right);
        make.right.equalTo(_contentView.mas_right);
    }];
    
    //选择颜色和尺码滚动区域
    [_contentView addSubview:self.contentScrollView];
    [self.contentScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1.mas_bottom);
        make.left.equalTo(_contentView.mas_left);
        make.right.equalTo(_contentView.mas_right);
        make.bottom.equalTo(self.addToShoppingCartButton.mas_top);
    }];
    
    UIView *contentViewOfScroll = [[UIView alloc] init];
    [self.contentScrollView addSubview:contentViewOfScroll];
    [contentViewOfScroll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentScrollView);
        make.width.equalTo(self.contentScrollView);
    }];
    
    CGFloat topOfView = 0;
    if (colorArray.count > 0) {
        //选择颜色区域
        _colorView  = [[UIView alloc] init];
        [contentViewOfScroll addSubview:_colorView];
        
        UILabel *colorTitle = [[UILabel alloc] init];
        colorTitle.font = kSystemFont(12);
        colorTitle.textColor = MAIN_TEXT_COLOR;
        colorTitle.text = @"颜色";
        [colorTitle sizeToFit];
        [_colorView addSubview:colorTitle];
        [colorTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_colorView.mas_left).with.offset(10);
            make.top.equalTo(_colorView.mas_top).with.offset(10);
        }];
        CGFloat currentWidth = 10.0;
        CGFloat currentHeight = 6.0;
        for (NSInteger i = 0; i < colorArray.count; i ++) {
            NSString *colorString = colorArray[i];
            CGSize size = [colorString sizeWithAttributes:@{NSFontAttributeName : kSystemFont(11)}];
            if (currentWidth + size.width + 20.0 > SCREEN_WIDTH) {
                currentWidth = 10.0;
                currentHeight += 34.0;
            }
            UIButton *colorButton = [UIButton buttonWithType:UIButtonTypeCustom];
            colorButton.tag = i + 1000;
            colorButton.titleLabel.font = kSystemFont(11);
            colorButton.layer.masksToBounds = YES;
            colorButton.layer.cornerRadius = 6.0;
            [colorButton setTitle:colorString forState:UIControlStateNormal];
            [colorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
            [colorButton setTitleColor:MAIN_TEXT_COLOR forState:UIControlStateNormal];
            [colorButton setBackgroundImage:GJCFQuickImageByColorWithSize(NAVIGATIONBAR_COLOR, CGSizeMake(1, 1)) forState:UIControlStateSelected];
            [colorButton setBackgroundImage:GJCFQuickImageByColorWithSize(kHexRGBColorWithAlpha(0xf5f5f5, 1.0), CGSizeMake(1, 1)) forState:UIControlStateNormal];
            [colorButton addTarget:self action:@selector(colorClick:) forControlEvents:UIControlEventTouchUpInside];
            [_colorView addSubview:colorButton];
            [colorButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(_colorView.mas_left).with.offset(currentWidth);
                make.top.equalTo(colorTitle.mas_bottom).with.offset(currentHeight);
                make.height.mas_offset(28);
                make.width.mas_offset(size.width + 20);
            }];
            currentWidth += size.width + 30;
        }
        [_colorView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(contentViewOfScroll.mas_top).with.offset(topOfView);
            make.left.equalTo(contentViewOfScroll.mas_left);
            make.right.equalTo(contentViewOfScroll.mas_right);
            make.height.mas_offset(62 + currentHeight);
        }];
        topOfView += 62 + currentHeight;
        
        UILabel *line = [[UILabel alloc] init];
        line.backgroundColor = BREAK_LINE_COLOR;
        [_colorView addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_colorView.mas_bottom);
            make.left.equalTo(_colorView.mas_left).with.offset(10);
            make.width.mas_offset(SCREEN_WIDTH - 20);
            make.height.mas_offset(0.5);
        }];
    }
    
    if (sizeArray.count > 0) {
        //选择尺寸区域
        _sizeView  = [[UIView alloc] init];
        [contentViewOfScroll addSubview:_sizeView];
        
        UILabel *sizeTitle = [[UILabel alloc] init];
        sizeTitle.font = kSystemFont(12);
        sizeTitle.textColor = MAIN_TEXT_COLOR;
        sizeTitle.text = @"尺码";
        [sizeTitle sizeToFit];
        [_sizeView addSubview:sizeTitle];
        [sizeTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_sizeView.mas_left).with.offset(10);
            make.top.equalTo(_sizeView.mas_top).with.offset(10);
        }];
        CGFloat currentWidth = 10.0;
        CGFloat currentHeight = 6.0;
        for (NSInteger i = 0; i < sizeArray.count; i ++) {
            NSString *sizeString = sizeArray[i];
            CGSize size = [sizeString sizeWithAttributes:@{NSFontAttributeName : kSystemFont(11)}];
            if (currentWidth + size.width + 20.0 > SCREEN_WIDTH) {
                currentWidth = 10.0;
                currentHeight += 34.0;
            }
            UIButton *sizeButton = [UIButton buttonWithType:UIButtonTypeCustom];
            sizeButton.tag = 2000 + i;
            sizeButton.titleLabel.font = kSystemFont(11);
            sizeButton.layer.masksToBounds = YES;
            sizeButton.layer.cornerRadius = 6.0;
            [sizeButton setTitle:sizeString forState:UIControlStateNormal];
            [sizeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
            [sizeButton setTitleColor:MAIN_TEXT_COLOR forState:UIControlStateNormal];
            [sizeButton setBackgroundImage:GJCFQuickImageByColorWithSize(NAVIGATIONBAR_COLOR, CGSizeMake(1, 1)) forState:UIControlStateSelected];
            [sizeButton setBackgroundImage:GJCFQuickImageByColorWithSize(kHexRGBColorWithAlpha(0xf5f5f5, 1.0), CGSizeMake(1, 1)) forState:UIControlStateNormal];
            [sizeButton addTarget:self action:@selector(sizeClick:) forControlEvents:UIControlEventTouchUpInside];
            [_sizeView addSubview:sizeButton];
            [sizeButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(_sizeView.mas_left).with.offset(currentWidth);
                make.top.equalTo(sizeTitle.mas_bottom).with.offset(currentHeight);
                make.height.mas_offset(28);
                make.width.mas_offset(size.width + 20);
            }];
            currentWidth += size.width + 30;
        }
        [_sizeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(contentViewOfScroll.mas_top).with.offset(topOfView);
            make.left.equalTo(contentViewOfScroll.mas_left);
            make.right.equalTo(contentViewOfScroll.mas_right);
            make.height.mas_offset(62 + currentHeight);
        }];
        topOfView += 62 + currentHeight;

        UILabel *line = [[UILabel alloc] init];
        line.backgroundColor = BREAK_LINE_COLOR;
        [_sizeView addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_sizeView.mas_bottom);
            make.left.equalTo(_sizeView.mas_left).with.offset(10);
            make.width.mas_offset(SCREEN_WIDTH - 20);
            make.height.mas_offset(0.5);
        }];
    }
    
    //选择数量区域
    UIView *quantityView = [[UIView alloc] init];
    [contentViewOfScroll addSubview:quantityView];
    [quantityView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contentViewOfScroll.mas_top).with.offset(topOfView + 1);
        make.left.right.equalTo(contentViewOfScroll);
        make.height.mas_offset(60);
    }];
    
    UILabel *line2 = [[UILabel alloc] init];
    line2.backgroundColor = BREAK_LINE_COLOR;
    [quantityView addSubview:line2];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(quantityView.mas_bottom);
        make.left.equalTo(quantityView.mas_left).with.offset(10);
        make.width.mas_offset(SCREEN_WIDTH - 20);
        make.height.mas_offset(0.5);
    }];
    
    //设置滚动区域下边界
    [contentViewOfScroll mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(quantityView.mas_bottom).with.offset(10);
    }];

}
- (UIView *)imageContainView {
    if (!_imageContainView) {
        _imageContainView = [[UIView alloc] init];
        _imageContainView.backgroundColor = [UIColor whiteColor];
        _imageContainView.layer.borderWidth = 0.5;
        _imageContainView.layer.borderColor = BREAK_LINE_COLOR.CGColor;
    }
    return _imageContainView;
}
- (UIImageView *)goodsImageView {
    if (!_goodsImageView) {
        _goodsImageView = [[UIImageView alloc] init];
        _goodsImageView.contentMode = UIViewContentModeScaleAspectFill;
        _goodsImageView.clipsToBounds = YES;
        _goodsImageView.backgroundColor = [UIColor redColor];
    }
    return _goodsImageView;
}
- (UIScrollView *)contentScrollView {
    if (!_contentScrollView) {
        _contentScrollView = [[UIScrollView alloc] init];
        _contentScrollView.backgroundColor = [UIColor clearColor];
        _contentScrollView.autoresizesSubviews = NO;
    }
    return _contentScrollView;
}
- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.font = kSystemFont(13);
        _priceLabel.textColor = NAVIGATIONBAR_COLOR;
        [_priceLabel sizeToFit];
    }
    return _priceLabel;
}
- (UILabel *)stockLabel {
    if (!_stockLabel) {
        _stockLabel = [[UILabel alloc] init];
        _stockLabel.font = kSystemFont(12);
        _stockLabel.textColor = MAIN_TEXT_COLOR;
        [_stockLabel sizeToFit];
    }
    return _stockLabel;
}
- (UIButton *)closeButton {
    if (!_closeButton) {
        _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeButton setTitle:@"关闭" forState:UIControlStateNormal];
        [_closeButton addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeButton;
}
- (UIButton *)addToShoppingCartButton {
    if (!_addToShoppingCartButton) {
        _addToShoppingCartButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _addToShoppingCartButton.backgroundColor = kHexRGBColorWithAlpha(0xff6138, 1.0);
        _addToShoppingCartButton.titleLabel.font = kSystemFont(13);
        [_addToShoppingCartButton setTitle:@"加入购物车" forState:UIControlStateNormal];
        [_addToShoppingCartButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_addToShoppingCartButton addTarget:self action:@selector(addToShoppingCartClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addToShoppingCartButton;
}
- (UIButton *)buyNowButton {
    if (!_buyNowButton) {
        _buyNowButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _buyNowButton.backgroundColor = kHexRGBColorWithAlpha(0xff3838, 1.0);
        _buyNowButton.titleLabel.font = kSystemFont(13);
        [_buyNowButton setTitle:@"立即购买" forState:UIControlStateNormal];
        [_buyNowButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_buyNowButton addTarget:self action:@selector(buyNowClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buyNowButton;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
#pragma mark - Action Method
- (void)show {
    UIWindow *win = [[UIApplication sharedApplication] keyWindow];
    UIView *topView = [win.subviews firstObject];
    [topView addSubview:self];
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _contentView.frame = CGRectMake(0, 0.3 * SCREEN_HEIGHT, SCREEN_WIDTH, 0.7 * SCREEN_HEIGHT);
    } completion:^(BOOL finished){
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, SCREEN_WIDTH, 0.3 * SCREEN_HEIGHT - 30);
        [button addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }];
    
}
- (void)hide {
    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _contentView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 0.7 * SCREEN_HEIGHT);
    } completion:^(BOOL finished){
        [self removeFromSuperview];
    }];
}
- (void)colorClick:(UIButton *)button {
    if (button.selected) {
        button.selected = NO;
    } else {
        button.selected = YES;
        for (NSInteger i = 0; i < _arrayOfColor.count; i ++) {
            UIButton *tempButton = (UIButton *)[_colorView viewWithTag:i + 1000];
            if (tempButton != button) {
                tempButton.selected = NO;
            }
        }
    }
}
- (void)sizeClick:(UIButton *)button {
    if (button.selected) {
        button.selected = NO;
    } else {
        button.selected = YES;
        for (NSInteger i = 0; i < _arrayOfSize.count; i ++) {
            UIButton *tempButton = (UIButton *)[_sizeView viewWithTag:i + 2000];
            if (tempButton != button) {
                tempButton.selected = NO;
            }
        }
    }
    
}

- (void)addToShoppingCartClick {}
- (void)buyNowClick {}
@end
