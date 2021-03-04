Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91B5032C9F3
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 02:20:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232593AbhCDBQ5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Mar 2021 20:16:57 -0500
Received: from mail.loongson.cn ([114.242.206.163]:37894 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232727AbhCDBQl (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Mar 2021 20:16:41 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz_HBNEBgqhQUAA--.8724S2;
        Thu, 04 Mar 2021 09:15:45 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH] MIPS: Add comment about CONFIG_MIPS32_O32 in loongson3_defconfig when build with Clang
Date:   Thu,  4 Mar 2021 09:15:44 +0800
Message-Id: <1614820544-10686-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxz_HBNEBgqhQUAA--.8724S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr4rtr17JF4kKF1rWry8Zrb_yoW8XFyfpw
        48Ja1DKrWrGr1rGF4kuryDWr4FyFZxJFyxXw4UJr15ZasxZayUZrnakF17ZrW7WrZaya18
        urZ3Gr17Jay7C3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
        WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK
        6w4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
        WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
        7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
        1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4U
        MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbLiSPUUUU
        U==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When build kernel with Clang [1]:

$ make CC=clang loongson3_defconfig
$ make CC=clang

there exists the following error:

  Checking missing-syscalls for O32
  CALL    scripts/checksyscalls.sh
error: ABI 'o32' is not supported on CPU 'mips64r2'
make[1]: *** [Kbuild:48: missing-syscalls] Error 1
make: *** [arch/mips/Makefile:419: archprepare] Error 2

This is a known bug [2] with Clang, as Simon Atanasyan said,
"There is no plan on support O32 for MIPS64 due to lack of
resources".

It is not a good idea to remove this config due to GCC works
well, so add comment to point out this bug and suggest the
users to remove CONFIG_MIPS32_O32=y in defconfig when build
kernel with Clang.

[1] https://www.kernel.org/doc/html/latest/kbuild/llvm.html
[2] https://bugs.llvm.org/show_bug.cgi?id=38063

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/configs/loongson3_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index 0e79f81..cacf9dd 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -35,6 +35,9 @@ CONFIG_NUMA=y
 CONFIG_SMP=y
 CONFIG_HZ_256=y
 CONFIG_KEXEC=y
+# Please remove CONFIG_MIPS32_O32=y when build with Clang
+# due to "ABI 'o32' is not supported on CPU 'mips64r2'",
+# https://bugs.llvm.org/show_bug.cgi?id=38063
 CONFIG_MIPS32_O32=y
 CONFIG_MIPS32_N32=y
 CONFIG_VIRTUALIZATION=y
-- 
2.1.0

