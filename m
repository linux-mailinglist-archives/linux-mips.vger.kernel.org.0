Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A1652A3D56
	for <lists+linux-mips@lfdr.de>; Tue,  3 Nov 2020 08:13:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbgKCHMe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Nov 2020 02:12:34 -0500
Received: from mail.loongson.cn ([114.242.206.163]:37242 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725988AbgKCHMN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 3 Nov 2020 02:12:13 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx79PGAqFfIKEEAA--.12977S3;
        Tue, 03 Nov 2020 15:12:06 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v3 1/6] MIPS: Loongson64: Do not write the read only field LPA of CP0_CONFIG3
Date:   Tue,  3 Nov 2020 15:12:00 +0800
Message-Id: <1604387525-23400-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1604387525-23400-1-git-send-email-yangtiezhu@loongson.cn>
References: <1604387525-23400-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dx79PGAqFfIKEEAA--.12977S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF1rXr4DKw4kCry3CFW7Jwb_yoW8AryDpa
        n5A3WkGr45Ww1UuFn5CryUurWrJr93KrW2vanFgrykXasxK342qw1ft3W8JFyrXa95K3Wf
        Wr9Y9r4jqanrC3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
        ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUGVWUXwAv7VCY1x0262k0Y48FwI0_Jr0_Gr1lYx0Ex4A2jsIE14v26r4j6F4U
        McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I64
        8v4I1lc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4U
        MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
        AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
        80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
        43ZEXa7VUjo5l5UUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The field LPA of CP0_CONFIG3 register is read only for Loongson64, so the
write operations are meaningless, remove them.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

v2: No changes
v3: No changes

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

