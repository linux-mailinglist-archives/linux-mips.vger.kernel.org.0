Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E03E16CDB
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2019 23:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728523AbfEGVJc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 May 2019 17:09:32 -0400
Received: from mx2.suse.de ([195.135.220.15]:59658 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728490AbfEGVJb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 7 May 2019 17:09:31 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 31D09AE4E;
        Tue,  7 May 2019 21:09:29 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] MIPS: SGI-IP27: use generic PCI driver
Date:   Tue,  7 May 2019 23:09:14 +0200
Message-Id: <20190507210917.4691-3-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.13.7
In-Reply-To: <20190507210917.4691-1-tbogendoerfer@suse.de>
References: <20190507210917.4691-1-tbogendoerfer@suse.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Converted bridge code to a platform driver using the PCI generic driver
framework and use adding platform devices during xtalk scan. This allows
easier sharing bridge driver for other SGI platforms like IP30 (Octane) and
IP35 (Origin 3k, Fuel, Tezro).

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/Kconfig                          |   5 +
 arch/mips/include/asm/mach-ip27/topology.h |  11 +-
 arch/mips/include/asm/pci/bridge.h         |  11 +-
 arch/mips/include/asm/xtalk/xtalk.h        |   9 -
 arch/mips/pci/Makefile                     |   2 +-
 arch/mips/pci/ops-bridge.c                 | 302 -------------------
 arch/mips/pci/pci-ip27.c                   | 191 ------------
 arch/mips/pci/pci-xtalk-bridge.c           | 452 +++++++++++++++++++++++++++++
 arch/mips/sgi-ip27/ip27-init.c             |   2 +
 arch/mips/sgi-ip27/ip27-xtalk.c            |  61 +++-
 include/linux/platform_data/xtalk-bridge.h |  22 ++
 11 files changed, 535 insertions(+), 533 deletions(-)
 delete mode 100644 arch/mips/pci/ops-bridge.c
 delete mode 100644 arch/mips/pci/pci-ip27.c
 create mode 100644 arch/mips/pci/pci-xtalk-bridge.c
 create mode 100644 include/linux/platform_data/xtalk-bridge.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 4a5f5b0ee9a9..dfb5d4151ba1 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -677,6 +677,8 @@ config SGI_IP27
 	select HAVE_PCI
 	select IRQ_MIPS_CPU
 	select NR_CPUS_DEFAULT_64
+	select PCI_DRIVERS_GENERIC
+	select PCI_XTALK_BRIDGE
 	select SYS_HAS_CPU_R10000
 	select SYS_SUPPORTS_64BIT_KERNEL
 	select SYS_SUPPORTS_BIG_ENDIAN
@@ -1250,6 +1252,9 @@ config IRQ_GT641XX
 config PCI_GT64XXX_PCI0
 	bool
 
+config PCI_XTALK_BRIDGE
+	bool
+
 config NO_EXCEPT_FILL
 	bool
 
diff --git a/arch/mips/include/asm/mach-ip27/topology.h b/arch/mips/include/asm/mach-ip27/topology.h
index 42ea1313626c..965f0793a5f9 100644
--- a/arch/mips/include/asm/mach-ip27/topology.h
+++ b/arch/mips/include/asm/mach-ip27/topology.h
@@ -7,18 +7,9 @@
 #include <asm/mmzone.h>
 
 struct cpuinfo_ip27 {
-//	cpuid_t		p_cpuid;	/* PROM assigned cpuid */
 	cnodeid_t	p_nodeid;	/* my node ID in compact-id-space */
 	nasid_t		p_nasid;	/* my node ID in numa-as-id-space */
 	unsigned char	p_slice;	/* Physical position on node board */
-#if 0
-	unsigned long		loops_per_sec;
-	unsigned long		ipi_count;
-	unsigned long		irq_attempt[NR_IRQS];
-	unsigned long		smp_local_irq_count;
-	unsigned long		prof_multiplier;
-	unsigned long		prof_counter;
-#endif
 };
 
 extern struct cpuinfo_ip27 sn_cpu_info[NR_CPUS];
@@ -30,7 +21,7 @@ extern struct cpuinfo_ip27 sn_cpu_info[NR_CPUS];
 struct pci_bus;
 extern int pcibus_to_node(struct pci_bus *);
 
-#define cpumask_of_pcibus(bus)	(cpu_online_mask)
+#define cpumask_of_pcibus(bus)	(cpumask_of_node(pcibus_to_node(bus)))
 
 extern unsigned char __node_distances[MAX_COMPACT_NODES][MAX_COMPACT_NODES];
 
diff --git a/arch/mips/include/asm/pci/bridge.h b/arch/mips/include/asm/pci/bridge.h
index 23574c27eb40..d42b27c97c23 100644
--- a/arch/mips/include/asm/pci/bridge.h
+++ b/arch/mips/include/asm/pci/bridge.h
@@ -801,15 +801,12 @@ struct bridge_err_cmdword {
 #define PCI64_ATTR_RMF_SHFT	48
 
 struct bridge_controller {
-	struct pci_controller	pc;
-	struct resource		mem;
-	struct resource		io;
 	struct resource		busn;
 	struct bridge_regs	*base;
-	nasid_t			nasid;
-	unsigned int		widget_id;
-	u64			baddr;
+	unsigned long		baddr;
+	unsigned long		intr_addr;
 	unsigned int		pci_int[8];
+	nasid_t			nasid;
 };
 
 #define BRIDGE_CONTROLLER(bus) \
@@ -824,6 +821,4 @@ struct bridge_controller {
 
 extern int request_bridge_irq(struct bridge_controller *bc, int pin);
 
-extern struct pci_ops bridge_pci_ops;
-
 #endif /* _ASM_PCI_BRIDGE_H */
diff --git a/arch/mips/include/asm/xtalk/xtalk.h b/arch/mips/include/asm/xtalk/xtalk.h
index 26d2ed1fa917..680e7efebbaf 100644
--- a/arch/mips/include/asm/xtalk/xtalk.h
+++ b/arch/mips/include/asm/xtalk/xtalk.h
@@ -47,15 +47,6 @@ typedef struct xtalk_piomap_s *xtalk_piomap_t;
 #define XIO_PORT(x)	((xwidgetnum_t)(((x)&XIO_PORT_BITS) >> XIO_PORT_SHIFT))
 #define XIO_PACK(p, o)	((((uint64_t)(p))<<XIO_PORT_SHIFT) | ((o)&XIO_ADDR_BITS))
 
-#ifdef CONFIG_PCI
-extern int bridge_probe(nasid_t nasid, int widget, int masterwid);
-#else
-static inline int bridge_probe(nasid_t nasid, int widget, int masterwid)
-{
-	return 0;
-}
-#endif
-
 #endif /* !__ASSEMBLY__ */
 
 #endif /* _ASM_XTALK_XTALK_H */
diff --git a/arch/mips/pci/Makefile b/arch/mips/pci/Makefile
index c4f976593061..477a4bf402fd 100644
--- a/arch/mips/pci/Makefile
+++ b/arch/mips/pci/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_PCI_AR2315)	+= pci-ar2315.o
 obj-$(CONFIG_SOC_AR71XX)	+= pci-ar71xx.o
 obj-$(CONFIG_PCI_AR724X)	+= pci-ar724x.o
 obj-$(CONFIG_MIPS_PCI_VIRTIO)	+= pci-virtio-guest.o
+obj-$(CONFIG_PCI_XTALK_BRIDGE)	+= pci-xtalk-bridge.o
 #
 # These are still pretty much in the old state, watch, go blind.
 #
@@ -39,7 +40,6 @@ obj-$(CONFIG_MIPS_MALTA)	+= fixup-malta.o pci-malta.o
 obj-$(CONFIG_PMC_MSP7120_GW)	+= fixup-pmcmsp.o ops-pmcmsp.o
 obj-$(CONFIG_PMC_MSP7120_EVAL)	+= fixup-pmcmsp.o ops-pmcmsp.o
 obj-$(CONFIG_PMC_MSP7120_FPGA)	+= fixup-pmcmsp.o ops-pmcmsp.o
-obj-$(CONFIG_SGI_IP27)		+= ops-bridge.o pci-ip27.o
 obj-$(CONFIG_SGI_IP32)		+= fixup-ip32.o ops-mace.o pci-ip32.o
 obj-$(CONFIG_SIBYTE_SB1250)	+= fixup-sb1250.o pci-sb1250.o
 obj-$(CONFIG_SIBYTE_BCM112X)	+= fixup-sb1250.o pci-sb1250.o
diff --git a/arch/mips/pci/ops-bridge.c b/arch/mips/pci/ops-bridge.c
deleted file mode 100644
index df95b0da08f2..000000000000
--- a/arch/mips/pci/ops-bridge.c
+++ /dev/null
@@ -1,302 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 1999, 2000, 04, 06 Ralf Baechle (ralf@linux-mips.org)
- * Copyright (C) 1999, 2000 Silicon Graphics, Inc.
- */
-#include <linux/pci.h>
-#include <asm/paccess.h>
-#include <asm/pci/bridge.h>
-#include <asm/sn/arch.h>
-#include <asm/sn/intr.h>
-#include <asm/sn/sn0/hub.h>
-
-/*
- * Most of the IOC3 PCI config register aren't present
- * we emulate what is needed for a normal PCI enumeration
- */
-static u32 emulate_ioc3_cfg(int where, int size)
-{
-	if (size == 1 && where == 0x3d)
-		return 0x01;
-	else if (size == 2 && where == 0x3c)
-		return 0x0100;
-	else if (size == 4 && where == 0x3c)
-		return 0x00000100;
-
-	return 0;
-}
-
-/*
- * The Bridge ASIC supports both type 0 and type 1 access.  Type 1 is
- * not really documented, so right now I can't write code which uses it.
- * Therefore we use type 0 accesses for now even though they won't work
- * correctly for PCI-to-PCI bridges.
- *
- * The function is complicated by the ultimate brokenness of the IOC3 chip
- * which is used in SGI systems.  The IOC3 can only handle 32-bit PCI
- * accesses and does only decode parts of it's address space.
- */
-
-static int pci_conf0_read_config(struct pci_bus *bus, unsigned int devfn,
-				 int where, int size, u32 * value)
-{
-	struct bridge_controller *bc = BRIDGE_CONTROLLER(bus);
-	struct bridge_regs *bridge = bc->base;
-	int slot = PCI_SLOT(devfn);
-	int fn = PCI_FUNC(devfn);
-	volatile void *addr;
-	u32 cf, shift, mask;
-	int res;
-
-	addr = &bridge->b_type0_cfg_dev[slot].f[fn].c[PCI_VENDOR_ID];
-	if (get_dbe(cf, (u32 *) addr))
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
-	/*
-	 * IOC3 is broken beyond belief ...  Don't even give the
-	 * generic PCI code a chance to look at it for real ...
-	 */
-	if (cf == (PCI_VENDOR_ID_SGI | (PCI_DEVICE_ID_SGI_IOC3 << 16)))
-		goto is_ioc3;
-
-	addr = &bridge->b_type0_cfg_dev[slot].f[fn].c[where ^ (4 - size)];
-
-	if (size == 1)
-		res = get_dbe(*value, (u8 *) addr);
-	else if (size == 2)
-		res = get_dbe(*value, (u16 *) addr);
-	else
-		res = get_dbe(*value, (u32 *) addr);
-
-	return res ? PCIBIOS_DEVICE_NOT_FOUND : PCIBIOS_SUCCESSFUL;
-
-is_ioc3:
-
-	/*
-	 * IOC3 special handling
-	 */
-	if ((where >= 0x14 && where < 0x40) || (where >= 0x48)) {
-		*value = emulate_ioc3_cfg(where, size);
-		return PCIBIOS_SUCCESSFUL;
-	}
-
-	addr = &bridge->b_type0_cfg_dev[slot].f[fn].l[where >> 2];
-
-	if (get_dbe(cf, (u32 *) addr))
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
-	shift = ((where & 3) << 3);
-	mask = (0xffffffffU >> ((4 - size) << 3));
-	*value = (cf >> shift) & mask;
-
-	return PCIBIOS_SUCCESSFUL;
-}
-
-static int pci_conf1_read_config(struct pci_bus *bus, unsigned int devfn,
-				 int where, int size, u32 * value)
-{
-	struct bridge_controller *bc = BRIDGE_CONTROLLER(bus);
-	struct bridge_regs *bridge = bc->base;
-	int busno = bus->number;
-	int slot = PCI_SLOT(devfn);
-	int fn = PCI_FUNC(devfn);
-	volatile void *addr;
-	u32 cf, shift, mask;
-	int res;
-
-	bridge_write(bc, b_pci_cfg, (busno << 16) | (slot << 11));
-	addr = &bridge->b_type1_cfg.c[(fn << 8) | PCI_VENDOR_ID];
-	if (get_dbe(cf, (u32 *) addr))
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
-	/*
-	 * IOC3 is broken beyond belief ...  Don't even give the
-	 * generic PCI code a chance to look at it for real ...
-	 */
-	if (cf == (PCI_VENDOR_ID_SGI | (PCI_DEVICE_ID_SGI_IOC3 << 16)))
-		goto is_ioc3;
-
-	bridge_write(bc, b_pci_cfg, (busno << 16) | (slot << 11));
-	addr = &bridge->b_type1_cfg.c[(fn << 8) | (where ^ (4 - size))];
-
-	if (size == 1)
-		res = get_dbe(*value, (u8 *) addr);
-	else if (size == 2)
-		res = get_dbe(*value, (u16 *) addr);
-	else
-		res = get_dbe(*value, (u32 *) addr);
-
-	return res ? PCIBIOS_DEVICE_NOT_FOUND : PCIBIOS_SUCCESSFUL;
-
-is_ioc3:
-
-	/*
-	 * IOC3 special handling
-	 */
-	if ((where >= 0x14 && where < 0x40) || (where >= 0x48)) {
-		*value = emulate_ioc3_cfg(where, size);
-		return PCIBIOS_SUCCESSFUL;
-	}
-
-	bridge_write(bc, b_pci_cfg, (busno << 16) | (slot << 11));
-	addr = &bridge->b_type1_cfg.c[(fn << 8) | where];
-
-	if (get_dbe(cf, (u32 *) addr))
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
-	shift = ((where & 3) << 3);
-	mask = (0xffffffffU >> ((4 - size) << 3));
-	*value = (cf >> shift) & mask;
-
-	return PCIBIOS_SUCCESSFUL;
-}
-
-static int pci_read_config(struct pci_bus *bus, unsigned int devfn,
-			   int where, int size, u32 * value)
-{
-	if (!pci_is_root_bus(bus))
-		return pci_conf1_read_config(bus, devfn, where, size, value);
-
-	return pci_conf0_read_config(bus, devfn, where, size, value);
-}
-
-static int pci_conf0_write_config(struct pci_bus *bus, unsigned int devfn,
-				  int where, int size, u32 value)
-{
-	struct bridge_controller *bc = BRIDGE_CONTROLLER(bus);
-	struct bridge_regs *bridge = bc->base;
-	int slot = PCI_SLOT(devfn);
-	int fn = PCI_FUNC(devfn);
-	volatile void *addr;
-	u32 cf, shift, mask, smask;
-	int res;
-
-	addr = &bridge->b_type0_cfg_dev[slot].f[fn].c[PCI_VENDOR_ID];
-	if (get_dbe(cf, (u32 *) addr))
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
-	/*
-	 * IOC3 is broken beyond belief ...  Don't even give the
-	 * generic PCI code a chance to look at it for real ...
-	 */
-	if (cf == (PCI_VENDOR_ID_SGI | (PCI_DEVICE_ID_SGI_IOC3 << 16)))
-		goto is_ioc3;
-
-	addr = &bridge->b_type0_cfg_dev[slot].f[fn].c[where ^ (4 - size)];
-
-	if (size == 1) {
-		res = put_dbe(value, (u8 *) addr);
-	} else if (size == 2) {
-		res = put_dbe(value, (u16 *) addr);
-	} else {
-		res = put_dbe(value, (u32 *) addr);
-	}
-
-	if (res)
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
-	return PCIBIOS_SUCCESSFUL;
-
-is_ioc3:
-
-	/*
-	 * IOC3 special handling
-	 */
-	if ((where >= 0x14 && where < 0x40) || (where >= 0x48))
-		return PCIBIOS_SUCCESSFUL;
-
-	addr = &bridge->b_type0_cfg_dev[slot].f[fn].l[where >> 2];
-
-	if (get_dbe(cf, (u32 *) addr))
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
-	shift = ((where & 3) << 3);
-	mask = (0xffffffffU >> ((4 - size) << 3));
-	smask = mask << shift;
-
-	cf = (cf & ~smask) | ((value & mask) << shift);
-	if (put_dbe(cf, (u32 *) addr))
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
-	return PCIBIOS_SUCCESSFUL;
-}
-
-static int pci_conf1_write_config(struct pci_bus *bus, unsigned int devfn,
-				  int where, int size, u32 value)
-{
-	struct bridge_controller *bc = BRIDGE_CONTROLLER(bus);
-	struct bridge_regs *bridge = bc->base;
-	int slot = PCI_SLOT(devfn);
-	int fn = PCI_FUNC(devfn);
-	int busno = bus->number;
-	volatile void *addr;
-	u32 cf, shift, mask, smask;
-	int res;
-
-	bridge_write(bc, b_pci_cfg, (busno << 16) | (slot << 11));
-	addr = &bridge->b_type1_cfg.c[(fn << 8) | PCI_VENDOR_ID];
-	if (get_dbe(cf, (u32 *) addr))
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
-	/*
-	 * IOC3 is broken beyond belief ...  Don't even give the
-	 * generic PCI code a chance to look at it for real ...
-	 */
-	if (cf == (PCI_VENDOR_ID_SGI | (PCI_DEVICE_ID_SGI_IOC3 << 16)))
-		goto is_ioc3;
-
-	addr = &bridge->b_type1_cfg.c[(fn << 8) | (where ^ (4 - size))];
-
-	if (size == 1) {
-		res = put_dbe(value, (u8 *) addr);
-	} else if (size == 2) {
-		res = put_dbe(value, (u16 *) addr);
-	} else {
-		res = put_dbe(value, (u32 *) addr);
-	}
-
-	if (res)
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
-	return PCIBIOS_SUCCESSFUL;
-
-is_ioc3:
-
-	/*
-	 * IOC3 special handling
-	 */
-	if ((where >= 0x14 && where < 0x40) || (where >= 0x48))
-		return PCIBIOS_SUCCESSFUL;
-
-	addr = &bridge->b_type0_cfg_dev[slot].f[fn].l[where >> 2];
-
-	if (get_dbe(cf, (u32 *) addr))
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
-	shift = ((where & 3) << 3);
-	mask = (0xffffffffU >> ((4 - size) << 3));
-	smask = mask << shift;
-
-	cf = (cf & ~smask) | ((value & mask) << shift);
-	if (put_dbe(cf, (u32 *) addr))
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
-	return PCIBIOS_SUCCESSFUL;
-}
-
-static int pci_write_config(struct pci_bus *bus, unsigned int devfn,
-	int where, int size, u32 value)
-{
-	if (!pci_is_root_bus(bus))
-		return pci_conf1_write_config(bus, devfn, where, size, value);
-
-	return pci_conf0_write_config(bus, devfn, where, size, value);
-}
-
-struct pci_ops bridge_pci_ops = {
-	.read	= pci_read_config,
-	.write	= pci_write_config,
-};
diff --git a/arch/mips/pci/pci-ip27.c b/arch/mips/pci/pci-ip27.c
deleted file mode 100644
index 0b0f9c4eaf04..000000000000
--- a/arch/mips/pci/pci-ip27.c
+++ /dev/null
@@ -1,191 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2003 Christoph Hellwig (hch@lst.de)
- * Copyright (C) 1999, 2000, 04 Ralf Baechle (ralf@linux-mips.org)
- * Copyright (C) 1999, 2000 Silicon Graphics, Inc.
- */
-#include <linux/kernel.h>
-#include <linux/export.h>
-#include <linux/pci.h>
-#include <linux/smp.h>
-#include <linux/dma-direct.h>
-#include <asm/sn/arch.h>
-#include <asm/pci/bridge.h>
-#include <asm/paccess.h>
-#include <asm/sn/intr.h>
-#include <asm/sn/sn0/hub.h>
-
-/*
- * Max #PCI busses we can handle; ie, max #PCI bridges.
- */
-#define MAX_PCI_BUSSES		40
-
-/*
- * XXX: No kmalloc available when we do our crosstalk scan,
- *	we should try to move it later in the boot process.
- */
-static struct bridge_controller bridges[MAX_PCI_BUSSES];
-
-extern struct pci_ops bridge_pci_ops;
-
-int bridge_probe(nasid_t nasid, int widget_id, int masterwid)
-{
-	unsigned long offset = NODE_OFFSET(nasid);
-	struct bridge_controller *bc;
-	static int num_bridges = 0;
-	int slot;
-
-	pci_set_flags(PCI_PROBE_ONLY);
-
-	printk("a bridge\n");
-
-	/* XXX: kludge alert.. */
-	if (!num_bridges)
-		ioport_resource.end = ~0UL;
-
-	bc = &bridges[num_bridges];
-
-	bc->pc.pci_ops		= &bridge_pci_ops;
-	bc->pc.mem_resource	= &bc->mem;
-	bc->pc.io_resource	= &bc->io;
-
-	bc->pc.index		= num_bridges;
-
-	bc->mem.name		= "Bridge PCI MEM";
-	bc->pc.mem_offset	= offset;
-	bc->mem.start		= 0;
-	bc->mem.end		= ~0UL;
-	bc->mem.flags		= IORESOURCE_MEM;
-
-	bc->io.name		= "Bridge IO MEM";
-	bc->pc.io_offset	= offset;
-	bc->io.start		= 0UL;
-	bc->io.end		= ~0UL;
-	bc->io.flags		= IORESOURCE_IO;
-
-	bc->widget_id = widget_id;
-	bc->nasid = nasid;
-
-	bc->baddr = (u64)masterwid << 60 | PCI64_ATTR_BAR;
-
-	/*
-	 * point to this bridge
-	 */
-	bc->base = (struct bridge_regs *)RAW_NODE_SWIN_BASE(nasid, widget_id);
-
-	/*
-	 * Clear all pending interrupts.
-	 */
-	bridge_write(bc, b_int_rst_stat, BRIDGE_IRR_ALL_CLR);
-
-	/*
-	 * Until otherwise set up, assume all interrupts are from slot 0
-	 */
-	bridge_write(bc, b_int_device, 0x0);
-
-	/*
-	 * swap pio's to pci mem and io space (big windows)
-	 */
-	bridge_set(bc, b_wid_control, BRIDGE_CTRL_IO_SWAP |
-				      BRIDGE_CTRL_MEM_SWAP);
-#ifdef CONFIG_PAGE_SIZE_4KB
-	bridge_clr(bc, b_wid_control, BRIDGE_CTRL_PAGE_SIZE);
-#else /* 16kB or larger */
-	bridge_set(bc, b_wid_control, BRIDGE_CTRL_PAGE_SIZE);
-#endif
-
-	/*
-	 * Hmm...  IRIX sets additional bits in the address which
-	 * are documented as reserved in the bridge docs.
-	 */
-	bridge_write(bc, b_wid_int_upper, 0x8000 | (masterwid << 16));
-	bridge_write(bc, b_wid_int_lower, 0x01800090); /* PI_INT_PEND_MOD off*/
-	bridge_write(bc, b_dir_map, (masterwid << 20));	/* DMA */
-	bridge_write(bc, b_int_enable, 0);
-
-	for (slot = 0; slot < 8; slot ++) {
-		bridge_set(bc, b_device[slot].reg, BRIDGE_DEV_SWAP_DIR);
-		bc->pci_int[slot] = -1;
-	}
-	bridge_read(bc, b_wid_tflush);	  /* wait until Bridge PIO complete */
-
-	register_pci_controller(&bc->pc);
-
-	num_bridges++;
-
-	return 0;
-}
-
-/*
- * All observed requests have pin == 1. We could have a global here, that
- * gets incremented and returned every time - unfortunately, pci_map_irq
- * may be called on the same device over and over, and need to return the
- * same value. On O2000, pin can be 0 or 1, and PCI slots can be [0..7].
- *
- * A given PCI device, in general, should be able to intr any of the cpus
- * on any one of the hubs connected to its xbow.
- */
-int pcibios_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
-{
-	return 0;
-}
-
-static inline struct pci_dev *bridge_root_dev(struct pci_dev *dev)
-{
-	while (dev->bus->parent) {
-		/* Move up the chain of bridges. */
-		dev = dev->bus->self;
-	}
-
-	return dev;
-}
-
-/* Do platform specific device initialization at pci_enable_device() time */
-int pcibios_plat_dev_init(struct pci_dev *dev)
-{
-	struct bridge_controller *bc = BRIDGE_CONTROLLER(dev->bus);
-	struct pci_dev *rdev = bridge_root_dev(dev);
-	int slot = PCI_SLOT(rdev->devfn);
-	int irq;
-
-	irq = bc->pci_int[slot];
-	if (irq == -1) {
-		irq = request_bridge_irq(bc, slot);
-		if (irq < 0)
-			return irq;
-
-		bc->pci_int[slot] = irq;
-	}
-	dev->irq = irq;
-
-	return 0;
-}
-
-/*
- * Device might live on a subordinate PCI bus.	XXX Walk up the chain of buses
- * to find the slot number in sense of the bridge device register.
- * XXX This also means multiple devices might rely on conflicting bridge
- * settings.
- */
-
-static inline void pci_disable_swapping(struct pci_dev *dev)
-{
-	struct bridge_controller *bc = BRIDGE_CONTROLLER(dev->bus);
-	struct bridge_regs *bridge = bc->base;
-	int slot = PCI_SLOT(dev->devfn);
-
-	/* Turn off byte swapping */
-	bridge->b_device[slot].reg &= ~BRIDGE_DEV_SWAP_DIR;
-	bridge->b_widget.w_tflush;	/* Flush */
-}
-
-static void pci_fixup_ioc3(struct pci_dev *d)
-{
-	pci_disable_swapping(d);
-}
-
-DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_SGI, PCI_DEVICE_ID_SGI_IOC3,
-	pci_fixup_ioc3);
diff --git a/arch/mips/pci/pci-xtalk-bridge.c b/arch/mips/pci/pci-xtalk-bridge.c
new file mode 100644
index 000000000000..8f481984ab6e
--- /dev/null
+++ b/arch/mips/pci/pci-xtalk-bridge.c
@@ -0,0 +1,452 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2003 Christoph Hellwig (hch@lst.de)
+ * Copyright (C) 1999, 2000, 04 Ralf Baechle (ralf@linux-mips.org)
+ * Copyright (C) 1999, 2000 Silicon Graphics, Inc.
+ */
+#include <linux/kernel.h>
+#include <linux/export.h>
+#include <linux/pci.h>
+#include <linux/smp.h>
+#include <linux/dma-direct.h>
+#include <linux/platform_device.h>
+#include <linux/platform_data/xtalk-bridge.h>
+
+#include <asm/pci/bridge.h>
+#include <asm/paccess.h>
+#include <asm/sn/intr.h>
+
+/*
+ * Most of the IOC3 PCI config register aren't present
+ * we emulate what is needed for a normal PCI enumeration
+ */
+static u32 emulate_ioc3_cfg(int where, int size)
+{
+	if (size == 1 && where == 0x3d)
+		return 0x01;
+	else if (size == 2 && where == 0x3c)
+		return 0x0100;
+	else if (size == 4 && where == 0x3c)
+		return 0x00000100;
+
+	return 0;
+}
+
+static void bridge_disable_swapping(struct pci_dev *dev)
+{
+	struct bridge_controller *bc = BRIDGE_CONTROLLER(dev->bus);
+	int slot = PCI_SLOT(dev->devfn);
+
+	/* Turn off byte swapping */
+	bridge_clr(bc, b_device[slot].reg, BRIDGE_DEV_SWAP_DIR);
+	bridge_read(bc, b_widget.w_tflush);	/* Flush */
+}
+
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_SGI, PCI_DEVICE_ID_SGI_IOC3,
+	bridge_disable_swapping);
+
+
+/*
+ * The Bridge ASIC supports both type 0 and type 1 access.  Type 1 is
+ * not really documented, so right now I can't write code which uses it.
+ * Therefore we use type 0 accesses for now even though they won't work
+ * correctly for PCI-to-PCI bridges.
+ *
+ * The function is complicated by the ultimate brokenness of the IOC3 chip
+ * which is used in SGI systems.  The IOC3 can only handle 32-bit PCI
+ * accesses and does only decode parts of it's address space.
+ */
+static int pci_conf0_read_config(struct pci_bus *bus, unsigned int devfn,
+				 int where, int size, u32 *value)
+{
+	struct bridge_controller *bc = BRIDGE_CONTROLLER(bus);
+	struct bridge_regs *bridge = bc->base;
+	int slot = PCI_SLOT(devfn);
+	int fn = PCI_FUNC(devfn);
+	void *addr;
+	u32 cf, shift, mask;
+	int res;
+
+	addr = &bridge->b_type0_cfg_dev[slot].f[fn].c[PCI_VENDOR_ID];
+	if (get_dbe(cf, (u32 *)addr))
+		return PCIBIOS_DEVICE_NOT_FOUND;
+
+	/*
+	 * IOC3 is broken beyond belief ...  Don't even give the
+	 * generic PCI code a chance to look at it for real ...
+	 */
+	if (cf == (PCI_VENDOR_ID_SGI | (PCI_DEVICE_ID_SGI_IOC3 << 16)))
+		goto is_ioc3;
+
+	addr = &bridge->b_type0_cfg_dev[slot].f[fn].c[where ^ (4 - size)];
+
+	if (size == 1)
+		res = get_dbe(*value, (u8 *)addr);
+	else if (size == 2)
+		res = get_dbe(*value, (u16 *)addr);
+	else
+		res = get_dbe(*value, (u32 *)addr);
+
+	return res ? PCIBIOS_DEVICE_NOT_FOUND : PCIBIOS_SUCCESSFUL;
+
+is_ioc3:
+
+	/*
+	 * IOC3 special handling
+	 */
+	if ((where >= 0x14 && where < 0x40) || (where >= 0x48)) {
+		*value = emulate_ioc3_cfg(where, size);
+		return PCIBIOS_SUCCESSFUL;
+	}
+
+	addr = &bridge->b_type0_cfg_dev[slot].f[fn].l[where >> 2];
+	if (get_dbe(cf, (u32 *)addr))
+		return PCIBIOS_DEVICE_NOT_FOUND;
+
+	shift = ((where & 3) << 3);
+	mask = (0xffffffffU >> ((4 - size) << 3));
+	*value = (cf >> shift) & mask;
+
+	return PCIBIOS_SUCCESSFUL;
+}
+
+static int pci_conf1_read_config(struct pci_bus *bus, unsigned int devfn,
+				 int where, int size, u32 *value)
+{
+	struct bridge_controller *bc = BRIDGE_CONTROLLER(bus);
+	struct bridge_regs *bridge = bc->base;
+	int busno = bus->number;
+	int slot = PCI_SLOT(devfn);
+	int fn = PCI_FUNC(devfn);
+	void *addr;
+	u32 cf, shift, mask;
+	int res;
+
+	bridge_write(bc, b_pci_cfg, (busno << 16) | (slot << 11));
+	addr = &bridge->b_type1_cfg.c[(fn << 8) | PCI_VENDOR_ID];
+	if (get_dbe(cf, (u32 *)addr))
+		return PCIBIOS_DEVICE_NOT_FOUND;
+
+	/*
+	 * IOC3 is broken beyond belief ...  Don't even give the
+	 * generic PCI code a chance to look at it for real ...
+	 */
+	if (cf == (PCI_VENDOR_ID_SGI | (PCI_DEVICE_ID_SGI_IOC3 << 16)))
+		goto is_ioc3;
+
+	addr = &bridge->b_type1_cfg.c[(fn << 8) | (where ^ (4 - size))];
+
+	if (size == 1)
+		res = get_dbe(*value, (u8 *)addr);
+	else if (size == 2)
+		res = get_dbe(*value, (u16 *)addr);
+	else
+		res = get_dbe(*value, (u32 *)addr);
+
+	return res ? PCIBIOS_DEVICE_NOT_FOUND : PCIBIOS_SUCCESSFUL;
+
+is_ioc3:
+
+	/*
+	 * IOC3 special handling
+	 */
+	if ((where >= 0x14 && where < 0x40) || (where >= 0x48)) {
+		*value = emulate_ioc3_cfg(where, size);
+		return PCIBIOS_SUCCESSFUL;
+	}
+
+	addr = &bridge->b_type1_cfg.c[(fn << 8) | where];
+	if (get_dbe(cf, (u32 *)addr))
+		return PCIBIOS_DEVICE_NOT_FOUND;
+
+	shift = ((where & 3) << 3);
+	mask = (0xffffffffU >> ((4 - size) << 3));
+	*value = (cf >> shift) & mask;
+
+	return PCIBIOS_SUCCESSFUL;
+}
+
+static int pci_read_config(struct pci_bus *bus, unsigned int devfn,
+			   int where, int size, u32 *value)
+{
+	if (!pci_is_root_bus(bus))
+		return pci_conf1_read_config(bus, devfn, where, size, value);
+
+	return pci_conf0_read_config(bus, devfn, where, size, value);
+}
+
+static int pci_conf0_write_config(struct pci_bus *bus, unsigned int devfn,
+				  int where, int size, u32 value)
+{
+	struct bridge_controller *bc = BRIDGE_CONTROLLER(bus);
+	struct bridge_regs *bridge = bc->base;
+	int slot = PCI_SLOT(devfn);
+	int fn = PCI_FUNC(devfn);
+	void *addr;
+	u32 cf, shift, mask, smask;
+	int res;
+
+	addr = &bridge->b_type0_cfg_dev[slot].f[fn].c[PCI_VENDOR_ID];
+	if (get_dbe(cf, (u32 *)addr))
+		return PCIBIOS_DEVICE_NOT_FOUND;
+
+	/*
+	 * IOC3 is broken beyond belief ...  Don't even give the
+	 * generic PCI code a chance to look at it for real ...
+	 */
+	if (cf == (PCI_VENDOR_ID_SGI | (PCI_DEVICE_ID_SGI_IOC3 << 16)))
+		goto is_ioc3;
+
+	addr = &bridge->b_type0_cfg_dev[slot].f[fn].c[where ^ (4 - size)];
+
+	if (size == 1)
+		res = put_dbe(value, (u8 *)addr);
+	else if (size == 2)
+		res = put_dbe(value, (u16 *)addr);
+	else
+		res = put_dbe(value, (u32 *)addr);
+
+	if (res)
+		return PCIBIOS_DEVICE_NOT_FOUND;
+
+	return PCIBIOS_SUCCESSFUL;
+
+is_ioc3:
+
+	/*
+	 * IOC3 special handling
+	 */
+	if ((where >= 0x14 && where < 0x40) || (where >= 0x48))
+		return PCIBIOS_SUCCESSFUL;
+
+	addr = &bridge->b_type0_cfg_dev[slot].f[fn].l[where >> 2];
+
+	if (get_dbe(cf, (u32 *)addr))
+		return PCIBIOS_DEVICE_NOT_FOUND;
+
+	shift = ((where & 3) << 3);
+	mask = (0xffffffffU >> ((4 - size) << 3));
+	smask = mask << shift;
+
+	cf = (cf & ~smask) | ((value & mask) << shift);
+	if (put_dbe(cf, (u32 *)addr))
+		return PCIBIOS_DEVICE_NOT_FOUND;
+
+	return PCIBIOS_SUCCESSFUL;
+}
+
+static int pci_conf1_write_config(struct pci_bus *bus, unsigned int devfn,
+				  int where, int size, u32 value)
+{
+	struct bridge_controller *bc = BRIDGE_CONTROLLER(bus);
+	struct bridge_regs *bridge = bc->base;
+	int slot = PCI_SLOT(devfn);
+	int fn = PCI_FUNC(devfn);
+	int busno = bus->number;
+	void *addr;
+	u32 cf, shift, mask, smask;
+	int res;
+
+	bridge_write(bc, b_pci_cfg, (busno << 16) | (slot << 11));
+	addr = &bridge->b_type1_cfg.c[(fn << 8) | PCI_VENDOR_ID];
+	if (get_dbe(cf, (u32 *)addr))
+		return PCIBIOS_DEVICE_NOT_FOUND;
+
+	/*
+	 * IOC3 is broken beyond belief ...  Don't even give the
+	 * generic PCI code a chance to look at it for real ...
+	 */
+	if (cf == (PCI_VENDOR_ID_SGI | (PCI_DEVICE_ID_SGI_IOC3 << 16)))
+		goto is_ioc3;
+
+	addr = &bridge->b_type1_cfg.c[(fn << 8) | (where ^ (4 - size))];
+
+	if (size == 1)
+		res = put_dbe(value, (u8 *)addr);
+	else if (size == 2)
+		res = put_dbe(value, (u16 *)addr);
+	else
+		res = put_dbe(value, (u32 *)addr);
+
+	if (res)
+		return PCIBIOS_DEVICE_NOT_FOUND;
+
+	return PCIBIOS_SUCCESSFUL;
+
+is_ioc3:
+
+	/*
+	 * IOC3 special handling
+	 */
+	if ((where >= 0x14 && where < 0x40) || (where >= 0x48))
+		return PCIBIOS_SUCCESSFUL;
+
+	addr = &bridge->b_type0_cfg_dev[slot].f[fn].l[where >> 2];
+	if (get_dbe(cf, (u32 *)addr))
+		return PCIBIOS_DEVICE_NOT_FOUND;
+
+	shift = ((where & 3) << 3);
+	mask = (0xffffffffU >> ((4 - size) << 3));
+	smask = mask << shift;
+
+	cf = (cf & ~smask) | ((value & mask) << shift);
+	if (put_dbe(cf, (u32 *)addr))
+		return PCIBIOS_DEVICE_NOT_FOUND;
+
+	return PCIBIOS_SUCCESSFUL;
+}
+
+static int pci_write_config(struct pci_bus *bus, unsigned int devfn,
+	int where, int size, u32 value)
+{
+	if (!pci_is_root_bus(bus))
+		return pci_conf1_write_config(bus, devfn, where, size, value);
+
+	return pci_conf0_write_config(bus, devfn, where, size, value);
+}
+
+static struct pci_ops bridge_pci_ops = {
+	.read	 = pci_read_config,
+	.write	 = pci_write_config,
+};
+
+/*
+ * All observed requests have pin == 1. We could have a global here, that
+ * gets incremented and returned every time - unfortunately, pci_map_irq
+ * may be called on the same device over and over, and need to return the
+ * same value. On O2000, pin can be 0 or 1, and PCI slots can be [0..7].
+ *
+ * A given PCI device, in general, should be able to intr any of the cpus
+ * on any one of the hubs connected to its xbow.
+ */
+static int bridge_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
+{
+	struct bridge_controller *bc = BRIDGE_CONTROLLER(dev->bus);
+	int irq;
+
+	irq = bc->pci_int[slot];
+	if (irq == -1) {
+		irq = request_bridge_irq(bc, slot);
+		if (irq < 0)
+			return irq;
+
+		bc->pci_int[slot] = irq;
+	}
+	return irq;
+}
+
+static int bridge_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct bridge_controller *bc;
+	struct pci_host_bridge *host;
+	int slot;
+	int err;
+	struct xtalk_bridge_platform_data *bd = dev_get_platdata(&pdev->dev);
+
+	pci_set_flags(PCI_PROBE_ONLY);
+
+	host = devm_pci_alloc_host_bridge(dev, sizeof(*bc));
+	if (!host)
+		return -ENOMEM;
+
+	bc = pci_host_bridge_priv(host);
+
+	bc->busn.name		= "Bridge PCI busn";
+	bc->busn.start		= 0;
+	bc->busn.end		= 0xff;
+	bc->busn.flags		= IORESOURCE_BUS;
+
+	pci_add_resource_offset(&host->windows, &bd->mem, bd->mem_offset);
+	pci_add_resource_offset(&host->windows, &bd->io, bd->io_offset);
+	pci_add_resource(&host->windows, &bc->busn);
+
+	err = devm_request_pci_bus_resources(dev, &host->windows);
+	if (err < 0) {
+		pci_free_resource_list(&host->windows);
+		return err;
+	}
+
+	bc->nasid = bd->nasid;
+
+	bc->baddr = (u64)bd->masterwid << 60 | PCI64_ATTR_BAR;
+	bc->base = (struct bridge_regs *)bd->bridge_addr;
+	bc->intr_addr = bd->intr_addr;
+
+	/*
+	 * Clear all pending interrupts.
+	 */
+	bridge_write(bc, b_int_rst_stat, BRIDGE_IRR_ALL_CLR);
+
+	/*
+	 * Until otherwise set up, assume all interrupts are from slot 0
+	 */
+	bridge_write(bc, b_int_device, 0x0);
+
+	/*
+	 * disable swapping for big windows
+	 */
+	bridge_clr(bc, b_wid_control,
+		   BRIDGE_CTRL_IO_SWAP | BRIDGE_CTRL_MEM_SWAP);
+#ifdef CONFIG_PAGE_SIZE_4KB
+	bridge_clr(bc, b_wid_control, BRIDGE_CTRL_PAGE_SIZE);
+#else /* 16kB or larger */
+	bridge_set(bc, b_wid_control, BRIDGE_CTRL_PAGE_SIZE);
+#endif
+
+	/*
+	 * Hmm...  IRIX sets additional bits in the address which
+	 * are documented as reserved in the bridge docs.
+	 */
+	bridge_write(bc, b_wid_int_upper,
+		     ((bc->intr_addr >> 32) & 0xffff) | (bd->masterwid << 16));
+	bridge_write(bc, b_wid_int_lower, bc->intr_addr & 0xffffffff);
+	bridge_write(bc, b_dir_map, (bd->masterwid << 20));	/* DMA */
+	bridge_write(bc, b_int_enable, 0);
+
+	for (slot = 0; slot < 8; slot++) {
+		bridge_set(bc, b_device[slot].reg, BRIDGE_DEV_SWAP_DIR);
+		bc->pci_int[slot] = -1;
+	}
+	bridge_read(bc, b_wid_tflush);	  /* wait until Bridge PIO complete */
+
+	host->dev.parent = dev;
+	host->sysdata = bc;
+	host->busnr = 0;
+	host->ops = &bridge_pci_ops;
+	host->map_irq = bridge_map_irq;
+	host->swizzle_irq = pci_common_swizzle;
+
+	err = pci_scan_root_bus_bridge(host);
+	if (err < 0)
+		return err;
+
+	pci_bus_claim_resources(host->bus);
+	pci_bus_add_devices(host->bus);
+
+	platform_set_drvdata(pdev, host->bus);
+
+	return 0;
+}
+
+static int bridge_remove(struct platform_device *pdev)
+{
+	struct pci_bus *bus = platform_get_drvdata(pdev);
+
+	pci_lock_rescan_remove();
+	pci_stop_root_bus(bus);
+	pci_remove_root_bus(bus);
+	pci_unlock_rescan_remove();
+
+	return 0;
+}
+
+static struct platform_driver bridge_driver = {
+	.probe  = bridge_probe,
+	.remove = bridge_remove,
+	.driver = {
+		.name = "xtalk-bridge",
+	}
+};
+
+builtin_platform_driver(bridge_driver);
diff --git a/arch/mips/sgi-ip27/ip27-init.c b/arch/mips/sgi-ip27/ip27-init.c
index 6074efeff894..066b33f50bcc 100644
--- a/arch/mips/sgi-ip27/ip27-init.c
+++ b/arch/mips/sgi-ip27/ip27-init.c
@@ -184,5 +184,7 @@ void __init plat_mem_setup(void)
 
 	ioc3_eth_init();
 
+	ioport_resource.start = 0;
+	ioport_resource.end = ~0UL;
 	set_io_port_base(IO_BASE);
 }
diff --git a/arch/mips/sgi-ip27/ip27-xtalk.c b/arch/mips/sgi-ip27/ip27-xtalk.c
index ce06aaa115ae..bd5cb855c6e5 100644
--- a/arch/mips/sgi-ip27/ip27-xtalk.c
+++ b/arch/mips/sgi-ip27/ip27-xtalk.c
@@ -9,6 +9,9 @@
 
 #include <linux/kernel.h>
 #include <linux/smp.h>
+#include <linux/platform_device.h>
+#include <linux/platform_data/xtalk-bridge.h>
+#include <asm/sn/addrs.h>
 #include <asm/sn/types.h>
 #include <asm/sn/klconfig.h>
 #include <asm/sn/hub.h>
@@ -20,7 +23,48 @@
 #define XXBOW_WIDGET_PART_NUM	0xd000	/* Xbow in Xbridge */
 #define BASE_XBOW_PORT		8     /* Lowest external port */
 
-extern int bridge_probe(nasid_t nasid, int widget, int masterwid);
+static void bridge_platform_create(nasid_t nasid, int widget, int masterwid)
+{
+	struct xtalk_bridge_platform_data *bd;
+	struct platform_device *pdev;
+	unsigned long offset;
+
+	bd = kzalloc(sizeof(*bd), GFP_KERNEL);
+	if (!bd)
+		goto no_mem;
+	pdev = platform_device_alloc("xtalk-bridge", PLATFORM_DEVID_AUTO);
+	if (!pdev) {
+		kfree(bd);
+		goto no_mem;
+	}
+
+	offset = NODE_OFFSET(nasid);
+
+	bd->bridge_addr = RAW_NODE_SWIN_BASE(nasid, widget);
+	bd->intr_addr	= BIT_ULL(47) + 0x01800000 + PI_INT_PEND_MOD;
+	bd->nasid	= nasid;
+	bd->masterwid	= masterwid;
+
+	bd->mem.name	= "Bridge PCI MEM";
+	bd->mem.start	= offset + (widget << SWIN_SIZE_BITS);
+	bd->mem.end	= bd->mem.start + SWIN_SIZE - 1;
+	bd->mem.flags	= IORESOURCE_MEM;
+	bd->mem_offset	= offset;
+
+	bd->io.name	= "Bridge PCI IO";
+	bd->io.start	= offset + (widget << SWIN_SIZE_BITS);
+	bd->io.end	= bd->io.start + SWIN_SIZE - 1;
+	bd->io.flags	= IORESOURCE_IO;
+	bd->io_offset	= offset;
+
+	platform_device_add_data(pdev, bd, sizeof(*bd));
+	platform_device_add(pdev);
+	pr_info("xtalk:n%d/%x bridge widget\n", nasid, widget);
+	return;
+
+no_mem:
+	pr_warn("xtalk:n%d/%x bridge create out of memory\n", nasid, widget);
+}
 
 static int probe_one_port(nasid_t nasid, int widget, int masterwid)
 {
@@ -31,13 +75,10 @@ static int probe_one_port(nasid_t nasid, int widget, int masterwid)
 		(RAW_NODE_SWIN_BASE(nasid, widget) + WIDGET_ID);
 	partnum = XWIDGET_PART_NUM(widget_id);
 
-	printk(KERN_INFO "Cpu %d, Nasid 0x%x, widget 0x%x (partnum 0x%x) is ",
-			smp_processor_id(), nasid, widget, partnum);
-
 	switch (partnum) {
 	case BRIDGE_WIDGET_PART_NUM:
 	case XBRIDGE_WIDGET_PART_NUM:
-		bridge_probe(nasid, widget, masterwid);
+		bridge_platform_create(nasid, widget, masterwid);
 		break;
 	default:
 		break;
@@ -52,8 +93,6 @@ static int xbow_probe(nasid_t nasid)
 	klxbow_t *xbow_p;
 	unsigned masterwid, i;
 
-	printk("is xbow\n");
-
 	/*
 	 * found xbow, so may have multiple bridges
 	 * need to probe xbow
@@ -117,19 +156,17 @@ static void xtalk_probe_node(cnodeid_t nid)
 		       (RAW_NODE_SWIN_BASE(nasid, 0x0) + WIDGET_ID);
 	partnum = XWIDGET_PART_NUM(widget_id);
 
-	printk(KERN_INFO "Cpu %d, Nasid 0x%x: partnum 0x%x is ",
-			smp_processor_id(), nasid, partnum);
-
 	switch (partnum) {
 	case BRIDGE_WIDGET_PART_NUM:
-		bridge_probe(nasid, 0x8, 0xa);
+		bridge_platform_create(nasid, 0x8, 0xa);
 		break;
 	case XBOW_WIDGET_PART_NUM:
 	case XXBOW_WIDGET_PART_NUM:
+		pr_info("xtalk:n%d/0 xbow widget\n", nasid);
 		xbow_probe(nasid);
 		break;
 	default:
-		printk(" unknown widget??\n");
+		pr_info("xtalk:n%d/0 unknown widget (0x%x)\n", nasid, partnum);
 		break;
 	}
 }
diff --git a/include/linux/platform_data/xtalk-bridge.h b/include/linux/platform_data/xtalk-bridge.h
new file mode 100644
index 000000000000..51e5001f2c05
--- /dev/null
+++ b/include/linux/platform_data/xtalk-bridge.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * SGI PCI Xtalk Bridge
+ */
+
+#ifndef PLATFORM_DATA_XTALK_BRIDGE_H
+#define PLATFORM_DATA_XTALK_BRIDGE_H
+
+#include <asm/sn/types.h>
+
+struct xtalk_bridge_platform_data {
+	struct resource	mem;
+	struct resource io;
+	unsigned long bridge_addr;
+	unsigned long intr_addr;
+	unsigned long mem_offset;
+	unsigned long io_offset;
+	nasid_t	nasid;
+	int	masterwid;
+};
+
+#endif /* PLATFORM_DATA_XTALK_BRIDGE_H */
-- 
2.13.7

