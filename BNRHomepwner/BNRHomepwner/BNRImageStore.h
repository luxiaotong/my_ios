//
//  BNRImageStore.h
//  BNRHomepwner
//
//  Created by 逯晓瞳 on 15/5/27.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BNRImageStore : NSObject

+ (instancetype) sharedStore;
- (instancetype) initPrivate;

- (void) setImage:(UIImage *)image forKey:(NSString *)key;
- (UIImage *) getImageForKey:(NSString *)key;

@end
