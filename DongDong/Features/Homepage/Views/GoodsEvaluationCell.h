//
//  GoodsEvaluationCell.h
//  DongDong
//
//  Created by 项小盆友 on 16/7/22.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodsEvaluationCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *evaluationNumberLabel;
@property (weak, nonatomic) IBOutlet UIImageView *portraitImageView;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *evaluationContentLabel;
@property (weak, nonatomic) IBOutlet UILabel *colorLabel;
@property (weak, nonatomic) IBOutlet UILabel *sizeLabel;
@property (weak, nonatomic) IBOutlet UIButton *lookOverAllEvaluationsButton;
@property (weak, nonatomic) IBOutlet UIView *starsView;

@end
