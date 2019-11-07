Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F30E1F2D6E
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2019 12:28:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727278AbfKGL2Z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 Nov 2019 06:28:25 -0500
Received: from forward100j.mail.yandex.net ([5.45.198.240]:59980 "EHLO
        forward100j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727178AbfKGL2Z (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 Nov 2019 06:28:25 -0500
Received: from forward100q.mail.yandex.net (forward100q.mail.yandex.net [IPv6:2a02:6b8:c0e:4b:0:640:4012:bb97])
        by forward100j.mail.yandex.net (Yandex) with ESMTP id 1643D50E20DB;
        Thu,  7 Nov 2019 14:28:21 +0300 (MSK)
Received: from mxback12q.mail.yandex.net (mxback12q.mail.yandex.net [IPv6:2a02:6b8:c0e:1b3:0:640:3818:d096])
        by forward100q.mail.yandex.net (Yandex) with ESMTP id 12F0C7080008;
        Thu,  7 Nov 2019 14:28:21 +0300 (MSK)
Received: from vla3-2bcfd5e94671.qloud-c.yandex.net (vla3-2bcfd5e94671.qloud-c.yandex.net [2a02:6b8:c15:350f:0:640:2bcf:d5e9])
        by mxback12q.mail.yandex.net (mxback/Yandex) with ESMTP id 8dnNpwOQiV-SK3qqaGb;
        Thu, 07 Nov 2019 14:28:20 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1573126101;
        bh=j1KzLDE/nTHmQQFbg+MoNJVQOh55Uy5b1uE8Df6LdIk=;
        h=Reply-to:Subject:To:From:Cc:Date:Message-Id;
        b=eyns1n7OeOHGvdaDPtkpCLDSbIqLn+dyvv4IbABhRDdB8DPy5kPeDyp5MpMvnmt/U
         bI95UH0ZzhFEXGHK0hqTvghJClpV7At7i9gj/XyLEQf+9CVrKRdQuHaJ/d0u4ydKvr
         Z5HZ/EniqjqJ8vjrix9Uot6N96wpXcoPfgW2FsXI=
Authentication-Results: mxback12q.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by vla3-2bcfd5e94671.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id a4NM0KkwfE-SGVGhG5w;
        Thu, 07 Nov 2019 14:28:18 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     yangtiezhu@loongson.cn
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        yangyinglu@loongson.cn, jdelvare@suse.de,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH REPLY] MIPS: Scan the DMI system information
Date:   Thu,  7 Nov 2019 19:28:01 +0800
Message-Id: <20191107112801.7037-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.24.0.rc1
MIME-Version: 1.0
Reply-to: 1573056341-21159-1-git-send-email-yangtiezhu@loongson.cn
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Tiezhu and Jean,

What about do like this?
We shouldn't follow x86's Kconfig as most of MIPS devices
don't support DMI.

And, we can reuse map/unmap from io.h to reduce
maintinance overhead.

Thanks

Jiaxun

>8------------------------------------------------------8<

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
[jiaxun.yang@flygoat.com: Refine definitions and Kconfig]
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig           |  9 +++++++++
 arch/mips/include/asm/dmi.h | 20 ++++++++++++++++++++
 arch/mips/kernel/setup.c    |  2 ++
 drivers/firmware/dmi_scan.c |  6 +++++-
 4 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/include/asm/dmi.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index c3a022ca3345..414f3a0ea397 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2759,6 +2759,15 @@ config HW_PERF_EVENTS
 	  Enable hardware performance counter support for perf events. If
 	  disabled, perf events will use software events only.
 
+config DMI
+	default y if MACH_LOONGSON64
+	select DMI_SCAN_MACHINE_NON_EFI_FALLBACK
+	bool "Enable DMI scanning"
+	help
+	  Enabled scanning of DMI to identify machine quirks. Say Y
+	  here unless you have verified that your setup is not
+	  affected by entries in the DMI blacklist.
+
 config SMP
 	bool "Multi-Processing support"
 	depends on SYS_SUPPORTS_SMP
diff --git a/arch/mips/include/asm/dmi.h b/arch/mips/include/asm/dmi.h
new file mode 100644
index 000000000000..5153ef6fe8a2
--- /dev/null
+++ b/arch/mips/include/asm/dmi.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_MIPS_DMI_H
+#define _ASM_MIPS_DMI_H
+
+#include <linux/io.h>
+#include <linux/memblock.h>
+
+#define dmi_early_remap(x, l)		ioremap_cache(x, l)
+#define dmi_early_unmap(x, l)		iounmap(x)
+#define dmi_remap(x, l)		ioremap_cache(x, l)
+#define dmi_unmap(x)			iounmap(x)
+
+/* MIPS initialize DMI scan before SLAB is ready, so we use memblock here */
+#define dmi_alloc(l)			memblock_alloc_low(l, PAGE_SIZE)
+
+#if defined(CONFIG_MACH_LOONGSON64)
+#define SMBIOS_ENTRY_POINT_SCAN_START	0xfffe000
+#endif
+
+#endif /* _ASM_MIPS_DMI_H */
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index c3d4212b5f1d..da7d312e20eb 100644
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
diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
index 35ed56b9c34f..ee2dbebf2063 100644
--- a/drivers/firmware/dmi_scan.c
+++ b/drivers/firmware/dmi_scan.c
@@ -11,6 +11,10 @@
 #include <asm/dmi.h>
 #include <asm/unaligned.h>
 
+#ifndef SMBIOS_ENTRY_POINT_SCAN_START
+#define SMBIOS_ENTRY_POINT_SCAN_START 0xf0000
+#endif
+
 struct kobject *dmi_kobj;
 EXPORT_SYMBOL_GPL(dmi_kobj);
 
@@ -661,7 +665,7 @@ static void __init dmi_scan_machine(void)
 			return;
 		}
 	} else if (IS_ENABLED(CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK)) {
-		p = dmi_early_remap(0xF0000, 0x10000);
+		p = dmi_early_remap(SMBIOS_ENTRY_POINT_SCAN_START, 0x10000);
 		if (p == NULL)
 			goto error;
 
-- 
2.24.0.rc1

