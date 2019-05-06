//
//  ImageHandler.h
//  CardGame
//
//  Created by Rafagan Abreu on 01/02/14.
//  Copyright (c) 2014 Rafagan Abreu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageHandler : NSObject

+ (UIImage *)captureView:(UIView*) view;
+ (NSData*)imageToRawData:(UIImage*) image;

@end
