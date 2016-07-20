//
//  UtilDefine.h
//  DongDong
//
//  Created by 项小盆友 on 16/7/15.
//  Copyright © 2016年 项小盆友. All rights reserved.
//
#import "Util.h"
#pragma mark - System
/**
 *  照相机是否可用
 */
#define XLIsCameraAvailable [Util cameraAvailable];

/**
 *  是否支持发短信
 */
#define XLCanSendSMS [Util canSendSMS];

/**
 *  是否支持打电话
 */
#define XLCanMakePhoneCall [Util canMakePhoneCall];

/**
 *  是否有权限访问相机
 */
#define XLIsAppCameraAccessAuthorized [Util isAppCameraAccessAuthorized];

/**
 *  是否有权限访问相册
 */
#define XLIsAppPhotoLibraryAccessAuthorized [Util isAppPhotoLibraryAccessAuthorized];

#pragma mark - Cache
/**
 *  判空
 */
#define XLIsNullObject [Util isNullObject:object]



/**
 *  string转url
 */
#define XLURLFromString(aString) [Util urlWithString:aString]

/**
 *  数字转string，小数点后最多两位
 */
#define XLStringFromFloat(aFloat) [Util numberString:aFloat]

/**
 *  计算文字大小
 */
#define XLSizeOfText(aText, aWidth, aFont) [Util sizeOfText:aText width:aWidth font:aFont]

