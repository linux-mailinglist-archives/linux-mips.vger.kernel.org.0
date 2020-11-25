Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E80502C3D3B
	for <lists+linux-mips@lfdr.de>; Wed, 25 Nov 2020 11:09:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728857AbgKYKHw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Nov 2020 05:07:52 -0500
Received: from mail.loongson.cn ([114.242.206.163]:38688 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726190AbgKYKHw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 25 Nov 2020 05:07:52 -0500
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxKtHyLL5fm38WAA--.43449S2;
        Wed, 25 Nov 2020 18:07:47 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] MIPS: Loongson64: Add KASLR support
Date:   Wed, 25 Nov 2020 18:07:46 +0800
Message-Id: <1606298866-7086-1-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9AxKtHyLL5fm38WAA--.43449S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGFWUury5Cw18AFWUKFWDCFg_yoW5XrWkpr
        4ayw1kGw4UXF4rGrW5Za48Wry3CasYq3y3uFWDtw1ruasIv3WYyrnFqr1fXry0qF4ktw4f
        Wr98KFWUt3WFvaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkFb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
        C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVAFwVW8twCF04k2
        0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIx
        AIcVCF04k26cxKx2IYs7xG6r4j6FyUMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
        jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07brVysUUUUU=
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Provide a weak plat_get_fdt() in relocate.c in case some platform enable
USE_OF while plat_get_fdt() is useless.

1MB RELOCATION_TABLE_SIZE is small for Loongson64 because too many
instructions should be relocated. 2MB is enough in present.

Add KASLR support for Loongson64.

KASLR(kernel address space layout randomization)

To enable KASLR on Loongson64:
First, make loongson3_defconfig.
Then, enable CONFIG_RELOCATABLE and CONFIG_RANDOMIZE_BASE.
Finally, compile the kernel.

To test KASLR on Loongson64:
Start machine with KASLR kernel.

The first time:
# cat /proc/iomem
00200000-0effffff : System RAM
  02f30000-03895e9f : Kernel code
  03895ea0-03bc7fff : Kernel data
  03e30000-04f43f7f : Kernel bss

The second time:
# cat /proc/iomem
00200000-0effffff : System RAM
  022f0000-02c55e9f : Kernel code
  02c55ea0-02f87fff : Kernel data
  031f0000-04303f7f : Kernel bss

We see that code, data and bss sections become randomize.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---

v2:
- Define weak plat_get_fdt() in relocate.c
- Add default RELOCATION_TABLE_SIZE for Loongson64

 arch/mips/Kconfig           | 5 ++++-
 arch/mips/kernel/relocate.c | 7 +++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 0f638bf..44a47ad 100644
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
@@ -2789,6 +2791,7 @@ config RELOCATION_TABLE_SIZE
 	hex "Relocation table size"
 	depends on RELOCATABLE
 	range 0x0 0x01000000
+	default "0x00200000" if CPU_LOONGSON64
 	default "0x00100000"
 	help
 	  A table of relocation data will be appended to the kernel binary
diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
index 8561c7a..57bdd276 100644
--- a/arch/mips/kernel/relocate.c
+++ b/arch/mips/kernel/relocate.c
@@ -294,6 +294,13 @@ static inline int __init relocation_addr_valid(void *loc_new)
 	return 1;
 }
 
+#if defined(CONFIG_USE_OF)
+void __weak *plat_get_fdt(void)
+{
+	return NULL;
+}
+#endif
+
 void *__init relocate_kernel(void)
 {
 	void *loc_new;
-- 
2.1.0

