Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFAF2199780
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2020 15:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730943AbgCaNdm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 31 Mar 2020 09:33:42 -0400
Received: from mail.loongson.cn ([114.242.206.163]:37370 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730216AbgCaNdm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 31 Mar 2020 09:33:42 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf9+pRoNeSSIiAA--.19S5;
        Tue, 31 Mar 2020 21:33:32 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v3 3/3] MIPS: Loongson: Add PCI support for 7A1000
Date:   Tue, 31 Mar 2020 21:33:28 +0800
Message-Id: <1585661608-3356-4-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1585661608-3356-1-git-send-email-yangtiezhu@loongson.cn>
References: <1585661608-3356-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dxf9+pRoNeSSIiAA--.19S5
X-Coremail-Antispam: 1UD129KBjvJXoW3Xw1rKry3ZFWxuFy3uFWruFg_yoWxCF1UpF
        43A3WUKr4FqF1fGFnYy3yUGF1rAFZxJF9rKFW2kryj93sxZryFqF95W3W5tr4fKw4DXa47
        W3yfKF17G3WjkaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9v14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
        ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
        xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
        vE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
        r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMxC20s
        026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
        JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
        v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xva
        j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JV
        W8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUUDKs7UUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add PCI support for 7A1000 to detect PCI device.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

v3:
  - Move ls7a1000_pci_class_quirk() to fixup-loongson3.c
  - Use PCI_VENDOR_ID_LOONGSON in pci_ids.h instead of 0x0014

  PCI_VENDOR_ID_LOONGSON depends on the mainline tree's commit:
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9acb9fe18d86

 arch/mips/include/asm/mach-loongson64/boot_param.h |  9 ++++
 arch/mips/loongson64/env.c                         |  2 +
 arch/mips/pci/fixup-loongson3.c                    | 12 +++++
 arch/mips/pci/ops-loongson3.c                      | 63 ++++++++++++++++++++--
 4 files changed, 82 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
index a36d3dc..c8f8d6b 100644
--- a/arch/mips/include/asm/mach-loongson64/boot_param.h
+++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
@@ -197,6 +197,7 @@ enum loongson_bridge_type {
 	LS7A1000 = 2
 };
 
+struct pci_bus;
 struct loongson_system_configuration {
 	u32 nr_cpus;
 	u32 nr_nodes;
@@ -222,6 +223,8 @@ struct loongson_system_configuration {
 	struct sensor_device sensors[MAX_SENSORS];
 	u64 workarounds;
 	void (*early_config)(void);
+	int (*pci_config_access)(unsigned char access_type, struct pci_bus *bus,
+				 unsigned int devfn, int where, u32 *data);
 };
 
 extern struct efi_memory_map_loongson *loongson_memmap;
@@ -230,5 +233,11 @@ extern struct loongson_system_configuration loongson_sysconf;
 extern u32 node_id_offset;
 extern void rs780e_early_config(void);
 extern void ls7a1000_early_config(void);
+extern int rs780e_pci_config_access(unsigned char access_type,
+		struct pci_bus *bus, unsigned int devfn,
+		int where, u32 *data);
+extern int ls7a1000_pci_config_access(unsigned char access_type,
+		struct pci_bus *bus, unsigned int devfn,
+		int where, u32 *data);
 
 #endif
diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
index 8b8d6f6..0190ea6 100644
--- a/arch/mips/loongson64/env.c
+++ b/arch/mips/loongson64/env.c
@@ -193,9 +193,11 @@ void __init prom_init_env(void)
 		pr_info("The bridge chip is Loongson 7A1000\n");
 		loongson_sysconf.bridgetype = LS7A1000;
 		loongson_sysconf.early_config = ls7a1000_early_config;
+		loongson_sysconf.pci_config_access = ls7a1000_pci_config_access;
 	} else {
 		pr_info("The bridge chip is AMD RS780E or SR5690\n");
 		loongson_sysconf.bridgetype = RS780E;
 		loongson_sysconf.early_config = rs780e_early_config;
+		loongson_sysconf.pci_config_access = rs780e_pci_config_access;
 	}
 }
diff --git a/arch/mips/pci/fixup-loongson3.c b/arch/mips/pci/fixup-loongson3.c
index 8a741c2..569649e 100644
--- a/arch/mips/pci/fixup-loongson3.c
+++ b/arch/mips/pci/fixup-loongson3.c
@@ -64,6 +64,18 @@ static void pci_fixup_radeon(struct pci_dev *pdev)
 DECLARE_PCI_FIXUP_CLASS_FINAL(PCI_VENDOR_ID_ATI, PCI_ANY_ID,
 				PCI_CLASS_DISPLAY_VGA, 8, pci_fixup_radeon);
 
+static void ls7a1000_pci_class_quirk(struct pci_dev *dev)
+{
+	dev->class = PCI_CLASS_BRIDGE_PCI << 8;
+}
+
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_LOONGSON, 0x7a09,
+			ls7a1000_pci_class_quirk);
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_LOONGSON, 0x7a19,
+			ls7a1000_pci_class_quirk);
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_LOONGSON, 0x7a29,
+			ls7a1000_pci_class_quirk);
+
 /* Do platform specific device initialization at pci_enable_device() time */
 int pcibios_plat_dev_init(struct pci_dev *dev)
 {
diff --git a/arch/mips/pci/ops-loongson3.c b/arch/mips/pci/ops-loongson3.c
index 2f6ad36..b69e569 100644
--- a/arch/mips/pci/ops-loongson3.c
+++ b/arch/mips/pci/ops-loongson3.c
@@ -13,7 +13,10 @@
 #define HT1LO_PCICFG_BASE      0x1a000000
 #define HT1LO_PCICFG_BASE_TP1  0x1b000000
 
-static int loongson3_pci_config_access(unsigned char access_type,
+#define HT1LO_PCICFG_BASE_EXT		0xefe00000000
+#define HT1LO_PCICFG_BASE_TP1_EXT	0xefe10000000
+
+int rs780e_pci_config_access(unsigned char access_type,
 		struct pci_bus *bus, unsigned int devfn,
 		int where, u32 *data)
 {
@@ -62,11 +65,63 @@ static int loongson3_pci_config_access(unsigned char access_type,
 	return PCIBIOS_SUCCESSFUL;
 }
 
+
+int ls7a1000_pci_config_access(unsigned char access_type,
+		struct pci_bus *bus, unsigned int devfn,
+		int where, u32 *data)
+{
+	u_int64_t addr;
+	void *addrp;
+	unsigned char busnum = bus->number;
+	int device = PCI_SLOT(devfn);
+	int function = PCI_FUNC(devfn);
+	int reg = where & ~3;
+
+	if (where >= PCI_CFG_SPACE_EXP_SIZE)
+		return PCIBIOS_DEVICE_NOT_FOUND;
+
+	if (busnum == 0 && device > 23)
+		return PCIBIOS_DEVICE_NOT_FOUND;
+
+	if (where < PCI_CFG_SPACE_SIZE) { /* standard config */
+		addr = (busnum << 16) | (device << 11) | (function << 8) | reg;
+		if (busnum == 0) {
+			addr = HT1LO_PCICFG_BASE | addr;
+			addrp = (void *)TO_UNCAC(addr);
+		} else {
+			addr = HT1LO_PCICFG_BASE_TP1 | addr;
+			addrp = (void *)TO_UNCAC(addr);
+		}
+	} else { /* extended config */
+		reg = (reg & 0xff) | ((reg & 0xf00) << 16);
+		addr = (busnum << 16) | (device << 11) | (function << 8) | reg;
+		if (busnum == 0) {
+			addr = HT1LO_PCICFG_BASE_EXT | addr;
+			addrp = (void *)TO_UNCAC(addr);
+		} else {
+			addr = HT1LO_PCICFG_BASE_TP1_EXT | addr;
+			addrp = (void *)TO_UNCAC(addr);
+		}
+	}
+
+	if (access_type == PCI_ACCESS_WRITE)
+		*(unsigned int *)addrp = cpu_to_le32(*data);
+	else {
+		*data = le32_to_cpu(*(unsigned int *)addrp);
+		if (*data == 0xffffffff) {
+			*data = -1;
+			return PCIBIOS_DEVICE_NOT_FOUND;
+		}
+	}
+
+	return PCIBIOS_SUCCESSFUL;
+}
+
 static int loongson3_pci_pcibios_read(struct pci_bus *bus, unsigned int devfn,
 				 int where, int size, u32 *val)
 {
 	u32 data = 0;
-	int ret = loongson3_pci_config_access(PCI_ACCESS_READ,
+	int ret = loongson_sysconf.pci_config_access(PCI_ACCESS_READ,
 			bus, devfn, where, &data);
 
 	if (ret != PCIBIOS_SUCCESSFUL)
@@ -91,7 +146,7 @@ static int loongson3_pci_pcibios_write(struct pci_bus *bus, unsigned int devfn,
 	if (size == 4)
 		data = val;
 	else {
-		ret = loongson3_pci_config_access(PCI_ACCESS_READ,
+		ret = loongson_sysconf.pci_config_access(PCI_ACCESS_READ,
 				bus, devfn, where, &data);
 		if (ret != PCIBIOS_SUCCESSFUL)
 			return ret;
@@ -104,7 +159,7 @@ static int loongson3_pci_pcibios_write(struct pci_bus *bus, unsigned int devfn,
 			    (val << ((where & 3) << 3));
 	}
 
-	ret = loongson3_pci_config_access(PCI_ACCESS_WRITE,
+	ret = loongson_sysconf.pci_config_access(PCI_ACCESS_WRITE,
 			bus, devfn, where, &data);
 
 	return ret;
-- 
2.1.0

