//
//  ObjCHelper.m
//  reddot
//
//  Created by Soongyu Kwon on 9/12/22, and edited by Yurii Anokhin. Thanks some source code from him. :)
//

#import "ObjCHelper.h"

#pragma clang diagnostic ignored "-Wincomplete-implementation"
@implementation ObjCHelper

- (void)imageToCPBitmap:(UIImage *)img path:(NSString *)path {
    [img writeToCPBitmapFile:path flags:1];
}

- (void)GenerateBlankImage {
    NSString* path = @"/var/mobile/Library/Caches/TelephonyUI-8/en-0---white.png";
    NSString* path1 = @"/var/mobile/Library/Caches/TelephonyUI-8/en-1---white.png";
    NSString* path2 = @"/var/mobile/Library/Caches/TelephonyUI-8/en-2-A B C--white.png";
    NSString* path3 = @"/var/mobile/Library/Caches/TelephonyUI-8/en-3-D E F--white.png";
    NSString* path4 = @"/var/mobile/Library/Caches/TelephonyUI-8/en-4-G H I--white.png";
    NSString* path5 = @"/var/mobile/Library/Caches/TelephonyUI-8/en-5-J K L--white.png";
    NSString* path6 = @"/var/mobile/Library/Caches/TelephonyUI-8/en-6-M N O--white.png";
    NSString* path7 = @"/var/mobile/Library/Caches/TelephonyUI-8/en-7-P Q R S--white.png";
    NSString* path8 = @"/var/mobile/Library/Caches/TelephonyUI-8/en-8-T U V--white.png";
    NSString* path9 = @"/var/mobile/Library/Caches/TelephonyUI-8/en-9-W X Y Z--white.png";
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(170, 170), NO, 0.0);
    UIImage *blankImage = UIGraphicsGetImageFromCurrentImageContext();
    NSData *blankImageData = UIImagePNGRepresentation(blankImage);
    UIGraphicsEndImageContext();
    [fileManager createFileAtPath:path contents:blankImageData attributes:nil];
    [fileManager createFileAtPath:path1 contents:blankImageData attributes:nil];
    [fileManager createFileAtPath:path2 contents:blankImageData attributes:nil];
    [fileManager createFileAtPath:path3 contents:blankImageData attributes:nil];
    [fileManager createFileAtPath:path4 contents:blankImageData attributes:nil];
    [fileManager createFileAtPath:path5 contents:blankImageData attributes:nil];
    [fileManager createFileAtPath:path6 contents:blankImageData attributes:nil];
    [fileManager createFileAtPath:path7 contents:blankImageData attributes:nil];
    [fileManager createFileAtPath:path8 contents:blankImageData attributes:nil];
    [fileManager createFileAtPath:path9 contents:blankImageData attributes:nil];
}

- (void)GenerateBlankImageNotEnglish {
    NSString* path = @"/var/mobile/Library/Caches/TelephonyUI-8/other-0---white.png";
    NSString* path1 = @"/var/mobile/Library/Caches/TelephonyUI-8/other-1---white.png";
    NSString* path2 = @"/var/mobile/Library/Caches/TelephonyUI-8/other-2-A B C--white.png";
    NSString* path3 = @"/var/mobile/Library/Caches/TelephonyUI-8/other-3-D E F--white.png";
    NSString* path4 = @"/var/mobile/Library/Caches/TelephonyUI-8/other-4-G H I--white.png";
    NSString* path5 = @"/var/mobile/Library/Caches/TelephonyUI-8/other-5-J K L--white.png";
    NSString* path6 = @"/var/mobile/Library/Caches/TelephonyUI-8/other-6-M N O--white.png";
    NSString* path7 = @"/var/mobile/Library/Caches/TelephonyUI-8/other-7-P Q R S--white.png";
    NSString* path8 = @"/var/mobile/Library/Caches/TelephonyUI-8/other-8-T U V--white.png";
    NSString* path9 = @"/var/mobile/Library/Caches/TelephonyUI-8/other-9-W X Y Z--white.png";
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(170, 170), NO, 0.0);
    UIImage *blankImage = UIGraphicsGetImageFromCurrentImageContext();
    NSData *blankImageData = UIImagePNGRepresentation(blankImage);
    UIGraphicsEndImageContext();
    [fileManager createFileAtPath:path contents:blankImageData attributes:nil];
    [fileManager createFileAtPath:path1 contents:blankImageData attributes:nil];
    [fileManager createFileAtPath:path2 contents:blankImageData attributes:nil];
    [fileManager createFileAtPath:path3 contents:blankImageData attributes:nil];
    [fileManager createFileAtPath:path4 contents:blankImageData attributes:nil];
    [fileManager createFileAtPath:path5 contents:blankImageData attributes:nil];
    [fileManager createFileAtPath:path6 contents:blankImageData attributes:nil];
    [fileManager createFileAtPath:path7 contents:blankImageData attributes:nil];
    [fileManager createFileAtPath:path8 contents:blankImageData attributes:nil];
    [fileManager createFileAtPath:path9 contents:blankImageData attributes:nil];
}

@end
