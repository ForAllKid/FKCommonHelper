//
//  FKCommonHelper.h
//  
//
//  Created by ForKid on 2017/2/16.
//  Copyright © 2017年 ForKid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const kGetImageJsString;
FOUNDATION_EXPORT NSString *const kImageClickJsString;

FOUNDATION_EXPORT NSString *const kGetImageJsFounctionName;
FOUNDATION_EXPORT NSString *const kImageClickJsFounctionName;

FOUNDATION_EXPORT NSString *const kWebImageURLScheme;

typedef NS_ENUM(NSInteger, DeviceType) {
    DeviceTypeIPhone4 = 0,
    DeviceTypeIPhone5,
    DeviceTypeIPhone6,
    DeviceTypeIPhone6P,
    DeviceTypeIPhone7,
    DeviceTypeIPhone7P,
    DeviceTypeIPad,
    DeviceTypeUnknown
};


@interface FKCommonHelper : NSObject

#pragma mark -- 富文本


/**
 格式化UIBarButtonItem  比如‘成都 ♡’

 @param string 文字
 @param imageName 图片名字
 @return foo
 */
+ (NSAttributedString *)attributedStringWithString:(NSString *)string
                                         imageName:(NSString *)imageName;



#pragma mark -- 网页代码拼接


/**
 已经忘了这是第几次改这个了

 @param htmlString body
 @param cssStyleName css
 @return foooooo
 */
+ (nullable NSString *)formatHTMLString:(NSString *)htmlString cssStyleName:(NSString *)cssStyleName;


/**
 将接收到的html的body代码转换成完整的HTML代码(即包括<HTML><HEAD>等标签), 可以根据需求来确定图片的宽高, 文字的大小和颜色

 @param titleString 标题
 @param dateString 时间
 @param bodyString 内容
 @param cssStyle css样式链接 e.g <link rel="stylesheet" type="text/css" href="text.css">
 @return 返回样式
 */
+ (nullable NSString *)formatHTMLStringWithTitle:(nullable NSString *)titleString
                                            date:(nullable NSString *)dateString
                                            body:(nullable NSString *)bodyString
                                        cssStyle:(nullable NSString *)cssStyle;





/**
 将接收到的html的body代码转换成完整的HTML代码(即包括<HTML><HEAD>等标签), 可以根据需求来确定图片的宽高, 文字的大小和颜色
 
 @param htmlBodyString body内容
 @return HTML string
 */
+ (nullable NSString *)formatHTMLStringWithHTMLBodyString:(nullable NSString *)htmlBodyString;




/**
 将接收到的html的body代码转换成完整的HTML代码(即包括<HTML><HEAD>等标签), 可以根据需求来确定图片的宽高, 文字的大小和颜色

 @param htmlBodyString body内容
 @param fontSize 字体大小
 @param colorString 文字颜色
 @return HTML string
 */
+ (nullable NSString *)formatHTMLStringWithHTMLBodyString:(nullable NSString *)htmlBodyString
                                                 fontSize:(CGFloat)fontSize
                                                textColor:(nullable NSString *)colorString;




/**
 说实话这个东西本来不需要太多参数的  不过为了用起来方便就加了  o(╯□╰)o   无力吐槽

 @param title 标题
 @param titleSize 标题字号
 @param date 日期
 @param dateSize 日期字号
 @param body 内容
 @param bodySize 内容字号
 @param colorString 内容字体
 @return HTML代码
 */
+ (nullable NSString *)formatHTMLStringWithTitle:(nullable NSString *)title
                                       titleSize:(CGFloat)titleSize
                                            date:(nullable NSString *)date
                                        dateSize:(CGFloat)dateSize
                                            body:(nullable NSString *)body
                                        bodySize:(CGFloat)bodySize
                                       bodyColor:(nullable NSString *)colorString;

+ (nullable NSString *)formatSimpleHTMLString:(NSString *)body;


#pragma mark -- 文本计算


/**
 根据一段文本内容计算文本大小
 
 @param text 文字内容
 @param width 指定宽度
 @param fontSize 字体大小
 @return size
 */
+ (CGSize)caculateTextSizeWithText:(nullable NSString *)text
                             width:(CGFloat)width
                          fontSize:(CGFloat)fontSize;


/**
 根据一段文本内容计算文本大小
 
 @param text 文字内容
 @param width 指定宽度
 @param font 字体
 @return size
 */
+ (CGSize)caculateTextSizeWithText:(nullable NSString *)text
                             width:(CGFloat)width
                              font:(nullable UIFont *)font;



/**
 根据一段文本内容计算文本大小

 @param text 文字内容
 @param width 指定宽度
 @param attributes 文本格式
 @return size
 */
+ (CGSize)caculateTextSizeWithText:(nullable NSString *)text
                             Width:(CGFloat)width
                        attributes:(nullable NSDictionary *)attributes;



/**
 过滤表情

 @param string 字符串
 @return 过滤后的字符串
 */
+ (NSString *)filterEmoji:(NSString *)string;


/**
 判断是否是Emoji表情
 
 @param string 输入字符串
 @return YES means Emoji.
 */
+ (BOOL)isContainEmojiWithString:(nullable NSString *)string;



/**
 压缩图片

 @param image 原始图片
 @return 压缩后的图片
 */
+ (UIImage *)compressImage:(UIImage *)image;



/**
 获取当前设备类型

 @return 设备类型
 */
+ (DeviceType)currentDeviceType;



/**
 手机号格式验证

 @return YES:格式正确  NO:格式错误
 */



/**
 手机号格式验证

 @param phoneNumber 手机号
 @return YES:格式正确  NO:格式错误
 */
+ (BOOL)checkPhoneNum:(NSString *)phoneNumber;


/**
 判断邮箱格式

 @param email 邮箱地址
 @return 是否是正确的邮箱地址格式
 */
+ (BOOL)checkEmail:(NSString *)email;

/**
 校验身份证有效性

 @param IDCardNumber 身份证格式
 @return YES:格式正确  NO:格式错误
 */
+ (BOOL)checkIDCardNumber:(NSString *)IDCardNumber;

//车牌号校验
+ (BOOL)checkCarID:(NSString *)carID;

@end

NS_ASSUME_NONNULL_END
