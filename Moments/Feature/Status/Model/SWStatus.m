//
//  SWStatus.m
//  Moments
//
//  Created by 宋国华 on 2018/9/11.
//  Copyright © 2018年 songguohua. All rights reserved.
//

#import "SWStatus.h"

@implementation SWStatus

+ (NSString *)primaryKey {
    return @"id";
}

+ (NSString *)generateRandomString {
    NSMutableString *mutableString = [NSMutableString stringWithString:[[NSDate date] formatYMDHMLine]];
    NSString * strAll = @"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    //定义一个结果
    NSString * result = [[NSMutableString alloc]initWithCapacity:16];
    for (int i = 0; i < 10; i++) {
        //获取随机数
        NSInteger index = arc4random() % (strAll.length-1);
        char tempStr = [strAll characterAtIndex:index];
        result = (NSMutableString *)[result stringByAppendingString:[NSString stringWithFormat:@"%c",tempStr]];
    }
    [mutableString appendString:result];
    return mutableString;
}

+ (NSString *)saveImage:(UIImage *)image {
    if (!image) {
        return @"";
    }
    NSString *imageName = [SWStatus generateRandomString];
    UIImage *imageSave = [image qmui_imageResizedInLimitedSize:CGSizeMake(1080, 1920)];
    NSString *path_sandox = NSHomeDirectory();
    NSString *imagePath = [path_sandox stringByAppendingString:[NSString stringWithFormat:@"/Documents/%@.png",imageName]];
    [UIImagePNGRepresentation(imageSave) writeToFile:imagePath atomically:YES];
    NSLog(@"保存照片%@到%@",imageName,imagePath);
    return imageName;
}

+ (UIImage *)getDocumentImageWithName:(NSString *)name {
    if (kStringIsEmpty(name)) {
        return nil;
    }
    NSString *aPath = [NSString stringWithFormat:@"%@/Documents/%@.png",NSHomeDirectory(),name];
    UIImage *imgFromUrl3 = [[UIImage alloc]initWithContentsOfFile:aPath];
    UIImageWriteToSavedPhotosAlbum(imgFromUrl3, self, nil, nil);
    return imgFromUrl3;
}

@end
