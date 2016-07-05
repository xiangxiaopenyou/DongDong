//
//  MessageModel.h
//  DongDong
//
//  Created by 项小盆友 on 16/7/4.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import "BaseModel.h"

@interface MessageModel : BaseModel
@property (copy, nonatomic) NSString *messageImageUrlString;
@property (copy, nonatomic) NSString *messageContent;
@property (copy, nonatomic) NSString *messageDateString;

@end
