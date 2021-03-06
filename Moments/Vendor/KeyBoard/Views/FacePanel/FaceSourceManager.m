//
//  FaceSourceManager.m
//  FaceKeyboard

//  Company：     SunEee
//  Blog:        devcai.com
//  Communicate: 2581502433@qq.com

//  Created by ruofei on 16/3/30.
//  Copyright © 2016年 ruofei. All rights reserved.
//

#import "FaceSourceManager.h"

@implementation FaceSourceManager

//从持久化存储里面加载表情源
+ (NSArray *)loadFaceSource {
    NSMutableArray *subjectArray = [NSMutableArray array];
//    NSArray *sources = @[@"face",@"expression"];
    NSArray *sources = @[@"expression"];
    for (int i = 0; i < sources.count; ++i) {
        NSString *plistName = sources[i];
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
        NSDictionary *faceDic = [NSDictionary dictionaryWithContentsOfFile:plistPath];
        NSArray *allkeys = faceDic.allKeys;
                FaceThemeModel *themeM = [[FaceThemeModel alloc] init];
        if ([plistName isEqualToString:@"face"]) {
            themeM.themeStyle = FaceThemeStyleCustomEmoji;
            themeM.themeDecribe = @"♥️";
            themeM.themeIcon = @"最近icon";
        } else if ([plistName isEqualToString:@"expression"]){
            themeM.themeStyle = FaceThemeStyleCustomEmoji;
            themeM.themeDecribe = @"微博";
            themeM.themeIcon = @"emojiKB_group_face";
        } else if ([plistName isEqualToString:@"systemEmoji"]){
            themeM.themeStyle = FaceThemeStyleSystemEmoji;
            themeM.themeDecribe = @"Emoji";
            themeM.themeIcon = @"";
        }
        NSMutableArray *modelsArr = [NSMutableArray array];
        for (int i = 0; i < allkeys.count; ++i) {
            NSString *name = allkeys[i];
            FaceModel *fm = [[FaceModel alloc] init];
            fm.faceTitle = name;
            fm.faceIcon = [faceDic objectForKey:name];
            [modelsArr addObject:fm];
        }
        themeM.faceModels = modelsArr;
        [subjectArray addObject:themeM];
    }
    return subjectArray;
}

@end
