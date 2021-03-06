//
//  BaseModel.h
//  DongDong
//
//  Created by 项小盆友 on 16/6/6.
//  Copyright © 2016年 项小盆友. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "BaseRequest.h"
@interface NSArray (ModelAddition)
- (NSArray *)rb_dictionaryArray;
@end

@interface BaseModel : JSONModel
+ (NSArray *)setupWithArray:(NSArray *)array;
+ (NSArray *)dictionaryArrayFromModelArray:(NSArray *)array;

@end
