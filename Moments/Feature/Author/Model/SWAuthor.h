//
//  SWAuthor.h
//  Moments
//
//  Created by 宋国华 on 2018/9/17.
//  Copyright © 2018年 songguohua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWAuthor : RLMObject

// 发布人昵称
@property NSString *nickname;
// 发布人头像
@property NSString *avatar;
// 选中
@property (nonatomic,assign) Boolean selected;

@end

RLM_ARRAY_TYPE(SWAuthor)
