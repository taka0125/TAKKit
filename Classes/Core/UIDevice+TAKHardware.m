//
//  UIDevice+TAKHardware.m
//  TAKKit
//
//  Created by Takahiro Ooishi
//  Copyright (c) 2014 Takahiro Ooishi. All rights reserved.
//  Released under the MIT license.
//

#import "UIDevice+TAKHardware.h"
#include <sys/types.h>
#include <sys/sysctl.h>

@implementation UIDevice (TAKHardware)

- (NSString *)tak_platform {
  size_t size;
  sysctlbyname("hw.machine", NULL, &size, NULL, 0);
  char *machine = malloc(size);
  sysctlbyname("hw.machine", machine, &size, NULL, 0);
  NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
  free(machine);
  return platform;
}

@end
