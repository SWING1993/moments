//
//  SWMessageCell.m
//  Moments
//
//  Created by 宋国华 on 2018/9/29.
//  Copyright © 2018年 songguohua. All rights reserved.
//

#import "SWMessageCell.h"
#define kWXBlue  UIColorMakeWithRGBA(87, 107, 149, 1)

@interface SWMessageCell ()

@property (nonatomic, strong) UIImageView *avatarView;
@property (nonatomic, strong) UILabel *nicknameLabel;
@property (nonatomic, strong) UIButton *likeView;
@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, strong) UILabel *createTimeLabel;
@property (nonatomic, strong) UIImageView *statusContentView;

@end

@implementation SWMessageCell

- (void)didInitializeWithStyle:(UITableViewCellStyle)style {
    [super didInitializeWithStyle:style];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.avatarView = [[UIImageView alloc] initWithImage:UIImageMake(@"defaultHead")];
    self.avatarView.contentMode = UIViewContentModeScaleAspectFill;
    self.avatarView.layer.cornerRadius = 4.0f;
    self.avatarView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.avatarView];
    
    _nicknameLabel = [[UILabel alloc] qmui_initWithFont:UIFontPFMediumMake(15) textColor:kWXBlue];
    [self.contentView addSubview:self.nicknameLabel];
    
    _messageLabel = [[QMUILabel alloc] qmui_initWithFont:UIFontMake(15) textColor:UIColorMakeX(40)];
    self.messageLabel.numberOfLines = 1;
    [self.contentView addSubview:self.messageLabel];
    
    self.likeView = [[UIButton alloc] init];
    self.likeView.userInteractionEnabled = NO;
    self.likeView.hidden = YES;
    [self.likeView setImage:UIImageMake(@"Like") forState:UIControlStateNormal];
    [self.contentView addSubview:self.likeView];
    
    self.createTimeLabel = [[UILabel alloc] qmui_initWithFont:UIFontMake(15) textColor:[UIColor grayColor]];
    [self.contentView addSubview:self.createTimeLabel];
    
    self.statusContentView = [[UIImageView alloc] init];
    self.statusContentView.image =UIImageMake(@"fileicon_pic");
    self.statusContentView.backgroundColor = UIColorMakeX(240);
    self.statusContentView.contentMode = UIViewContentModeScaleAspectFill;
    self.statusContentView.clipsToBounds = YES;
    [self.contentView addSubview:self.statusContentView];
}

- (void)configCellWithModel:(SWMessage *)message {
    self.avatarView.image = [SWStatus getDocumentImageWithName:message.author.avatar];
    self.nicknameLabel.text = message.author.nickname;
    self.createTimeLabel.text = message.createdTime;

    if (message.type == 1) {
        self.likeView.hidden = YES;
        self.messageLabel.hidden = NO;
        self.messageLabel.text = message.content;
    } else {
        self.likeView.hidden = NO;
        self.messageLabel.hidden = YES;
    }
    if (!kStringIsEmpty(message.contentImage)) {
        self.statusContentView.image = [SWStatus getDocumentImageWithName:message.contentImage];
    }
}

+ (CGFloat)cellHeight {
    return 80;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat space = 7.5;
    
    self.avatarView.frame = CGRectMake(space, space, 50, 50);
    self.statusContentView.frame = CGRectMake(self.contentView.qmui_width- self.contentView.qmui_height + space, space, self.contentView.qmui_height - 2*space, self.contentView.qmui_height - 2*space);
    
    CGFloat lableHieht = ((self.contentView.qmui_height - 2*space)/3);
    CGFloat lableWidth = self.contentView.qmui_width - 2*self.contentView.qmui_height;
    CGFloat lableX = self.avatarView.qmui_right + space;
    
    self.nicknameLabel.frame = CGRectMake(lableX, space, lableWidth, lableHieht);
    self.messageLabel.frame = CGRectMake(lableX, self.nicknameLabel.qmui_bottom, lableWidth, lableHieht);
    self.createTimeLabel.frame = CGRectMake(lableX, self.messageLabel.qmui_bottom, lableWidth, lableHieht);
    self.likeView.frame = CGRectMake(lableX, self.nicknameLabel.qmui_bottom + 2.5, self.messageLabel.qmui_height - 5, self.messageLabel.qmui_height - 5);
}


@end
