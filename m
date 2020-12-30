Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62CBD2E7C9D
	for <lists+linux-mips@lfdr.de>; Wed, 30 Dec 2020 22:23:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbgL3VX1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Dec 2020 16:23:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbgL3VX0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Dec 2020 16:23:26 -0500
Received: from yawp.biot.com (yawp.biot.com [IPv6:2a01:4f8:10a:8e::fce2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CD76C06179C
        for <linux-mips@vger.kernel.org>; Wed, 30 Dec 2020 13:22:46 -0800 (PST)
Received: from debian-spamd by yawp.biot.com with sa-checked (Exim 4.93)
        (envelope-from <bert@biot.com>)
        id 1kuivc-00Alwl-Kh
        for linux-mips@vger.kernel.org; Wed, 30 Dec 2020 22:22:44 +0100
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on yawp
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.4
Received: from [2a02:578:460c:1:ae1f:6bff:fed1:9ca8] (helo=sumner.biot.com)
        by yawp.biot.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <bert@biot.com>)
        id 1kuiv9-00Alu9-OF; Wed, 30 Dec 2020 22:22:15 +0100
Received: from bert by sumner.biot.com with local (Exim 4.93)
        (envelope-from <bert@biot.com>)
        id 1kuiv9-00AvnY-Ah; Wed, 30 Dec 2020 22:22:15 +0100
From:   Bert Vermeulen <bert@biot.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sander Vanheule <sander@svanheule.net>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Bert Vermeulen <bert@biot.com>
Subject: [PATCH v3 2/4] MIPS: Add Realtek RTL838x/RTL839x support as generic MIPS system
Date:   Wed, 30 Dec 2020 22:22:03 +0100
Message-Id: <20201230212205.2605383-2-bert@biot.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201230212205.2605383-1-bert@biot.com>
References: <20201230212205.2605383-1-bert@biot.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is just enough system to boot the kernel with earlycon working.

Signed-off-by: Bert Vermeulen <bert@biot.com>
Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
 arch/mips/Kconfig                       | 21 ++++++++++++++++++
 arch/mips/generic/Platform              |  1 +
 arch/mips/include/asm/realtek/ioremap.h | 29 +++++++++++++++++++++++++
 3 files changed, 51 insertions(+)
 create mode 100644 arch/mips/include/asm/realtek/ioremap.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 0a17bedf4f0d..0986d0c4405f 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -627,6 +627,27 @@ config RALINK
 	select ARCH_HAS_RESET_CONTROLLER
 	select RESET_CONTROLLER
 
+config MACH_REALTEK_RTL
+	bool "Realtek RTL838x/RTL839x based machines"
+	select MIPS_GENERIC
+	select DMA_NONCOHERENT
+	select IRQ_MIPS_CPU
+	select CSRC_R4K
+	select CEVT_R4K
+	select SYS_HAS_CPU_MIPS32_R1
+	select SYS_HAS_CPU_MIPS32_R2
+	select SYS_SUPPORTS_BIG_ENDIAN
+	select SYS_SUPPORTS_32BIT_KERNEL
+	select SYS_SUPPORTS_MIPS16
+	select SYS_SUPPORTS_MULTITHREADING
+	select SYS_SUPPORTS_VPE_LOADER
+	select SYS_HAS_EARLY_PRINTK
+	select SYS_HAS_EARLY_PRINTK_8250
+	select USE_GENERIC_EARLY_PRINTK_8250
+	select BOOT_RAW
+	select PINCTRL
+	select USE_OF
+
 config SGI_IP22
 	bool "SGI IP22 (Indy/Indigo2)"
 	select ARC_MEMORY
diff --git a/arch/mips/generic/Platform b/arch/mips/generic/Platform
index b871af16b5b6..5dff52295b0a 100644
--- a/arch/mips/generic/Platform
+++ b/arch/mips/generic/Platform
@@ -10,6 +10,7 @@
 
 # Note: order matters, keep the asm/mach-generic include last.
 cflags-$(CONFIG_MACH_INGENIC_SOC)	+= -I$(srctree)/arch/mips/include/asm/mach-ingenic
+cflags-$(CONFIG_MACH_REALTEK_RTL)	+= -I$(srctree)/arch/mips/include/asm/realtek
 cflags-$(CONFIG_MIPS_GENERIC)	+= -I$(srctree)/arch/mips/include/asm/mach-generic
 
 load-$(CONFIG_MIPS_GENERIC)	+= 0xffffffff80100000
diff --git a/arch/mips/include/asm/realtek/ioremap.h b/arch/mips/include/asm/realtek/ioremap.h
new file mode 100644
index 000000000000..ea51af023e26
--- /dev/null
+++ b/arch/mips/include/asm/realtek/ioremap.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _REALTEK_RTL_IOREMAP_H_
+#define _REALTEK_RTL_IOREMAP_H_
+
+static inline int is_rtl8380_internal_registers(phys_addr_t offset)
+{
+	/* IO Block */
+	if (offset >= 0xb8000000 && offset < 0xb9000000)
+		return 1;
+	/* Switch block */
+	if (offset >= 0xbb000000 && offset < 0xbc000000)
+		return 1;
+	return 0;
+}
+
+static inline void __iomem *plat_ioremap(phys_addr_t offset, unsigned long size,
+					 unsigned long flags)
+{
+	if (is_rtl8380_internal_registers(offset))
+		return (void __iomem *)offset;
+	return NULL;
+}
+
+static inline int plat_iounmap(const volatile void __iomem *addr)
+{
+	return is_rtl8380_internal_registers((unsigned long)addr);
+}
+
+#endif /* _REALTEK_RTL_IOREMAP_H_ */
-- 
2.25.1

