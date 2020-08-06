Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35D9B23D72E
	for <lists+linux-mips@lfdr.de>; Thu,  6 Aug 2020 09:09:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728475AbgHFHJR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 6 Aug 2020 03:09:17 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47006 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728443AbgHFHJQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 6 Aug 2020 03:09:16 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP9yNrCtfsTgFAA--.866S2;
        Thu, 06 Aug 2020 15:09:05 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Introduce cmdline argument writecombine=
Date:   Thu,  6 Aug 2020 15:09:01 +0800
Message-Id: <1596697741-3561-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxP9yNrCtfsTgFAA--.866S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGFWUGFyrtw1ftr47CF48JFb_yoW5XrW7pF
        4qk3Z7Gr4Fgw1vyF9xAr1jgrW5Zrn5AFZxJr4UCw18Zas0qr4kKFnaqrWaqF48XFyxJa48
        tFWruFyUKw1Iy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUyqb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
        C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F
        4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF
        x2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
        v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
        67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2
        IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
        xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUy75rDUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Loongson processors have a writecombine issue that maybe failed to
write back framebuffer used with ATI Radeon or AMD GPU at times,
after commit 8a08e50cee66 ("drm: Permit video-buffers writecombine
mapping for MIPS"), there exists some errors such as blurred screen
and lockup, and so on.

With this patch, disable writecombine by default for Loongson64 to
work well with ATI Radeon or AMD GPU, and it has no influence on the
other platforms due to writecombine is enabled by default.

Additionally, if it is necessary, writecombine=on can be set manually
in the cmdline to enhance the performance for Loongson LS7A integrated
graphics in the future.

[   60.958721] radeon 0000:03:00.0: ring 0 stalled for more than 10079msec
[   60.965315] radeon 0000:03:00.0: GPU lockup (current fence id 0x0000000000000112 last fence id 0x000000000000011d on ring 0)
[   60.976525] radeon 0000:03:00.0: ring 3 stalled for more than 10086msec
[   60.983156] radeon 0000:03:00.0: GPU lockup (current fence id 0x0000000000000374 last fence id 0x00000000000003a8 on ring 3)

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/include/asm/pgtable.h |  4 ++++
 arch/mips/kernel/cpu-probe.c    | 19 +++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index dd7a0f5..34869f7 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -473,6 +473,10 @@ static inline pgprot_t pgprot_noncached(pgprot_t _prot)
 static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
 {
 	unsigned long prot = pgprot_val(_prot);
+	extern bool mips_writecombine;
+
+	if (!mips_writecombine)
+		return pgprot_noncached(_prot);
 
 	/* cpu_data[0].writecombine is already shifted by _CACHE_SHIFT */
 	prot = (prot & ~_CACHE_MASK) | cpu_data[0].writecombine;
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index e2955f1..98777ca 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -459,6 +459,25 @@ static int __init ftlb_disable(char *s)
 
 __setup("noftlb", ftlb_disable);
 
+#ifdef CONFIG_MACH_LOONGSON64
+bool mips_writecombine; /* initialise to false by default */
+#else
+bool mips_writecombine = true;
+#endif
+EXPORT_SYMBOL(mips_writecombine);
+
+static int __init writecombine_setup(char *str)
+{
+	if (strcmp(str, "on") == 0)
+		mips_writecombine = true;
+	else if (strcmp(str, "off") == 0)
+		mips_writecombine = false;
+
+	return 1;
+}
+
+__setup("writecombine=", writecombine_setup);
+
 /*
  * Check if the CPU has per tc perf counters
  */
-- 
2.1.0

