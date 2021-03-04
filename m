Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADF8B32CCB8
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 07:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbhCDGUl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Mar 2021 01:20:41 -0500
Received: from mail.loongson.cn ([114.242.206.163]:47486 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235121AbhCDGUg (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 4 Mar 2021 01:20:36 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx7_H6e0BgdDIUAA--.8807S2;
        Thu, 04 Mar 2021 14:19:39 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v2] MIPS: Make MIPS32_O32 depends on !CC_IS_CLANG
Date:   Thu,  4 Mar 2021 14:19:38 +0800
Message-Id: <1614838778-3696-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dx7_H6e0BgdDIUAA--.8807S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr4rtr17JF4kKF1rWry8Zrb_yoW8GF4xp3
        yvka1kKrs8Gr1rGFWkWrykWr12v3s5JayFqasakw12vasxZa4kZr1Ska4xZFW7Ars2vay8
        WFZ3Wry7JayUCFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GF1l
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
        4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU-J5rUUUUU=
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

It is not a good idea to remove CONFIG_MIPS32_O32=y directly
in defconfig due to GCC works well, as Nathan said, the config
should not even be selectable when build kernel with Clang, so
just make MIPS32_O32 depends on !CC_IS_CLANG.

[1] https://www.kernel.org/doc/html/latest/kbuild/llvm.html
[2] https://bugs.llvm.org/show_bug.cgi?id=38063

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
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

