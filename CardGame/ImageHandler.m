//
//  ImageHandler.m
//  CardGame
//
//  Created by Rafagan Abreu on 01/02/14.
//  Copyright (c) 2014 Rafagan Abreu. All rights reserved.
//

#import "ImageHandler.h"

@implementation ImageHandler

+ (UIImage *)captureView:(UIView*)view {
    
    //hide controls if needed
    CGRect rect = [view bounds];
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

+ (NSData*)imageToRawData:(UIImage*) image{
    NSData *imageData = UIImagePNGRepresentation(image);
    return imageData;
}

@end
