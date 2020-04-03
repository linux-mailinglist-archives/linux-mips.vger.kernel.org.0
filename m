Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A004519D3AD
	for <lists+linux-mips@lfdr.de>; Fri,  3 Apr 2020 11:30:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389015AbgDCJaG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 3 Apr 2020 05:30:06 -0400
Received: from mail.loongson.cn ([114.242.206.163]:42998 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390255AbgDCJaG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 3 Apr 2020 05:30:06 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX2gQAodeHGAjAA--.150S5;
        Fri, 03 Apr 2020 17:30:01 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v4 3/3] MIPS: Loongson: Add PCI support for LS7A
Date:   Fri,  3 Apr 2020 17:29:51 +0800
Message-Id: <1585906191-26037-4-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1585906191-26037-1-git-send-email-yangtiezhu@loongson.cn>
References: <1585906191-26037-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9DxX2gQAodeHGAjAA--.150S5
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw18tw45ZFykKr4kXrW5Jrb_yoWxCw18pF
        43A3WUKr4FqFn3GF9Yy3y8GF1rAFZxJF97KFW2y34j93sxZryFqF95W3W5tr4fKw4DXa4x
        W3yfKF4UGF1jk3JanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9m14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxGrwCFx2
        IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
        6r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
        AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
        s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
        0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU5wIkUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add PCI support for LS7A to detect PCI device.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

v3:
  - Move ls7a1000_pci_class_quirk() to fixup-loongson3.c
  - Use PCI_VENDOR_ID_LOONGSON in pci_ids.h instead of 0x0014

  PCI_VENDOR_ID_LOONGSON depends on the mainline tree's commit:
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9acb9fe18d86

v4:
  - Use LS7A instead of Loongson 7A1000 in the description
  - Use LS7A or ls7a instead of LS7A1000 or ls7a1000 in the code

 arch/mips/include/asm/mach-loongson64/boot_param.h |  9 ++++
 arch/mips/loongson64/env.c                         |  2 +
 arch/mips/pci/fixup-loongson3.c                    | 12 +++++
 arch/mips/pci/ops-loongson3.c                      | 63 ++++++++++++++++++++--
 4 files changed, 82 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
index 4ac7034..02dcdf2 100644
--- a/arch/mips/include/asm/mach-loongson64/boot_param.h
+++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
@@ -197,6 +197,7 @@ enum loongson_bridge_type {
 	LS7A = 2
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
 extern void ls7a_early_config(void);
+extern int rs780e_pci_config_access(unsigned char access_type,
+		struct pci_bus *bus, unsigned int devfn,
+		int where, u32 *data);
+extern int ls7a_pci_config_access(unsigned char access_type,
+		struct pci_bus *bus, unsigned int devfn,
+		int where, u32 *data);
 
 #endif
diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
index d11bc34..9b206ed 100644
--- a/arch/mips/loongson64/env.c
+++ b/arch/mips/loongson64/env.c
@@ -193,9 +193,11 @@ void __init prom_init_env(void)
 		pr_info("The bridge chip is LS7A\n");
 		loongson_sysconf.bridgetype = LS7A;
 		loongson_sysconf.early_config = ls7a_early_config;
+		loongson_sysconf.pci_config_access = ls7a_pci_config_access;
 	} else {
 		pr_info("The bridge chip is RS780E or SR5690\n");
 		loongson_sysconf.bridgetype = RS780E;
 		loongson_sysconf.early_config = rs780e_early_config;
+		loongson_sysconf.pci_config_access = rs780e_pci_config_access;
 	}
 }
diff --git a/arch/mips/pci/fixup-loongson3.c b/arch/mips/pci/fixup-loongson3.c
index 8a741c2..6e7514c 100644
--- a/arch/mips/pci/fixup-loongson3.c
+++ b/arch/mips/pci/fixup-loongson3.c
@@ -64,6 +64,18 @@ static void pci_fixup_radeon(struct pci_dev *pdev)
 DECLARE_PCI_FIXUP_CLASS_FINAL(PCI_VENDOR_ID_ATI, PCI_ANY_ID,
 				PCI_CLASS_DISPLAY_VGA, 8, pci_fixup_radeon);
 
+static void ls7a_pci_class_quirk(struct pci_dev *dev)
+{
+	dev->class = PCI_CLASS_BRIDGE_PCI << 8;
+}
+
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_LOONGSON, 0x7a09,
+			ls7a_pci_class_quirk);
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_LOONGSON, 0x7a19,
+			ls7a_pci_class_quirk);
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_LOONGSON, 0x7a29,
+			ls7a_pci_class_quirk);
+
 /* Do platform specific device initialization at pci_enable_device() time */
 int pcibios_plat_dev_init(struct pci_dev *dev)
 {
diff --git a/arch/mips/pci/ops-loongson3.c b/arch/mips/pci/ops-loongson3.c
index 2f6ad36..fba55dd 100644
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
+int ls7a_pci_config_access(unsigned char access_type,
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

