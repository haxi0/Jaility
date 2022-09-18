//
//  ObjCHelper.h
//  reddot
//
//  Created by Soongyu Kwon on 9/12/22.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <spawn.h>
#import <sys/sysctl.h>

@interface UIImage (Private)

- (BOOL)writeToCPBitmapFile:(NSString *)filename flags:(NSInteger)flags; 

@end

NS_ASSUME_NONNULL_BEGIN

@interface ObjCHelper : NSObject
- (void)imageToCPBitmap:(UIImage *)img path:(NSString *)path;
- (void)GenerateBlankImage;
- (void)GenerateBlankImageNotEnglish;
@end

NS_ASSUME_NONNULL_END
