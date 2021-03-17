Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF70233E977
	for <lists+linux-mips@lfdr.de>; Wed, 17 Mar 2021 07:00:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbhCQF7c (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Mar 2021 01:59:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbhCQF7Q (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Mar 2021 01:59:16 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E02F1C06174A;
        Tue, 16 Mar 2021 22:59:08 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id o10so237622plg.11;
        Tue, 16 Mar 2021 22:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7kgTgl5Lk4YBTT/f5PQYaTPsw7lPuwKB6cHK7aX5OYo=;
        b=WFndP0xEksylxRu1x0rkdukJzOsVr49B7UZMVr6XrSDxUqwOuRZuhwphw8hFGE+RwZ
         U4O4ftdbJUeu8SCo3ZO/LWuWLosJgUOsLKUwlwUxjzsQVeTsvylN+yG0Xs8x89VFxFcA
         NG6u05wG1Spi0NJWQ3Ap3wg1UPM5bc5WvYd1eazQVu0ihm+NA2GOLqy9mKR2q5im4hsX
         jaiIvTTkkK848Wsh5qd7zeqKBiy1xRYxW+WUo8c+qVylmVJwKw0duZTGtx8l2egQkyUS
         bZFva9DBc+k186UcYy8kcv9iNy3W5HMN1SObCdKA1xSuLwsm5mmTG8TLuc2OckyN78+t
         sIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7kgTgl5Lk4YBTT/f5PQYaTPsw7lPuwKB6cHK7aX5OYo=;
        b=dp3Yc5qDmCYM5m/T+WuwYC1M/udIbCf8GeYH04YQ4NFjQqTdo03tpjc92Vhzigq75s
         vhbrL8unOdt3fLfKs0kMB3RxuR5O6goaQ1q5yzNMaPm3t6vno0LKJNpNva84zQBq2tdj
         rQnKg9jHDiqX95Ig1/b72zsUPadEV57UkefwEvYEFE/OZs0HEClyol6v+pSI6wGP21SG
         gBkslz/BrDKC9t+db5qvv8gN2P7WlFsNg4rihxRTyLBzTIxsYeqOCkJWRXMVugWC5BFe
         7Pt3yAAQm/riWhf1p+VSsPMp7UZtd2djR/Sk48sj6Ht2swP51IlYKOMlK/Jz383W/9dN
         PW3A==
X-Gm-Message-State: AOAM533gP/6y82JxyW//XDpzdNQm6E0q47bYtQVg+T/8cArjJOtrMIQK
        BuCqS5Y3oRXu6t3DddZAZgjrHxR4CWPNb24U
X-Google-Smtp-Source: ABdhPJwsKJU5jbmr5boZZ/qRk4PJh6dB6ozpqqeDldjX/NvpRpi8QwtkjDK9KiW7OyQEhWcyWKRrWw==
X-Received: by 2002:a17:90a:4b8c:: with SMTP id i12mr2810810pjh.76.1615960748099;
        Tue, 16 Mar 2021 22:59:08 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:738f:1000::678])
        by smtp.gmail.com with ESMTPSA id i2sm16952169pgs.82.2021.03.16.22.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 22:59:07 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Crispin <john@phrozen.org>,
        Chuanhong Guo <gch981213@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH] MIPS: ralink: mt7621: add memory detection support
Date:   Tue, 16 Mar 2021 22:59:02 -0700
Message-Id: <20210317055902.506773-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Chuanhong Guo <gch981213@gmail.com>

mt7621 has the following memory map:
0x0-0x1c000000: lower 448m memory
0x1c000000-0x2000000: peripheral registers
0x20000000-0x2400000: higher 64m memory

detect_memory_region in arch/mips/kernel/setup.c only adds the first
memory region and isn't suitable for 512m memory detection because
it may accidentally read the memory area for peripheral registers.

This commit adds memory detection capability for mt7621:
  1. Add the highmem area when 512m is detected.
  2. Guard memcmp from accessing peripheral registers:
     This only happens when a user decided to change kernel load address
     to 256m or higher address. Since this is a quite unusual case, we
     just skip 512m testing and return 256m as memory size.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
[Minor commit message reword, make mt7621_memory_detect static]
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 arch/mips/include/asm/mach-ralink/mt7621.h |  7 +++---
 arch/mips/ralink/common.h                  |  1 +
 arch/mips/ralink/mt7621.c                  | 29 +++++++++++++++++++---
 arch/mips/ralink/of.c                      |  2 ++
 4 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/arch/mips/include/asm/mach-ralink/mt7621.h b/arch/mips/include/asm/mach-ralink/mt7621.h
index e1af1ba50bd8..6bbf082dd149 100644
--- a/arch/mips/include/asm/mach-ralink/mt7621.h
+++ b/arch/mips/include/asm/mach-ralink/mt7621.h
@@ -24,9 +24,10 @@
 #define CHIP_REV_VER_SHIFT		8
 #define CHIP_REV_ECO_MASK		0xf
 
-#define MT7621_DRAM_BASE                0x0
-#define MT7621_DDR2_SIZE_MIN		32
-#define MT7621_DDR2_SIZE_MAX		256
+#define MT7621_LOWMEM_BASE		0x0
+#define MT7621_LOWMEM_MAX_SIZE		0x1C000000
+#define MT7621_HIGHMEM_BASE		0x20000000
+#define MT7621_HIGHMEM_SIZE		0x4000000
 
 #define MT7621_CHIP_NAME0		0x3637544D
 #define MT7621_CHIP_NAME1		0x20203132
diff --git a/arch/mips/ralink/common.h b/arch/mips/ralink/common.h
index 4bc65b7a3241..113dca5ac129 100644
--- a/arch/mips/ralink/common.h
+++ b/arch/mips/ralink/common.h
@@ -17,6 +17,7 @@ struct ralink_soc_info {
 	unsigned long mem_size;
 	unsigned long mem_size_min;
 	unsigned long mem_size_max;
+	void (*mem_detect)(void);
 };
 extern struct ralink_soc_info soc_info;
 
diff --git a/arch/mips/ralink/mt7621.c b/arch/mips/ralink/mt7621.c
index ca0ac607b0f3..d6616b0ad610 100644
--- a/arch/mips/ralink/mt7621.c
+++ b/arch/mips/ralink/mt7621.c
@@ -9,7 +9,9 @@
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/sys_soc.h>
+#include <linux/memblock.h>
 
+#include <asm/bootinfo.h>
 #include <asm/mipsregs.h>
 #include <asm/smp-ops.h>
 #include <asm/mips-cps.h>
@@ -49,6 +51,8 @@
 #define MT7621_GPIO_MODE_SDHCI_SHIFT	18
 #define MT7621_GPIO_MODE_SDHCI_GPIO	1
 
+static void *detect_magic __initdata = detect_memory_region;
+
 static struct rt2880_pmx_func uart1_grp[] =  { FUNC("uart1", 0, 1, 2) };
 static struct rt2880_pmx_func i2c_grp[] =  { FUNC("i2c", 0, 3, 2) };
 static struct rt2880_pmx_func uart3_grp[] = {
@@ -110,6 +114,26 @@ phys_addr_t mips_cpc_default_phys_base(void)
 	panic("Cannot detect cpc address");
 }
 
+static void __init mt7621_memory_detect(void)
+{
+	void *dm = &detect_magic;
+	phys_addr_t size;
+
+	for (size = 32 * SZ_1M; size < 256 * SZ_1M; size <<= 1) {
+		if (!__builtin_memcmp(dm, dm + size, sizeof(detect_magic)))
+			break;
+	}
+
+	if ((size == 256 * SZ_1M) &&
+	    (CPHYSADDR(dm + size) < MT7621_LOWMEM_MAX_SIZE) &&
+	    __builtin_memcmp(dm, dm + size, sizeof(detect_magic))) {
+		memblock_add(MT7621_LOWMEM_BASE, MT7621_LOWMEM_MAX_SIZE);
+		memblock_add(MT7621_HIGHMEM_BASE, MT7621_HIGHMEM_SIZE);
+	} else {
+		memblock_add(MT7621_LOWMEM_BASE, size);
+	}
+}
+
 void __init ralink_of_remap(void)
 {
 	rt_sysc_membase = plat_of_remap_node("mtk,mt7621-sysc");
@@ -194,10 +218,7 @@ void prom_soc_init(struct ralink_soc_info *soc_info)
 		(rev >> CHIP_REV_VER_SHIFT) & CHIP_REV_VER_MASK,
 		(rev & CHIP_REV_ECO_MASK));
 
-	soc_info->mem_size_min = MT7621_DDR2_SIZE_MIN;
-	soc_info->mem_size_max = MT7621_DDR2_SIZE_MAX;
-	soc_info->mem_base = MT7621_DRAM_BASE;
-
+	soc_info->mem_detect = mt7621_memory_detect;
 	rt2880_pinmux_data = mt7621_pinmux_data;
 
 	soc_dev_init(soc_info, rev);
diff --git a/arch/mips/ralink/of.c b/arch/mips/ralink/of.c
index 8286c3521476..0c5de07da097 100644
--- a/arch/mips/ralink/of.c
+++ b/arch/mips/ralink/of.c
@@ -78,6 +78,8 @@ void __init plat_mem_setup(void)
 	of_scan_flat_dt(early_init_dt_find_memory, NULL);
 	if (memory_dtb)
 		of_scan_flat_dt(early_init_dt_scan_memory, NULL);
+	else if (soc_info.mem_detect)
+		soc_info.mem_detect();
 	else if (soc_info.mem_size)
 		memblock_add(soc_info.mem_base, soc_info.mem_size * SZ_1M);
 	else
-- 
2.31.0

