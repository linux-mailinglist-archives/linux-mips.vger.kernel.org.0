Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8D6934B481
	for <lists+linux-mips@lfdr.de>; Sat, 27 Mar 2021 06:39:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbhC0FjS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Mar 2021 01:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbhC0Fiv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 27 Mar 2021 01:38:51 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 908ECC0613AA;
        Fri, 26 Mar 2021 22:38:51 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id j25so6291451pfe.2;
        Fri, 26 Mar 2021 22:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7eFOafYjPPlgKHm64EqWVR9F6JqxMMQWqfco8Ml51KU=;
        b=XZsSzFrl+9EzBODupHKVToet7afFuME8+yiHlvROhkK9LE0J9I3RWpj1D02PpTBXmb
         ywPyDTRt2ExrH0D8MR5CeuBTYDRiWVPstaekmjHEh7TOZKc30rgiMalT/6xkKRZT2dpb
         Dvy/FKFEbOODNZLoq44Dw+kPkD0DNHaCe1N21h4MPGlfzyQLrA9SmrmADCe1Z84+T0L0
         3nykS5hA1P4TcgIbb17fD7fuoFvHMSqIOSq5AulvQsPwFUiGei3e3gw64NsrCtgah6Q0
         4/KYx7KTzRP48w+ekwtZMhPHhxT2phh2WA7qX2DZ+OTjV1GOiSg7bg6GiZQta/n4l+7D
         3WVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7eFOafYjPPlgKHm64EqWVR9F6JqxMMQWqfco8Ml51KU=;
        b=eP/mFrYzgiHRzwjjv7btbvd716rIc24+FYXCwIbEb5HjGAXsCv8VP3Mywwi8SLV2ip
         SjC/EGYzuiDDzayZrPacGVLNML8D2E/AibbEMwalQ8bO17HHhRhDbHPnuU8I6+lCKcd1
         S1TKmewH11E4Ln4p+bNngL27GUfDWMnEfRjkEGARL7TU3EoilJfWna6BYNJUJTPz1EBt
         HZFhF9PLOyuOPIfaBRdiWg0MLL9R1Ow2B+Z0JPzQYy0m9LBWnWEPgy7M4rujX/R0hytc
         XAwFDU2Bp5p0NlVgEDp8RcOiP1QHLMrC4S92xls8ExIaMoj1I+xjy3acZEiKqb7bDCMI
         WqXA==
X-Gm-Message-State: AOAM5308eNgp24cnOGJeZNd/jqwiV/czEgn9wMv9EufjSLveWV/m8NYk
        aV/0aAui4/Sm6e0QNLkAmsQ=
X-Google-Smtp-Source: ABdhPJx7BH3r7NpJZLrlLv3I2yX/8zTcwfdqEZUbxkarK1Zw2ziY5Y9tvKmqdYi/BLd9oskQ5XB58w==
X-Received: by 2002:a62:1713:0:b029:1f1:56e2:8ec6 with SMTP id 19-20020a6217130000b02901f156e28ec6mr15527140pfx.56.1616823531150;
        Fri, 26 Mar 2021 22:38:51 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
        by smtp.gmail.com with ESMTPSA id k128sm10701933pfd.137.2021.03.26.22.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 22:38:50 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     John Crispin <john@phrozen.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc:     Chuanhong Guo <gch981213@gmail.com>,
        Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH 2/2] MIPS: ralink: mt7621: add memory detection support
Date:   Fri, 26 Mar 2021 22:38:40 -0700
Message-Id: <20210327053840.471155-2-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210327053840.471155-1-ilya.lipnitskiy@gmail.com>
References: <20210327053840.471155-1-ilya.lipnitskiy@gmail.com>
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
index 49ae370d023d..87fc16751281 100644
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
index ec87ce561049..6b3db98894cb 100644
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
@@ -194,10 +218,7 @@ void __init prom_soc_init(struct ralink_soc_info *soc_info)
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

