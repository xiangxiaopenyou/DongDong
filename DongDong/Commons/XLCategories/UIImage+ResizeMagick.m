//
//  UIImage+ResizeMagick.m
//
//
//  Created by Vlad Andersen on 1/5/13.
//
//

#import "UIImage+ResizeMagick.h"

@implementation UIImage (ResizeMagick)

- (NSData *)rmk_resizedAndReturnData {
    UIImage *newImage = [self  rmk_resizedImageByMagick:@"1024x1024"];
    
    NSData *imgData1 = UIImageJPEGRepresentation(newImage, 1.0f);
    NSLog(@"1.0 size: %lu", (unsigned long)imgData1.length);
    
    NSData *imgData2 = UIImageJPEGRepresentation(newImage, 0.7f);
    NSLog(@"0.7 size: %lu", (unsigned long)imgData2.length);
    
    NSData *imgData3 = UIImageJPEGRepresentation(newImage, 0.4f);
    NSLog(@"0.4 size: %lu", (unsigned long)imgData3.length);
    
    NSData *imgData4 = UIImageJPEGRepresentation(newImage, 0.0f);
    NSLog(@"0.0 size: %lu", (unsigned long)imgData4.length);
    
    return imgData1;
}

- (NSString *)rmk_resizedAndReturnPath {
    return @"";
}

// width	Width given, height automagically selected to preserve aspect ratio.
// xheight	Height given, width automagically selected to preserve aspect ratio.
// widthxheight	Maximum values of height and width given, aspect ratio preserved.
// widthxheight^	Minimum values of width and height given, aspect ratio preserved.
// widthxheight!	Exact dimensions, no aspect ratio preserved.
// widthxheight#	Crop to this exact dimensions.
- (UIImage *)rmk_resizedImageByMagick:(NSString *)spec {
    if ([spec hasSuffix:@"!"]) {
        NSString *specWithoutSuffix = [spec substringToIndex:[spec length] - 1];
        NSArray *widthAndHeight = [specWithoutSuffix componentsSeparatedByString:@"x"];
        NSUInteger width = (unsigned int)[[widthAndHeight objectAtIndex:0] longLongValue];
        NSUInteger height = (unsigned int)[[widthAndHeight objectAtIndex:1] longLongValue];
        UIImage *newImage = [self rmk_resizedImageWithMinimumSize: CGSizeMake (width, height)];
        return [newImage drawImageInBounds: CGRectMake (0, 0, width, height)];
    }

    if ([spec hasSuffix:@"#"]) {
        NSString *specWithoutSuffix = [spec substringToIndex:[spec length] - 1];
        NSArray *widthAndHeight = [specWithoutSuffix componentsSeparatedByString:@"x"];
        NSUInteger width = (unsigned int)[[widthAndHeight objectAtIndex:0] longLongValue];
        NSUInteger height = (unsigned int)[[widthAndHeight objectAtIndex:1] longLongValue];
        UIImage *newImage = [self rmk_resizedImageWithMinimumSize: CGSizeMake (width, height)];
        return [newImage croppedImageWithRect: CGRectMake ((newImage.size.width - width) / 2, (newImage.size.height - height) / 2, width, height)];
    }
    if ([spec hasSuffix:@"^"]) {
        NSString *specWithoutSuffix = [spec substringToIndex:[spec length] - 1];
        NSArray *widthAndHeight = [specWithoutSuffix componentsSeparatedByString:@"x"];
        return [self rmk_resizedImageWithMinimumSize: CGSizeMake ([[widthAndHeight objectAtIndex: 0] longLongValue],
                                                              [[widthAndHeight objectAtIndex: 1] longLongValue])];
    }

    NSArray *widthAndHeight = [spec componentsSeparatedByString:@"x"];
    if ([widthAndHeight count] == 1) {
        return [self rmk_resizedImageByWidth:(unsigned int)[spec longLongValue]];
    }
    if ([[widthAndHeight objectAtIndex: 0] isEqualToString: @""]) {
        return [self rmk_resizedImageByHeight:(unsigned int)[[widthAndHeight objectAtIndex: 1] longLongValue]];
    }
    return [self rmk_resizedImageWithMaximumSize: CGSizeMake ([[widthAndHeight objectAtIndex: 0] longLongValue],
                                                          [[widthAndHeight objectAtIndex: 1] longLongValue])];
}

- (CGImageRef)CGImageWithCorrectOrientation {
    if (self.imageOrientation == UIImageOrientationDown) {
        //retaining because caller expects to own the reference
        CGImageRetain([self CGImage]);
        return [self CGImage];
    }
    UIGraphicsBeginImageContext(self.size);

    CGContextRef context = UIGraphicsGetCurrentContext();

    if (self.imageOrientation == UIImageOrientationRight) {
        CGContextRotateCTM (context, 90 * M_PI / 180);
    } else if (self.imageOrientation == UIImageOrientationLeft) {
        CGContextRotateCTM (context, -90 * M_PI / 180);
    } else if (self.imageOrientation == UIImageOrientationUp) {
        CGContextRotateCTM (context, 180 * M_PI / 180);
    }

    [self drawAtPoint:CGPointMake(0, 0)];

    CGImageRef cgImage = CGBitmapContextCreateImage(context);
    UIGraphicsEndImageContext();

    return cgImage;
}

- (UIImage *)rmk_resizedImageByWidth:(NSUInteger)width {
    CGImageRef imgRef = [self CGImageWithCorrectOrientation];
    CGFloat original_width  = CGImageGetWidth(imgRef);
    CGFloat original_height = CGImageGetHeight(imgRef);
    CGFloat ratio = width / original_width;
    CGImageRelease(imgRef);
    return [self drawImageInBounds: CGRectMake(0, 0, width, round(original_height * ratio))];
}

- (UIImage *)rmk_resizedImageByHeight:(NSUInteger)height {
    CGImageRef imgRef = [self CGImageWithCorrectOrientation];
    CGFloat original_width  = CGImageGetWidth(imgRef);
    CGFloat original_height = CGImageGetHeight(imgRef);
    CGFloat ratio = height / original_height;
    CGImageRelease(imgRef);
    return [self drawImageInBounds: CGRectMake(0, 0, round(original_width * ratio), height)];
}

- (UIImage *)rmk_resizedImageWithMinimumSize:(CGSize)size {
    CGImageRef imgRef = [self CGImageWithCorrectOrientation];
    CGFloat original_width  = CGImageGetWidth(imgRef);
    CGFloat original_height = CGImageGetHeight(imgRef);
    CGFloat width_ratio = size.width / original_width;
    CGFloat height_ratio = size.height / original_height;
    CGFloat scale_ratio = width_ratio > height_ratio ? width_ratio : height_ratio;
    CGImageRelease(imgRef);
    return [self drawImageInBounds: CGRectMake(0, 0, round(original_width * scale_ratio), round(original_height * scale_ratio))];
}

- (UIImage *)rmk_resizedImageWithMaximumSize:(CGSize)size {
    CGImageRef imgRef = [self CGImageWithCorrectOrientation];
    CGFloat original_width  = CGImageGetWidth(imgRef);
    CGFloat original_height = CGImageGetHeight(imgRef);
    CGFloat width_ratio = size.width / original_width;
    CGFloat height_ratio = size.height / original_height;
    CGFloat scale_ratio = width_ratio < height_ratio ? width_ratio : height_ratio;
    CGImageRelease(imgRef);
    return [self drawImageInBounds: CGRectMake(0, 0, round(original_width * scale_ratio), round(original_height * scale_ratio))];
}

- (UIImage *)drawImageInBounds:(CGRect)bounds {
    UIGraphicsBeginImageContext(bounds.size);
    [self drawInRect:bounds];
    UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resizedImage;
}

- (UIImage *)croppedImageWithRect:(CGRect)rect {

    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect drawRect = CGRectMake(-rect.origin.x, -rect.origin.y, self.size.width, self.size.height);
    CGContextClipToRect(context, CGRectMake(0, 0, rect.size.width, rect.size.height));
    [self drawInRect:drawRect];
    UIImage *subImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return subImage;
}

@end
