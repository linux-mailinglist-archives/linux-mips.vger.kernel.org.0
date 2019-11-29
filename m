Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8319E10D2AE
	for <lists+linux-mips@lfdr.de>; Fri, 29 Nov 2019 09:52:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726975AbfK2IwI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Nov 2019 03:52:08 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25863 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbfK2IwI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Nov 2019 03:52:08 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1575017454; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=Pog4AJUBnKTdHvkwodKZils8+h3LFpftI4r0LpwS2d8Wp1LqCzpTWARyY/HZzcZXAikZFhiVMchcEXyoLznAqVfjnMqCbYEu0dpLcXSv4brYoMjd3cclPanmAqZApgve63rKuabjAWB+jjMNaU1I+B+pOlSoTcOTMjPjP6ZWlUI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1575017454; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=zvN90hWymS8Vno2DFecGcw9wXJZwHJzujjtvjaa4K+k=; 
        b=d/ul54aPZ86qPSFANAO6D3Ui0+8zIw8z+7ijOpsVDRIgeU3WqicXFNSBJUQ+k7Y0wSAelKaEjLSe7U2sYwPXOiW/75HMUfDBDWRkAQRZsGCqYJ1iWcrF9tOGowA33u9LgiSzUIgGfQz1AJ9sSAwAkglcWbgRoyIX55/bEU22EKQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=hWaidi9eGPa2pXBYkGJMJotXerOApc0WX0i+XW0e0xWU8OjR1ea2yL/79JBdOyJVoNLK/+pu4XxD
    d7ZRViVEJE3sraMUgFDnMu7OoRjU2Tuvg6vRl7Sevez3ObgnzEXL  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1575017454;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=zvN90hWymS8Vno2DFecGcw9wXJZwHJzujjtvjaa4K+k=;
        b=fj0GM7CRgV3AuhNzwtoy7UDbKKGE7lkn5hFMqR4Zguy4YgBlbethIfr086w076SX
        Dktmiea6QXg+DwEbhveqg4NX6BMGcVFnQPloQ/R5LJEndVUxgijQL7HnMKSd3+H0dp2
        dVfMTwY9ogD/qxdRkKbs0UAmNEsbEpohCB0rdR6k=
Received: from zhouyanjie-virtual-machine.localdomain (139.207.146.46 [139.207.146.46]) by mx.zohomail.com
        with SMTPS id 1575017452562880.4841021396152; Fri, 29 Nov 2019 00:50:52 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, mripard@kernel.org, shawnguo@kernel.org,
        mark.rutland@arm.com, syq@debian.org, ralf@linux-mips.org,
        heiko@sntech.de, icenowy@aosc.io,
        laurent.pinchart@ideasonboard.com, krzk@kernel.org,
        geert+renesas@glider.be, paul@crapouillou.net,
        prasannatsmkumar@gmail.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, 772753199@qq.com
Subject: [PATCH v6 04/12] MIPS: Ingenic: Initial YSH & ATIL CU Neo board support.
Date:   Fri, 29 Nov 2019 16:48:45 +0800
Message-Id: <1575017333-29020-5-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575017333-29020-1-git-send-email-zhouyanjie@zoho.com>
References: <1575017333-29020-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add a device tree for the Ingenic X1000 based YSH & ATIL CU Neo board.
Note that this is unselectable via Kconfig until the X1000 SoC is made
selectable in a later commit.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---

Notes:
    v1->v2:
    Rebase on top of mips-next, use TCU for system timer and clocksource.
    
    v2->v3:
    No change.
    
    v3->v4:
    1.Adjust "model" in "cu1000.dts" to match the description in "devices.yaml".
    2.Adjust "bool" in "Kconfig" to avoid duplicate names with subsequent boards.
    
    v4->v5:
    1.Rename "cu1000" to "cu1000-neo" to prevent conflicts with subsequent boards
      such as "cu1000-geo", and so on.
    2.Remove "CONFIG_HZ=100" and "mem=32M@0x0" from defconfg.
    3.Modify incorrect comments in DT.
    
    v5->v6:
    1.Use "stdout-path = "serial2:115200n8"" instead "stdout-path = &uart2" in DT.
    2.Remove "console=ttyS2,115200n8" and "CONFIG_CMDLINE_OVERRIDE=y" from defconfg.

 arch/mips/boot/dts/ingenic/Makefile       |  1 +
 arch/mips/boot/dts/ingenic/cu1000-neo.dts | 52 ++++++++++++++++
 arch/mips/configs/cu1000-neo_defconfig    | 98 +++++++++++++++++++++++++++++++
 arch/mips/jz4740/Kconfig                  |  4 ++
 4 files changed, 155 insertions(+)
 create mode 100644 arch/mips/boot/dts/ingenic/cu1000-neo.dts
 create mode 100644 arch/mips/configs/cu1000-neo_defconfig

diff --git a/arch/mips/boot/dts/ingenic/Makefile b/arch/mips/boot/dts/ingenic/Makefile
index 9cc4844..e165429 100644
--- a/arch/mips/boot/dts/ingenic/Makefile
+++ b/arch/mips/boot/dts/ingenic/Makefile
@@ -2,5 +2,6 @@
 dtb-$(CONFIG_JZ4740_QI_LB60)	+= qi_lb60.dtb
 dtb-$(CONFIG_JZ4770_GCW0)	+= gcw0.dtb
 dtb-$(CONFIG_JZ4780_CI20)	+= ci20.dtb
+dtb-$(CONFIG_X1000_CU1000_NEO)	+= cu1000-neo.dtb
 
 obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
diff --git a/arch/mips/boot/dts/ingenic/cu1000-neo.dts b/arch/mips/boot/dts/ingenic/cu1000-neo.dts
new file mode 100644
index 00000000..fb00439
--- /dev/null
+++ b/arch/mips/boot/dts/ingenic/cu1000-neo.dts
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "x1000.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/ingenic,tcu.h>
+
+/ {
+	compatible = "yna,cu1000-neo", "ingenic,x1000";
+	model = "YSH & ATIL General Board CU Neo";
+
+	aliases {
+		serial2 = &uart2;
+	};
+
+	chosen {
+		stdout-path = "serial2:115200n8";
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x0 0x04000000>;
+	};
+};
+
+&exclk {
+	clock-frequency = <24000000>;
+};
+
+&tcu {
+	/* 1500 kHz for the system timer and clocksource */
+	assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER2>;
+	assigned-clock-rates = <1500000>, <1500000>;
+
+	/* Use channel #0 for the system timer channel #2 for the clocksource */
+	ingenic,pwm-channels-mask = <0xfa>;
+};
+
+&uart2 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_uart2>;
+};
+
+&pinctrl {
+	pins_uart2: uart2 {
+		function = "uart2";
+		groups = "uart2-data-d";
+		bias-disable;
+	};
+};
diff --git a/arch/mips/configs/cu1000-neo_defconfig b/arch/mips/configs/cu1000-neo_defconfig
new file mode 100644
index 00000000..4fafe92
--- /dev/null
+++ b/arch/mips/configs/cu1000-neo_defconfig
@@ -0,0 +1,98 @@
+CONFIG_LOCALVERSION_AUTO=y
+CONFIG_KERNEL_GZIP=y
+CONFIG_SYSVIPC=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_PREEMPT=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_CGROUPS=y
+CONFIG_MEMCG=y
+CONFIG_MEMCG_KMEM=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_CGROUP_FREEZER=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_NAMESPACES=y
+CONFIG_USER_NS=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE="arch/mips/boot/ramdisk.cpio.gz"
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_SYSCTL_SYSCALL=y
+CONFIG_KALLSYMS_ALL=y
+CONFIG_EMBEDDED=y
+# CONFIG_VM_EVENT_COUNTERS is not set
+# CONFIG_COMPAT_BRK is not set
+CONFIG_SLAB=y
+CONFIG_MACH_INGENIC=y
+CONFIG_X1000_CU1000_NEO=y
+CONFIG_HIGHMEM=y
+CONFIG_HZ_100=y
+# CONFIG_SECCOMP is not set
+# CONFIG_SUSPEND is not set
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+# CONFIG_COMPACTION is not set
+CONFIG_CMA=y
+CONFIG_CMA_AREAS=7
+CONFIG_UEVENT_HELPER=y
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_DEVTMPFS=y
+# CONFIG_FW_LOADER is not set
+# CONFIG_ALLOW_DEV_COREDUMP is not set
+# CONFIG_INPUT_MOUSEDEV is not set
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO is not set
+CONFIG_VT_HW_CONSOLE_BINDING=y
+CONFIG_LEGACY_PTY_COUNT=2
+CONFIG_SERIAL_EARLYCON=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=3
+CONFIG_SERIAL_8250_RUNTIME_UARTS=3
+CONFIG_SERIAL_8250_INGENIC=y
+CONFIG_SERIAL_OF_PLATFORM=y
+# CONFIG_HW_RANDOM is not set
+CONFIG_GPIO_SYSFS=y
+# CONFIG_HWMON is not set
+# CONFIG_LCD_CLASS_DEVICE is not set
+# CONFIG_BACKLIGHT_CLASS_DEVICE is not set
+# CONFIG_VGA_CONSOLE is not set
+# CONFIG_HID is not set
+# CONFIG_USB_SUPPORT is not set
+# CONFIG_IOMMU_SUPPORT is not set
+CONFIG_NVMEM=y
+CONFIG_NVMEM_SYSFS=y
+CONFIG_EXT4_FS=y
+# CONFIG_DNOTIFY is not set
+CONFIG_PROC_KCORE=y
+# CONFIG_PROC_PAGE_MONITOR is not set
+CONFIG_TMPFS=y
+CONFIG_CONFIGFS_FS=y
+CONFIG_NLS=y
+CONFIG_NLS_CODEPAGE_936=y
+CONFIG_NLS_CODEPAGE_950=y
+CONFIG_NLS_ASCII=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NLS_UTF8=y
+CONFIG_CRYPTO_ECHAINIV=y
+CONFIG_CRYPTO_AES=y
+CONFIG_CRYPTO_DEFLATE=y
+CONFIG_CRYPTO_LZO=y
+CONFIG_PRINTK_TIME=y
+CONFIG_CONSOLE_LOGLEVEL_DEFAULT=15
+CONFIG_CONSOLE_LOGLEVEL_QUIET=15
+CONFIG_MESSAGE_LOGLEVEL_DEFAULT=7
+CONFIG_DEBUG_INFO=y
+CONFIG_STRIP_ASM_SYMS=y
+CONFIG_DEBUG_FS=y
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_PANIC_ON_OOPS=y
+CONFIG_PANIC_TIMEOUT=10
+# CONFIG_SCHED_DEBUG is not set
+# CONFIG_DEBUG_PREEMPT is not set
+CONFIG_STACKTRACE=y
+# CONFIG_FTRACE is not set
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE="earlycon clk_ignore_unused"
diff --git a/arch/mips/jz4740/Kconfig b/arch/mips/jz4740/Kconfig
index 6b96844..412d2fa 100644
--- a/arch/mips/jz4740/Kconfig
+++ b/arch/mips/jz4740/Kconfig
@@ -16,6 +16,10 @@ config JZ4780_CI20
 	bool "MIPS Creator CI20"
 	select MACH_JZ4780
 
+config X1000_CU1000_NEO
+	bool "YSH & ATIL CU1000 Module with Neo backplane"
+	select MACH_X1000
+
 endchoice
 
 config MACH_JZ4740
-- 
2.7.4


