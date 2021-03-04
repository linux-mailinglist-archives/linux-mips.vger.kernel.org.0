Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6E6F32CE17
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 09:08:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235368AbhCDIFR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Mar 2021 03:05:17 -0500
Received: from mail.loongson.cn ([114.242.206.163]:44336 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235412AbhCDIFA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 4 Mar 2021 03:05:00 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr_BwlEBgYTwUAA--.9025S2;
        Thu, 04 Mar 2021 16:04:01 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v3] MIPS: Make MIPS32_O32 depends on !CC_IS_CLANG
Date:   Thu,  4 Mar 2021 16:04:00 +0800
Message-Id: <1614845040-12995-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxr_BwlEBgYTwUAA--.9025S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr4rtr17JF4kKF1rWry8Zrb_yoW8XF1rp3
        ykKa1DKrs8GFyrJFWkWrykWr1av3ykJayFvF9ayw17ZasrZa409r1SkF1IvFW7Ars2qay0
        grZ3W347JayjyFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8
        ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
        1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
        64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
        0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4U
        MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUSeHgUUU
        UU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When building with Clang [1]:

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

It is not a good idea to remove CONFIG_MIPS32_O32=y directly
in defconfig because GCC works, as Nathan said, the config
should not even be selectable when building with Clang, so
just make MIPS32_O32 depends on !CC_IS_CLANG.

[1] https://www.kernel.org/doc/html/latest/kbuild/llvm.html
[2] https://bugs.llvm.org/show_bug.cgi?id=38063

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Acked-by: Nathan Chancellor <nathan@kernel.org>
---

v3: Update the commit message suggested by Nathan, thank you!

 arch/mips/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 3a38d27..f6ba59f 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -3318,6 +3318,8 @@ config SYSVIPC_COMPAT
 config MIPS32_O32
 	bool "Kernel support for o32 binaries"
 	depends on 64BIT
+	# https://bugs.llvm.org/show_bug.cgi?id=38063
+	depends on !CC_IS_CLANG
 	select ARCH_WANT_OLD_COMPAT_IPC
 	select COMPAT
 	select MIPS32_COMPAT
-- 
2.1.0

