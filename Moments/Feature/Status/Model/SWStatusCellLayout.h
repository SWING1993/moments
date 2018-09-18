//
//  SWStatusCellLayout.h
//  Moments
//
//  Created by 宋国华 on 2018/9/11.
//  Copyright © 2018年 songguohua. All rights reserved.
//

#import "LWLayout.h"
#import "SWStatus.h"

#define MESSAGE_TYPE_IMAGE @"image"
#define MESSAGE_TYPE_WEBSITE @"website"
#define MESSAGE_TYPE_VIDEO @"video"
#define AVATAR_IDENTIFIER @"avatar"
#define IMAGE_IDENTIFIER @"image"
#define WEBSITE_COVER_IDENTIFIER @"cover"

#define kLinkOpen  @"open"
#define kLinkClose  @"close"
#define kLinkDelete @"delete"


@interface SWStatusCellLayout : LWLayout <NSCopying>

@property (nonatomic,strong) SWStatus* statusModel;
@property (nonatomic,assign) CGFloat cellHeight;
@property (nonatomic,assign) CGRect lineRect;
@property (nonatomic,assign) CGRect menuPosition;
@property (nonatomic,assign) CGRect commentBgPosition;
@property (nonatomic,assign) CGRect avatarPosition;
@property (nonatomic,assign) CGRect websitePosition;
@property (nonatomic,copy) NSArray* imagePostions;

//布局模型
- (id)initWithStatusModel:(SWStatus *)statusModel
                    index:(NSInteger)index
                    opend:(BOOL)open;

@end