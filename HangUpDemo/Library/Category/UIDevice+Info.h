//
//  UIDevice+Info.h
//  HangUpDemo
//
//  Created by 1084-Wangcl-Mac on 2022/11/11.
//  Copyright © 2022 Charles. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (Info)

+ (NSString *)jk_platform;
+ (NSString *)jk_platformString;
+ (NSString *)jk_macAddress;

/// Return the current device CPU frequency
+ (NSUInteger)jk_cpuFrequency;
/// Return the current device BUS frequency
+ (NSUInteger)jk_busFrequency;
/// current device RAM size
+ (NSUInteger)jk_ramSize;
/// Return the current device CPU number
+ (NSUInteger)jk_cpuNumber;

/// 获取iOS系统的版本号
+ (NSString *)jk_systemVersion;
/// 获取手机内存总量, 返回的是字节数
+ (NSUInteger)jk_totalMemoryBytes;
/// 获取手机可用内存, 返回的是字节数
+ (NSUInteger)jk_freeMemoryBytes;

/// 判断当前系统是否有摄像头
+ (BOOL)jk_hasCamera;
/// 获取手机硬盘空闲空间, 返回的是字节数
+ (long long)jk_freeDiskSpaceBytes;
/// 获取手机硬盘总空间, 返回的是字节数
+ (long long)jk_totalDiskSpaceBytes;

@end

NS_ASSUME_NONNULL_END
