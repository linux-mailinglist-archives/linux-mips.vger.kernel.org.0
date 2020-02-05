Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF8C4152580
	for <lists+linux-mips@lfdr.de>; Wed,  5 Feb 2020 05:08:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727949AbgBEEIj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Feb 2020 23:08:39 -0500
Received: from mail.loongson.cn ([114.242.206.163]:42346 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727832AbgBEEIj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 4 Feb 2020 23:08:39 -0500
Received: from linux.HaierAP (unknown [111.18.44.203])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax1um3Pzpeh44MAA--.150S3;
        Wed, 05 Feb 2020 12:08:29 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Jean Delvare <jdelvare@suse.com>,
        Jean Delvare <jdelvare@suse.de>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Xuefeng Li <lixuefeng@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yinglu Yang <yangyinglu@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 2/2] MIPS: Add support for Desktop Management Interface (DMI)
Date:   Wed,  5 Feb 2020 12:08:33 +0800
Message-Id: <1580875713-18252-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1580875713-18252-1-git-send-email-yangtiezhu@loongson.cn>
References: <1580875713-18252-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Ax1um3Pzpeh44MAA--.150S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCr4xAw4rtFy7Zw45AF17GFg_yoWrXryfpa
        1DA3Z5tr4DGF17Ga4fAFyI9r13Cws3WrWYkFWj9r17Zas8X348Jrs3KrsxZFyUAr4kKa40
        9a4a9F4UCFZFv3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPE14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
        JwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
        IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
        M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
        kIc2xKxwCY02Avz4vE14v_Gryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
        8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
        UjIFyTuYvjfU08nYUUUUU
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

Additionally, in order to avoid the unknown risks on the mips platform
which is not MACH_LOONGSON64, the DMI config is better to depend on
MACH_LOONGSON64. If other mips platform also needs this DMI feature in
the future, the "depends on" condition can be modified.

Co-developed-by: Yinglu Yang <yangyinglu@loongson.cn>
Signed-off-by: Yinglu Yang <yangyinglu@loongson.cn>
[jiaxun.yang@flygoat.com: Refine definitions and Kconfig]
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Reviewed-by: Huacai Chen <chenhc@lemote.com>
---

v3:
  - split the v2 patch into two patches
  - make MIPS DMI config depend on MACH_LOONGSON64

v2:
  - add SMBIOS_ENTRY_POINT_SCAN_START suggested by Jean
  - refine definitions and Kconfig by Jiaxun

 arch/mips/Kconfig           | 11 +++++++++++
 arch/mips/include/asm/dmi.h | 20 ++++++++++++++++++++
 arch/mips/kernel/setup.c    |  2 ++
 3 files changed, 33 insertions(+)
 create mode 100644 arch/mips/include/asm/dmi.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 08b6f34..d84cb32 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2758,6 +2758,17 @@ config HW_PERF_EVENTS
 	  Enable hardware performance counter support for perf events. If
 	  disabled, perf events will use software events only.
 
+config DMI
+	bool "Enable DMI scanning"
+	depends on MACH_LOONGSON64
+	select DMI_SCAN_MACHINE_NON_EFI_FALLBACK
+	default y
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
-- 
1.8.3.1

