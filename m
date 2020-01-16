Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4A3213DBC3
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2020 14:28:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbgAPN1X (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jan 2020 08:27:23 -0500
Received: from mail.loongson.cn ([114.242.206.163]:42992 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726378AbgAPN1X (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Jan 2020 08:27:23 -0500
Received: from linux.loongson.cn (unknown [10.20.41.119])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxv92vZCBes+wFAA--.20S2;
        Thu, 16 Jan 2020 21:27:11 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Xuefeng Li <lixuefeng@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yinglu Yang <yangyinglu@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2,RESEND] MIPS: Scan the DMI system information
Date:   Thu, 16 Jan 2020 21:26:05 +0800
Message-Id: <1579181165-2493-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxv92vZCBes+wFAA--.20S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCr4xAw4rtFy7Zw45AF17GFg_yoWrCFy7pF
        4DC3Z5tr4DGF17G3yfAa4xur13Zan3Wry5KFyj9347ZasxX34xJrs7GwsxAryUAr4kKa40
        93WagF45KFZFvaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkS14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE-syl42xK
        82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
        C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48J
        MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMI
        IF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
        6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOGQDUUUUU
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
but there exists a special case for Loongson platform, when call function
dmi_early_remap, it should specify the start address to 0xFFFE000 due to
it is reserved for SMBIOS and can be normally access in the BIOS.

This patch works fine on the Loongson 3A3000 platform which belongs to
MIPS architecture and has no influence on the other architectures such
as x86 and ARM.

Co-developed-by: Yinglu Yang <yangyinglu@loongson.cn>
Signed-off-by: Yinglu Yang <yangyinglu@loongson.cn>
[jiaxun.yang@flygoat.com: Refine definitions and Kconfig]
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Reviewed-by: Huacai Chen <chenhc@lemote.com>
---

v2:
  - add SMBIOS_ENTRY_POINT_SCAN_START suggested by Jean
  - refine definitions and Kconfig by Jiaxun

 arch/mips/Kconfig           | 10 ++++++++++
 arch/mips/include/asm/dmi.h | 20 ++++++++++++++++++++
 arch/mips/kernel/setup.c    |  2 ++
 drivers/firmware/dmi_scan.c |  6 +++++-
 4 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/include/asm/dmi.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 4b83507..c097f78 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2773,6 +2773,16 @@ config HW_PERF_EVENTS
 	  Enable hardware performance counter support for perf events. If
 	  disabled, perf events will use software events only.
 
+config DMI
+	default y if MACH_LOONGSON64
+	select DMI_SCAN_MACHINE_NON_EFI_FALLBACK
+	bool "Enable DMI scanning"
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
index 0000000..27415a2
--- /dev/null
+++ b/arch/mips/include/asm/dmi.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_DMI_H
+#define _ASM_DMI_H
+
+#include <linux/io.h>
+#include <linux/memblock.h>
+
+#define dmi_early_remap(x, l)		ioremap_cache(x, l)
+#define dmi_early_unmap(x, l)		iounmap(x)
+#define dmi_remap(x, l)			ioremap_cache(x, l)
+#define dmi_unmap(x)			iounmap(x)
+
+/* MIPS initialize DMI scan before SLAB is ready, so we use memblock here */
+#define dmi_alloc(l)			memblock_alloc_low(l, PAGE_SIZE)
+
+#if defined(CONFIG_MACH_LOONGSON64)
+#define SMBIOS_ENTRY_POINT_SCAN_START	0xFFFE000
+#endif
+
+#endif /* _ASM_DMI_H */
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 701f4bc..d9bd841 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -28,6 +28,7 @@
 #include <linux/decompress/generic.h>
 #include <linux/of_fdt.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/dmi.h>
 
 #include <asm/addrspace.h>
 #include <asm/bootinfo.h>
@@ -800,6 +801,7 @@ void __init setup_arch(char **cmdline_p)
 #endif
 
 	arch_mem_init(cmdline_p);
+	dmi_setup();
 
 	resource_init();
 	plat_smp_setup();
diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
index 2045566..f59163c 100644
--- a/drivers/firmware/dmi_scan.c
+++ b/drivers/firmware/dmi_scan.c
@@ -11,6 +11,10 @@
 #include <asm/dmi.h>
 #include <asm/unaligned.h>
 
+#ifndef SMBIOS_ENTRY_POINT_SCAN_START
+#define SMBIOS_ENTRY_POINT_SCAN_START 0xF0000
+#endif
+
 struct kobject *dmi_kobj;
 EXPORT_SYMBOL_GPL(dmi_kobj);
 
@@ -663,7 +667,7 @@ static void __init dmi_scan_machine(void)
 			return;
 		}
 	} else if (IS_ENABLED(CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK)) {
-		p = dmi_early_remap(0xF0000, 0x10000);
+		p = dmi_early_remap(SMBIOS_ENTRY_POINT_SCAN_START, 0x10000);
 		if (p == NULL)
 			goto error;
 
-- 
2.1.0

