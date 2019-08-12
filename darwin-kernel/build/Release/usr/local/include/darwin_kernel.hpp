//
//  darwin_kernel.hpp
//  darwin-kernel
//
//  Created by Zachary Tipnis on 8/9/19.
//  Copyright © 2019 Zachary Tipnis. All rights reserved.
//

#ifndef darwin_kernel_
#define darwin_kernel_

/* The classes below are exported */
#pragma GCC visibility push(default)

#include <Kernel/kern/ipc_mig.h>
void proxy_mach_msg_destroy(mach_msg_header_t *msg);

#pragma GCC visibility pop
#endif
