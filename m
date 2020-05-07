Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F5B61C8CEA
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 15:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbgEGNsC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 09:48:02 -0400
Received: from mx2.suse.de ([195.135.220.15]:56756 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726476AbgEGNsB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 7 May 2020 09:48:01 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 95EB7AD5D;
        Thu,  7 May 2020 13:47:57 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] MIPS: Remove NEC MARKEINS/EMMA
Date:   Thu,  7 May 2020 15:47:43 +0200
Message-Id: <20200507134747.7403-3-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200507134747.7403-1-tsbogend@alpha.franken.de>
References: <20200507134747.7403-1-tsbogend@alpha.franken.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

No (active) developer owns this hardware, so let's remove Linux support.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/Kbuild.platforms               |   1 -
 arch/mips/Kconfig                        |  19 --
 arch/mips/configs/markeins_defconfig     | 185 -------------------
 arch/mips/emma/Makefile                  |   7 -
 arch/mips/emma/Platform                  |   4 -
 arch/mips/emma/common/Makefile           |   6 -
 arch/mips/emma/common/prom.c             |  56 ------
 arch/mips/emma/markeins/Makefile         |   6 -
 arch/mips/emma/markeins/irq.c            | 293 -------------------------------
 arch/mips/emma/markeins/led.c            |  44 -----
 arch/mips/emma/markeins/platform.c       | 199 ---------------------
 arch/mips/emma/markeins/setup.c          | 115 ------------
 arch/mips/include/asm/emma/emma2rh.h     | 248 --------------------------
 arch/mips/include/asm/emma/markeins.h    |  28 ---
 arch/mips/include/asm/mach-emma2rh/irq.h |  15 --
 arch/mips/pci/Makefile                   |   1 -
 arch/mips/pci/fixup-emma2rh.c            |  84 ---------
 arch/mips/pci/ops-emma2rh.c              | 167 ------------------
 arch/mips/pci/pci-emma2rh.c              |  72 --------
 19 files changed, 1550 deletions(-)
 delete mode 100644 arch/mips/configs/markeins_defconfig
 delete mode 100644 arch/mips/emma/Makefile
 delete mode 100644 arch/mips/emma/Platform
 delete mode 100644 arch/mips/emma/common/Makefile
 delete mode 100644 arch/mips/emma/common/prom.c
 delete mode 100644 arch/mips/emma/markeins/Makefile
 delete mode 100644 arch/mips/emma/markeins/irq.c
 delete mode 100644 arch/mips/emma/markeins/led.c
 delete mode 100644 arch/mips/emma/markeins/platform.c
 delete mode 100644 arch/mips/emma/markeins/setup.c
 delete mode 100644 arch/mips/include/asm/emma/emma2rh.h
 delete mode 100644 arch/mips/include/asm/emma/markeins.h
 delete mode 100644 arch/mips/include/asm/mach-emma2rh/irq.h
 delete mode 100644 arch/mips/pci/fixup-emma2rh.c
 delete mode 100644 arch/mips/pci/ops-emma2rh.c
 delete mode 100644 arch/mips/pci/pci-emma2rh.c

diff --git a/arch/mips/Kbuild.platforms b/arch/mips/Kbuild.platforms
index 65c119432e06..292b59afb4ba 100644
--- a/arch/mips/Kbuild.platforms
+++ b/arch/mips/Kbuild.platforms
@@ -11,7 +11,6 @@ platforms += bmips
 platforms += cavium-octeon
 platforms += cobalt
 platforms += dec
-platforms += emma
 platforms += generic
 platforms += jazz
 platforms += jz4740
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index f2565a88e086..ce1aacc2ee9c 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -580,13 +580,6 @@ config MACH_PIC32
 	  Microchip PIC32 is a family of general-purpose 32 bit MIPS core
 	  microcontrollers.
 
-config NEC_MARKEINS
-	bool "NEC EMMA2RH Mark-eins board"
-	select SOC_EMMA2RH
-	select HAVE_PCI
-	help
-	  This enables support for the NEC Electronics Mark-eins boards.
-
 config MACH_VR41XX
 	bool "NEC VR4100 series based machines"
 	select CEVT_R4K
@@ -1292,18 +1285,6 @@ config PCI_XTALK_BRIDGE
 config NO_EXCEPT_FILL
 	bool
 
-config SOC_EMMA2RH
-	bool
-	select CEVT_R4K
-	select CSRC_R4K
-	select DMA_NONCOHERENT
-	select IRQ_MIPS_CPU
-	select SWAP_IO_SPACE
-	select SYS_HAS_CPU_R5500
-	select SYS_SUPPORTS_32BIT_KERNEL
-	select SYS_SUPPORTS_64BIT_KERNEL
-	select SYS_SUPPORTS_BIG_ENDIAN
-
 config SOC_PNX833X
 	bool
 	select CEVT_R4K
diff --git a/arch/mips/configs/markeins_defconfig b/arch/mips/configs/markeins_defconfig
deleted file mode 100644
index 507ad91b21e7..000000000000
--- a/arch/mips/configs/markeins_defconfig
+++ /dev/null
@@ -1,185 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_POSIX_MQUEUE=y
-CONFIG_PREEMPT=y
-CONFIG_BSD_PROCESS_ACCT=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_EXPERT=y
-CONFIG_SLAB=y
-CONFIG_NEC_MARKEINS=y
-CONFIG_HZ_1000=y
-CONFIG_PCI=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODULE_FORCE_UNLOAD=y
-CONFIG_MODVERSIONS=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_NET_KEY=y
-CONFIG_NET_KEY_MIGRATE=y
-CONFIG_INET=y
-CONFIG_IP_MULTICAST=y
-CONFIG_IP_ADVANCED_ROUTER=y
-CONFIG_IP_MULTIPLE_TABLES=y
-CONFIG_IP_ROUTE_MULTIPATH=y
-CONFIG_IP_ROUTE_VERBOSE=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_BOOTP=y
-CONFIG_SYN_COOKIES=y
-CONFIG_INET_XFRM_MODE_TRANSPORT=m
-CONFIG_INET_XFRM_MODE_TUNNEL=m
-CONFIG_INET_XFRM_MODE_BEET=m
-CONFIG_TCP_MD5SIG=y
-CONFIG_IPV6_MIP6=m
-CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION=m
-CONFIG_IPV6_MULTIPLE_TABLES=y
-CONFIG_IPV6_SUBTREES=y
-CONFIG_NETWORK_SECMARK=y
-CONFIG_NETFILTER=y
-CONFIG_NF_CONNTRACK=m
-CONFIG_NF_CONNTRACK_SECMARK=y
-CONFIG_NF_CONNTRACK_EVENTS=y
-CONFIG_NF_CONNTRACK_AMANDA=m
-CONFIG_NF_CONNTRACK_FTP=m
-CONFIG_NF_CONNTRACK_H323=m
-CONFIG_NF_CONNTRACK_IRC=m
-CONFIG_NF_CONNTRACK_PPTP=m
-CONFIG_NF_CONNTRACK_SANE=m
-CONFIG_NF_CONNTRACK_SIP=m
-CONFIG_NF_CONNTRACK_TFTP=m
-CONFIG_NETFILTER_XT_TARGET_CLASSIFY=m
-CONFIG_NETFILTER_XT_TARGET_CONNMARK=m
-CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=m
-CONFIG_NETFILTER_XT_TARGET_DSCP=m
-CONFIG_NETFILTER_XT_TARGET_MARK=m
-CONFIG_NETFILTER_XT_TARGET_NFLOG=m
-CONFIG_NETFILTER_XT_TARGET_NFQUEUE=m
-CONFIG_NETFILTER_XT_TARGET_SECMARK=m
-CONFIG_NETFILTER_XT_TARGET_TCPMSS=m
-CONFIG_NETFILTER_XT_MATCH_COMMENT=m
-CONFIG_NETFILTER_XT_MATCH_CONNBYTES=m
-CONFIG_NETFILTER_XT_MATCH_CONNMARK=m
-CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
-CONFIG_NETFILTER_XT_MATCH_DCCP=m
-CONFIG_NETFILTER_XT_MATCH_DSCP=m
-CONFIG_NETFILTER_XT_MATCH_ESP=m
-CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=m
-CONFIG_NETFILTER_XT_MATCH_HELPER=m
-CONFIG_NETFILTER_XT_MATCH_LENGTH=m
-CONFIG_NETFILTER_XT_MATCH_LIMIT=m
-CONFIG_NETFILTER_XT_MATCH_MAC=m
-CONFIG_NETFILTER_XT_MATCH_MARK=m
-CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
-CONFIG_NETFILTER_XT_MATCH_POLICY=m
-CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
-CONFIG_NETFILTER_XT_MATCH_QUOTA=m
-CONFIG_NETFILTER_XT_MATCH_REALM=m
-CONFIG_NETFILTER_XT_MATCH_STATE=m
-CONFIG_NETFILTER_XT_MATCH_STATISTIC=m
-CONFIG_NETFILTER_XT_MATCH_STRING=m
-CONFIG_NETFILTER_XT_MATCH_TCPMSS=m
-CONFIG_IP_NF_IPTABLES=m
-CONFIG_IP_NF_MATCH_AH=m
-CONFIG_IP_NF_MATCH_ECN=m
-CONFIG_IP_NF_MATCH_TTL=m
-CONFIG_IP_NF_FILTER=m
-CONFIG_IP_NF_TARGET_REJECT=m
-CONFIG_IP_NF_MANGLE=m
-CONFIG_IP_NF_TARGET_CLUSTERIP=m
-CONFIG_IP_NF_TARGET_ECN=m
-CONFIG_IP_NF_TARGET_TTL=m
-CONFIG_IP_NF_RAW=m
-CONFIG_IP_NF_ARPTABLES=m
-CONFIG_IP_NF_ARPFILTER=m
-CONFIG_IP_NF_ARP_MANGLE=m
-CONFIG_IP6_NF_IPTABLES=m
-CONFIG_IP6_NF_MATCH_AH=m
-CONFIG_IP6_NF_MATCH_EUI64=m
-CONFIG_IP6_NF_MATCH_FRAG=m
-CONFIG_IP6_NF_MATCH_OPTS=m
-CONFIG_IP6_NF_MATCH_HL=m
-CONFIG_IP6_NF_MATCH_IPV6HEADER=m
-CONFIG_IP6_NF_MATCH_MH=m
-CONFIG_IP6_NF_MATCH_RT=m
-CONFIG_IP6_NF_TARGET_HL=m
-CONFIG_IP6_NF_FILTER=m
-CONFIG_IP6_NF_TARGET_REJECT=m
-CONFIG_IP6_NF_MANGLE=m
-CONFIG_IP6_NF_RAW=m
-CONFIG_FW_LOADER=m
-CONFIG_MTD=y
-CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_BLOCK=y
-CONFIG_MTD_CFI=y
-CONFIG_MTD_CFI_AMDSTD=y
-CONFIG_MTD_PHYSMAP=y
-CONFIG_BLK_DEV_LOOP=m
-CONFIG_BLK_DEV_CRYPTOLOOP=m
-CONFIG_SCSI=m
-# CONFIG_SCSI_PROC_FS is not set
-CONFIG_BLK_DEV_SD=m
-CONFIG_CHR_DEV_SG=m
-CONFIG_SCSI_SCAN_ASYNC=y
-CONFIG_SCSI_AIC94XX=m
-# CONFIG_AIC94XX_DEBUG is not set
-CONFIG_NETDEVICES=y
-CONFIG_TUN=m
-CONFIG_CHELSIO_T3=m
-CONFIG_NATSEMI=y
-CONFIG_QLA3XXX=m
-CONFIG_NETXEN_NIC=m
-CONFIG_PPP=m
-CONFIG_PPP_DEFLATE=m
-CONFIG_PPP_ASYNC=m
-CONFIG_PPP_SYNC_TTY=m
-CONFIG_INPUT_EVDEV=m
-# CONFIG_INPUT_KEYBOARD is not set
-# CONFIG_INPUT_MOUSE is not set
-# CONFIG_SERIO is not set
-# CONFIG_VT is not set
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-# CONFIG_HW_RANDOM is not set
-CONFIG_I2C=y
-CONFIG_I2C_CHARDEV=y
-CONFIG_I2C_DEBUG_CORE=y
-CONFIG_I2C_DEBUG_BUS=y
-# CONFIG_HID is not set
-CONFIG_EXT2_FS=y
-CONFIG_EXT2_FS_XATTR=y
-CONFIG_EXT2_FS_POSIX_ACL=y
-CONFIG_EXT2_FS_SECURITY=y
-CONFIG_EXT3_FS=m
-CONFIG_XFS_FS=m
-# CONFIG_DNOTIFY is not set
-CONFIG_AUTOFS4_FS=m
-CONFIG_MSDOS_FS=y
-CONFIG_VFAT_FS=y
-CONFIG_NTFS_FS=m
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_JFFS2_FS=y
-CONFIG_JFFS2_COMPRESSION_OPTIONS=y
-CONFIG_CRAMFS=y
-CONFIG_NFS_FS=y
-CONFIG_NFS_V4=y
-CONFIG_ROOT_NFS=y
-CONFIG_NFSD=m
-CONFIG_NFSD_V3=y
-CONFIG_NLS_DEFAULT=""
-CONFIG_NLS_CODEPAGE_437=m
-CONFIG_NLS_ASCII=m
-CONFIG_NLS_ISO8859_1=m
-CONFIG_NLS_UTF8=m
-CONFIG_CRYPTO_ECB=m
-CONFIG_CRYPTO_LRW=m
-CONFIG_CRYPTO_PCBC=m
-CONFIG_CRYPTO_HMAC=y
-CONFIG_CRYPTO_XCBC=m
-CONFIG_CRYPTO_CAMELLIA=m
-CONFIG_CRYPTO_FCRYPT=m
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="console=ttyS0,115200 mem=192m ip=bootp root=/dev/nfs rw"
diff --git a/arch/mips/emma/Makefile b/arch/mips/emma/Makefile
deleted file mode 100644
index bc03082064ca..000000000000
--- a/arch/mips/emma/Makefile
+++ /dev/null
@@ -1,7 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_SOC_EMMA2RH)	+= common/
-
-#
-# NEC EMMA2RH Mark-eins
-#
-obj-$(CONFIG_NEC_MARKEINS)	+= markeins/
diff --git a/arch/mips/emma/Platform b/arch/mips/emma/Platform
deleted file mode 100644
index 0282f7f99b88..000000000000
--- a/arch/mips/emma/Platform
+++ /dev/null
@@ -1,4 +0,0 @@
-platform-$(CONFIG_SOC_EMMA2RH)	+= emma/
-cflags-$(CONFIG_SOC_EMMA2RH)	+=					\
-		-I$(srctree)/arch/mips/include/asm/mach-emma2rh
-load-$(CONFIG_NEC_MARKEINS)	+= 0xffffffff88100000
diff --git a/arch/mips/emma/common/Makefile b/arch/mips/emma/common/Makefile
deleted file mode 100644
index a754abd1beb9..000000000000
--- a/arch/mips/emma/common/Makefile
+++ /dev/null
@@ -1,6 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-#
-#  Copyright (C) NEC Electronics Corporation 2005-2006
-#
-
-obj-$(CONFIG_NEC_MARKEINS)	+= prom.o
diff --git a/arch/mips/emma/common/prom.c b/arch/mips/emma/common/prom.c
deleted file mode 100644
index 7c3a6f32beda..000000000000
--- a/arch/mips/emma/common/prom.c
+++ /dev/null
@@ -1,56 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  Copyright (C) NEC Electronics Corporation 2004-2006
- *
- *  This file is based on the arch/mips/ddb5xxx/common/prom.c
- *
- *	Copyright 2001 MontaVista Software Inc.
- */
-#include <linux/init.h>
-#include <linux/mm.h>
-#include <linux/sched.h>
-#include <linux/memblock.h>
-
-#include <asm/addrspace.h>
-#include <asm/bootinfo.h>
-#include <asm/emma/emma2rh.h>
-
-const char *get_system_type(void)
-{
-#ifdef CONFIG_NEC_MARKEINS
-	return "NEC EMMA2RH Mark-eins";
-#else
-#error  Unknown NEC board
-#endif
-}
-
-/* [jsun@junsun.net] PMON passes arguments in C main() style */
-void __init prom_init(void)
-{
-	int argc = fw_arg0;
-	char **arg = (char **)fw_arg1;
-	int i;
-
-	/* if user passes kernel args, ignore the default one */
-	if (argc > 1)
-		arcs_cmdline[0] = '\0';
-
-	/* arg[0] is "g", the rest is boot parameters */
-	for (i = 1; i < argc; i++) {
-		if (strlen(arcs_cmdline) + strlen(arg[i]) + 1
-		    >= sizeof(arcs_cmdline))
-			break;
-		strcat(arcs_cmdline, arg[i]);
-		strcat(arcs_cmdline, " ");
-	}
-
-#ifdef CONFIG_NEC_MARKEINS
-	add_memory_region(0, EMMA2RH_RAM_SIZE, BOOT_MEM_RAM);
-#else
-#error  Unknown NEC board
-#endif
-}
-
-void __init prom_free_prom_memory(void)
-{
-}
diff --git a/arch/mips/emma/markeins/Makefile b/arch/mips/emma/markeins/Makefile
deleted file mode 100644
index 8c8649069504..000000000000
--- a/arch/mips/emma/markeins/Makefile
+++ /dev/null
@@ -1,6 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-#
-#  Copyright (C) NEC Electronics Corporation 2005-2006
-#
-
-obj-$(CONFIG_NEC_MARKEINS) += irq.o setup.o led.o platform.o
diff --git a/arch/mips/emma/markeins/irq.c b/arch/mips/emma/markeins/irq.c
deleted file mode 100644
index 4aebf559be2e..000000000000
--- a/arch/mips/emma/markeins/irq.c
+++ /dev/null
@@ -1,293 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  Copyright (C) NEC Electronics Corporation 2004-2006
- *
- *  This file is based on the arch/mips/ddb5xxx/ddb5477/irq.c
- *
- *	Copyright 2001 MontaVista Software Inc.
- */
-#include <linux/init.h>
-#include <linux/interrupt.h>
-#include <linux/irq.h>
-#include <linux/types.h>
-#include <linux/ptrace.h>
-#include <linux/delay.h>
-
-#include <asm/irq_cpu.h>
-#include <asm/mipsregs.h>
-#include <asm/addrspace.h>
-#include <asm/bootinfo.h>
-
-#include <asm/emma/emma2rh.h>
-
-static void emma2rh_irq_enable(struct irq_data *d)
-{
-	unsigned int irq = d->irq - EMMA2RH_IRQ_BASE;
-	u32 reg_value, reg_bitmask, reg_index;
-
-	reg_index = EMMA2RH_BHIF_INT_EN_0 +
-		    (EMMA2RH_BHIF_INT_EN_1 - EMMA2RH_BHIF_INT_EN_0) * (irq / 32);
-	reg_value = emma2rh_in32(reg_index);
-	reg_bitmask = 0x1 << (irq % 32);
-	emma2rh_out32(reg_index, reg_value | reg_bitmask);
-}
-
-static void emma2rh_irq_disable(struct irq_data *d)
-{
-	unsigned int irq = d->irq - EMMA2RH_IRQ_BASE;
-	u32 reg_value, reg_bitmask, reg_index;
-
-	reg_index = EMMA2RH_BHIF_INT_EN_0 +
-		    (EMMA2RH_BHIF_INT_EN_1 - EMMA2RH_BHIF_INT_EN_0) * (irq / 32);
-	reg_value = emma2rh_in32(reg_index);
-	reg_bitmask = 0x1 << (irq % 32);
-	emma2rh_out32(reg_index, reg_value & ~reg_bitmask);
-}
-
-struct irq_chip emma2rh_irq_controller = {
-	.name = "emma2rh_irq",
-	.irq_mask = emma2rh_irq_disable,
-	.irq_unmask = emma2rh_irq_enable,
-};
-
-void emma2rh_irq_init(void)
-{
-	u32 i;
-
-	for (i = 0; i < NUM_EMMA2RH_IRQ; i++)
-		irq_set_chip_and_handler_name(EMMA2RH_IRQ_BASE + i,
-					      &emma2rh_irq_controller,
-					      handle_level_irq, "level");
-}
-
-static void emma2rh_sw_irq_enable(struct irq_data *d)
-{
-	unsigned int irq = d->irq - EMMA2RH_SW_IRQ_BASE;
-	u32 reg;
-
-	reg = emma2rh_in32(EMMA2RH_BHIF_SW_INT_EN);
-	reg |= 1 << irq;
-	emma2rh_out32(EMMA2RH_BHIF_SW_INT_EN, reg);
-}
-
-static void emma2rh_sw_irq_disable(struct irq_data *d)
-{
-	unsigned int irq = d->irq - EMMA2RH_SW_IRQ_BASE;
-	u32 reg;
-
-	reg = emma2rh_in32(EMMA2RH_BHIF_SW_INT_EN);
-	reg &= ~(1 << irq);
-	emma2rh_out32(EMMA2RH_BHIF_SW_INT_EN, reg);
-}
-
-struct irq_chip emma2rh_sw_irq_controller = {
-	.name = "emma2rh_sw_irq",
-	.irq_mask = emma2rh_sw_irq_disable,
-	.irq_unmask = emma2rh_sw_irq_enable,
-};
-
-void emma2rh_sw_irq_init(void)
-{
-	u32 i;
-
-	for (i = 0; i < NUM_EMMA2RH_IRQ_SW; i++)
-		irq_set_chip_and_handler_name(EMMA2RH_SW_IRQ_BASE + i,
-					      &emma2rh_sw_irq_controller,
-					      handle_level_irq, "level");
-}
-
-static void emma2rh_gpio_irq_enable(struct irq_data *d)
-{
-	unsigned int irq = d->irq - EMMA2RH_GPIO_IRQ_BASE;
-	u32 reg;
-
-	reg = emma2rh_in32(EMMA2RH_GPIO_INT_MASK);
-	reg |= 1 << irq;
-	emma2rh_out32(EMMA2RH_GPIO_INT_MASK, reg);
-}
-
-static void emma2rh_gpio_irq_disable(struct irq_data *d)
-{
-	unsigned int irq = d->irq - EMMA2RH_GPIO_IRQ_BASE;
-	u32 reg;
-
-	reg = emma2rh_in32(EMMA2RH_GPIO_INT_MASK);
-	reg &= ~(1 << irq);
-	emma2rh_out32(EMMA2RH_GPIO_INT_MASK, reg);
-}
-
-static void emma2rh_gpio_irq_ack(struct irq_data *d)
-{
-	unsigned int irq = d->irq - EMMA2RH_GPIO_IRQ_BASE;
-
-	emma2rh_out32(EMMA2RH_GPIO_INT_ST, ~(1 << irq));
-}
-
-static void emma2rh_gpio_irq_mask_ack(struct irq_data *d)
-{
-	unsigned int irq = d->irq - EMMA2RH_GPIO_IRQ_BASE;
-	u32 reg;
-
-	emma2rh_out32(EMMA2RH_GPIO_INT_ST, ~(1 << irq));
-
-	reg = emma2rh_in32(EMMA2RH_GPIO_INT_MASK);
-	reg &= ~(1 << irq);
-	emma2rh_out32(EMMA2RH_GPIO_INT_MASK, reg);
-}
-
-struct irq_chip emma2rh_gpio_irq_controller = {
-	.name = "emma2rh_gpio_irq",
-	.irq_ack = emma2rh_gpio_irq_ack,
-	.irq_mask = emma2rh_gpio_irq_disable,
-	.irq_mask_ack = emma2rh_gpio_irq_mask_ack,
-	.irq_unmask = emma2rh_gpio_irq_enable,
-};
-
-void emma2rh_gpio_irq_init(void)
-{
-	u32 i;
-
-	for (i = 0; i < NUM_EMMA2RH_IRQ_GPIO; i++)
-		irq_set_chip_and_handler_name(EMMA2RH_GPIO_IRQ_BASE + i,
-					      &emma2rh_gpio_irq_controller,
-					      handle_edge_irq, "edge");
-}
-
-/*
- * the first level int-handler will jump here if it is a emma2rh irq
- */
-void emma2rh_irq_dispatch(void)
-{
-	u32 intStatus;
-	u32 bitmask;
-	u32 i;
-
-	intStatus = emma2rh_in32(EMMA2RH_BHIF_INT_ST_0) &
-		    emma2rh_in32(EMMA2RH_BHIF_INT_EN_0);
-
-#ifdef EMMA2RH_SW_CASCADE
-	if (intStatus & (1UL << EMMA2RH_SW_CASCADE)) {
-		u32 swIntStatus;
-		swIntStatus = emma2rh_in32(EMMA2RH_BHIF_SW_INT)
-		    & emma2rh_in32(EMMA2RH_BHIF_SW_INT_EN);
-		for (i = 0, bitmask = 1; i < 32; i++, bitmask <<= 1) {
-			if (swIntStatus & bitmask) {
-				do_IRQ(EMMA2RH_SW_IRQ_BASE + i);
-				return;
-			}
-		}
-	}
-	/* Skip S/W interrupt */
-	intStatus &= ~(1UL << EMMA2RH_SW_CASCADE);
-#endif
-
-	for (i = 0, bitmask = 1; i < 32; i++, bitmask <<= 1) {
-		if (intStatus & bitmask) {
-			do_IRQ(EMMA2RH_IRQ_BASE + i);
-			return;
-		}
-	}
-
-	intStatus = emma2rh_in32(EMMA2RH_BHIF_INT_ST_1) &
-		    emma2rh_in32(EMMA2RH_BHIF_INT_EN_1);
-
-#ifdef EMMA2RH_GPIO_CASCADE
-	if (intStatus & (1UL << (EMMA2RH_GPIO_CASCADE % 32))) {
-		u32 gpioIntStatus;
-		gpioIntStatus = emma2rh_in32(EMMA2RH_GPIO_INT_ST)
-		    & emma2rh_in32(EMMA2RH_GPIO_INT_MASK);
-		for (i = 0, bitmask = 1; i < 32; i++, bitmask <<= 1) {
-			if (gpioIntStatus & bitmask) {
-				do_IRQ(EMMA2RH_GPIO_IRQ_BASE + i);
-				return;
-			}
-		}
-	}
-	/* Skip GPIO interrupt */
-	intStatus &= ~(1UL << (EMMA2RH_GPIO_CASCADE % 32));
-#endif
-
-	for (i = 32, bitmask = 1; i < 64; i++, bitmask <<= 1) {
-		if (intStatus & bitmask) {
-			do_IRQ(EMMA2RH_IRQ_BASE + i);
-			return;
-		}
-	}
-
-	intStatus = emma2rh_in32(EMMA2RH_BHIF_INT_ST_2) &
-		    emma2rh_in32(EMMA2RH_BHIF_INT_EN_2);
-
-	for (i = 64, bitmask = 1; i < 96; i++, bitmask <<= 1) {
-		if (intStatus & bitmask) {
-			do_IRQ(EMMA2RH_IRQ_BASE + i);
-			return;
-		}
-	}
-}
-
-void __init arch_init_irq(void)
-{
-	u32 reg;
-	int irq;
-
-	/* by default, interrupts are disabled. */
-	emma2rh_out32(EMMA2RH_BHIF_INT_EN_0, 0);
-	emma2rh_out32(EMMA2RH_BHIF_INT_EN_1, 0);
-	emma2rh_out32(EMMA2RH_BHIF_INT_EN_2, 0);
-	emma2rh_out32(EMMA2RH_BHIF_INT1_EN_0, 0);
-	emma2rh_out32(EMMA2RH_BHIF_INT1_EN_1, 0);
-	emma2rh_out32(EMMA2RH_BHIF_INT1_EN_2, 0);
-	emma2rh_out32(EMMA2RH_BHIF_SW_INT_EN, 0);
-
-	clear_c0_status(0xff00);
-	set_c0_status(0x0400);
-
-#define GPIO_PCI (0xf<<15)
-	/* setup GPIO interrupt for PCI interface */
-	/* direction input */
-	reg = emma2rh_in32(EMMA2RH_GPIO_DIR);
-	emma2rh_out32(EMMA2RH_GPIO_DIR, reg & ~GPIO_PCI);
-	/* disable interrupt */
-	reg = emma2rh_in32(EMMA2RH_GPIO_INT_MASK);
-	emma2rh_out32(EMMA2RH_GPIO_INT_MASK, reg & ~GPIO_PCI);
-	/* level triggerd */
-	reg = emma2rh_in32(EMMA2RH_GPIO_INT_MODE);
-	emma2rh_out32(EMMA2RH_GPIO_INT_MODE, reg | GPIO_PCI);
-	reg = emma2rh_in32(EMMA2RH_GPIO_INT_CND_A);
-	emma2rh_out32(EMMA2RH_GPIO_INT_CND_A, reg & (~GPIO_PCI));
-	/* interrupt clear */
-	emma2rh_out32(EMMA2RH_GPIO_INT_ST, ~GPIO_PCI);
-
-	/* init all controllers */
-	emma2rh_irq_init();
-	emma2rh_sw_irq_init();
-	emma2rh_gpio_irq_init();
-	mips_cpu_irq_init();
-
-	/* setup cascade interrupts */
-	irq = EMMA2RH_IRQ_BASE + EMMA2RH_SW_CASCADE;
-	if (request_irq(irq, no_action, IRQF_NO_THREAD, "cascade", NULL))
-		pr_err("Failed to request irq %d (cascade)\n", irq);
-	irq = EMMA2RH_IRQ_BASE + EMMA2RH_GPIO_CASCADE;
-	if (request_irq(irq, no_action, IRQF_NO_THREAD, "cascade", NULL))
-		pr_err("Failed to request irq %d (cascade)\n", irq);
-	irq = MIPS_CPU_IRQ_BASE + 2;
-	if (request_irq(irq, no_action, IRQF_NO_THREAD, "cascade", NULL))
-		pr_err("Failed to request irq %d (cascade)\n", irq);
-}
-
-asmlinkage void plat_irq_dispatch(void)
-{
-	unsigned int pending = read_c0_status() & read_c0_cause() & ST0_IM;
-
-	if (pending & STATUSF_IP7)
-		do_IRQ(MIPS_CPU_IRQ_BASE + 7);
-	else if (pending & STATUSF_IP2)
-		emma2rh_irq_dispatch();
-	else if (pending & STATUSF_IP1)
-		do_IRQ(MIPS_CPU_IRQ_BASE + 1);
-	else if (pending & STATUSF_IP0)
-		do_IRQ(MIPS_CPU_IRQ_BASE + 0);
-	else
-		spurious_interrupt();
-}
diff --git a/arch/mips/emma/markeins/led.c b/arch/mips/emma/markeins/led.c
deleted file mode 100644
index d377542c0ec4..000000000000
--- a/arch/mips/emma/markeins/led.c
+++ /dev/null
@@ -1,44 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  Copyright (C) NEC Electronics Corporation 2004-2006
- */
-#include <linux/kernel.h>
-#include <linux/types.h>
-#include <linux/string.h>
-#include <asm/emma/emma2rh.h>
-
-const unsigned long clear = 0x20202020;
-
-#define LED_BASE 0xb1400038
-
-void markeins_led_clear(void)
-{
-	emma2rh_out32(LED_BASE, clear);
-	emma2rh_out32(LED_BASE + 4, clear);
-}
-
-void markeins_led(const char *str)
-{
-	int i;
-	int len = strlen(str);
-
-	markeins_led_clear();
-	if (len > 8)
-		len = 8;
-
-	if (emma2rh_in32(0xb0000800) & (0x1 << 18))
-		for (i = 0; i < len; i++)
-			emma2rh_out8(LED_BASE + i, str[i]);
-	else
-		for (i = 0; i < len; i++)
-			emma2rh_out8(LED_BASE + (i & 4) + (3 - (i & 3)),
-				     str[i]);
-}
-
-void markeins_led_hex(u32 val)
-{
-	char str[10];
-
-	sprintf(str, "%08x", val);
-	markeins_led(str);
-}
diff --git a/arch/mips/emma/markeins/platform.c b/arch/mips/emma/markeins/platform.c
deleted file mode 100644
index 97eeb9e8fb2b..000000000000
--- a/arch/mips/emma/markeins/platform.c
+++ /dev/null
@@ -1,199 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  Copyright(C) MontaVista Software Inc, 2006
- *
- *  Author: dmitry pervushin <dpervushin@ru.mvista.com>
- */
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/types.h>
-#include <linux/ioport.h>
-#include <linux/serial_8250.h>
-#include <linux/mtd/physmap.h>
-
-#include <asm/cpu.h>
-#include <asm/bootinfo.h>
-#include <asm/addrspace.h>
-#include <asm/time.h>
-#include <asm/bcache.h>
-#include <asm/irq.h>
-#include <asm/reboot.h>
-#include <asm/traps.h>
-
-#include <asm/emma/emma2rh.h>
-
-
-#define I2C_EMMA2RH "emma2rh-iic" /* must be in sync with IIC driver */
-
-static struct resource i2c_emma_resources_0[] = {
-	{
-		.name	= NULL,
-		.start	= EMMA2RH_IRQ_PIIC0,
-		.end	= EMMA2RH_IRQ_PIIC0,
-		.flags	= IORESOURCE_IRQ
-	}, {
-		.name	= NULL,
-		.start	= EMMA2RH_PIIC0_BASE,
-		.end	= EMMA2RH_PIIC0_BASE + 0x1000,
-		.flags	= 0
-	},
-};
-
-struct resource i2c_emma_resources_1[] = {
-	{
-		.name	= NULL,
-		.start	= EMMA2RH_IRQ_PIIC1,
-		.end	= EMMA2RH_IRQ_PIIC1,
-		.flags	= IORESOURCE_IRQ
-	}, {
-		.name	= NULL,
-		.start	= EMMA2RH_PIIC1_BASE,
-		.end	= EMMA2RH_PIIC1_BASE + 0x1000,
-		.flags	= 0
-	},
-};
-
-struct resource i2c_emma_resources_2[] = {
-	{
-		.name	= NULL,
-		.start	= EMMA2RH_IRQ_PIIC2,
-		.end	= EMMA2RH_IRQ_PIIC2,
-		.flags	= IORESOURCE_IRQ
-	}, {
-		.name	= NULL,
-		.start	= EMMA2RH_PIIC2_BASE,
-		.end	= EMMA2RH_PIIC2_BASE + 0x1000,
-		.flags	= 0
-	},
-};
-
-struct platform_device i2c_emma_devices[] = {
-	[0] = {
-		.name = I2C_EMMA2RH,
-		.id = 0,
-		.resource = i2c_emma_resources_0,
-		.num_resources = ARRAY_SIZE(i2c_emma_resources_0),
-	},
-	[1] = {
-		.name = I2C_EMMA2RH,
-		.id = 1,
-		.resource = i2c_emma_resources_1,
-		.num_resources = ARRAY_SIZE(i2c_emma_resources_1),
-	},
-	[2] = {
-		.name = I2C_EMMA2RH,
-		.id = 2,
-		.resource = i2c_emma_resources_2,
-		.num_resources = ARRAY_SIZE(i2c_emma_resources_2),
-	},
-};
-
-#define EMMA2RH_SERIAL_CLOCK 18544000
-#define EMMA2RH_SERIAL_FLAGS UPF_BOOT_AUTOCONF | UPF_SKIP_TEST
-
-static struct  plat_serial8250_port platform_serial_ports[] = {
-	[0] = {
-		.membase= (void __iomem*)KSEG1ADDR(EMMA2RH_PFUR0_BASE + 3),
-		.mapbase = EMMA2RH_PFUR0_BASE + 3,
-		.irq = EMMA2RH_IRQ_PFUR0,
-		.uartclk = EMMA2RH_SERIAL_CLOCK,
-		.regshift = 4,
-		.iotype = UPIO_MEM,
-		.flags = EMMA2RH_SERIAL_FLAGS,
-       }, [1] = {
-		.membase = (void __iomem*)KSEG1ADDR(EMMA2RH_PFUR1_BASE + 3),
-		.mapbase = EMMA2RH_PFUR1_BASE + 3,
-		.irq = EMMA2RH_IRQ_PFUR1,
-		.uartclk = EMMA2RH_SERIAL_CLOCK,
-		.regshift = 4,
-		.iotype = UPIO_MEM,
-		.flags = EMMA2RH_SERIAL_FLAGS,
-       }, [2] = {
-		.membase = (void __iomem*)KSEG1ADDR(EMMA2RH_PFUR2_BASE + 3),
-		.mapbase = EMMA2RH_PFUR2_BASE + 3,
-		.irq = EMMA2RH_IRQ_PFUR2,
-		.uartclk = EMMA2RH_SERIAL_CLOCK,
-		.regshift = 4,
-		.iotype = UPIO_MEM,
-		.flags = EMMA2RH_SERIAL_FLAGS,
-       }, [3] = {
-		.flags = 0,
-       },
-};
-
-static struct  platform_device serial_emma = {
-	.name = "serial8250",
-	.dev = {
-		.platform_data = &platform_serial_ports,
-	},
-};
-
-static struct mtd_partition markeins_parts[] = {
-	[0] = {
-		.name = "RootFS",
-		.offset = 0x00000000,
-		.size = 0x00c00000,
-	},
-	[1] = {
-		.name = "boot code area",
-		.offset = MTDPART_OFS_APPEND,
-		.size = 0x00100000,
-	},
-	[2] = {
-		.name = "kernel image",
-		.offset = MTDPART_OFS_APPEND,
-		.size = 0x00300000,
-	},
-	[3] = {
-		.name = "RootFS2",
-		.offset = MTDPART_OFS_APPEND,
-		.size = 0x00c00000,
-	},
-	[4] = {
-		.name = "boot code area2",
-		.offset = MTDPART_OFS_APPEND,
-		.size = 0x00100000,
-	},
-	[5] = {
-		.name = "kernel image2",
-		.offset = MTDPART_OFS_APPEND,
-		.size = MTDPART_SIZ_FULL,
-	},
-};
-
-static struct physmap_flash_data markeins_flash_data = {
-	.width		= 2,
-	.nr_parts	= ARRAY_SIZE(markeins_parts),
-	.parts		= markeins_parts
-};
-
-static struct resource markeins_flash_resource = {
-	.start		= 0x1e000000,
-	.end		= 0x02000000,
-	.flags		= IORESOURCE_MEM
-};
-
-static struct platform_device markeins_flash_device = {
-	.name		= "physmap-flash",
-	.id		= 0,
-	.dev		= {
-		.platform_data	= &markeins_flash_data,
-	},
-	.num_resources	= 1,
-	.resource	= &markeins_flash_resource,
-};
-
-static struct platform_device *devices[] = {
-	i2c_emma_devices,
-	i2c_emma_devices + 1,
-	i2c_emma_devices + 2,
-	&serial_emma,
-	&markeins_flash_device,
-};
-
-static int __init platform_devices_setup(void)
-{
-	return platform_add_devices(devices, ARRAY_SIZE(devices));
-}
-
-arch_initcall(platform_devices_setup);
diff --git a/arch/mips/emma/markeins/setup.c b/arch/mips/emma/markeins/setup.c
deleted file mode 100644
index c8a91c2a63bc..000000000000
--- a/arch/mips/emma/markeins/setup.c
+++ /dev/null
@@ -1,115 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  Copyright (C) NEC Electronics Corporation 2004-2006
- *
- *  This file is based on the arch/mips/ddb5xxx/ddb5477/setup.c.
- *
- *	Copyright 2001 MontaVista Software Inc.
- */
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/types.h>
-
-#include <asm/time.h>
-#include <asm/reboot.h>
-
-#include <asm/emma/emma2rh.h>
-
-#define USE_CPU_COUNTER_TIMER	/* whether we use cpu counter */
-
-extern void markeins_led(const char *);
-
-static int bus_frequency;
-
-static void markeins_machine_restart(char *command)
-{
-	static void (*back_to_prom) (void) = (void (*)(void))0xbfc00000;
-
-	printk("cannot EMMA2RH Mark-eins restart.\n");
-	markeins_led("restart.");
-	back_to_prom();
-}
-
-static void markeins_machine_halt(void)
-{
-	printk("EMMA2RH Mark-eins halted.\n");
-	markeins_led("halted.");
-	while (1) ;
-}
-
-static void markeins_machine_power_off(void)
-{
-	markeins_led("poweroff.");
-	while (1) ;
-}
-
-static unsigned long __initdata emma2rh_clock[4] = {
-	166500000, 187312500, 199800000, 210600000
-};
-
-static unsigned int __init detect_bus_frequency(unsigned long rtc_base)
-{
-	u32 reg;
-
-	/* detect from boot strap */
-	reg = emma2rh_in32(EMMA2RH_BHIF_STRAP_0);
-	reg = (reg >> 4) & 0x3;
-
-	return emma2rh_clock[reg];
-}
-
-void __init plat_time_init(void)
-{
-	u32 reg;
-	if (bus_frequency == 0)
-		bus_frequency = detect_bus_frequency(0);
-
-	reg = emma2rh_in32(EMMA2RH_BHIF_STRAP_0);
-	if ((reg & 0x3) == 0)
-		reg = (reg >> 6) & 0x3;
-	else {
-		reg = emma2rh_in32(EMMA2RH_BHIF_MAIN_CTRL);
-		reg = (reg >> 4) & 0x3;
-	}
-	mips_hpt_frequency = (bus_frequency * (4 + reg)) / 4 / 2;
-}
-
-static void markeins_board_init(void);
-extern void markeins_irq_setup(void);
-
-static inline void __init markeins_sio_setup(void)
-{
-}
-
-void __init plat_mem_setup(void)
-{
-	/* initialize board - we don't trust the loader */
-	markeins_board_init();
-
-	set_io_port_base(KSEG1ADDR(EMMA2RH_PCI_IO_BASE));
-
-	_machine_restart = markeins_machine_restart;
-	_machine_halt = markeins_machine_halt;
-	pm_power_off = markeins_machine_power_off;
-
-	/* setup resource limits */
-	ioport_resource.start = EMMA2RH_PCI_IO_BASE;
-	ioport_resource.end = EMMA2RH_PCI_IO_BASE + EMMA2RH_PCI_IO_SIZE - 1;
-	iomem_resource.start = EMMA2RH_IO_BASE;
-	iomem_resource.end = EMMA2RH_ROM_BASE - 1;
-
-	markeins_sio_setup();
-}
-
-static void __init markeins_board_init(void)
-{
-	u32 val;
-
-	val = emma2rh_in32(EMMA2RH_PBRD_INT_EN);	/* open serial interrupts. */
-	emma2rh_out32(EMMA2RH_PBRD_INT_EN, val | 0xaa);
-	val = emma2rh_in32(EMMA2RH_PBRD_CLKSEL);	/* set serial clocks. */
-	emma2rh_out32(EMMA2RH_PBRD_CLKSEL, val | 0x5);	/* 18MHz */
-	emma2rh_out32(EMMA2RH_PCI_CONTROL, 0);
-
-	markeins_led("MVL E2RH");
-}
diff --git a/arch/mips/include/asm/emma/emma2rh.h b/arch/mips/include/asm/emma/emma2rh.h
deleted file mode 100644
index a25cdb378fe8..000000000000
--- a/arch/mips/include/asm/emma/emma2rh.h
+++ /dev/null
@@ -1,248 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- *  Copyright (C) NEC Electronics Corporation 2005-2006
- *
- *  This file based on include/asm-mips/ddb5xxx/ddb5xxx.h
- *	    Copyright 2001 MontaVista Software Inc.
- */
-#ifndef __ASM_EMMA_EMMA2RH_H
-#define __ASM_EMMA_EMMA2RH_H
-
-#include <irq.h>
-
-/*
- * EMMA2RH registers
- */
-#define REGBASE 0x10000000
-
-#define EMMA2RH_BHIF_STRAP_0	(0x000010+REGBASE)
-#define EMMA2RH_BHIF_INT_ST_0	(0x000030+REGBASE)
-#define EMMA2RH_BHIF_INT_ST_1	(0x000034+REGBASE)
-#define EMMA2RH_BHIF_INT_ST_2	(0x000038+REGBASE)
-#define EMMA2RH_BHIF_INT_EN_0	(0x000040+REGBASE)
-#define EMMA2RH_BHIF_INT_EN_1	(0x000044+REGBASE)
-#define EMMA2RH_BHIF_INT_EN_2	(0x000048+REGBASE)
-#define EMMA2RH_BHIF_INT1_EN_0	(0x000050+REGBASE)
-#define EMMA2RH_BHIF_INT1_EN_1	(0x000054+REGBASE)
-#define EMMA2RH_BHIF_INT1_EN_2	(0x000058+REGBASE)
-#define EMMA2RH_BHIF_SW_INT	(0x000070+REGBASE)
-#define EMMA2RH_BHIF_SW_INT_EN	(0x000080+REGBASE)
-#define EMMA2RH_BHIF_SW_INT_CLR (0x000090+REGBASE)
-#define EMMA2RH_BHIF_MAIN_CTRL	(0x0000b4+REGBASE)
-#define EMMA2RH_BHIF_EXCEPT_VECT_BASE_ADDRESS	(0x0000c0+REGBASE)
-#define EMMA2RH_GPIO_DIR	(0x110d20+REGBASE)
-#define EMMA2RH_GPIO_INT_ST	(0x110d30+REGBASE)
-#define EMMA2RH_GPIO_INT_MASK	(0x110d3c+REGBASE)
-#define EMMA2RH_GPIO_INT_MODE	(0x110d48+REGBASE)
-#define EMMA2RH_GPIO_INT_CND_A	(0x110d54+REGBASE)
-#define EMMA2RH_GPIO_INT_CND_B	(0x110d60+REGBASE)
-#define EMMA2RH_PBRD_INT_EN	(0x100010+REGBASE)
-#define EMMA2RH_PBRD_CLKSEL	(0x100028+REGBASE)
-#define EMMA2RH_PFUR0_BASE	(0x101000+REGBASE)
-#define EMMA2RH_PFUR1_BASE	(0x102000+REGBASE)
-#define EMMA2RH_PFUR2_BASE	(0x103000+REGBASE)
-#define EMMA2RH_PIIC0_BASE	(0x107000+REGBASE)
-#define EMMA2RH_PIIC1_BASE	(0x108000+REGBASE)
-#define EMMA2RH_PIIC2_BASE	(0x109000+REGBASE)
-#define EMMA2RH_PCI_CONTROL	(0x200000+REGBASE)
-#define EMMA2RH_PCI_ARBIT_CTR	(0x200004+REGBASE)
-#define EMMA2RH_PCI_IWIN0_CTR	(0x200010+REGBASE)
-#define EMMA2RH_PCI_IWIN1_CTR	(0x200014+REGBASE)
-#define EMMA2RH_PCI_INIT_ESWP	(0x200018+REGBASE)
-#define EMMA2RH_PCI_INT		(0x200020+REGBASE)
-#define EMMA2RH_PCI_INT_EN	(0x200024+REGBASE)
-#define EMMA2RH_PCI_TWIN_CTR	(0x200030+REGBASE)
-#define EMMA2RH_PCI_TWIN_BADR	(0x200034+REGBASE)
-#define EMMA2RH_PCI_TWIN0_DADR	(0x200038+REGBASE)
-#define EMMA2RH_PCI_TWIN1_DADR	(0x20003c+REGBASE)
-
-/*
- *  Memory map (physical address)
- *
- *  Note most of the following address must be properly aligned by the
- *  corresponding size.	 For example, if PCI_IO_SIZE is 16MB, then
- *  PCI_IO_BASE must be aligned along 16MB boundary.
- */
-
-/* the actual ram size is detected at run-time */
-#define EMMA2RH_RAM_BASE	0x00000000
-#define EMMA2RH_RAM_SIZE	0x10000000	/* less than 256MB */
-
-#define EMMA2RH_IO_BASE		0x10000000
-#define EMMA2RH_IO_SIZE		0x01000000	/* 16 MB */
-
-#define EMMA2RH_GENERALIO_BASE	0x11000000
-#define EMMA2RH_GENERALIO_SIZE	0x01000000	/* 16 MB */
-
-#define EMMA2RH_PCI_IO_BASE	0x12000000
-#define EMMA2RH_PCI_IO_SIZE	0x02000000	/* 32 MB */
-
-#define EMMA2RH_PCI_MEM_BASE	0x14000000
-#define EMMA2RH_PCI_MEM_SIZE	0x08000000	/* 128 MB */
-
-#define EMMA2RH_ROM_BASE	0x1c000000
-#define EMMA2RH_ROM_SIZE	0x04000000	/* 64 MB */
-
-#define EMMA2RH_PCI_CONFIG_BASE EMMA2RH_PCI_IO_BASE
-#define EMMA2RH_PCI_CONFIG_SIZE EMMA2RH_PCI_IO_SIZE
-
-#define NUM_EMMA2RH_IRQ		96
-
-#define EMMA2RH_IRQ_BASE	(MIPS_CPU_IRQ_BASE + 8)
-
-/*
- * emma2rh irq defs
- */
-
-#define EMMA2RH_IRQ_INT(n)	(EMMA2RH_IRQ_BASE + (n))
-
-#define EMMA2RH_IRQ_PFUR0	EMMA2RH_IRQ_INT(49)
-#define EMMA2RH_IRQ_PFUR1	EMMA2RH_IRQ_INT(50)
-#define EMMA2RH_IRQ_PFUR2	EMMA2RH_IRQ_INT(51)
-#define EMMA2RH_IRQ_PIIC0	EMMA2RH_IRQ_INT(56)
-#define EMMA2RH_IRQ_PIIC1	EMMA2RH_IRQ_INT(57)
-#define EMMA2RH_IRQ_PIIC2	EMMA2RH_IRQ_INT(58)
-
-/*
- *  EMMA2RH Register Access
- */
-
-#define EMMA2RH_BASE (0xa0000000)
-
-static inline void emma2rh_sync(void)
-{
-	volatile u32 *p = (volatile u32 *)0xbfc00000;
-	(void)(*p);
-}
-
-static inline void emma2rh_out32(u32 offset, u32 val)
-{
-	*(volatile u32 *)(EMMA2RH_BASE | offset) = val;
-	emma2rh_sync();
-}
-
-static inline u32 emma2rh_in32(u32 offset)
-{
-	u32 val = *(volatile u32 *)(EMMA2RH_BASE | offset);
-	return val;
-}
-
-static inline void emma2rh_out16(u32 offset, u16 val)
-{
-	*(volatile u16 *)(EMMA2RH_BASE | offset) = val;
-	emma2rh_sync();
-}
-
-static inline u16 emma2rh_in16(u32 offset)
-{
-	u16 val = *(volatile u16 *)(EMMA2RH_BASE | offset);
-	return val;
-}
-
-static inline void emma2rh_out8(u32 offset, u8 val)
-{
-	*(volatile u8 *)(EMMA2RH_BASE | offset) = val;
-	emma2rh_sync();
-}
-
-static inline u8 emma2rh_in8(u32 offset)
-{
-	u8 val = *(volatile u8 *)(EMMA2RH_BASE | offset);
-	return val;
-}
-
-/**
- * IIC registers map
- **/
-
-/*---------------------------------------------------------------------------*/
-/* CNT - Control register (00H R/W)					     */
-/*---------------------------------------------------------------------------*/
-#define SPT	    0x00000001
-#define STT	    0x00000002
-#define ACKE	    0x00000004
-#define WTIM	    0x00000008
-#define SPIE	    0x00000010
-#define WREL	    0x00000020
-#define LREL	    0x00000040
-#define IICE	    0x00000080
-#define CNT_RESERVED	0x000000ff	/* reserved bit 0 */
-
-#define I2C_EMMA_START	    (IICE | STT)
-#define I2C_EMMA_STOP	    (IICE | SPT)
-#define I2C_EMMA_REPSTART   I2C_EMMA_START
-
-/*---------------------------------------------------------------------------*/
-/* STA - Status register (10H Read)					     */
-/*---------------------------------------------------------------------------*/
-#define MSTS	    0x00000080
-#define ALD	    0x00000040
-#define EXC	    0x00000020
-#define COI	    0x00000010
-#define TRC	    0x00000008
-#define ACKD	    0x00000004
-#define STD	    0x00000002
-#define SPD	    0x00000001
-
-/*---------------------------------------------------------------------------*/
-/* CSEL - Clock select register (20H R/W)				     */
-/*---------------------------------------------------------------------------*/
-#define FCL	    0x00000080
-#define ND50	    0x00000040
-#define CLD	    0x00000020
-#define DAD	    0x00000010
-#define SMC	    0x00000008
-#define DFC	    0x00000004
-#define CL	    0x00000003
-#define CSEL_RESERVED	0x000000ff	/* reserved bit 0 */
-
-#define FAST397	    0x0000008b
-#define FAST297	    0x0000008a
-#define FAST347	    0x0000000b
-#define FAST260	    0x0000000a
-#define FAST130	    0x00000008
-#define STANDARD108 0x00000083
-#define STANDARD83  0x00000082
-#define STANDARD95  0x00000003
-#define STANDARD73  0x00000002
-#define STANDARD36  0x00000001
-#define STANDARD71  0x00000000
-
-/*---------------------------------------------------------------------------*/
-/* SVA - Slave address register (30H R/W)				     */
-/*---------------------------------------------------------------------------*/
-#define SVA	    0x000000fe
-
-/*---------------------------------------------------------------------------*/
-/* SHR - Shift register (40H R/W)					     */
-/*---------------------------------------------------------------------------*/
-#define SR	    0x000000ff
-
-/*---------------------------------------------------------------------------*/
-/* INT - Interrupt register (50H R/W)					     */
-/* INTM - Interrupt mask register (60H R/W)				     */
-/*---------------------------------------------------------------------------*/
-#define INTE0	    0x00000001
-
-/***********************************************************************
- * I2C registers
- ***********************************************************************
- */
-#define I2C_EMMA_CNT		0x00
-#define I2C_EMMA_STA		0x10
-#define I2C_EMMA_CSEL		0x20
-#define I2C_EMMA_SVA		0x30
-#define I2C_EMMA_SHR		0x40
-#define I2C_EMMA_INT		0x50
-#define I2C_EMMA_INTM		0x60
-
-/*
- * include the board dependent part
- */
-#ifdef CONFIG_NEC_MARKEINS
-#include <asm/emma/markeins.h>
-#else
-#error "Unknown EMMA2RH board!"
-#endif
-
-#endif /* __ASM_EMMA_EMMA2RH_H */
diff --git a/arch/mips/include/asm/emma/markeins.h b/arch/mips/include/asm/emma/markeins.h
deleted file mode 100644
index 2d7e1339d36f..000000000000
--- a/arch/mips/include/asm/emma/markeins.h
+++ /dev/null
@@ -1,28 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- *  Copyright (C) NEC Electronics Corporation 2005-2006
- *
- *  This file based on include/asm-mips/ddb5xxx/ddb5xxx.h
- *	    Copyright 2001 MontaVista Software Inc.
- */
-
-#ifndef MARKEINS_H
-#define MARKEINS_H
-
-#define NUM_EMMA2RH_IRQ_SW	32
-#define NUM_EMMA2RH_IRQ_GPIO	32
-
-#define EMMA2RH_SW_CASCADE	(EMMA2RH_IRQ_INT(7) - EMMA2RH_IRQ_INT(0))
-#define EMMA2RH_GPIO_CASCADE	(EMMA2RH_IRQ_INT(46) - EMMA2RH_IRQ_INT(0))
-
-#define EMMA2RH_SW_IRQ_BASE	(EMMA2RH_IRQ_BASE + NUM_EMMA2RH_IRQ)
-#define EMMA2RH_GPIO_IRQ_BASE	(EMMA2RH_SW_IRQ_BASE + NUM_EMMA2RH_IRQ_SW)
-
-#define EMMA2RH_SW_IRQ_INT(n)	(EMMA2RH_SW_IRQ_BASE + (n))
-
-#define MARKEINS_PCI_IRQ_INTA	EMMA2RH_GPIO_IRQ_BASE+15
-#define MARKEINS_PCI_IRQ_INTB	EMMA2RH_GPIO_IRQ_BASE+16
-#define MARKEINS_PCI_IRQ_INTC	EMMA2RH_GPIO_IRQ_BASE+17
-#define MARKEINS_PCI_IRQ_INTD	EMMA2RH_GPIO_IRQ_BASE+18
-
-#endif /* CONFIG_MARKEINS */
diff --git a/arch/mips/include/asm/mach-emma2rh/irq.h b/arch/mips/include/asm/mach-emma2rh/irq.h
deleted file mode 100644
index d32736736bb3..000000000000
--- a/arch/mips/include/asm/mach-emma2rh/irq.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2003 by Ralf Baechle
- */
-#ifndef __ASM_MACH_EMMA2RH_IRQ_H
-#define __ASM_MACH_EMMA2RH_IRQ_H
-
-#define NR_IRQS 256
-
-#include <asm/mach-generic/irq.h>
-
-#endif /* __ASM_MACH_EMMA2RH_IRQ_H */
diff --git a/arch/mips/pci/Makefile b/arch/mips/pci/Makefile
index aeac09090fb4..f238d7b9e0b2 100644
--- a/arch/mips/pci/Makefile
+++ b/arch/mips/pci/Makefile
@@ -15,7 +15,6 @@ obj-$(CONFIG_PCI_GT64XXX_PCI0)	+= ops-gt64xxx_pci0.o
 obj-$(CONFIG_MIPS_MSC)		+= ops-msc.o
 obj-$(CONFIG_SOC_TX3927)	+= ops-tx3927.o
 obj-$(CONFIG_PCI_VR41XX)	+= ops-vr41xx.o pci-vr41xx.o
-obj-$(CONFIG_NEC_MARKEINS)	+= ops-emma2rh.o pci-emma2rh.o fixup-emma2rh.o
 obj-$(CONFIG_PCI_TX4927)	+= ops-tx4927.o
 obj-$(CONFIG_BCM47XX)		+= pci-bcm47xx.o
 obj-$(CONFIG_BCM63XX)		+= pci-bcm63xx.o fixup-bcm63xx.o \
diff --git a/arch/mips/pci/fixup-emma2rh.c b/arch/mips/pci/fixup-emma2rh.c
deleted file mode 100644
index 2541f9bc12de..000000000000
--- a/arch/mips/pci/fixup-emma2rh.c
+++ /dev/null
@@ -1,84 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  Copyright (C) NEC Electronics Corporation 2004-2006
- *
- *  This file is based on the arch/mips/ddb5xxx/ddb5477/pci.c
- *
- *	Copyright 2001 MontaVista Software Inc.
- */
-
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/types.h>
-#include <linux/pci.h>
-
-#include <asm/bootinfo.h>
-
-#include <asm/emma/emma2rh.h>
-
-#define EMMA2RH_PCI_HOST_SLOT 0x09
-#define EMMA2RH_USB_SLOT 0x03
-#define PCI_DEVICE_ID_NEC_EMMA2RH      0x014b /* EMMA2RH PCI Host */
-
-/*
- * we fix up irqs based on the slot number.
- * The first entry is at AD:11.
- * Fortunately this works because, although we have two pci buses,
- * they all have different slot numbers (except for rockhopper slot 20
- * which is handled below).
- *
- */
-
-#define MAX_SLOT_NUM 10
-static unsigned char irq_map[][5] = {
-	[3] = {0, MARKEINS_PCI_IRQ_INTB, MARKEINS_PCI_IRQ_INTC,
-	       MARKEINS_PCI_IRQ_INTD, 0,},
-	[4] = {0, MARKEINS_PCI_IRQ_INTA, 0, 0, 0,},
-	[5] = {0, 0, 0, 0, 0,},
-	[6] = {0, MARKEINS_PCI_IRQ_INTC, MARKEINS_PCI_IRQ_INTD,
-	       MARKEINS_PCI_IRQ_INTA, MARKEINS_PCI_IRQ_INTB,},
-};
-
-static void nec_usb_controller_fixup(struct pci_dev *dev)
-{
-	if (PCI_SLOT(dev->devfn) == EMMA2RH_USB_SLOT)
-		/* on board USB controller configuration */
-		pci_write_config_dword(dev, 0xe4, 1 << 5);
-}
-
-DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_NEC, PCI_DEVICE_ID_NEC_USB,
-			nec_usb_controller_fixup);
-
-/*
- * Prevent the PCI layer from seeing the resources allocated to this device
- * if it is the host bridge by marking it as such.  These resources are of
- * no consequence to the PCI layer (they are handled elsewhere).
- */
-static void emma2rh_pci_host_fixup(struct pci_dev *dev)
-{
-	int i;
-
-	if (PCI_SLOT(dev->devfn) == EMMA2RH_PCI_HOST_SLOT) {
-		dev->class &= 0xff;
-		dev->class |= PCI_CLASS_BRIDGE_HOST << 8;
-		for (i = 0; i < PCI_NUM_RESOURCES; i++) {
-			dev->resource[i].start = 0;
-			dev->resource[i].end = 0;
-			dev->resource[i].flags = 0;
-		}
-	}
-}
-
-DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_NEC, PCI_DEVICE_ID_NEC_EMMA2RH,
-			 emma2rh_pci_host_fixup);
-
-int pcibios_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
-{
-	return irq_map[slot][pin];
-}
-
-/* Do platform specific device initialization at pci_enable_device() time */
-int pcibios_plat_dev_init(struct pci_dev *dev)
-{
-	return 0;
-}
diff --git a/arch/mips/pci/ops-emma2rh.c b/arch/mips/pci/ops-emma2rh.c
deleted file mode 100644
index 65f47344536c..000000000000
--- a/arch/mips/pci/ops-emma2rh.c
+++ /dev/null
@@ -1,167 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  Copyright (C) NEC Electronics Corporation 2004-2006
- *
- *  This file is based on the arch/mips/pci/ops-vr41xx.c
- *
- *	Copyright 2001 MontaVista Software Inc.
- */
-
-#include <linux/pci.h>
-#include <linux/kernel.h>
-#include <linux/types.h>
-
-#include <asm/addrspace.h>
-
-#include <asm/emma/emma2rh.h>
-
-#define RTABORT (0x1<<9)
-#define RMABORT (0x1<<10)
-#define EMMA2RH_PCI_SLOT_NUM 9	/* 0000:09.0 is final PCI device */
-
-/*
- * access config space
- */
-
-static int check_args(struct pci_bus *bus, u32 devfn, u32 * bus_num)
-{
-	/* check if the bus is top-level */
-	if (bus->parent != NULL)
-		*bus_num = bus->number;
-	else
-		*bus_num = 0;
-
-	if (*bus_num == 0) {
-		/* Type 0 */
-		if (PCI_SLOT(devfn) >= 10)
-			return PCIBIOS_DEVICE_NOT_FOUND;
-	} else {
-		/* Type 1 */
-		if ((*bus_num >= 64) || (PCI_SLOT(devfn) >= 16))
-			return PCIBIOS_DEVICE_NOT_FOUND;
-	}
-	return 0;
-}
-
-static inline int set_pci_configuration_address(unsigned char bus_num,
-						unsigned int devfn, int where)
-{
-	u32 config_win0;
-
-	emma2rh_out32(EMMA2RH_PCI_INT, ~RMABORT);
-	if (bus_num == 0)
-		/*
-		 * Type 0 configuration
-		 */
-		config_win0 = (1 << (22 + PCI_SLOT(devfn))) | (5 << 9);
-	else
-		/*
-		 * Type 1 configuration
-		 */
-		config_win0 = (bus_num << 26) | (PCI_SLOT(devfn) << 22) |
-		    (1 << 15) | (5 << 9);
-
-	emma2rh_out32(EMMA2RH_PCI_IWIN0_CTR, config_win0);
-
-	return 0;
-}
-
-static int pci_config_read(struct pci_bus *bus, unsigned int devfn, int where,
-			   int size, uint32_t * val)
-{
-	u32 bus_num;
-	u32 base = KSEG1ADDR(EMMA2RH_PCI_CONFIG_BASE);
-	u32 backup_win0;
-	u32 data;
-
-	*val = 0xffffffffU;
-
-	if (check_args(bus, devfn, &bus_num) == PCIBIOS_DEVICE_NOT_FOUND)
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
-	backup_win0 = emma2rh_in32(EMMA2RH_PCI_IWIN0_CTR);
-
-	if (set_pci_configuration_address(bus_num, devfn, where) < 0)
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
-	data =
-	    *(volatile u32 *)(base + (PCI_FUNC(devfn) << 8) +
-			      (where & 0xfffffffc));
-
-	switch (size) {
-	case 1:
-		*val = (data >> ((where & 3) << 3)) & 0xffU;
-		break;
-	case 2:
-		*val = (data >> ((where & 2) << 3)) & 0xffffU;
-		break;
-	case 4:
-		*val = data;
-		break;
-	default:
-		emma2rh_out32(EMMA2RH_PCI_IWIN0_CTR, backup_win0);
-		return PCIBIOS_FUNC_NOT_SUPPORTED;
-	}
-
-	emma2rh_out32(EMMA2RH_PCI_IWIN0_CTR, backup_win0);
-
-	if (emma2rh_in32(EMMA2RH_PCI_INT) & RMABORT)
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
-	return PCIBIOS_SUCCESSFUL;
-}
-
-static int pci_config_write(struct pci_bus *bus, unsigned int devfn, int where,
-			    int size, u32 val)
-{
-	u32 bus_num;
-	u32 base = KSEG1ADDR(EMMA2RH_PCI_CONFIG_BASE);
-	u32 backup_win0;
-	u32 data;
-	int shift;
-
-	if (check_args(bus, devfn, &bus_num) == PCIBIOS_DEVICE_NOT_FOUND)
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
-	backup_win0 = emma2rh_in32(EMMA2RH_PCI_IWIN0_CTR);
-
-	if (set_pci_configuration_address(bus_num, devfn, where) < 0)
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
-	/* read modify write */
-	data =
-	    *(volatile u32 *)(base + (PCI_FUNC(devfn) << 8) +
-			      (where & 0xfffffffc));
-
-	switch (size) {
-	case 1:
-		shift = (where & 3) << 3;
-		data &= ~(0xffU << shift);
-		data |= ((val & 0xffU) << shift);
-		break;
-	case 2:
-		shift = (where & 2) << 3;
-		data &= ~(0xffffU << shift);
-		data |= ((val & 0xffffU) << shift);
-		break;
-	case 4:
-		data = val;
-		break;
-	default:
-		emma2rh_out32(EMMA2RH_PCI_IWIN0_CTR, backup_win0);
-		return PCIBIOS_FUNC_NOT_SUPPORTED;
-	}
-	*(volatile u32 *)(base + (PCI_FUNC(devfn) << 8) +
-			  (where & 0xfffffffc)) = data;
-
-	emma2rh_out32(EMMA2RH_PCI_IWIN0_CTR, backup_win0);
-	if (emma2rh_in32(EMMA2RH_PCI_INT) & RMABORT)
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
-	return PCIBIOS_SUCCESSFUL;
-}
-
-struct pci_ops emma2rh_pci_ops = {
-	.read = pci_config_read,
-	.write = pci_config_write,
-};
diff --git a/arch/mips/pci/pci-emma2rh.c b/arch/mips/pci/pci-emma2rh.c
deleted file mode 100644
index 156091a3e341..000000000000
--- a/arch/mips/pci/pci-emma2rh.c
+++ /dev/null
@@ -1,72 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  Copyright (C) NEC Electronics Corporation 2004-2006
- *
- *  This file is based on the arch/mips/ddb5xxx/ddb5477/pci.c
- *
- *	Copyright 2001 MontaVista Software Inc.
- */
-
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/types.h>
-#include <linux/pci.h>
-
-#include <asm/bootinfo.h>
-
-#include <asm/emma/emma2rh.h>
-
-static struct resource pci_io_resource = {
-	.name = "pci IO space",
-	.start = EMMA2RH_PCI_IO_BASE,
-	.end = EMMA2RH_PCI_IO_BASE + EMMA2RH_PCI_IO_SIZE - 1,
-	.flags = IORESOURCE_IO,
-};
-
-static struct resource pci_mem_resource = {
-	.name = "pci memory space",
-	.start = EMMA2RH_PCI_MEM_BASE,
-	.end = EMMA2RH_PCI_MEM_BASE + EMMA2RH_PCI_MEM_SIZE - 1,
-	.flags = IORESOURCE_MEM,
-};
-
-extern struct pci_ops emma2rh_pci_ops;
-
-static struct pci_controller emma2rh_pci_controller = {
-	.pci_ops = &emma2rh_pci_ops,
-	.mem_resource = &pci_mem_resource,
-	.io_resource = &pci_io_resource,
-	.mem_offset = -0x04000000,
-	.io_offset = 0,
-};
-
-static void __init emma2rh_pci_init(void)
-{
-	/* setup PCI interface */
-	emma2rh_out32(EMMA2RH_PCI_ARBIT_CTR, 0x70f);
-
-	emma2rh_out32(EMMA2RH_PCI_IWIN0_CTR, 0x80000a18);
-	emma2rh_out32(EMMA2RH_PCI_CONFIG_BASE + PCI_COMMAND,
-		      PCI_STATUS_DEVSEL_MEDIUM | PCI_STATUS_CAP_LIST |
-		      PCI_COMMAND_MASTER | PCI_COMMAND_MEMORY);
-	emma2rh_out32(EMMA2RH_PCI_CONFIG_BASE + PCI_BASE_ADDRESS_0, 0x10000000);
-	emma2rh_out32(EMMA2RH_PCI_CONFIG_BASE + PCI_BASE_ADDRESS_1, 0x00000000);
-
-	emma2rh_out32(EMMA2RH_PCI_IWIN0_CTR, 0x12000000 | 0x218);
-	emma2rh_out32(EMMA2RH_PCI_IWIN1_CTR, 0x18000000 | 0x600);
-	emma2rh_out32(EMMA2RH_PCI_INIT_ESWP, 0x00000200);
-
-	emma2rh_out32(EMMA2RH_PCI_TWIN_CTR, 0x00009200);
-	emma2rh_out32(EMMA2RH_PCI_TWIN_BADR, 0x00000000);
-	emma2rh_out32(EMMA2RH_PCI_TWIN0_DADR, 0x00000000);
-	emma2rh_out32(EMMA2RH_PCI_TWIN1_DADR, 0x00000000);
-}
-
-static int __init emma2rh_pci_setup(void)
-{
-	emma2rh_pci_init();
-	register_pci_controller(&emma2rh_pci_controller);
-	return 0;
-}
-
-arch_initcall(emma2rh_pci_setup);
-- 
2.16.4

