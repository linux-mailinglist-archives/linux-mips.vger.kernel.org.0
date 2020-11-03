Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF6652A3AE7
	for <lists+linux-mips@lfdr.de>; Tue,  3 Nov 2020 04:15:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725974AbgKCDPN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Nov 2020 22:15:13 -0500
Received: from mail.loongson.cn ([114.242.206.163]:47016 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725968AbgKCDPN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 2 Nov 2020 22:15:13 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx7387y6BfU3sEAA--.3657S3;
        Tue, 03 Nov 2020 11:15:08 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v2 1/6] MIPS: Loongson64: Do not write the read only field LPA of CP0_CONFIG3
Date:   Tue,  3 Nov 2020 11:15:01 +0800
Message-Id: <1604373306-3599-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1604373306-3599-1-git-send-email-yangtiezhu@loongson.cn>
References: <1604373306-3599-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dx7387y6BfU3sEAA--.3657S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF1rXry7ury7JrW5uw1DAwb_yoW8Ar43pa
        n5A3WkGr45Ww1UuFn5CryUurWrJr93KrW2vanFgrykXasxK342qr1ft3W8JFyrXa95K3Wx
        Wr9Y9r4jqanrG3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxd
        M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
        v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
        F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8GwCF04
        k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
        MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr4
        1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
        IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
        A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU2tCcUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The field LPA of CP0_CONFIG3 register is read only for Loongson64, so the
write operations are meaningless, remove them.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

v2: No changes

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

