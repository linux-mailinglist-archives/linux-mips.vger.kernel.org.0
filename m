Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 967F62B3C4E
	for <lists+linux-mips@lfdr.de>; Mon, 16 Nov 2020 06:03:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725814AbgKPFDL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Nov 2020 00:03:11 -0500
Received: from mail.loongson.cn ([114.242.206.163]:47336 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725300AbgKPFDK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 16 Nov 2020 00:03:10 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxetAGCLJf4bQPAA--.24654S2;
        Mon, 16 Nov 2020 13:03:02 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [RFC PATCH] MIPS: Kconfig: Select ARCH_WANT_FRAME_POINTERS
Date:   Mon, 16 Nov 2020 13:03:00 +0800
Message-Id: <1605502980-31946-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9AxetAGCLJf4bQPAA--.24654S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFWrAFW3KF4UWF43uryrXrb_yoW8CFWUpw
        s0k3WDKrW8Way8KF48ArW8ury5X3s3GrW3CFs7t345A3Z5uasYqrnaqF1UWFy2gr1ktay8
        XF9a934jqF4vk3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
        1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8
        WwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
        1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
        64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
        0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
        IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUeHUDDUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Select ARCH_WANT_FRAME_POINTERS to fix the following build error under
CONFIG_DEBUG_ATOMIC_SLEEP:

  CC      arch/mips/kernel/signal.o
{standard input}: Assembler messages:
{standard input}:1775: Error: Unable to parse register name $fp
scripts/Makefile.build:283: recipe for target 'arch/mips/kernel/signal.o' failed
make[2]: *** [arch/mips/kernel/signal.o] Error 1
scripts/Makefile.build:500: recipe for target 'arch/mips/kernel' failed
make[1]: *** [arch/mips/kernel] Error 2
Makefile:1799: recipe for target 'arch/mips' failed
make: *** [arch/mips] Error 2

I think it is useful to get debugging information as described in the
following texts:

lib/Kconfig.debug
config FRAME_POINTER
        bool "Compile the kernel with frame pointers"
        ...
        default y if (DEBUG_INFO && UML) || ARCH_WANT_FRAME_POINTERS
        help
          If you say Y here the resulting kernel image will be slightly
          larger and slower, but it gives very useful debugging information
          in case of kernel bugs. (precise oopses/stacktraces/warnings)

Documentation/dev-tools/kgdb.rst
This option inserts code to into the compiled executable which saves
the frame information in registers or on the stack at different points
which allows a debugger such as gdb to more accurately construct stack
back traces while debugging the kernel.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ddaff19..4a4c791 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -15,6 +15,7 @@ config MIPS
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
+	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select BUILDTIME_TABLE_SORT
 	select CLONE_BACKWARDS
-- 
2.1.0

