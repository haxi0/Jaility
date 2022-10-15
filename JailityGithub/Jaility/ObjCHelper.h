
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
- (void)GenerateBlankImageMask;
@end

NS_ASSUME_NONNULL_END
