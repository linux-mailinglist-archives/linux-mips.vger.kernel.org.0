Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 728692B8A19
	for <lists+linux-mips@lfdr.de>; Thu, 19 Nov 2020 03:30:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726503AbgKSC3V (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 18 Nov 2020 21:29:21 -0500
Received: from mail.loongson.cn ([114.242.206.163]:52812 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726163AbgKSC3U (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 18 Nov 2020 21:29:20 -0500
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxytF62LVfImASAA--.42816S3;
        Thu, 19 Nov 2020 10:29:15 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] MIPS: Loongson64: Add KASLR support
Date:   Thu, 19 Nov 2020 10:29:13 +0800
Message-Id: <1605752954-10368-2-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1605752954-10368-1-git-send-email-hejinyang@loongson.cn>
References: <1605752954-10368-1-git-send-email-hejinyang@loongson.cn>
X-CM-TRANSID: AQAAf9AxytF62LVfImASAA--.42816S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww4DurWxKrW8XF43CF4DJwb_yoW8XF1xpw
        4vy3Z3GrWUuF1YyrW3AryUur43Ja93Ja97ZF4jka4UXasIva43Zrn3trnxAryjyr48Jw1r
        uryFgFW7WFWIkaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBIb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
        8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_Jrv_JF4l8cAvFVAK0II2c7xJM28CjxkF
        64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcV
        CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280
        aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64
        kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm
        72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6r4UMxAIw28Icx
        kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
        xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42
        IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY
        6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aV
        CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8pyxtUUUUU==
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Provide null return plat_get_fdt(). Loongson64 start supporting KASLR.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/Kconfig            | 4 +++-
 arch/mips/loongson64/setup.c | 7 +++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 0f638bf..1508829 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -488,6 +488,7 @@ config MACH_LOONGSON64
 	select SYS_SUPPORTS_HIGHMEM
 	select SYS_SUPPORTS_LITTLE_ENDIAN
 	select SYS_SUPPORTS_ZBOOT
+	select SYS_SUPPORTS_RELOCATABLE
 	select ZONE_DMA32
 	select NUMA
 	select SMP
@@ -2778,7 +2779,8 @@ config RELOCATABLE
 	depends on CPU_MIPS32_R2 || CPU_MIPS64_R2 || \
 		   CPU_MIPS32_R5 || CPU_MIPS64_R5 || \
 		   CPU_MIPS32_R6 || CPU_MIPS64_R6 || \
-		   CPU_P5600 || CAVIUM_OCTEON_SOC
+		   CPU_P5600 || CAVIUM_OCTEON_SOC || \
+		   CPU_LOONGSON64
 	help
 	  This builds a kernel image that retains relocation information
 	  so it can be loaded someplace besides the default 1MB.
diff --git a/arch/mips/loongson64/setup.c b/arch/mips/loongson64/setup.c
index 6fe3fff..5a5b745 100644
--- a/arch/mips/loongson64/setup.c
+++ b/arch/mips/loongson64/setup.c
@@ -31,6 +31,13 @@ static void wbflush_loongson(void)
 void (*__wbflush)(void) = wbflush_loongson;
 EXPORT_SYMBOL(__wbflush);
 
+#ifdef CONFIG_RELOCATABLE
+void __init *plat_get_fdt(void)
+{
+		return NULL;
+}
+#endif
+
 void __init plat_mem_setup(void)
 {
 	if (loongson_fdt_blob)
-- 
2.1.0

