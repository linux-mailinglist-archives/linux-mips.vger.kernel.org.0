Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1752CD055
	for <lists+linux-mips@lfdr.de>; Thu,  3 Dec 2020 08:25:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387933AbgLCHYP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Dec 2020 02:24:15 -0500
Received: from mail.loongson.cn ([114.242.206.163]:39074 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729856AbgLCHYP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 3 Dec 2020 02:24:15 -0500
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxKtFPkshfIVYZAA--.48637S2;
        Thu, 03 Dec 2020 15:22:56 +0800 (CST)
From:   Xingxing Su <suxingxing@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Youling Tang <tangyouling@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Enable GCOV
Date:   Thu,  3 Dec 2020 15:22:51 +0800
Message-Id: <1606980171-9536-1-git-send-email-suxingxing@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9AxKtFPkshfIVYZAA--.48637S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFW7JryfCF47CFyUWw18AFb_yoW8Zw17pa
        1vk348tw4kWr4kJF48Z3y8Wr1aqr95trWUJF4qk34UXasIgF95XrySqrn3XryUXrs5t395
        C395W3ZrJry0yaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r4x
        MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
        0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
        wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
        W8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
        IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU0SoGDUUUU
X-CM-SenderInfo: pvx0x0xj0l0wo6or00hjvr0hdfq/1tbiAQATC13QvMtQUwAAsg
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Enable gcov profiling of the entire kernel on mips. Required changes
include disabling profiling for:

* arch/kernel/boot/compressed: not linked to main kernel.

Lightly tested on Loongson 3A3000 an 3A4000, seems to work as expected.

without "GCOV_PROFILE := n" in compressed Makefile,
build errors as follows:
...
ld: arch/mips/boot/compressed/string.o:(.data+0x88):
 undefined reference to `__gcov_merge_add'
ld: arch/mips/boot/compressed/string.o:
 in function `_GLOBAL__sub_I_00100_0_memcpy':
string.c:(.text.startup+0x4): undefined reference to `__gcov_init'
ld: arch/mips/boot/compressed/string.o:
 in function `_GLOBAL__sub_D_00100_1_memcpy':
string.c:(.text.exit+0x0): undefined reference to `__gcov_exit'
...

Signed-off-by: Youling Tang <tangyouling@loongson.cn>
Signed-off-by: Xingxing Su <suxingxing@loongson.cn>
---
 arch/mips/Kconfig                  | 1 +
 arch/mips/boot/compressed/Makefile | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 2000bb2..52664a30 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -9,6 +9,7 @@ config MIPS
 	select ARCH_HAS_PTE_SPECIAL if !(32BIT && CPU_HAS_RIXI)
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
+	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_SUPPORTS_UPROBES
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
index d665118..405b47a 100644
--- a/arch/mips/boot/compressed/Makefile
+++ b/arch/mips/boot/compressed/Makefile
@@ -36,6 +36,7 @@ KBUILD_AFLAGS := $(KBUILD_AFLAGS) -D__ASSEMBLY__ \
 
 # Prevents link failures: __sanitizer_cov_trace_pc() is not linked in.
 KCOV_INSTRUMENT		:= n
+GCOV_PROFILE := n
 
 # decompressor objects (linked with vmlinuz)
 vmlinuzobjs-y := $(obj)/head.o $(obj)/decompress.o $(obj)/string.o
-- 
2.1.0

