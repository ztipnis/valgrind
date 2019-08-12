//
//  darwin_kernel.cpp
//  darwin-kernel
//
//  Created by Zachary Tipnis on 8/9/19.
//  Copyright © 2019 Zachary Tipnis. All rights reserved.
//

#include "darwin_kernel.hpp"

void mach_msg_destroy(mach_msg_header_t *msg){
    mach_msg_destroy_from_kernel_proper(msg);
}
