Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD171DDEF4
	for <lists+linux-mips@lfdr.de>; Sun, 20 Oct 2019 16:45:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726390AbfJTOpW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Oct 2019 10:45:22 -0400
Received: from forward101p.mail.yandex.net ([77.88.28.101]:57104 "EHLO
        forward101p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726373AbfJTOpW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 20 Oct 2019 10:45:22 -0400
Received: from mxback7j.mail.yandex.net (mxback7j.mail.yandex.net [IPv6:2a02:6b8:0:1619::110])
        by forward101p.mail.yandex.net (Yandex) with ESMTP id 2DFCE3280952;
        Sun, 20 Oct 2019 17:45:15 +0300 (MSK)
Received: from myt1-e9eae5d2de9d.qloud-c.yandex.net (myt1-e9eae5d2de9d.qloud-c.yandex.net [2a02:6b8:c00:1290:0:640:e9ea:e5d2])
        by mxback7j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id 8JBkvAZ3AW-jFr4wo5Y;
        Sun, 20 Oct 2019 17:45:15 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1571582715;
        bh=wMOukuFLMmFBuMg9XpMy3+pc2R3FO9Mi3rNiJvSnQkE=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=IcmZg/GKiPhw+1BtBXZ9j8OngFZOTZrKO6rYybCX1A3OAS9o6zUV6u42QJzTIjIRc
         JMfDHA2HNqRr2shYzapLmVGqRWvMypv9wHgwJxqnlCB3S3EKeZShRTrk9mxFzlLBne
         njhVvPNUMjJ4Hmfv6z5FkqcXxaT92etrx+M+paLE=
Authentication-Results: mxback7j.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by myt1-e9eae5d2de9d.qloud-c.yandex.net (nwsmtp/Yandex) with ESMTPSA id cvdeeoAR7I-idtaJPcT;
        Sun, 20 Oct 2019 17:44:42 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 2/6] MIPS: Fork loongson2ef from loongson64
Date:   Sun, 20 Oct 2019 22:43:14 +0800
Message-Id: <20191020144318.18341-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191020144318.18341-1-jiaxun.yang@flygoat.com>
References: <20191020144318.18341-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

As later model of GSx64 family processors including 2-series-soc have
similar design with initial loongson3a while loongson2e/f seems less
identical, we separate loongson2e/f support code out of mach-loongson64
to make our life easier.

This patch contains mostly file moving works.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kbuild.platforms                    |  1 +
 arch/mips/Kconfig                             | 19 ++---
 arch/mips/configs/fuloong2e_defconfig         |  2 +-
 arch/mips/configs/lemote2f_defconfig          |  2 +-
 .../boot_param.h                              |  0
 .../cpu-feature-overrides.h                   |  0
 .../cs5536/cs5536.h                           |  0
 .../cs5536/cs5536_mfgpt.h                     |  0
 .../cs5536/cs5536_pci.h                       |  0
 .../cs5536/cs5536_vsm.h                       |  0
 .../irq.h                                     |  0
 .../kernel-entry-init.h                       |  0
 .../loongson.h                                |  0
 .../loongson_hwmon.h                          |  0
 .../loongson_regs.h                           |  0
 .../machine.h                                 |  0
 .../mc146818rtc.h                             |  0
 .../mem.h                                     |  0
 .../mmzone.h                                  |  0
 .../pci.h                                     |  0
 .../spaces.h                                  |  0
 .../topology.h                                |  0
 .../workarounds.h                             |  0
 arch/mips/{loongson64 => loongson2ef}/Kconfig | 50 +------------
 .../mips/{loongson64 => loongson2ef}/Makefile |  8 +-
 arch/mips/loongson2ef/Platform                | 32 ++++++++
 .../common/Makefile                           |  0
 .../common/bonito-irq.c                       |  0
 .../common/cmdline.c                          |  0
 .../common/cs5536/Makefile                    |  0
 .../common/cs5536/cs5536_acc.c                |  0
 .../common/cs5536/cs5536_ehci.c               |  0
 .../common/cs5536/cs5536_ide.c                |  0
 .../common/cs5536/cs5536_isa.c                |  0
 .../common/cs5536/cs5536_mfgpt.c              |  0
 .../common/cs5536/cs5536_ohci.c               |  0
 .../common/cs5536/cs5536_pci.c                |  0
 .../common/early_printk.c                     |  0
 .../{loongson64 => loongson2ef}/common/env.c  |  0
 .../{loongson64 => loongson2ef}/common/init.c |  0
 .../{loongson64 => loongson2ef}/common/irq.c  |  0
 .../common/machtype.c                         |  0
 .../{loongson64 => loongson2ef}/common/mem.c  |  0
 .../{loongson64 => loongson2ef}/common/pci.c  |  0
 .../common/platform.c                         |  0
 .../{loongson64 => loongson2ef}/common/pm.c   |  0
 .../common/reset.c                            |  0
 .../{loongson64 => loongson2ef}/common/rtc.c  |  0
 .../common/serial.c                           |  0
 .../common/setup.c                            |  0
 .../{loongson64 => loongson2ef}/common/time.c |  0
 .../common/uart_base.c                        |  0
 .../fuloong-2e/Makefile                       |  0
 .../fuloong-2e/dma.c                          |  0
 .../fuloong-2e/irq.c                          |  0
 .../fuloong-2e/reset.c                        |  0
 .../lemote-2f/Makefile                        |  0
 .../lemote-2f/clock.c                         |  2 +-
 .../lemote-2f/dma.c                           |  0
 .../lemote-2f/ec_kb3310b.c                    |  0
 .../lemote-2f/ec_kb3310b.h                    |  0
 .../lemote-2f/irq.c                           |  0
 .../lemote-2f/machtype.c                      |  0
 .../lemote-2f/pm.c                            |  0
 .../lemote-2f/reset.c                         |  0
 arch/mips/loongson64/Kconfig                  | 75 -------------------
 arch/mips/loongson64/Makefile                 | 12 ---
 arch/mips/loongson64/Platform                 | 21 ------
 arch/mips/loongson64/common/Makefile          |  6 --
 drivers/cpufreq/loongson2_cpufreq.c           |  2 +-
 70 files changed, 52 insertions(+), 180 deletions(-)
 copy arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/boot_param.h (100%)
 copy arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/cpu-feature-overrides.h (100%)
 copy arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/cs5536/cs5536.h (100%)
 copy arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/cs5536/cs5536_mfgpt.h (100%)
 copy arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/cs5536/cs5536_pci.h (100%)
 copy arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/cs5536/cs5536_vsm.h (100%)
 copy arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/irq.h (100%)
 copy arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/kernel-entry-init.h (100%)
 copy arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/loongson.h (100%)
 copy arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/loongson_hwmon.h (100%)
 copy arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/loongson_regs.h (100%)
 copy arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/machine.h (100%)
 copy arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/mc146818rtc.h (100%)
 copy arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/mem.h (100%)
 copy arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/mmzone.h (100%)
 copy arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/pci.h (100%)
 copy arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/spaces.h (100%)
 copy arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/topology.h (100%)
 copy arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/workarounds.h (100%)
 copy arch/mips/{loongson64 => loongson2ef}/Kconfig (65%)
 copy arch/mips/{loongson64 => loongson2ef}/Makefile (68%)
 create mode 100644 arch/mips/loongson2ef/Platform
 copy arch/mips/{loongson64 => loongson2ef}/common/Makefile (100%)
 copy arch/mips/{loongson64 => loongson2ef}/common/bonito-irq.c (100%)
 copy arch/mips/{loongson64 => loongson2ef}/common/cmdline.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/Makefile (100%)
 rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_acc.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_ehci.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_ide.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_isa.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_mfgpt.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_ohci.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_pci.c (100%)
 copy arch/mips/{loongson64 => loongson2ef}/common/early_printk.c (100%)
 copy arch/mips/{loongson64 => loongson2ef}/common/env.c (100%)
 copy arch/mips/{loongson64 => loongson2ef}/common/init.c (100%)
 copy arch/mips/{loongson64 => loongson2ef}/common/irq.c (100%)
 copy arch/mips/{loongson64 => loongson2ef}/common/machtype.c (100%)
 copy arch/mips/{loongson64 => loongson2ef}/common/mem.c (100%)
 copy arch/mips/{loongson64 => loongson2ef}/common/pci.c (100%)
 copy arch/mips/{loongson64 => loongson2ef}/common/platform.c (100%)
 copy arch/mips/{loongson64 => loongson2ef}/common/pm.c (100%)
 copy arch/mips/{loongson64 => loongson2ef}/common/reset.c (100%)
 copy arch/mips/{loongson64 => loongson2ef}/common/rtc.c (100%)
 copy arch/mips/{loongson64 => loongson2ef}/common/serial.c (100%)
 copy arch/mips/{loongson64 => loongson2ef}/common/setup.c (100%)
 copy arch/mips/{loongson64 => loongson2ef}/common/time.c (100%)
 copy arch/mips/{loongson64 => loongson2ef}/common/uart_base.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/fuloong-2e/Makefile (100%)
 rename arch/mips/{loongson64 => loongson2ef}/fuloong-2e/dma.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/fuloong-2e/irq.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/fuloong-2e/reset.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/Makefile (100%)
 rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/clock.c (98%)
 rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/dma.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/ec_kb3310b.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/ec_kb3310b.h (100%)
 rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/irq.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/machtype.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/pm.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/reset.c (100%)

diff --git a/arch/mips/Kbuild.platforms b/arch/mips/Kbuild.platforms
index 0de839882106..7c0d461483ef 100644
--- a/arch/mips/Kbuild.platforms
+++ b/arch/mips/Kbuild.platforms
@@ -17,6 +17,7 @@ platforms += jazz
 platforms += jz4740
 platforms += lantiq
 platforms += lasat
+platforms += loongson2ef
 platforms += loongson32
 platforms += loongson64
 platforms += mti-malta
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 3d6cdd5d8538..7d6b1c993e28 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -453,18 +453,18 @@ config MACH_LOONGSON32
 	  the Institute of Computing Technology (ICT), Chinese Academy of
 	  Sciences (CAS).
 
-config MACH_LOONGSON64
-	bool "Loongson-2/3 family of machines"
+config MACH_LOONGSON2EF
+	bool "Loongson-2E/F family of machines"
 	select SYS_SUPPORTS_ZBOOT
 	help
-	  This enables the support of Loongson-2/3 family of machines.
+	  This enables the support of early Loongson-2E/F family of machines.
 
-	  Loongson-2 is a family of single-core CPUs and Loongson-3 is a
-	  family of multi-core CPUs. They are both 64-bit general-purpose
-	  MIPS-compatible CPUs. Loongson-2/3 are developed by the Institute
-	  of Computing Technology (ICT), Chinese Academy of Sciences (CAS)
-	  in the People's Republic of China. The chief architect is Professor
-	  Weiwu Hu.
+config MACH_LOONGSON64
+	bool "Loongson-2/3 GSx64 family of machines"
+	select SYS_SUPPORTS_ZBOOT
+	help
+	  This enables the support of Loongson-2/3 family of processors with
+	  GSx64 microarchitecture.
 
 config MACH_PISTACHIO
 	bool "IMG Pistachio SoC based boards"
@@ -1036,6 +1036,7 @@ source "arch/mips/sibyte/Kconfig"
 source "arch/mips/txx9/Kconfig"
 source "arch/mips/vr41xx/Kconfig"
 source "arch/mips/cavium-octeon/Kconfig"
+source "arch/mips/loongson2ef/Kconfig"
 source "arch/mips/loongson32/Kconfig"
 source "arch/mips/loongson64/Kconfig"
 source "arch/mips/netlogic/Kconfig"
diff --git a/arch/mips/configs/fuloong2e_defconfig b/arch/mips/configs/fuloong2e_defconfig
index 7a7af706e898..1788ae23bff9 100644
--- a/arch/mips/configs/fuloong2e_defconfig
+++ b/arch/mips/configs/fuloong2e_defconfig
@@ -15,7 +15,7 @@ CONFIG_EXPERT=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_SLAB=y
 CONFIG_PROFILING=y
-CONFIG_MACH_LOONGSON64=y
+CONFIG_MACH_LOONGSON2EF=y
 CONFIG_PCI=y
 CONFIG_MIPS32_O32=y
 CONFIG_MIPS32_N32=y
diff --git a/arch/mips/configs/lemote2f_defconfig b/arch/mips/configs/lemote2f_defconfig
index d44f1469cf64..f9f93427c9bd 100644
--- a/arch/mips/configs/lemote2f_defconfig
+++ b/arch/mips/configs/lemote2f_defconfig
@@ -12,7 +12,7 @@ CONFIG_LOG_BUF_SHIFT=15
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 CONFIG_PROFILING=y
-CONFIG_MACH_LOONGSON64=y
+CONFIG_MACH_LOONGSON2EF=y
 CONFIG_LEMOTE_MACH2F=y
 CONFIG_KEXEC=y
 # CONFIG_SECCOMP is not set
diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson2ef/boot_param.h
similarity index 100%
copy from arch/mips/include/asm/mach-loongson64/boot_param.h
copy to arch/mips/include/asm/mach-loongson2ef/boot_param.h
diff --git a/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h b/arch/mips/include/asm/mach-loongson2ef/cpu-feature-overrides.h
similarity index 100%
copy from arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
copy to arch/mips/include/asm/mach-loongson2ef/cpu-feature-overrides.h
diff --git a/arch/mips/include/asm/mach-loongson64/cs5536/cs5536.h b/arch/mips/include/asm/mach-loongson2ef/cs5536/cs5536.h
similarity index 100%
copy from arch/mips/include/asm/mach-loongson64/cs5536/cs5536.h
copy to arch/mips/include/asm/mach-loongson2ef/cs5536/cs5536.h
diff --git a/arch/mips/include/asm/mach-loongson64/cs5536/cs5536_mfgpt.h b/arch/mips/include/asm/mach-loongson2ef/cs5536/cs5536_mfgpt.h
similarity index 100%
copy from arch/mips/include/asm/mach-loongson64/cs5536/cs5536_mfgpt.h
copy to arch/mips/include/asm/mach-loongson2ef/cs5536/cs5536_mfgpt.h
diff --git a/arch/mips/include/asm/mach-loongson64/cs5536/cs5536_pci.h b/arch/mips/include/asm/mach-loongson2ef/cs5536/cs5536_pci.h
similarity index 100%
copy from arch/mips/include/asm/mach-loongson64/cs5536/cs5536_pci.h
copy to arch/mips/include/asm/mach-loongson2ef/cs5536/cs5536_pci.h
diff --git a/arch/mips/include/asm/mach-loongson64/cs5536/cs5536_vsm.h b/arch/mips/include/asm/mach-loongson2ef/cs5536/cs5536_vsm.h
similarity index 100%
copy from arch/mips/include/asm/mach-loongson64/cs5536/cs5536_vsm.h
copy to arch/mips/include/asm/mach-loongson2ef/cs5536/cs5536_vsm.h
diff --git a/arch/mips/include/asm/mach-loongson64/irq.h b/arch/mips/include/asm/mach-loongson2ef/irq.h
similarity index 100%
copy from arch/mips/include/asm/mach-loongson64/irq.h
copy to arch/mips/include/asm/mach-loongson2ef/irq.h
diff --git a/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h b/arch/mips/include/asm/mach-loongson2ef/kernel-entry-init.h
similarity index 100%
copy from arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
copy to arch/mips/include/asm/mach-loongson2ef/kernel-entry-init.h
diff --git a/arch/mips/include/asm/mach-loongson64/loongson.h b/arch/mips/include/asm/mach-loongson2ef/loongson.h
similarity index 100%
copy from arch/mips/include/asm/mach-loongson64/loongson.h
copy to arch/mips/include/asm/mach-loongson2ef/loongson.h
diff --git a/arch/mips/include/asm/mach-loongson64/loongson_hwmon.h b/arch/mips/include/asm/mach-loongson2ef/loongson_hwmon.h
similarity index 100%
copy from arch/mips/include/asm/mach-loongson64/loongson_hwmon.h
copy to arch/mips/include/asm/mach-loongson2ef/loongson_hwmon.h
diff --git a/arch/mips/include/asm/mach-loongson64/loongson_regs.h b/arch/mips/include/asm/mach-loongson2ef/loongson_regs.h
similarity index 100%
copy from arch/mips/include/asm/mach-loongson64/loongson_regs.h
copy to arch/mips/include/asm/mach-loongson2ef/loongson_regs.h
diff --git a/arch/mips/include/asm/mach-loongson64/machine.h b/arch/mips/include/asm/mach-loongson2ef/machine.h
similarity index 100%
copy from arch/mips/include/asm/mach-loongson64/machine.h
copy to arch/mips/include/asm/mach-loongson2ef/machine.h
diff --git a/arch/mips/include/asm/mach-loongson64/mc146818rtc.h b/arch/mips/include/asm/mach-loongson2ef/mc146818rtc.h
similarity index 100%
copy from arch/mips/include/asm/mach-loongson64/mc146818rtc.h
copy to arch/mips/include/asm/mach-loongson2ef/mc146818rtc.h
diff --git a/arch/mips/include/asm/mach-loongson64/mem.h b/arch/mips/include/asm/mach-loongson2ef/mem.h
similarity index 100%
copy from arch/mips/include/asm/mach-loongson64/mem.h
copy to arch/mips/include/asm/mach-loongson2ef/mem.h
diff --git a/arch/mips/include/asm/mach-loongson64/mmzone.h b/arch/mips/include/asm/mach-loongson2ef/mmzone.h
similarity index 100%
copy from arch/mips/include/asm/mach-loongson64/mmzone.h
copy to arch/mips/include/asm/mach-loongson2ef/mmzone.h
diff --git a/arch/mips/include/asm/mach-loongson64/pci.h b/arch/mips/include/asm/mach-loongson2ef/pci.h
similarity index 100%
copy from arch/mips/include/asm/mach-loongson64/pci.h
copy to arch/mips/include/asm/mach-loongson2ef/pci.h
diff --git a/arch/mips/include/asm/mach-loongson64/spaces.h b/arch/mips/include/asm/mach-loongson2ef/spaces.h
similarity index 100%
copy from arch/mips/include/asm/mach-loongson64/spaces.h
copy to arch/mips/include/asm/mach-loongson2ef/spaces.h
diff --git a/arch/mips/include/asm/mach-loongson64/topology.h b/arch/mips/include/asm/mach-loongson2ef/topology.h
similarity index 100%
copy from arch/mips/include/asm/mach-loongson64/topology.h
copy to arch/mips/include/asm/mach-loongson2ef/topology.h
diff --git a/arch/mips/include/asm/mach-loongson64/workarounds.h b/arch/mips/include/asm/mach-loongson2ef/workarounds.h
similarity index 100%
copy from arch/mips/include/asm/mach-loongson64/workarounds.h
copy to arch/mips/include/asm/mach-loongson2ef/workarounds.h
diff --git a/arch/mips/loongson64/Kconfig b/arch/mips/loongson2ef/Kconfig
similarity index 65%
copy from arch/mips/loongson64/Kconfig
copy to arch/mips/loongson2ef/Kconfig
index d08b20ff2b27..007bd023a4e9 100644
--- a/arch/mips/loongson64/Kconfig
+++ b/arch/mips/loongson2ef/Kconfig
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-if MACH_LOONGSON64
+if MACH_LOONGSON2EF
 
 choice
 	prompt "Machine Type"
@@ -15,7 +15,7 @@ config LEMOTE_FULOONG2E
 	select DMA_NONCOHERENT
 	select BOOT_ELF32
 	select BOARD_SCACHE
-	select HAVE_PCI
+	select FORCE_PCI
 	select I8259
 	select ISA
 	select IRQ_MIPS_CPU
@@ -46,7 +46,7 @@ config LEMOTE_MACH2F
 	select DMA_NONCOHERENT
 	select GENERIC_ISA_DMA_SUPPORT_BROKEN
 	select HAVE_CLK
-	select HAVE_PCI
+	select FORCE_PCI
 	select I8259
 	select IRQ_MIPS_CPU
 	select ISA
@@ -63,36 +63,6 @@ config LEMOTE_MACH2F
 	  These family machines include fuloong2f mini PC, yeeloong2f notebook,
 	  LingLoong allinone PC and so forth.
 
-config LOONGSON_MACH3X
-	bool "Generic Loongson 3 family machines"
-	select ARCH_SPARSEMEM_ENABLE
-	select ARCH_MIGHT_HAVE_PC_PARPORT
-	select ARCH_MIGHT_HAVE_PC_SERIO
-	select GENERIC_ISA_DMA_SUPPORT_BROKEN
-	select BOOT_ELF32
-	select BOARD_SCACHE
-	select CSRC_R4K
-	select CEVT_R4K
-	select CPU_HAS_WB
-	select FORCE_PCI
-	select ISA
-	select I8259
-	select IRQ_MIPS_CPU
-	select NR_CPUS_DEFAULT_4
-	select SYS_HAS_CPU_LOONGSON64
-	select SYS_HAS_EARLY_PRINTK
-	select SYS_SUPPORTS_SMP
-	select SYS_SUPPORTS_HOTPLUG_CPU
-	select SYS_SUPPORTS_NUMA
-	select SYS_SUPPORTS_64BIT_KERNEL
-	select SYS_SUPPORTS_HIGHMEM
-	select SYS_SUPPORTS_LITTLE_ENDIAN
-	select LOONGSON_MC146818
-	select ZONE_DMA32
-	select LEFI_FIRMWARE_INTERFACE
-	help
-		Generic Loongson 3 family machines utilize the 3A/3B revision
-		of Loongson processor and RS780/SBX00 chipset.
 endchoice
 
 config CS5536
@@ -111,18 +81,6 @@ config CS5536_MFGPT
 
 	  If unsure, say Yes.
 
-config RS780_HPET
-	bool "RS780/SBX00 HPET Timer"
-	depends on LOONGSON_MACH3X
-	select MIPS_EXTERNAL_TIMER
-	help
-	  This option enables the hpet timer of AMD RS780/SBX00.
-
-	  If you want to enable the Loongson3 CPUFreq Driver, Please enable
-	  this option at first, otherwise, You will get wrong system time.
-
-	  If unsure, say Yes.
-
 config LOONGSON_UART_BASE
 	bool
 	default y
@@ -135,4 +93,4 @@ config LOONGSON_MC146818
 config LEFI_FIRMWARE_INTERFACE
 	bool
 
-endif # MACH_LOONGSON64
+endif # MACH_LOONGSON2EF
diff --git a/arch/mips/loongson64/Makefile b/arch/mips/loongson2ef/Makefile
similarity index 68%
copy from arch/mips/loongson64/Makefile
copy to arch/mips/loongson2ef/Makefile
index c74bc0251e9d..d4af1605cc9b 100644
--- a/arch/mips/loongson64/Makefile
+++ b/arch/mips/loongson2ef/Makefile
@@ -3,7 +3,7 @@
 # Common code for all Loongson based systems
 #
 
-obj-$(CONFIG_MACH_LOONGSON64) += common/
+obj-$(CONFIG_MACH_LOONGSON2EF) += common/
 
 #
 # Lemote Fuloong mini-PC (Loongson 2E-based)
@@ -16,9 +16,3 @@ obj-$(CONFIG_LEMOTE_FULOONG2E)	+= fuloong-2e/
 #
 
 obj-$(CONFIG_LEMOTE_MACH2F)  += lemote-2f/
-
-#
-# All Loongson-3 family machines
-#
-
-obj-$(CONFIG_CPU_LOONGSON64)  += loongson-3/
diff --git a/arch/mips/loongson2ef/Platform b/arch/mips/loongson2ef/Platform
new file mode 100644
index 000000000000..3aca42963f35
--- /dev/null
+++ b/arch/mips/loongson2ef/Platform
@@ -0,0 +1,32 @@
+#
+# Loongson Processors' Support
+#
+
+# Only gcc >= 4.4 have Loongson specific support
+cflags-$(CONFIG_CPU_LOONGSON2EF)	+= -Wa,--trap
+cflags-$(CONFIG_CPU_LOONGSON2E) += \
+	$(call cc-option,-march=loongson2e,-march=r4600)
+cflags-$(CONFIG_CPU_LOONGSON2F) += \
+	$(call cc-option,-march=loongson2f,-march=r4600)
+# Enable the workarounds for Loongson2f
+ifdef CONFIG_CPU_LOONGSON2F_WORKAROUNDS
+  ifeq ($(call as-option,-Wa$(comma)-mfix-loongson2f-nop,),)
+    $(error only binutils >= 2.20.2 have needed option -mfix-loongson2f-nop)
+  else
+    cflags-$(CONFIG_CPU_NOP_WORKAROUNDS) += -Wa$(comma)-mfix-loongson2f-nop
+  endif
+  ifeq ($(call as-option,-Wa$(comma)-mfix-loongson2f-jump,),)
+    $(error only binutils >= 2.20.2 have needed option -mfix-loongson2f-jump)
+  else
+    cflags-$(CONFIG_CPU_JUMP_WORKAROUNDS) += -Wa$(comma)-mfix-loongson2f-jump
+  endif
+endif
+
+#
+# Loongson Machines' Support
+#
+
+platform-$(CONFIG_MACH_LOONGSON2EF) += loongson2ef/
+cflags-$(CONFIG_MACH_LOONGSON2EF) += -I$(srctree)/arch/mips/include/asm/mach-loongson2ef -mno-branch-likely
+load-$(CONFIG_LEMOTE_FULOONG2E) += 0xffffffff80100000
+load-$(CONFIG_LEMOTE_MACH2F) += 0xffffffff80200000
diff --git a/arch/mips/loongson64/common/Makefile b/arch/mips/loongson2ef/common/Makefile
similarity index 100%
copy from arch/mips/loongson64/common/Makefile
copy to arch/mips/loongson2ef/common/Makefile
diff --git a/arch/mips/loongson64/common/bonito-irq.c b/arch/mips/loongson2ef/common/bonito-irq.c
similarity index 100%
copy from arch/mips/loongson64/common/bonito-irq.c
copy to arch/mips/loongson2ef/common/bonito-irq.c
diff --git a/arch/mips/loongson64/common/cmdline.c b/arch/mips/loongson2ef/common/cmdline.c
similarity index 100%
copy from arch/mips/loongson64/common/cmdline.c
copy to arch/mips/loongson2ef/common/cmdline.c
diff --git a/arch/mips/loongson64/common/cs5536/Makefile b/arch/mips/loongson2ef/common/cs5536/Makefile
similarity index 100%
rename from arch/mips/loongson64/common/cs5536/Makefile
rename to arch/mips/loongson2ef/common/cs5536/Makefile
diff --git a/arch/mips/loongson64/common/cs5536/cs5536_acc.c b/arch/mips/loongson2ef/common/cs5536/cs5536_acc.c
similarity index 100%
rename from arch/mips/loongson64/common/cs5536/cs5536_acc.c
rename to arch/mips/loongson2ef/common/cs5536/cs5536_acc.c
diff --git a/arch/mips/loongson64/common/cs5536/cs5536_ehci.c b/arch/mips/loongson2ef/common/cs5536/cs5536_ehci.c
similarity index 100%
rename from arch/mips/loongson64/common/cs5536/cs5536_ehci.c
rename to arch/mips/loongson2ef/common/cs5536/cs5536_ehci.c
diff --git a/arch/mips/loongson64/common/cs5536/cs5536_ide.c b/arch/mips/loongson2ef/common/cs5536/cs5536_ide.c
similarity index 100%
rename from arch/mips/loongson64/common/cs5536/cs5536_ide.c
rename to arch/mips/loongson2ef/common/cs5536/cs5536_ide.c
diff --git a/arch/mips/loongson64/common/cs5536/cs5536_isa.c b/arch/mips/loongson2ef/common/cs5536/cs5536_isa.c
similarity index 100%
rename from arch/mips/loongson64/common/cs5536/cs5536_isa.c
rename to arch/mips/loongson2ef/common/cs5536/cs5536_isa.c
diff --git a/arch/mips/loongson64/common/cs5536/cs5536_mfgpt.c b/arch/mips/loongson2ef/common/cs5536/cs5536_mfgpt.c
similarity index 100%
rename from arch/mips/loongson64/common/cs5536/cs5536_mfgpt.c
rename to arch/mips/loongson2ef/common/cs5536/cs5536_mfgpt.c
diff --git a/arch/mips/loongson64/common/cs5536/cs5536_ohci.c b/arch/mips/loongson2ef/common/cs5536/cs5536_ohci.c
similarity index 100%
rename from arch/mips/loongson64/common/cs5536/cs5536_ohci.c
rename to arch/mips/loongson2ef/common/cs5536/cs5536_ohci.c
diff --git a/arch/mips/loongson64/common/cs5536/cs5536_pci.c b/arch/mips/loongson2ef/common/cs5536/cs5536_pci.c
similarity index 100%
rename from arch/mips/loongson64/common/cs5536/cs5536_pci.c
rename to arch/mips/loongson2ef/common/cs5536/cs5536_pci.c
diff --git a/arch/mips/loongson64/common/early_printk.c b/arch/mips/loongson2ef/common/early_printk.c
similarity index 100%
copy from arch/mips/loongson64/common/early_printk.c
copy to arch/mips/loongson2ef/common/early_printk.c
diff --git a/arch/mips/loongson64/common/env.c b/arch/mips/loongson2ef/common/env.c
similarity index 100%
copy from arch/mips/loongson64/common/env.c
copy to arch/mips/loongson2ef/common/env.c
diff --git a/arch/mips/loongson64/common/init.c b/arch/mips/loongson2ef/common/init.c
similarity index 100%
copy from arch/mips/loongson64/common/init.c
copy to arch/mips/loongson2ef/common/init.c
diff --git a/arch/mips/loongson64/common/irq.c b/arch/mips/loongson2ef/common/irq.c
similarity index 100%
copy from arch/mips/loongson64/common/irq.c
copy to arch/mips/loongson2ef/common/irq.c
diff --git a/arch/mips/loongson64/common/machtype.c b/arch/mips/loongson2ef/common/machtype.c
similarity index 100%
copy from arch/mips/loongson64/common/machtype.c
copy to arch/mips/loongson2ef/common/machtype.c
diff --git a/arch/mips/loongson64/common/mem.c b/arch/mips/loongson2ef/common/mem.c
similarity index 100%
copy from arch/mips/loongson64/common/mem.c
copy to arch/mips/loongson2ef/common/mem.c
diff --git a/arch/mips/loongson64/common/pci.c b/arch/mips/loongson2ef/common/pci.c
similarity index 100%
copy from arch/mips/loongson64/common/pci.c
copy to arch/mips/loongson2ef/common/pci.c
diff --git a/arch/mips/loongson64/common/platform.c b/arch/mips/loongson2ef/common/platform.c
similarity index 100%
copy from arch/mips/loongson64/common/platform.c
copy to arch/mips/loongson2ef/common/platform.c
diff --git a/arch/mips/loongson64/common/pm.c b/arch/mips/loongson2ef/common/pm.c
similarity index 100%
copy from arch/mips/loongson64/common/pm.c
copy to arch/mips/loongson2ef/common/pm.c
diff --git a/arch/mips/loongson64/common/reset.c b/arch/mips/loongson2ef/common/reset.c
similarity index 100%
copy from arch/mips/loongson64/common/reset.c
copy to arch/mips/loongson2ef/common/reset.c
diff --git a/arch/mips/loongson64/common/rtc.c b/arch/mips/loongson2ef/common/rtc.c
similarity index 100%
copy from arch/mips/loongson64/common/rtc.c
copy to arch/mips/loongson2ef/common/rtc.c
diff --git a/arch/mips/loongson64/common/serial.c b/arch/mips/loongson2ef/common/serial.c
similarity index 100%
copy from arch/mips/loongson64/common/serial.c
copy to arch/mips/loongson2ef/common/serial.c
diff --git a/arch/mips/loongson64/common/setup.c b/arch/mips/loongson2ef/common/setup.c
similarity index 100%
copy from arch/mips/loongson64/common/setup.c
copy to arch/mips/loongson2ef/common/setup.c
diff --git a/arch/mips/loongson64/common/time.c b/arch/mips/loongson2ef/common/time.c
similarity index 100%
copy from arch/mips/loongson64/common/time.c
copy to arch/mips/loongson2ef/common/time.c
diff --git a/arch/mips/loongson64/common/uart_base.c b/arch/mips/loongson2ef/common/uart_base.c
similarity index 100%
copy from arch/mips/loongson64/common/uart_base.c
copy to arch/mips/loongson2ef/common/uart_base.c
diff --git a/arch/mips/loongson64/fuloong-2e/Makefile b/arch/mips/loongson2ef/fuloong-2e/Makefile
similarity index 100%
rename from arch/mips/loongson64/fuloong-2e/Makefile
rename to arch/mips/loongson2ef/fuloong-2e/Makefile
diff --git a/arch/mips/loongson64/fuloong-2e/dma.c b/arch/mips/loongson2ef/fuloong-2e/dma.c
similarity index 100%
rename from arch/mips/loongson64/fuloong-2e/dma.c
rename to arch/mips/loongson2ef/fuloong-2e/dma.c
diff --git a/arch/mips/loongson64/fuloong-2e/irq.c b/arch/mips/loongson2ef/fuloong-2e/irq.c
similarity index 100%
rename from arch/mips/loongson64/fuloong-2e/irq.c
rename to arch/mips/loongson2ef/fuloong-2e/irq.c
diff --git a/arch/mips/loongson64/fuloong-2e/reset.c b/arch/mips/loongson2ef/fuloong-2e/reset.c
similarity index 100%
rename from arch/mips/loongson64/fuloong-2e/reset.c
rename to arch/mips/loongson2ef/fuloong-2e/reset.c
diff --git a/arch/mips/loongson64/lemote-2f/Makefile b/arch/mips/loongson2ef/lemote-2f/Makefile
similarity index 100%
rename from arch/mips/loongson64/lemote-2f/Makefile
rename to arch/mips/loongson2ef/lemote-2f/Makefile
diff --git a/arch/mips/loongson64/lemote-2f/clock.c b/arch/mips/loongson2ef/lemote-2f/clock.c
similarity index 98%
rename from arch/mips/loongson64/lemote-2f/clock.c
rename to arch/mips/loongson2ef/lemote-2f/clock.c
index 8281334df9c8..1ced30e7aeef 100644
--- a/arch/mips/loongson64/lemote-2f/clock.c
+++ b/arch/mips/loongson2ef/lemote-2f/clock.c
@@ -15,7 +15,7 @@
 #include <linux/spinlock.h>
 
 #include <asm/clock.h>
-#include <asm/mach-loongson64/loongson.h>
+#include <asm/mach-loongson2ef/loongson.h>
 
 static LIST_HEAD(clock_list);
 static DEFINE_SPINLOCK(clock_lock);
diff --git a/arch/mips/loongson64/lemote-2f/dma.c b/arch/mips/loongson2ef/lemote-2f/dma.c
similarity index 100%
rename from arch/mips/loongson64/lemote-2f/dma.c
rename to arch/mips/loongson2ef/lemote-2f/dma.c
diff --git a/arch/mips/loongson64/lemote-2f/ec_kb3310b.c b/arch/mips/loongson2ef/lemote-2f/ec_kb3310b.c
similarity index 100%
rename from arch/mips/loongson64/lemote-2f/ec_kb3310b.c
rename to arch/mips/loongson2ef/lemote-2f/ec_kb3310b.c
diff --git a/arch/mips/loongson64/lemote-2f/ec_kb3310b.h b/arch/mips/loongson2ef/lemote-2f/ec_kb3310b.h
similarity index 100%
rename from arch/mips/loongson64/lemote-2f/ec_kb3310b.h
rename to arch/mips/loongson2ef/lemote-2f/ec_kb3310b.h
diff --git a/arch/mips/loongson64/lemote-2f/irq.c b/arch/mips/loongson2ef/lemote-2f/irq.c
similarity index 100%
rename from arch/mips/loongson64/lemote-2f/irq.c
rename to arch/mips/loongson2ef/lemote-2f/irq.c
diff --git a/arch/mips/loongson64/lemote-2f/machtype.c b/arch/mips/loongson2ef/lemote-2f/machtype.c
similarity index 100%
rename from arch/mips/loongson64/lemote-2f/machtype.c
rename to arch/mips/loongson2ef/lemote-2f/machtype.c
diff --git a/arch/mips/loongson64/lemote-2f/pm.c b/arch/mips/loongson2ef/lemote-2f/pm.c
similarity index 100%
rename from arch/mips/loongson64/lemote-2f/pm.c
rename to arch/mips/loongson2ef/lemote-2f/pm.c
diff --git a/arch/mips/loongson64/lemote-2f/reset.c b/arch/mips/loongson2ef/lemote-2f/reset.c
similarity index 100%
rename from arch/mips/loongson64/lemote-2f/reset.c
rename to arch/mips/loongson2ef/lemote-2f/reset.c
diff --git a/arch/mips/loongson64/Kconfig b/arch/mips/loongson64/Kconfig
index d08b20ff2b27..0e99a5af6e90 100644
--- a/arch/mips/loongson64/Kconfig
+++ b/arch/mips/loongson64/Kconfig
@@ -4,65 +4,6 @@ if MACH_LOONGSON64
 choice
 	prompt "Machine Type"
 
-config LEMOTE_FULOONG2E
-	bool "Lemote Fuloong(2e) mini-PC"
-	select ARCH_SPARSEMEM_ENABLE
-	select ARCH_MIGHT_HAVE_PC_PARPORT
-	select ARCH_MIGHT_HAVE_PC_SERIO
-	select CEVT_R4K
-	select CSRC_R4K
-	select SYS_HAS_CPU_LOONGSON2E
-	select DMA_NONCOHERENT
-	select BOOT_ELF32
-	select BOARD_SCACHE
-	select HAVE_PCI
-	select I8259
-	select ISA
-	select IRQ_MIPS_CPU
-	select SYS_SUPPORTS_64BIT_KERNEL
-	select SYS_SUPPORTS_LITTLE_ENDIAN
-	select SYS_SUPPORTS_HIGHMEM
-	select SYS_HAS_EARLY_PRINTK
-	select GENERIC_ISA_DMA_SUPPORT_BROKEN
-	select CPU_HAS_WB
-	select LOONGSON_MC146818
-	help
-	  Lemote Fuloong(2e) mini-PC board based on the Chinese Loongson-2E CPU and
-	  an FPGA northbridge
-
-	  Lemote Fuloong(2e) mini PC have a VIA686B south bridge.
-
-config LEMOTE_MACH2F
-	bool "Lemote Loongson 2F family machines"
-	select ARCH_SPARSEMEM_ENABLE
-	select ARCH_MIGHT_HAVE_PC_PARPORT
-	select ARCH_MIGHT_HAVE_PC_SERIO
-	select BOARD_SCACHE
-	select BOOT_ELF32
-	select CEVT_R4K if ! MIPS_EXTERNAL_TIMER
-	select CPU_HAS_WB
-	select CS5536
-	select CSRC_R4K if ! MIPS_EXTERNAL_TIMER
-	select DMA_NONCOHERENT
-	select GENERIC_ISA_DMA_SUPPORT_BROKEN
-	select HAVE_CLK
-	select HAVE_PCI
-	select I8259
-	select IRQ_MIPS_CPU
-	select ISA
-	select SYS_HAS_CPU_LOONGSON2F
-	select SYS_HAS_EARLY_PRINTK
-	select SYS_SUPPORTS_64BIT_KERNEL
-	select SYS_SUPPORTS_HIGHMEM
-	select SYS_SUPPORTS_LITTLE_ENDIAN
-	select LOONGSON_MC146818
-	help
-	  Lemote Loongson 2F family machines utilize the 2F revision of
-	  Loongson processor and the AMD CS5536 south bridge.
-
-	  These family machines include fuloong2f mini PC, yeeloong2f notebook,
-	  LingLoong allinone PC and so forth.
-
 config LOONGSON_MACH3X
 	bool "Generic Loongson 3 family machines"
 	select ARCH_SPARSEMEM_ENABLE
@@ -95,22 +36,6 @@ config LOONGSON_MACH3X
 		of Loongson processor and RS780/SBX00 chipset.
 endchoice
 
-config CS5536
-	bool
-
-config CS5536_MFGPT
-	bool "CS5536 MFGPT Timer"
-	depends on CS5536 && !HIGH_RES_TIMERS
-	select MIPS_EXTERNAL_TIMER
-	help
-	  This option enables the mfgpt0 timer of AMD CS5536. With this timer
-	  switched on you can not use high resolution timers.
-
-	  If you want to enable the Loongson2 CPUFreq Driver, Please enable
-	  this option at first, otherwise, You will get wrong system time.
-
-	  If unsure, say Yes.
-
 config RS780_HPET
 	bool "RS780/SBX00 HPET Timer"
 	depends on LOONGSON_MACH3X
diff --git a/arch/mips/loongson64/Makefile b/arch/mips/loongson64/Makefile
index c74bc0251e9d..dc16a23c171f 100644
--- a/arch/mips/loongson64/Makefile
+++ b/arch/mips/loongson64/Makefile
@@ -5,18 +5,6 @@
 
 obj-$(CONFIG_MACH_LOONGSON64) += common/
 
-#
-# Lemote Fuloong mini-PC (Loongson 2E-based)
-#
-
-obj-$(CONFIG_LEMOTE_FULOONG2E)	+= fuloong-2e/
-
-#
-# Lemote loongson2f family machines
-#
-
-obj-$(CONFIG_LEMOTE_MACH2F)  += lemote-2f/
-
 #
 # All Loongson-3 family machines
 #
diff --git a/arch/mips/loongson64/Platform b/arch/mips/loongson64/Platform
index 4da74eea7de8..31167e568e46 100644
--- a/arch/mips/loongson64/Platform
+++ b/arch/mips/loongson64/Platform
@@ -2,25 +2,6 @@
 # Loongson Processors' Support
 #
 
-# Only gcc >= 4.4 have Loongson specific support
-cflags-$(CONFIG_CPU_LOONGSON2EF)	+= -Wa,--trap
-cflags-$(CONFIG_CPU_LOONGSON2E) += \
-	$(call cc-option,-march=loongson2e,-march=r4600)
-cflags-$(CONFIG_CPU_LOONGSON2F) += \
-	$(call cc-option,-march=loongson2f,-march=r4600)
-# Enable the workarounds for Loongson2f
-ifdef CONFIG_CPU_LOONGSON2F_WORKAROUNDS
-  ifeq ($(call as-option,-Wa$(comma)-mfix-loongson2f-nop,),)
-    $(error only binutils >= 2.20.2 have needed option -mfix-loongson2f-nop)
-  else
-    cflags-$(CONFIG_CPU_NOP_WORKAROUNDS) += -Wa$(comma)-mfix-loongson2f-nop
-  endif
-  ifeq ($(call as-option,-Wa$(comma)-mfix-loongson2f-jump,),)
-    $(error only binutils >= 2.20.2 have needed option -mfix-loongson2f-jump)
-  else
-    cflags-$(CONFIG_CPU_JUMP_WORKAROUNDS) += -Wa$(comma)-mfix-loongson2f-jump
-  endif
-endif
 
 cflags-$(CONFIG_CPU_LOONGSON64)	+= -Wa,--trap
 
@@ -72,6 +53,4 @@ endif
 
 platform-$(CONFIG_MACH_LOONGSON64) += loongson64/
 cflags-$(CONFIG_MACH_LOONGSON64) += -I$(srctree)/arch/mips/include/asm/mach-loongson64 -mno-branch-likely
-load-$(CONFIG_LEMOTE_FULOONG2E) += 0xffffffff80100000
-load-$(CONFIG_LEMOTE_MACH2F) += 0xffffffff80200000
 load-$(CONFIG_LOONGSON_MACH3X) += 0xffffffff80200000
diff --git a/arch/mips/loongson64/common/Makefile b/arch/mips/loongson64/common/Makefile
index 684624f61f5a..85438df80950 100644
--- a/arch/mips/loongson64/common/Makefile
+++ b/arch/mips/loongson64/common/Makefile
@@ -14,12 +14,6 @@ obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-$(CONFIG_LOONGSON_UART_BASE) += uart_base.o
 obj-$(CONFIG_LOONGSON_MC146818) += rtc.o
 
-#
-# Enable CS5536 Virtual Support Module(VSM) to virtulize the PCI configure
-# space
-#
-obj-$(CONFIG_CS5536) += cs5536/
-
 #
 # Suspend Support
 #
diff --git a/drivers/cpufreq/loongson2_cpufreq.c b/drivers/cpufreq/loongson2_cpufreq.c
index 890813e0bb76..e9caa9586982 100644
--- a/drivers/cpufreq/loongson2_cpufreq.c
+++ b/drivers/cpufreq/loongson2_cpufreq.c
@@ -23,7 +23,7 @@
 #include <asm/clock.h>
 #include <asm/idle.h>
 
-#include <asm/mach-loongson64/loongson.h>
+#include <asm/mach-loongson2ef/loongson.h>
 
 static uint nowait;
 
-- 
2.23.0

