Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEA3FF1ABD
	for <lists+linux-mips@lfdr.de>; Wed,  6 Nov 2019 17:06:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728462AbfKFQGh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 Nov 2019 11:06:37 -0500
Received: from mail.loongson.cn ([114.242.206.163]:39724 "EHLO
        mail.loongson.cn" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727028AbfKFQGh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 Nov 2019 11:06:37 -0500
Received: from linux.loongson.cn (unknown [10.20.41.27])
        by mail (Coremail) with SMTP id QMiowPDx72B+78JdqhYAAA--.24S2;
        Thu, 07 Nov 2019 00:06:22 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yinglu Yang <yangyinglu@loongson.cn>
Subject: [PATCH] MIPS: Scan the DMI system information
Date:   Thu,  7 Nov 2019 00:05:41 +0800
Message-Id: <1573056341-21159-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: QMiowPDx72B+78JdqhYAAA--.24S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCr4xAw4DAr47GFW8KFyUWrg_yoW5KFWxpF
        4kA3Z5tr45Wr17GFWfAFyxuF13JFs3XFW5KFW7KF9rAas8Xa4UZrsag3ZxAFy0yr4kta4F
        ga4SgF4UGrsFyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9S14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
        6r4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r1j6r
        4UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0
        Y40En7xvr7AKxVWUJVW8JwAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr
        0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0Y48IcxkI7VAKI48G
        6xCjnVAKz4kxM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxGrwCFx2IqxV
        CFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r10
        6r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxV
        WUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG
        6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r
        4UYxBIdaVFxhVjvjDU0xZFpf9x0JUrkuxUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Enable DMI scanning on the MIPS architecture, this setups DMI identifiers
(dmi_system_id) for printing it out on task dumps and prepares DIMM entry
information (dmi_memdev_info) from the SMBIOS table. With this patch, the
driver can easily match various of mainboards.

In the SMBIOS reference specification, the table anchor string "_SM_" is
present in the address range 0xF0000 to 0xFFFFF on a 16-byte boundary,
but there exists a special case for loongson platform, when call function
dmi_early_remap, it should specify the start address to 0xFFFE000 due to
it is reserved for SMBIOS and can be normally access in the BIOS.

Co-developed-by: Yinglu Yang <yangyinglu@loongson.cn>
Signed-off-by: Yinglu Yang <yangyinglu@loongson.cn>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/Kconfig           | 12 ++++++++++++
 arch/mips/include/asm/dmi.h | 43 +++++++++++++++++++++++++++++++++++++++++++
 arch/mips/kernel/setup.c    |  2 ++
 3 files changed, 57 insertions(+)
 create mode 100644 arch/mips/include/asm/dmi.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 7cb8947..0a67b18 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2757,6 +2757,18 @@ config HW_PERF_EVENTS
 	  Enable hardware performance counter support for perf events. If
 	  disabled, perf events will use software events only.
 
+# Mark as expert because too many people got it wrong.
+# The code disables itself when not needed.
+config DMI
+	default y
+	select DMI_SCAN_MACHINE_NON_EFI_FALLBACK
+	bool "Enable DMI scanning" if EXPERT
+	help
+	  Enabled scanning of DMI to identify machine quirks. Say Y
+	  here unless you have verified that your setup is not
+	  affected by entries in the DMI blacklist. Required by PNP
+	  BIOS code.
+
 config SMP
 	bool "Multi-Processing support"
 	depends on SYS_SUPPORTS_SMP
diff --git a/arch/mips/include/asm/dmi.h b/arch/mips/include/asm/dmi.h
new file mode 100644
index 0000000..1f3da37
--- /dev/null
+++ b/arch/mips/include/asm/dmi.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_MIPS_DMI_H
+#define _ASM_MIPS_DMI_H
+
+#define dmi_early_remap		mips_early_memremap
+#define dmi_early_unmap		mips_early_memunmap
+#define dmi_remap(_x, _l)	mips_memremap(_x, _l, MEMREMAP_WB)
+#define dmi_unmap(_x)		mips_memunmap(_x)
+
+#define dmi_alloc(l)		memblock_alloc_low(l, PAGE_SIZE)
+
+void __init *mips_early_memremap(resource_size_t phys_addr, unsigned long size)
+{
+#if defined(CONFIG_MACH_LOONGSON64)
+	if (phys_addr == 0xF0000)
+		phys_addr = 0xFFFE000;
+
+	return (void *)TO_CAC(phys_addr);
+#else
+	return NULL;
+#endif
+}
+
+void __init mips_early_memunmap(void *addr, unsigned long size)
+{
+
+}
+
+void *mips_memremap(resource_size_t offset, size_t size, unsigned long flags)
+{
+#if defined(CONFIG_MACH_LOONGSON64)
+	return (void *)TO_CAC(offset);
+#else
+	return NULL;
+#endif
+}
+
+void mips_memunmap(void *addr)
+{
+
+}
+
+#endif /* _ASM_MIPS_DMI_H */
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index c3d4212..da7d312 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -28,6 +28,7 @@
 #include <linux/decompress/generic.h>
 #include <linux/of_fdt.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/dmi.h>
 
 #include <asm/addrspace.h>
 #include <asm/bootinfo.h>
@@ -802,6 +803,7 @@ void __init setup_arch(char **cmdline_p)
 #endif
 
 	arch_mem_init(cmdline_p);
+	dmi_setup();
 
 	resource_init();
 	plat_smp_setup();
-- 
2.1.0


