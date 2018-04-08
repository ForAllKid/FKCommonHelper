//
//  FKCommonHelper.m
//  
//
//  Created by ForKid on 2017/2/16.
//  Copyright © 2017年 ForKid. All rights reserved.
//

#import "FKCommonHelper.h"
#import <sys/utsname.h>

//static NSString *const kDeviceIPhone4;
//static NSString *const kDeviceIPhone5;
//static NSString *const kDeviceIPhone6;
//static NSString *const kDeviceIPhone7;
//static NSString *const kDeviceIPhoneIPadMini;
//static NSString *const kDeviceIPhoneIPadAir;


NSString *const kGetImageJsString = @"function getImages(){\
var imgs = document.getElementsByTagName('img');\
var imgScr = '';\
for(var i=0;i<imgs.length;i++){\
if (i == 0){ \
imgScr = imgs[i].src; \
} else {\
imgScr = imgScr +'***'+ imgs[i].src;\
} \
};\
return imgScr;\
};";

NSString *const kImageClickJsString = @"function registerImageClickAction(){\
var imgs = document.getElementsByTagName('img');\
for(var i=0;i<imgs.length;i++){\
imgs[i].customIndex = i;\
imgs[i].onclick=function(){\
window.location.href='image-preview-index:'+this.customIndex;\
}\
}\
}";

NSString *const kGetImageJsFounctionName = @"getImages()";
NSString *const kImageClickJsFounctionName = @"registerImageClickAction();";


NSString *const kWebImageURLScheme = @"image-preview-index";

@implementation FKCommonHelper


#pragma mark - 富文本

+ (NSAttributedString *)attributedStringWithString:(NSString *)string imageName:(NSString *)imageName{
    if (!string || !imageName) {
        return nil;
    }
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:14.f],
                                 NSForegroundColorAttributeName:[UIColor blackColor]};
    NSMutableAttributedString *mainString = [[NSMutableAttributedString alloc] initWithString:string
                                                                                   attributes:attributes];
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = [UIImage imageNamed:@"icon_navigationBar_arrowDown"];
    attachment.bounds = CGRectMake(3, 2, 11, 6);
    NSAttributedString *attachmentString = [NSAttributedString attributedStringWithAttachment:attachment];
    
    [mainString appendAttributedString:attachmentString];
    return mainString;
}


#pragma mark - 网页

+ (NSString *)formatHTMLString:(NSString *)htmlString cssStyleName:(NSString *)cssStyleName{
    
    if (!htmlString) {
        return nil;
    }
    
    NSString *HTMLString = [NSString stringWithFormat:@"<html>\n"
                            "<head>\n"
                            
                            "<meta charset=\"UTF-8\">"
                            "<meta name=\"viewport\" content=\"target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no\">"
                            
                            "<script type=\"text/JavaScript\">"
                            "window.onload=function({document.documentElement.style.webkitTouchCallout='none';};"
                            "</script>"
                            
                            "<link rel=\"stylesheet\" type=\"text/css\" href=\"%@.css\">\n"  //css样式表
                            
                            "</head>\n"
                            "<body>\n"

                            "<p>%@</p>\n"  //content
                            
                            "</body>\n"
                            "</html>", cssStyleName, htmlString];
    return HTMLString;
    
}

+ (NSString *)formatHTMLStringWithTitle:(NSString *)titleString
                                   date:(NSString *)dateString
                                   body:(NSString *)bodyString
                               cssStyle:(NSString *)cssStyle{
    if (!bodyString) {
        return nil;
    }
    
    NSString *HTMLString = [NSString stringWithFormat:@"<html>\n"
                            "<head>\n"
                            
                            "<meta charset=\"UTF-8\">"
                            "<meta name=\"viewport\" content=\"target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no\">"

                            "<script type=\"text/JavaScript\">"
                            "window.onload=function({document.documentElement.style.webkitTouchCallout='none';};"
                            "</script>"
                            
                            "%@\n"  //css样式表
                            
                            "</head>\n"
                            "<body>\n"
                            "<p id=\"title\">%@</p>\n"
                            "<p id=\"date\">%@</p>\n"

                            "<p>%@</p>\n"  //content

                            "</body>\n"
                            "</html>", cssStyle, titleString, dateString, bodyString];
    return HTMLString;
}




+ (NSString *)formatHTMLStringWithHTMLBodyString:(NSString *)htmlBodyString{
    return [self formatHTMLStringWithHTMLBodyString:htmlBodyString
                                           fontSize:15.f
                                          textColor:@"#333333"];
}


+(NSString *)formatHTMLStringWithHTMLBodyString:(NSString *)htmlBodyString
                                       fontSize:(CGFloat)fontSize
                                      textColor:(NSString *)colorString{
    
    if (!htmlBodyString) {
        return nil;
    }
        
    NSString *HTMLString = [NSString stringWithFormat:@"<html>\n"
                            "<head>\n"
                            
                            "<meta charset=\"UTF-8\">"
                            "<meta name=\"viewport\" content=\"target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no\">"
                            "<style type=\"text/css\">\n"
                            
                            "p{line-height:%fpx}"
                            
                            "img{width:100%%;}\n"
                            
                            "body{font-size:%lf; color: %@;text-align:justify;font-weight:300}\n"
                            
                            "p{font-size:%lf;font-family: \"微软雅黑\"}\n"
                            
                            "</style>\n"
                            "</head>\n"
                            "<body><p>%@</p></body>\n"
                            "</html>", fontSize + 8, fontSize, colorString, fontSize, htmlBodyString];
    return HTMLString;
}



+ (NSString *)formatHTMLStringWithTitle:(NSString *)title
                              titleSize:(CGFloat)titleSize
                                   date:(NSString *)date
                               dateSize:(CGFloat)dateSize
                                   body:(NSString *)body
                               bodySize:(CGFloat)bodySize
                              bodyColor:(NSString *)colorString{
    
    if (!body) {
        return nil;
    }
    
    NSString *HTMLString = [NSString stringWithFormat:@"<html>\n"
                            "<head>\n"
                            
                            "<meta charset=\"UTF-8\">"
                            "<meta name=\"viewport\" content=\"target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no\">"
                            "<style type=\"text/css\">\n"
                            
                            "p{line-height:%fpx}"
                            
                            "img{width:100%%;}\n"
                            
                            "body{font-size:%lf; color:%@;font-family:\"微软雅黑\";font-weight:300;text-align:justify}\n"
                            
                            "p{font-size:%lf;font-family: \"微软雅黑\";margin:3px}\n"
                            
                            "</style>\n"
                            
                            "</head>\n"
                            "<body>\n"
                            "<p padding:0px; align=\"center\"; style=\"font-size: %fpx;\";font-weight:bold>%@</p>\n"
                            "<p padding:0px; align=\"center\"; style=\"font-size: %fpx; color:#999999;\">%@</p>\n"
                            "%@\n"
                            "</body>\n"
                            "</html>", bodySize + 8, bodySize, colorString, bodySize, titleSize, title, dateSize, date, body];
    return HTMLString;
    
}


+ (NSString *)formatSimpleHTMLString:(NSString *)body{
    if (!body) {
        return nil;
    }
    NSString *HTMLString = [NSString stringWithFormat:@"<html>\n"
                            "<head>\n"
                            
                            "<meta charset=\"UTF-8\">"
                            "<meta name=\"viewport\" content=\"target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no\">"
                            
                            "<script type=\"text/JavaScript\">"
                            "window.onload=function({document.documentElement.style.webkitTouchCallout='none';};"
                            "</script>"
                            
                            
                            "</head>\n"
                            "<body>\n"

                            "<p>%@</p>\n"  //content
                            
                            "</body>\n"
                            "</html>", body];
    return HTMLString;
    
}

#pragma mark - 文本

+ (CGSize)caculateTextSizeWithText:(NSString *)text
                             width:(CGFloat)width
                          fontSize:(CGFloat)fontSize{
    
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    return [self caculateTextSizeWithText:text
                                    width:width
                                     font:font];
}

+ (CGSize)caculateTextSizeWithText:(NSString *)text
                             width:(CGFloat)width
                              font:(UIFont *)font{
    
    return [self caculateTextSizeWithText:text
                                    Width:width
                               attributes:@{NSFontAttributeName:font}];
    
}

+ (CGSize)caculateTextSizeWithText:(NSString *)text
                             Width:(CGFloat)width
                        attributes:(NSDictionary *)attributes{
    
    CGSize size = CGSizeMake(width, CGFLOAT_MAX);
    NSStringDrawingOptions options = NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin;
    
    CGSize textSize = [text boundingRectWithSize:size
                                         options:options
                                      attributes:attributes
                                         context:nil].size;
    return textSize;
}



//过滤表情
+ (NSString *)filterEmoji:(NSString *)string {
    NSUInteger len = [string lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
    const char *utf8 = [string UTF8String];
    char *newUTF8 = malloc( sizeof(char) * len );
    int j = 0;
    
    //0xF0(4) 0xE2(3) 0xE3(3) 0xC2(2) 0x30---0x39(4)
    for ( int i = 0; i < len; i++ ) {
        unsigned int c = (int)utf8;
        BOOL isControlChar = NO;
        if ( c == 4294967280 ||
            c == 4294967089 ||
            c == 4294967090 ||
            c == 4294967091 ||
            c == 4294967092 ||
            c == 4294967093 ||
            c == 4294967094 ||
            c == 4294967095 ||
            c == 4294967096 ||
            c == 4294967097 ||
            c == 4294967088 ) {
            i = i + 3;
            isControlChar = YES;
        }
        if ( c == 4294967266 || c == 4294967267 ) {
            i = i + 2;
            isControlChar = YES;
        }
        if ( c == 4294967234 ) {
            i = i + 1;
            isControlChar = YES;
        }
        if ( !isControlChar ) {
            newUTF8[j] = *(char *)utf8;
            j++;
        }
    }
    newUTF8[j] = '\0';
    NSString *encrypted = [NSString stringWithCString:(const char*)newUTF8
                                             encoding:NSUTF8StringEncoding];
    free( newUTF8 );
    return encrypted;
}


+ (BOOL)isContainEmojiWithString:(NSString *)string{
    
    __block BOOL returnValue = NO;
    
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                const unichar hs = [substring characterAtIndex:0];
                                if (0xd800 <= hs && hs <= 0xdbff) {
                                    if (substring.length > 1) {
                                        const unichar ls = [substring characterAtIndex:1];
                                        const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                                        if (0x1d000 <= uc && uc <= 0x1f77f) {
                                            returnValue = YES;
                                        }
                                    }
                                } else if (substring.length > 1) {
                                    const unichar ls = [substring characterAtIndex:1];
                                    if (ls == 0x20e3) {
                                        returnValue = YES;
                                    }
                                } else {
                                    if (0x2100 <= hs && hs <= 0x27ff) {
                                        returnValue = YES;
                                    } else if (0x2B05 <= hs && hs <= 0x2b07) {
                                        returnValue = YES;
                                    } else if (0x2934 <= hs && hs <= 0x2935) {
                                        returnValue = YES;
                                    } else if (0x3297 <= hs && hs <= 0x3299) {
                                        returnValue = YES;
                                    } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                                        returnValue = YES;
                                    }
                                }
                            }];
    
    return returnValue;

}


+ (UIImage *)compressImage:(UIImage *)image{

    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    float actualWidth = image.size.width * image.scale;
    float boundsWidth = screenWidth - 8.f * 2;
    float compressionQuality = boundsWidth / actualWidth;
    if (compressionQuality > 1) {
        compressionQuality = 1;
    }
    NSData *degradedImageData = UIImageJPEGRepresentation(image, compressionQuality);
    UIImage *degradedImage = [UIImage imageWithData:degradedImageData];
    return degradedImage;
}


+ (DeviceType)currentDeviceType{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([deviceString isEqualToString:@"iPhone4,1"])    return DeviceTypeIPhone4;
    if ([deviceString isEqualToString:@"iPhone5,1"])    return DeviceTypeIPhone5;
    if ([deviceString isEqualToString:@"iPhone5,2"])    return DeviceTypeIPhone5;
    if ([deviceString isEqualToString:@"iPhone5,3"])    return DeviceTypeIPhone5;
    if ([deviceString isEqualToString:@"iPhone5,4"])    return DeviceTypeIPhone5;
    if ([deviceString isEqualToString:@"iPhone6,1"])    return DeviceTypeIPhone5;
    if ([deviceString isEqualToString:@"iPhone6,2"])    return DeviceTypeIPhone5;
    if ([deviceString isEqualToString:@"iPhone7,1"])    return DeviceTypeIPhone6P;
    if ([deviceString isEqualToString:@"iPhone7,2"])    return DeviceTypeIPhone6;
    if ([deviceString isEqualToString:@"iPhone8,1"])    return DeviceTypeIPhone6;
    if ([deviceString isEqualToString:@"iPhone8,2"])    return DeviceTypeIPhone6P;
    if ([deviceString isEqualToString:@"iPhone8,4"])    return DeviceTypeIPhone5;
    if ([deviceString isEqualToString:@"iPhone9,1"])    return DeviceTypeIPhone7;
    if ([deviceString isEqualToString:@"iPhone9.2"])    return DeviceTypeIPhone7P;
    //
    if ([deviceString isEqualToString:@"iPad3,1"])    return DeviceTypeIPad;
    if ([deviceString isEqualToString:@"iPad3,2"])    return DeviceTypeIPad;
    if ([deviceString isEqualToString:@"iPad3,3"])    return DeviceTypeIPad;
    
    //
    if ([deviceString isEqualToString:@"iPad3,4"])    return DeviceTypeIPad;
    if ([deviceString isEqualToString:@"iPad3,5"])    return DeviceTypeIPad;
    if ([deviceString isEqualToString:@"iPad3,6"])    return DeviceTypeIPad;
    
    //
    if ([deviceString isEqualToString:@"iPad4,1"])    return DeviceTypeIPad;
    if ([deviceString isEqualToString:@"iPad4,1"])    return DeviceTypeIPad;
    if ([deviceString isEqualToString:@"iPad4,1"])    return DeviceTypeIPad;
    
    //
    return DeviceTypeUnknown;
}


+ (NSString*)getDeviceInfo{
    
    // 需要#import "sys/utsname.h"
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"4S";
    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"5";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"5";
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"5C";
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"5C";
    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"5S";
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"5S";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"6P";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"6S";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"6SP";
    if ([deviceString isEqualToString:@"iPhone8,4"])    return @"SE";
    if ([deviceString isEqualToString:@"iPhone9,1"])    return @"7";
    if ([deviceString isEqualToString:@"iPhone9.2"])    return @"7P";
    //
    if ([deviceString isEqualToString:@"iPad3,1"])    return @"iPad3";
    if ([deviceString isEqualToString:@"iPad3,2"])    return @"iPad3";
    if ([deviceString isEqualToString:@"iPad3,3"])    return @"iPad3";
    
    //
    if ([deviceString isEqualToString:@"iPad3,4"])    return @"iPad4";
    if ([deviceString isEqualToString:@"iPad3,5"])    return @"iPad4";
    if ([deviceString isEqualToString:@"iPad3,6"])    return @"iPad4";
    
    //
    if ([deviceString isEqualToString:@"iPad4,1"])    return @"iPadAir";
    if ([deviceString isEqualToString:@"iPad4,1"])    return @"iPadAir";
    if ([deviceString isEqualToString:@"iPad4,1"])    return @"iPadAir";
    
    //
    return @"other";
}



+ (BOOL)checkPhoneNum:(NSString *)phoneNumber{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188 (147 178)
     * 联通：130,131,132,152,155,156,185,186 (145 176)
     * 电信：133,1349,153,180,189 (177 181)
     */
    NSString * MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|7[678]|8[0125-9])\\d{8}$";;
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         
     */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|4[7]|5[017-9]|7[8]|8[123478])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         
     */
    NSString * CU = @"^1(3[0-2]|4[5]|5[256]|7[6]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         
     */
    NSString * CT = @"^1((33|53|8[019])[0-9]|349|77)\\d{7}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:phoneNumber] == YES)
        || ([regextestcm  evaluateWithObject:phoneNumber] == YES)
        || ([regextestct  evaluateWithObject:phoneNumber] == YES)
        || ([regextestcu  evaluateWithObject:phoneNumber] == YES)){
        return YES;
    }
    else{
        return NO;
    }
}


+ (BOOL)checkEmail:(NSString *)email{
    NSString *pEmailCheck = @"[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+[A-Za-z]{2,4}";
    NSPredicate *pEmailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pEmailCheck];
    return [pEmailTest evaluateWithObject:email];
}

+ (BOOL)checkIDCardNumber:(NSString *)IDCardNumber{
    return YES;
}

+ (BOOL)checkCarID:(NSString *)carID{
    
    if (carID.length != 7) {
        return NO;
    }
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-hj-zA-HJ-Z]{1}[a-hj-zA-HJ-Z_0-9]{4}[a-hj-zA-HJ-Z_0-9_\u4e00-\u9fa5]$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    return [carTest evaluateWithObject:carID];
    
    return YES;
}

@end
