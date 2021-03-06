//
//  BNRImageStore.m
//  BNRHomepwner
//
//  Created by 逯晓瞳 on 15/5/27.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import "BNRImageStore.h"

@interface BNRImageStore ()

@property (nonatomic) NSMutableDictionary *imageDict;

@end

@implementation BNRImageStore

#pragma mark - init

+ (instancetype) sharedStore
{
    static BNRImageStore *imageStore = nil;
    if ( !imageStore ) {
        imageStore = [[self alloc] initPrivate];
    }
    
    return imageStore;
}

- (instancetype) initPrivate
{
    self = [super init];
    
    if ( self ) {
        _imageDict = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

- (instancetype) init
{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[BNRImageStore sharedStore]" userInfo:nil];
}

#pragma mark - image dict

- (void) setImage:(UIImage *)image forKey:(NSString *)key
{
    self.imageDict[key] = image;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *cacheDir = paths[0];
    NSString *fullPath = [cacheDir stringByAppendingPathComponent:key];
    
    NSData *imageData = UIImageJPEGRepresentation(image, 0.7); // 0.7 is JPG quality
    [imageData writeToFile:fullPath atomically:YES];
}

- (UIImage *) getImageForKey:(NSString *)key
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *cacheDir = paths[0];
    NSString *fullPath = [cacheDir stringByAppendingPathComponent:key];
    
    UIImage *image = [UIImage imageWithData: [NSData dataWithContentsOfFile:fullPath]];
    
    if ( image ) {
        return image;
    } else {
        return self.imageDict[key];
    }
}

- (void) delImageForKey:(NSString *)key
{
    [self.imageDict removeObjectForKey:key];
}

@end
