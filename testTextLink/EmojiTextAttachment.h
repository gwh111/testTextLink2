//
//  EmojiTextAttachment.h
//  InputEmojiExample
//
//  Created by zorro on 15/3/7.
//  Copyright (c) 2015年 tutuge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmojiTextAttachment : NSTextAttachment
@property(strong, nonatomic) NSString *emojiTag;
@property(strong, nonatomic) NSString *emojiName;

@property(strong, nonatomic) NSDictionary *infoDic;
@property(assign, nonatomic) CGFloat emojiSize;  //For emoji image size
@end
