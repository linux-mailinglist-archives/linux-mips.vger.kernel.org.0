Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A1FA29E5AF
	for <lists+linux-mips@lfdr.de>; Thu, 29 Oct 2020 09:05:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727648AbgJ2IEy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 29 Oct 2020 04:04:54 -0400
Received: from mail.loongson.cn ([114.242.206.163]:58386 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726449AbgJ2ID2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 29 Oct 2020 04:03:28 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_9JJd5pfmHcCAA--.10240S3;
        Thu, 29 Oct 2020 16:03:22 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH 1/6] MIPS: Loongson64: Do not write the read only field LPA of CP0_CONFIG3
Date:   Thu, 29 Oct 2020 16:02:56 +0800
Message-Id: <1603958581-4723-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1603958581-4723-1-git-send-email-yangtiezhu@loongson.cn>
References: <1603958581-4723-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dx_9JJd5pfmHcCAA--.10240S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF1rXry7ury7JrW5uw1DAwb_yoW8Ar17pa
        n3A3Z5Gr45Ww1UuFn5CryUurWrJrZ3KrW2vanFgrykXasxK342gr1ft3W8JF95Xa95Ka1f
        Wr9Y9r4jqanrG3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBS14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GFyl42xK82
        IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
        0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMI
        IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
        0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
        Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU00PSUUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The field LPA of CP0_CONFIG3 register is read only for Loongson64, so the
write operations are meaningless, remove them.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/include/asm/mach-loongson64/kernel-entry-init.h | 8 --------
 arch/mips/loongson64/numa.c                               | 3 ---
 2 files changed, 11 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h b/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
index 87a5bfb..e4d77f4 100644
--- a/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
+++ b/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
@@ -19,10 +19,6 @@
 	.macro	kernel_entry_setup
 	.set	push
 	.set	mips64
-	/* Set LPA on LOONGSON3 config3 */
-	mfc0	t0, CP0_CONFIG3
-	or	t0, (0x1 << 7)
-	mtc0	t0, CP0_CONFIG3
 	/* Set ELPA on LOONGSON3 pagegrain */
 	mfc0	t0, CP0_PAGEGRAIN
 	or	t0, (0x1 << 29)
@@ -54,10 +50,6 @@
 	.macro	smp_slave_setup
 	.set	push
 	.set	mips64
-	/* Set LPA on LOONGSON3 config3 */
-	mfc0	t0, CP0_CONFIG3
-	or	t0, (0x1 << 7)
-	mtc0	t0, CP0_CONFIG3
 	/* Set ELPA on LOONGSON3 pagegrain */
 	mfc0	t0, CP0_PAGEGRAIN
 	or	t0, (0x1 << 29)
diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
index cf9459f..c7e3cced 100644
--- a/arch/mips/loongson64/numa.c
+++ b/arch/mips/loongson64/numa.c
@@ -40,9 +40,6 @@ static void enable_lpa(void)
 	unsigned long value;
 
 	value = __read_32bit_c0_register($16, 3);
-	value |= 0x00000080;
-	__write_32bit_c0_register($16, 3, value);
-	value = __read_32bit_c0_register($16, 3);
 	pr_info("CP0_Config3: CP0 16.3 (0x%lx)\n", value);
 
 	value = __read_32bit_c0_register($5, 1);
-- 
2.1.0

