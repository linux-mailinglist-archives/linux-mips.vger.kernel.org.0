Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D810C21AF77
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2020 08:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbgGJGc7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 10 Jul 2020 02:32:59 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:40632 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbgGJGc7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 10 Jul 2020 02:32:59 -0400
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 357FD1FF15;
        Fri, 10 Jul 2020 06:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1594362778; bh=dbezDAzQUO6V7Qt4rnIubgoAOGxRnzf2dCmnywT7xOA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Lt7K31IjObfbcEsrNoTiYzLoeHjB8U3wtMXmtYgEgKGcJnuMaKQoDVUrh5tBZXCyE
         Ut3zbv38HMqhoVjlXLE/T4ZyJ7jcNh6kMnFRxmAumBfOJ25WuTcodC2KeL/BxCxXAg
         7mWm1Vw6f0BpETrShwHjuU9EYbaJEa8EIc51raY6Wxmgp1NkcBMmujGok96Qe7KTbp
         h9TeXtn9m+0d6M25tOnOg1smDaHejunp3VCLj/J9SlMYeR6UHo4bzGF+Fg5tNdez/R
         K+foYaiap/5mULCu7vnCx80iUIREYDNLYRHbeZvHkxlSY8OBhMlV7DpBF4rXKglxHJ
         D+hlAzweJrGSA==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michal Simek <michal.simek@xilinx.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Waiman Long <longman@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexander Lobakin <alobakin@pm.me>,
        Jason Wang <jasowang@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Subject: [RFC PATCH 1/3] MIPS: Retire kvm paravirt
Date:   Fri, 10 Jul 2020 14:30:16 +0800
Message-Id: <20200710063047.154611-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200710063047.154611-1-jiaxun.yang@flygoat.com>
References: <20200710063047.154611-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

paravirt machine was introduced for Cavium's partial virtualization
technology, however, it's host side support and QEMU support never
landed in upstream.

As Cavium was acquired by Marvel and they have no intention to maintain
their MIPS product line, also paravirt is unlikely to be utilized by
community users, it's time to retire it if nobody steps in to maintain
it.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kbuild.platforms                |   1 -
 arch/mips/Kconfig                         |  19 --
 arch/mips/configs/mips_paravirt_defconfig |  98 ------
 arch/mips/include/asm/Kbuild              |   1 +
 arch/mips/include/asm/kvm_para.h          | 115 -------
 arch/mips/include/uapi/asm/Kbuild         |   2 +
 arch/mips/include/uapi/asm/kvm_para.h     |   5 -
 arch/mips/paravirt/Kconfig                |   7 -
 arch/mips/paravirt/Makefile               |  14 -
 arch/mips/paravirt/Platform               |   7 -
 arch/mips/paravirt/paravirt-irq.c         | 368 ----------------------
 arch/mips/paravirt/paravirt-smp.c         | 145 ---------
 arch/mips/paravirt/serial.c               |  39 ---
 arch/mips/paravirt/setup.c                |  67 ----
 arch/mips/pci/Makefile                    |   1 -
 arch/mips/pci/pci-virtio-guest.c          | 131 --------
 16 files changed, 3 insertions(+), 1017 deletions(-)
 delete mode 100644 arch/mips/configs/mips_paravirt_defconfig
 delete mode 100644 arch/mips/include/asm/kvm_para.h
 delete mode 100644 arch/mips/include/uapi/asm/kvm_para.h
 delete mode 100644 arch/mips/paravirt/Kconfig
 delete mode 100644 arch/mips/paravirt/Makefile
 delete mode 100644 arch/mips/paravirt/Platform
 delete mode 100644 arch/mips/paravirt/paravirt-irq.c
 delete mode 100644 arch/mips/paravirt/paravirt-smp.c
 delete mode 100644 arch/mips/paravirt/serial.c
 delete mode 100644 arch/mips/paravirt/setup.c
 delete mode 100644 arch/mips/pci/pci-virtio-guest.c

diff --git a/arch/mips/Kbuild.platforms b/arch/mips/Kbuild.platforms
index c7368a81fd1e..a13c4cf6e608 100644
--- a/arch/mips/Kbuild.platforms
+++ b/arch/mips/Kbuild.platforms
@@ -20,7 +20,6 @@ platform-$(CONFIG_MACH_LOONGSON32)	+= loongson32/
 platform-$(CONFIG_MACH_LOONGSON64)	+= loongson64/
 platform-$(CONFIG_MIPS_MALTA)		+= mti-malta/
 platform-$(CONFIG_NLM_COMMON)		+= netlogic/
-platform-$(CONFIG_MIPS_PARAVIRT)	+= paravirt/
 platform-$(CONFIG_PIC32MZDA)		+= pic32/
 platform-$(CONFIG_MACH_PISTACHIO)	+= pistachio/
 platform-$(CONFIG_SOC_PNX833X)		+= pnx833x/
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 6fee1a133e9d..6bc577f34da1 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1013,24 +1013,6 @@ config NLM_XLP_BOARD
 	  This board is based on Netlogic XLP Processor.
 	  Say Y here if you have a XLP based board.
 
-config MIPS_PARAVIRT
-	bool "Para-Virtualized guest system"
-	select CEVT_R4K
-	select CSRC_R4K
-	select SYS_SUPPORTS_64BIT_KERNEL
-	select SYS_SUPPORTS_32BIT_KERNEL
-	select SYS_SUPPORTS_BIG_ENDIAN
-	select SYS_SUPPORTS_SMP
-	select NR_CPUS_DEFAULT_4
-	select SYS_HAS_EARLY_PRINTK
-	select SYS_HAS_CPU_MIPS32_R2
-	select SYS_HAS_CPU_MIPS64_R2
-	select SYS_HAS_CPU_CAVIUM_OCTEON
-	select HAVE_PCI
-	select SWAP_IO_SPACE
-	help
-	  This option supports guest running under ????
-
 endchoice
 
 source "arch/mips/alchemy/Kconfig"
@@ -1055,7 +1037,6 @@ source "arch/mips/loongson2ef/Kconfig"
 source "arch/mips/loongson32/Kconfig"
 source "arch/mips/loongson64/Kconfig"
 source "arch/mips/netlogic/Kconfig"
-source "arch/mips/paravirt/Kconfig"
 
 endmenu
 
diff --git a/arch/mips/configs/mips_paravirt_defconfig b/arch/mips/configs/mips_paravirt_defconfig
deleted file mode 100644
index 5599cde97030..000000000000
--- a/arch/mips/configs/mips_paravirt_defconfig
+++ /dev/null
@@ -1,98 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_PREEMPT=y
-CONFIG_BSD_PROCESS_ACCT=y
-CONFIG_BSD_PROCESS_ACCT_V3=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_RELAY=y
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_EXPERT=y
-CONFIG_SLAB=y
-CONFIG_MIPS_PARAVIRT=y
-CONFIG_CPU_MIPS64_R2=y
-CONFIG_64BIT=y
-CONFIG_SMP=y
-CONFIG_HZ_1000=y
-CONFIG_PCI=y
-CONFIG_MIPS32_O32=y
-CONFIG_MIPS32_N32=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_TRANSPARENT_HUGEPAGE=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IP_MULTICAST=y
-CONFIG_IP_ADVANCED_ROUTER=y
-CONFIG_IP_MULTIPLE_TABLES=y
-CONFIG_IP_ROUTE_MULTIPATH=y
-CONFIG_IP_ROUTE_VERBOSE=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_IP_PNP_BOOTP=y
-CONFIG_IP_PNP_RARP=y
-CONFIG_IP_MROUTE=y
-CONFIG_IP_PIMSM_V1=y
-CONFIG_IP_PIMSM_V2=y
-CONFIG_SYN_COOKIES=y
-# CONFIG_WIRELESS is not set
-# CONFIG_FW_LOADER is not set
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_VIRTIO_BLK=y
-CONFIG_SCSI=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_NETDEVICES=y
-CONFIG_VIRTIO_NET=y
-# CONFIG_NET_VENDOR_BROADCOM is not set
-# CONFIG_NET_VENDOR_INTEL is not set
-# CONFIG_NET_VENDOR_MARVELL is not set
-# CONFIG_NET_VENDOR_MICREL is not set
-# CONFIG_NET_VENDOR_NATSEMI is not set
-# CONFIG_NET_VENDOR_SMSC is not set
-# CONFIG_NET_VENDOR_STMICRO is not set
-# CONFIG_NET_VENDOR_WIZNET is not set
-CONFIG_PHYLIB=y
-CONFIG_BCM87XX_PHY=y
-CONFIG_BROADCOM_PHY=y
-CONFIG_MARVELL_PHY=y
-# CONFIG_WLAN is not set
-# CONFIG_INPUT is not set
-# CONFIG_SERIO is not set
-# CONFIG_VT is not set
-CONFIG_VIRTIO_CONSOLE=y
-# CONFIG_HW_RANDOM is not set
-# CONFIG_HWMON is not set
-# CONFIG_USB_SUPPORT is not set
-CONFIG_VIRTIO_PCI=y
-CONFIG_VIRTIO_BALLOON=y
-CONFIG_VIRTIO_MMIO=y
-# CONFIG_IOMMU_SUPPORT is not set
-CONFIG_EXT4_FS=y
-CONFIG_EXT4_FS_POSIX_ACL=y
-CONFIG_EXT4_FS_SECURITY=y
-CONFIG_MSDOS_FS=y
-CONFIG_VFAT_FS=y
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_HUGETLBFS=y
-# CONFIG_MISC_FILESYSTEMS is not set
-CONFIG_NFS_FS=y
-CONFIG_NFS_V4=y
-CONFIG_NFS_V4_1=y
-CONFIG_ROOT_NFS=y
-CONFIG_NLS_CODEPAGE_437=y
-CONFIG_NLS_ASCII=y
-CONFIG_NLS_ISO8859_1=y
-CONFIG_NLS_UTF8=y
-CONFIG_CRYPTO_CBC=y
-CONFIG_CRYPTO_HMAC=y
-CONFIG_CRYPTO_MD5=y
-CONFIG_CRYPTO_DES=y
-CONFIG_DEBUG_INFO=y
-CONFIG_DEBUG_FS=y
-CONFIG_MAGIC_SYSRQ=y
-# CONFIG_SCHED_DEBUG is not set
-# CONFIG_FTRACE is not set
diff --git a/arch/mips/include/asm/Kbuild b/arch/mips/include/asm/Kbuild
index 8643d313890e..198b3bafdac9 100644
--- a/arch/mips/include/asm/Kbuild
+++ b/arch/mips/include/asm/Kbuild
@@ -5,6 +5,7 @@ generated-y += syscall_table_64_n32.h
 generated-y += syscall_table_64_n64.h
 generated-y += syscall_table_64_o32.h
 generic-y += export.h
+generic-y += kvm_para.h
 generic-y += local64.h
 generic-y += mcs_spinlock.h
 generic-y += parport.h
diff --git a/arch/mips/include/asm/kvm_para.h b/arch/mips/include/asm/kvm_para.h
deleted file mode 100644
index b57e978b0946..000000000000
--- a/arch/mips/include/asm/kvm_para.h
+++ /dev/null
@@ -1,115 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_MIPS_KVM_PARA_H
-#define _ASM_MIPS_KVM_PARA_H
-
-#include <uapi/asm/kvm_para.h>
-
-#define KVM_HYPERCALL ".word 0x42000028"
-
-/*
- * Hypercalls for KVM.
- *
- * Hypercall number is passed in v0.
- * Return value will be placed in v0.
- * Up to 3 arguments are passed in a0, a1, and a2.
- */
-static inline unsigned long kvm_hypercall0(unsigned long num)
-{
-	register unsigned long n asm("v0");
-	register unsigned long r asm("v0");
-
-	n = num;
-	__asm__ __volatile__(
-		KVM_HYPERCALL
-		: "=r" (r) : "r" (n) : "memory"
-		);
-
-	return r;
-}
-
-static inline unsigned long kvm_hypercall1(unsigned long num,
-					unsigned long arg0)
-{
-	register unsigned long n asm("v0");
-	register unsigned long r asm("v0");
-	register unsigned long a0 asm("a0");
-
-	n = num;
-	a0 = arg0;
-	__asm__ __volatile__(
-		KVM_HYPERCALL
-		: "=r" (r) : "r" (n), "r" (a0) : "memory"
-		);
-
-	return r;
-}
-
-static inline unsigned long kvm_hypercall2(unsigned long num,
-					unsigned long arg0, unsigned long arg1)
-{
-	register unsigned long n asm("v0");
-	register unsigned long r asm("v0");
-	register unsigned long a0 asm("a0");
-	register unsigned long a1 asm("a1");
-
-	n = num;
-	a0 = arg0;
-	a1 = arg1;
-	__asm__ __volatile__(
-		KVM_HYPERCALL
-		: "=r" (r) : "r" (n), "r" (a0), "r" (a1) : "memory"
-		);
-
-	return r;
-}
-
-static inline unsigned long kvm_hypercall3(unsigned long num,
-	unsigned long arg0, unsigned long arg1, unsigned long arg2)
-{
-	register unsigned long n asm("v0");
-	register unsigned long r asm("v0");
-	register unsigned long a0 asm("a0");
-	register unsigned long a1 asm("a1");
-	register unsigned long a2 asm("a2");
-
-	n = num;
-	a0 = arg0;
-	a1 = arg1;
-	a2 = arg2;
-	__asm__ __volatile__(
-		KVM_HYPERCALL
-		: "=r" (r) : "r" (n), "r" (a0), "r" (a1), "r" (a2) : "memory"
-		);
-
-	return r;
-}
-
-static inline bool kvm_check_and_clear_guest_paused(void)
-{
-	return false;
-}
-
-static inline unsigned int kvm_arch_para_features(void)
-{
-	return 0;
-}
-
-static inline unsigned int kvm_arch_para_hints(void)
-{
-	return 0;
-}
-
-#ifdef CONFIG_MIPS_PARAVIRT
-static inline bool kvm_para_available(void)
-{
-	return true;
-}
-#else
-static inline bool kvm_para_available(void)
-{
-	return false;
-}
-#endif
-
-
-#endif /* _ASM_MIPS_KVM_PARA_H */
diff --git a/arch/mips/include/uapi/asm/Kbuild b/arch/mips/include/uapi/asm/Kbuild
index c21c87ecdcd0..6db08385d3d8 100644
--- a/arch/mips/include/uapi/asm/Kbuild
+++ b/arch/mips/include/uapi/asm/Kbuild
@@ -5,3 +5,5 @@ generated-y += unistd_o32.h
 generated-y += unistd_nr_n32.h
 generated-y += unistd_nr_n64.h
 generated-y += unistd_nr_o32.h
+
+generic-y += kvm_para.h
diff --git a/arch/mips/include/uapi/asm/kvm_para.h b/arch/mips/include/uapi/asm/kvm_para.h
deleted file mode 100644
index 7e16d7c42e65..000000000000
--- a/arch/mips/include/uapi/asm/kvm_para.h
+++ /dev/null
@@ -1,5 +0,0 @@
-#ifndef _UAPI_ASM_MIPS_KVM_PARA_H
-#define _UAPI_ASM_MIPS_KVM_PARA_H
-
-
-#endif /* _UAPI_ASM_MIPS_KVM_PARA_H */
diff --git a/arch/mips/paravirt/Kconfig b/arch/mips/paravirt/Kconfig
deleted file mode 100644
index 46b110fec967..000000000000
--- a/arch/mips/paravirt/Kconfig
+++ /dev/null
@@ -1,7 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-if MIPS_PARAVIRT
-
-config MIPS_PCI_VIRTIO
-	def_bool y
-
-endif #  MIPS_PARAVIRT
diff --git a/arch/mips/paravirt/Makefile b/arch/mips/paravirt/Makefile
deleted file mode 100644
index 5023af733a35..000000000000
--- a/arch/mips/paravirt/Makefile
+++ /dev/null
@@ -1,14 +0,0 @@
-#
-# Makefile for MIPS para-virtualized specific kernel interface routines
-# under Linux.
-#
-# This file is subject to the terms and conditions of the GNU General Public
-# License.  See the file "COPYING" in the main directory of this archive
-# for more details.
-#
-# Copyright (C) 2013 Cavium, Inc.
-#
-
-obj-y := setup.o serial.o paravirt-irq.o
-
-obj-$(CONFIG_SMP)		+= paravirt-smp.o
diff --git a/arch/mips/paravirt/Platform b/arch/mips/paravirt/Platform
deleted file mode 100644
index 0b857580dfdd..000000000000
--- a/arch/mips/paravirt/Platform
+++ /dev/null
@@ -1,7 +0,0 @@
-#
-# Generic para-virtualized guest.
-#
-cflags-$(CONFIG_MIPS_PARAVIRT)		+=				\
-		-I$(srctree)/arch/mips/include/asm/mach-paravirt
-
-load-$(CONFIG_MIPS_PARAVIRT)	= 0xffffffff80010000
diff --git a/arch/mips/paravirt/paravirt-irq.c b/arch/mips/paravirt/paravirt-irq.c
deleted file mode 100644
index 8987b06c9de9..000000000000
--- a/arch/mips/paravirt/paravirt-irq.c
+++ /dev/null
@@ -1,368 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2013 Cavium, Inc.
- */
-
-#include <linux/interrupt.h>
-#include <linux/cpumask.h>
-#include <linux/kernel.h>
-#include <linux/mutex.h>
-
-#include <asm/io.h>
-
-#define MBOX_BITS_PER_CPU 2
-
-static int cpunum_for_cpu(int cpu)
-{
-#ifdef CONFIG_SMP
-	return cpu_logical_map(cpu);
-#else
-	return get_ebase_cpunum();
-#endif
-}
-
-struct core_chip_data {
-	struct mutex core_irq_mutex;
-	bool current_en;
-	bool desired_en;
-	u8 bit;
-};
-
-static struct core_chip_data irq_core_chip_data[8];
-
-static void irq_core_ack(struct irq_data *data)
-{
-	struct core_chip_data *cd = irq_data_get_irq_chip_data(data);
-	unsigned int bit = cd->bit;
-
-	/*
-	 * We don't need to disable IRQs to make these atomic since
-	 * they are already disabled earlier in the low level
-	 * interrupt code.
-	 */
-	clear_c0_status(0x100 << bit);
-	/* The two user interrupts must be cleared manually. */
-	if (bit < 2)
-		clear_c0_cause(0x100 << bit);
-}
-
-static void irq_core_eoi(struct irq_data *data)
-{
-	struct core_chip_data *cd = irq_data_get_irq_chip_data(data);
-
-	/*
-	 * We don't need to disable IRQs to make these atomic since
-	 * they are already disabled earlier in the low level
-	 * interrupt code.
-	 */
-	set_c0_status(0x100 << cd->bit);
-}
-
-static void irq_core_set_enable_local(void *arg)
-{
-	struct irq_data *data = arg;
-	struct core_chip_data *cd = irq_data_get_irq_chip_data(data);
-	unsigned int mask = 0x100 << cd->bit;
-
-	/*
-	 * Interrupts are already disabled, so these are atomic.
-	 */
-	if (cd->desired_en)
-		set_c0_status(mask);
-	else
-		clear_c0_status(mask);
-
-}
-
-static void irq_core_disable(struct irq_data *data)
-{
-	struct core_chip_data *cd = irq_data_get_irq_chip_data(data);
-	cd->desired_en = false;
-}
-
-static void irq_core_enable(struct irq_data *data)
-{
-	struct core_chip_data *cd = irq_data_get_irq_chip_data(data);
-	cd->desired_en = true;
-}
-
-static void irq_core_bus_lock(struct irq_data *data)
-{
-	struct core_chip_data *cd = irq_data_get_irq_chip_data(data);
-
-	mutex_lock(&cd->core_irq_mutex);
-}
-
-static void irq_core_bus_sync_unlock(struct irq_data *data)
-{
-	struct core_chip_data *cd = irq_data_get_irq_chip_data(data);
-
-	if (cd->desired_en != cd->current_en) {
-		on_each_cpu(irq_core_set_enable_local, data, 1);
-		cd->current_en = cd->desired_en;
-	}
-
-	mutex_unlock(&cd->core_irq_mutex);
-}
-
-static struct irq_chip irq_chip_core = {
-	.name = "Core",
-	.irq_enable = irq_core_enable,
-	.irq_disable = irq_core_disable,
-	.irq_ack = irq_core_ack,
-	.irq_eoi = irq_core_eoi,
-	.irq_bus_lock = irq_core_bus_lock,
-	.irq_bus_sync_unlock = irq_core_bus_sync_unlock,
-
-	.irq_cpu_online = irq_core_eoi,
-	.irq_cpu_offline = irq_core_ack,
-	.flags = IRQCHIP_ONOFFLINE_ENABLED,
-};
-
-static void __init irq_init_core(void)
-{
-	int i;
-	int irq;
-	struct core_chip_data *cd;
-
-	/* Start with a clean slate */
-	clear_c0_status(ST0_IM);
-	clear_c0_cause(CAUSEF_IP0 | CAUSEF_IP1);
-
-	for (i = 0; i < ARRAY_SIZE(irq_core_chip_data); i++) {
-		cd = irq_core_chip_data + i;
-		cd->current_en = false;
-		cd->desired_en = false;
-		cd->bit = i;
-		mutex_init(&cd->core_irq_mutex);
-
-		irq = MIPS_CPU_IRQ_BASE + i;
-
-		switch (i) {
-		case 0: /* SW0 */
-		case 1: /* SW1 */
-		case 5: /* IP5 */
-		case 6: /* IP6 */
-		case 7: /* IP7 */
-			irq_set_chip_data(irq, cd);
-			irq_set_chip_and_handler(irq, &irq_chip_core,
-						 handle_percpu_irq);
-			break;
-		default:
-			break;
-		}
-	}
-}
-
-static void __iomem *mips_irq_chip;
-#define MIPS_IRQ_CHIP_NUM_BITS 0
-#define MIPS_IRQ_CHIP_REGS 8
-
-static int mips_irq_cpu_stride;
-static int mips_irq_chip_reg_raw;
-static int mips_irq_chip_reg_src;
-static int mips_irq_chip_reg_en;
-static int mips_irq_chip_reg_raw_w1s;
-static int mips_irq_chip_reg_raw_w1c;
-static int mips_irq_chip_reg_en_w1s;
-static int mips_irq_chip_reg_en_w1c;
-
-static void irq_pci_enable(struct irq_data *data)
-{
-	u32 mask = 1u << data->irq;
-
-	__raw_writel(mask, mips_irq_chip + mips_irq_chip_reg_en_w1s);
-}
-
-static void irq_pci_disable(struct irq_data *data)
-{
-	u32 mask = 1u << data->irq;
-
-	__raw_writel(mask, mips_irq_chip + mips_irq_chip_reg_en_w1c);
-}
-
-static void irq_pci_ack(struct irq_data *data)
-{
-}
-
-static void irq_pci_mask(struct irq_data *data)
-{
-	u32 mask = 1u << data->irq;
-
-	__raw_writel(mask, mips_irq_chip + mips_irq_chip_reg_en_w1c);
-}
-
-static void irq_pci_unmask(struct irq_data *data)
-{
-	u32 mask = 1u << data->irq;
-
-	__raw_writel(mask, mips_irq_chip + mips_irq_chip_reg_en_w1s);
-}
-
-static struct irq_chip irq_chip_pci = {
-	.name = "PCI",
-	.irq_enable = irq_pci_enable,
-	.irq_disable = irq_pci_disable,
-	.irq_ack = irq_pci_ack,
-	.irq_mask = irq_pci_mask,
-	.irq_unmask = irq_pci_unmask,
-};
-
-static void irq_mbox_all(struct irq_data *data,  void __iomem *base)
-{
-	int cpu;
-	unsigned int mbox = data->irq - MIPS_IRQ_MBOX0;
-	u32 mask;
-
-	WARN_ON(mbox >= MBOX_BITS_PER_CPU);
-
-	for_each_online_cpu(cpu) {
-		unsigned int cpuid = cpunum_for_cpu(cpu);
-		mask = 1 << (cpuid * MBOX_BITS_PER_CPU + mbox);
-		__raw_writel(mask, base + (cpuid * mips_irq_cpu_stride));
-	}
-}
-
-static void irq_mbox_enable(struct irq_data *data)
-{
-	irq_mbox_all(data, mips_irq_chip + mips_irq_chip_reg_en_w1s + sizeof(u32));
-}
-
-static void irq_mbox_disable(struct irq_data *data)
-{
-	irq_mbox_all(data, mips_irq_chip + mips_irq_chip_reg_en_w1c + sizeof(u32));
-}
-
-static void irq_mbox_ack(struct irq_data *data)
-{
-	u32 mask;
-	unsigned int mbox = data->irq - MIPS_IRQ_MBOX0;
-
-	WARN_ON(mbox >= MBOX_BITS_PER_CPU);
-
-	mask = 1 << (get_ebase_cpunum() * MBOX_BITS_PER_CPU + mbox);
-	__raw_writel(mask, mips_irq_chip + mips_irq_chip_reg_raw_w1c + sizeof(u32));
-}
-
-void irq_mbox_ipi(int cpu, unsigned int actions)
-{
-	unsigned int cpuid = cpunum_for_cpu(cpu);
-	u32 mask;
-
-	WARN_ON(actions >= (1 << MBOX_BITS_PER_CPU));
-
-	mask = actions << (cpuid * MBOX_BITS_PER_CPU);
-	__raw_writel(mask, mips_irq_chip + mips_irq_chip_reg_raw_w1s + sizeof(u32));
-}
-
-static void irq_mbox_cpu_onoffline(struct irq_data *data,  void __iomem *base)
-{
-	unsigned int mbox = data->irq - MIPS_IRQ_MBOX0;
-	unsigned int cpuid = get_ebase_cpunum();
-	u32 mask;
-
-	WARN_ON(mbox >= MBOX_BITS_PER_CPU);
-
-	mask = 1 << (cpuid * MBOX_BITS_PER_CPU + mbox);
-	__raw_writel(mask, base + (cpuid * mips_irq_cpu_stride));
-
-}
-
-static void irq_mbox_cpu_online(struct irq_data *data)
-{
-	irq_mbox_cpu_onoffline(data, mips_irq_chip + mips_irq_chip_reg_en_w1s + sizeof(u32));
-}
-
-static void irq_mbox_cpu_offline(struct irq_data *data)
-{
-	irq_mbox_cpu_onoffline(data, mips_irq_chip + mips_irq_chip_reg_en_w1c + sizeof(u32));
-}
-
-static struct irq_chip irq_chip_mbox = {
-	.name = "MBOX",
-	.irq_enable = irq_mbox_enable,
-	.irq_disable = irq_mbox_disable,
-	.irq_ack = irq_mbox_ack,
-	.irq_cpu_online = irq_mbox_cpu_online,
-	.irq_cpu_offline = irq_mbox_cpu_offline,
-	.flags = IRQCHIP_ONOFFLINE_ENABLED,
-};
-
-static void __init irq_pci_init(void)
-{
-	int i, stride;
-	u32 num_bits;
-
-	mips_irq_chip = ioremap(0x1e010000, 4096);
-
-	num_bits = __raw_readl(mips_irq_chip + MIPS_IRQ_CHIP_NUM_BITS);
-	stride = 8 * (1 + ((num_bits - 1) / 64));
-
-
-	pr_notice("mips_irq_chip: %u bits, reg stride: %d\n", num_bits, stride);
-	mips_irq_chip_reg_raw		= MIPS_IRQ_CHIP_REGS + 0 * stride;
-	mips_irq_chip_reg_raw_w1s	= MIPS_IRQ_CHIP_REGS + 1 * stride;
-	mips_irq_chip_reg_raw_w1c	= MIPS_IRQ_CHIP_REGS + 2 * stride;
-	mips_irq_chip_reg_src		= MIPS_IRQ_CHIP_REGS + 3 * stride;
-	mips_irq_chip_reg_en		= MIPS_IRQ_CHIP_REGS + 4 * stride;
-	mips_irq_chip_reg_en_w1s	= MIPS_IRQ_CHIP_REGS + 5 * stride;
-	mips_irq_chip_reg_en_w1c	= MIPS_IRQ_CHIP_REGS + 6 * stride;
-	mips_irq_cpu_stride		= stride * 4;
-
-	for (i = 0; i < 4; i++)
-		irq_set_chip_and_handler(i + MIPS_IRQ_PCIA, &irq_chip_pci, handle_level_irq);
-
-	for (i = 0; i < 2; i++)
-		irq_set_chip_and_handler(i + MIPS_IRQ_MBOX0, &irq_chip_mbox, handle_percpu_irq);
-
-
-	set_c0_status(STATUSF_IP2);
-}
-
-static void irq_pci_dispatch(void)
-{
-	unsigned int cpuid = get_ebase_cpunum();
-	u32 en;
-
-	en = __raw_readl(mips_irq_chip + mips_irq_chip_reg_src +
-			(cpuid * mips_irq_cpu_stride));
-
-	if (!en) {
-		en = __raw_readl(mips_irq_chip + mips_irq_chip_reg_src + (cpuid * mips_irq_cpu_stride) + sizeof(u32));
-		en = (en >> (2 * cpuid)) & 3;
-
-		if (!en)
-			spurious_interrupt();
-		else
-			do_IRQ(__ffs(en) + MIPS_IRQ_MBOX0);	/* MBOX type */
-	} else {
-		do_IRQ(__ffs(en));
-	}
-}
-
-
-void __init arch_init_irq(void)
-{
-	irq_init_core();
-	irq_pci_init();
-}
-
-asmlinkage void plat_irq_dispatch(void)
-{
-	unsigned int pending = read_c0_cause() & read_c0_status() & ST0_IM;
-	int ip;
-
-	if (unlikely(!pending)) {
-		spurious_interrupt();
-		return;
-	}
-
-	ip = ffs(pending) - 1 - STATUSB_IP0;
-	if (ip == 2)
-		irq_pci_dispatch();
-	else
-		do_IRQ(MIPS_CPU_IRQ_BASE + ip);
-}
diff --git a/arch/mips/paravirt/paravirt-smp.c b/arch/mips/paravirt/paravirt-smp.c
deleted file mode 100644
index 107d9f90d668..000000000000
--- a/arch/mips/paravirt/paravirt-smp.c
+++ /dev/null
@@ -1,145 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2013 Cavium, Inc.
- */
-
-#include <linux/interrupt.h>
-#include <linux/cpumask.h>
-#include <linux/kernel.h>
-#include <linux/sched.h>
-#include <linux/sched/task_stack.h>
-
-#include <asm/mipsregs.h>
-#include <asm/setup.h>
-#include <asm/time.h>
-#include <asm/smp.h>
-
-/*
- * Writing the sp releases the CPU, so writes must be ordered, gp
- * first, then sp.
- */
-unsigned long paravirt_smp_sp[NR_CPUS];
-unsigned long paravirt_smp_gp[NR_CPUS];
-
-static int numcpus = 1;
-
-static int __init set_numcpus(char *str)
-{
-	int newval;
-
-	if (get_option(&str, &newval)) {
-		if (newval < 1 || newval >= NR_CPUS)
-			goto bad;
-		numcpus = newval;
-		return 0;
-	}
-bad:
-	return -EINVAL;
-}
-early_param("numcpus", set_numcpus);
-
-
-static void paravirt_smp_setup(void)
-{
-	int id;
-	unsigned int cpunum = get_ebase_cpunum();
-
-	if (WARN_ON(cpunum >= NR_CPUS))
-		return;
-
-	/* The present CPUs are initially just the boot cpu (CPU 0). */
-	for (id = 0; id < NR_CPUS; id++) {
-		set_cpu_possible(id, id == 0);
-		set_cpu_present(id, id == 0);
-	}
-	__cpu_number_map[cpunum] = 0;
-	__cpu_logical_map[0] = cpunum;
-
-	for (id = 0; id < numcpus; id++) {
-		set_cpu_possible(id, true);
-		set_cpu_present(id, true);
-		__cpu_number_map[id] = id;
-		__cpu_logical_map[id] = id;
-	}
-}
-
-void irq_mbox_ipi(int cpu, unsigned int actions);
-static void paravirt_send_ipi_single(int cpu, unsigned int action)
-{
-	irq_mbox_ipi(cpu, action);
-}
-
-static void paravirt_send_ipi_mask(const struct cpumask *mask, unsigned int action)
-{
-	unsigned int cpu;
-
-	for_each_cpu(cpu, mask)
-		paravirt_send_ipi_single(cpu, action);
-}
-
-static void paravirt_init_secondary(void)
-{
-	unsigned int sr;
-
-	sr = set_c0_status(ST0_BEV);
-	write_c0_ebase((u32)ebase);
-
-	sr |= STATUSF_IP2; /* Interrupt controller on IP2 */
-	write_c0_status(sr);
-
-	irq_cpu_online();
-}
-
-static void paravirt_smp_finish(void)
-{
-	/* to generate the first CPU timer interrupt */
-	write_c0_compare(read_c0_count() + mips_hpt_frequency / HZ);
-	local_irq_enable();
-}
-
-static int paravirt_boot_secondary(int cpu, struct task_struct *idle)
-{
-	paravirt_smp_gp[cpu] = (unsigned long)task_thread_info(idle);
-	smp_wmb();
-	paravirt_smp_sp[cpu] = __KSTK_TOS(idle);
-	return 0;
-}
-
-static irqreturn_t paravirt_reched_interrupt(int irq, void *dev_id)
-{
-	scheduler_ipi();
-	return IRQ_HANDLED;
-}
-
-static irqreturn_t paravirt_function_interrupt(int irq, void *dev_id)
-{
-	generic_smp_call_function_interrupt();
-	return IRQ_HANDLED;
-}
-
-static void paravirt_prepare_cpus(unsigned int max_cpus)
-{
-	if (request_irq(MIPS_IRQ_MBOX0, paravirt_reched_interrupt,
-			IRQF_PERCPU | IRQF_NO_THREAD, "Scheduler",
-			paravirt_reched_interrupt)) {
-		panic("Cannot request_irq for SchedulerIPI");
-	}
-	if (request_irq(MIPS_IRQ_MBOX1, paravirt_function_interrupt,
-			IRQF_PERCPU | IRQF_NO_THREAD, "SMP-Call",
-			paravirt_function_interrupt)) {
-		panic("Cannot request_irq for SMP-Call");
-	}
-}
-
-const struct plat_smp_ops paravirt_smp_ops = {
-	.send_ipi_single	= paravirt_send_ipi_single,
-	.send_ipi_mask		= paravirt_send_ipi_mask,
-	.init_secondary		= paravirt_init_secondary,
-	.smp_finish		= paravirt_smp_finish,
-	.boot_secondary		= paravirt_boot_secondary,
-	.smp_setup		= paravirt_smp_setup,
-	.prepare_cpus		= paravirt_prepare_cpus,
-};
diff --git a/arch/mips/paravirt/serial.c b/arch/mips/paravirt/serial.c
deleted file mode 100644
index a37b6f9f0ede..000000000000
--- a/arch/mips/paravirt/serial.c
+++ /dev/null
@@ -1,39 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2013 Cavium, Inc.
- */
-
-#include <linux/kernel.h>
-#include <linux/virtio_console.h>
-#include <linux/kvm_para.h>
-#include <asm/setup.h>
-
-/*
- * Emit one character to the boot console.
- */
-void prom_putchar(char c)
-{
-	kvm_hypercall3(KVM_HC_MIPS_CONSOLE_OUTPUT, 0 /*  port 0 */,
-		(unsigned long)&c, 1 /* len == 1 */);
-}
-
-#ifdef CONFIG_VIRTIO_CONSOLE
-static int paravirt_put_chars(u32 vtermno, const char *buf, int count)
-{
-	kvm_hypercall3(KVM_HC_MIPS_CONSOLE_OUTPUT, vtermno,
-		(unsigned long)buf, count);
-
-	return count;
-}
-
-static int __init paravirt_cons_init(void)
-{
-	virtio_cons_early_init(paravirt_put_chars);
-	return 0;
-}
-core_initcall(paravirt_cons_init);
-
-#endif
diff --git a/arch/mips/paravirt/setup.c b/arch/mips/paravirt/setup.c
deleted file mode 100644
index d2ffec1409a7..000000000000
--- a/arch/mips/paravirt/setup.c
+++ /dev/null
@@ -1,67 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2013 Cavium, Inc.
- */
-
-#include <linux/kernel.h>
-#include <linux/kvm_para.h>
-
-#include <asm/reboot.h>
-#include <asm/bootinfo.h>
-#include <asm/smp-ops.h>
-#include <asm/time.h>
-
-extern const struct plat_smp_ops paravirt_smp_ops;
-
-const char *get_system_type(void)
-{
-	return "MIPS Para-Virtualized Guest";
-}
-
-void __init plat_time_init(void)
-{
-	mips_hpt_frequency = kvm_hypercall0(KVM_HC_MIPS_GET_CLOCK_FREQ);
-
-	preset_lpj = mips_hpt_frequency / (2 * HZ);
-}
-
-static void pv_machine_halt(void)
-{
-	kvm_hypercall0(KVM_HC_MIPS_EXIT_VM);
-}
-
-/*
- * Early entry point for arch setup
- */
-void __init prom_init(void)
-{
-	int i;
-	int argc = fw_arg0;
-	char **argv = (char **)fw_arg1;
-
-#ifdef CONFIG_32BIT
-	set_io_port_base(KSEG1ADDR(0x1e000000));
-#else /* CONFIG_64BIT */
-	set_io_port_base(PHYS_TO_XKSEG_UNCACHED(0x1e000000));
-#endif
-
-	for (i = 0; i < argc; i++) {
-		strlcat(arcs_cmdline, argv[i], COMMAND_LINE_SIZE);
-		if (i < argc - 1)
-			strlcat(arcs_cmdline, " ", COMMAND_LINE_SIZE);
-	}
-	_machine_halt = pv_machine_halt;
-	register_smp_ops(&paravirt_smp_ops);
-}
-
-void __init plat_mem_setup(void)
-{
-	/* Do nothing, the "mem=???" parser handles our memory. */
-}
-
-void __init prom_free_prom_memory(void)
-{
-}
diff --git a/arch/mips/pci/Makefile b/arch/mips/pci/Makefile
index 0f68d6849978..f3eecc065e5c 100644
--- a/arch/mips/pci/Makefile
+++ b/arch/mips/pci/Makefile
@@ -23,7 +23,6 @@ obj-$(CONFIG_MIPS_ALCHEMY)	+= pci-alchemy.o
 obj-$(CONFIG_PCI_AR2315)	+= pci-ar2315.o
 obj-$(CONFIG_SOC_AR71XX)	+= pci-ar71xx.o
 obj-$(CONFIG_PCI_AR724X)	+= pci-ar724x.o
-obj-$(CONFIG_MIPS_PCI_VIRTIO)	+= pci-virtio-guest.o
 obj-$(CONFIG_PCI_XTALK_BRIDGE)	+= pci-xtalk-bridge.o
 #
 # These are still pretty much in the old state, watch, go blind.
diff --git a/arch/mips/pci/pci-virtio-guest.c b/arch/mips/pci/pci-virtio-guest.c
deleted file mode 100644
index 40a078bc4617..000000000000
--- a/arch/mips/pci/pci-virtio-guest.c
+++ /dev/null
@@ -1,131 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2013 Cavium, Inc.
- */
-
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/interrupt.h>
-#include <linux/pci.h>
-
-#include <uapi/asm/bitfield.h>
-#include <asm/byteorder.h>
-#include <asm/io.h>
-
-#define PCI_CONFIG_ADDRESS	0xcf8
-#define PCI_CONFIG_DATA		0xcfc
-
-union pci_config_address {
-	struct {
-		__BITFIELD_FIELD(unsigned enable_bit	  : 1,	/* 31       */
-		__BITFIELD_FIELD(unsigned reserved	  : 7,	/* 30 .. 24 */
-		__BITFIELD_FIELD(unsigned bus_number	  : 8,	/* 23 .. 16 */
-		__BITFIELD_FIELD(unsigned devfn_number	  : 8,	/* 15 .. 8  */
-		__BITFIELD_FIELD(unsigned register_number : 8,	/* 7  .. 0  */
-		)))));
-	};
-	u32 w;
-};
-
-int pcibios_plat_dev_init(struct pci_dev *dev)
-{
-	return 0;
-}
-
-int pcibios_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
-{
-	return ((pin + slot) % 4)+ MIPS_IRQ_PCIA;
-}
-
-static void pci_virtio_guest_write_config_addr(struct pci_bus *bus,
-					unsigned int devfn, int reg)
-{
-	union pci_config_address pca = { .w = 0 };
-
-	pca.register_number = reg;
-	pca.devfn_number = devfn;
-	pca.bus_number = bus->number;
-	pca.enable_bit = 1;
-
-	outl(pca.w, PCI_CONFIG_ADDRESS);
-}
-
-static int pci_virtio_guest_write_config(struct pci_bus *bus,
-		unsigned int devfn, int reg, int size, u32 val)
-{
-	pci_virtio_guest_write_config_addr(bus, devfn, reg);
-
-	switch (size) {
-	case 1:
-		outb(val, PCI_CONFIG_DATA + (reg & 3));
-		break;
-	case 2:
-		outw(val, PCI_CONFIG_DATA + (reg & 2));
-		break;
-	case 4:
-		outl(val, PCI_CONFIG_DATA);
-		break;
-	}
-
-	return PCIBIOS_SUCCESSFUL;
-}
-
-static int pci_virtio_guest_read_config(struct pci_bus *bus, unsigned int devfn,
-					int reg, int size, u32 *val)
-{
-	pci_virtio_guest_write_config_addr(bus, devfn, reg);
-
-	switch (size) {
-	case 1:
-		*val = inb(PCI_CONFIG_DATA + (reg & 3));
-		break;
-	case 2:
-		*val = inw(PCI_CONFIG_DATA + (reg & 2));
-		break;
-	case 4:
-		*val = inl(PCI_CONFIG_DATA);
-		break;
-	}
-	return PCIBIOS_SUCCESSFUL;
-}
-
-static struct pci_ops pci_virtio_guest_ops = {
-	.read  = pci_virtio_guest_read_config,
-	.write = pci_virtio_guest_write_config,
-};
-
-static struct resource pci_virtio_guest_mem_resource = {
-	.name = "Virtio MEM",
-	.flags = IORESOURCE_MEM,
-	.start	= 0x10000000,
-	.end	= 0x1dffffff
-};
-
-static struct resource pci_virtio_guest_io_resource = {
-	.name = "Virtio IO",
-	.flags = IORESOURCE_IO,
-	.start	= 0,
-	.end	= 0xffff
-};
-
-static struct pci_controller pci_virtio_guest_controller = {
-	.pci_ops = &pci_virtio_guest_ops,
-	.mem_resource = &pci_virtio_guest_mem_resource,
-	.io_resource = &pci_virtio_guest_io_resource,
-};
-
-static int __init pci_virtio_guest_setup(void)
-{
-	pr_err("pci_virtio_guest_setup\n");
-
-	/* Virtio comes pre-assigned */
-	pci_set_flags(PCI_PROBE_ONLY);
-
-	pci_virtio_guest_controller.io_map_base = mips_io_port_base;
-	register_pci_controller(&pci_virtio_guest_controller);
-	return 0;
-}
-arch_initcall(pci_virtio_guest_setup);
-- 
2.27.0

