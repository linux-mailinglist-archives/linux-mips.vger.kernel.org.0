Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFDB218EE53
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2020 04:00:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbgCWC71 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 22 Mar 2020 22:59:27 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56016 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727067AbgCWC70 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 22 Mar 2020 22:59:26 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxP+gDJnhedaseAA--.407S5;
        Mon, 23 Mar 2020 10:59:18 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v2 3/3] MIPS: Loongson: Add PCI support for 7A1000
Date:   Mon, 23 Mar 2020 10:59:15 +0800
Message-Id: <1584932355-3642-4-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1584932355-3642-1-git-send-email-yangtiezhu@loongson.cn>
References: <1584932355-3642-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9AxP+gDJnhedaseAA--.407S5
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw1Utw4xWr17Kr4ktFykAFb_yoW7uF45pF
        43J3WUKr4FqF1fGFnYy3y8GF1fAFZxJF9rKFW2vryjv3sxZryYqF98W3W5tr4fKrs8Xa47
        WrWfKF17GF1jkaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBv14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxd
        M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
        v20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
        F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8JwCF04
        k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
        MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr4
        1lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
        IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4
        A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUYjgxUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add PCI support for 7A1000 to detect PCI device.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/include/asm/mach-loongson64/boot_param.h |  9 +++
 arch/mips/loongson64/env.c                         |  2 +
 arch/mips/pci/ops-loongson3.c                      | 72 ++++++++++++++++++++--
 3 files changed, 79 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
index c759b7c..d766a36 100644
--- a/arch/mips/include/asm/mach-loongson64/boot_param.h
+++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
@@ -195,6 +195,7 @@ enum loongson_bridge_type {
 	LS7A1000 = 2
 };
 
+struct pci_bus;
 struct loongson_system_configuration {
 	u32 nr_cpus;
 	u32 nr_nodes;
@@ -220,6 +221,8 @@ struct loongson_system_configuration {
 	struct sensor_device sensors[MAX_SENSORS];
 	u64 workarounds;
 	void (*early_config)(void);
+	int (*pci_config_access)(unsigned char access_type, struct pci_bus *bus,
+				 unsigned int devfn, int where, u32 *data);
 };
 
 extern struct efi_memory_map_loongson *loongson_memmap;
@@ -228,5 +231,11 @@ extern struct loongson_system_configuration loongson_sysconf;
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
index 32a3822..1c27f46 100644
--- a/arch/mips/loongson64/env.c
+++ b/arch/mips/loongson64/env.c
@@ -168,9 +168,11 @@ void __init prom_init_env(void)
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
diff --git a/arch/mips/pci/ops-loongson3.c b/arch/mips/pci/ops-loongson3.c
index 2f6ad36..0b8fc5e 100644
--- a/arch/mips/pci/ops-loongson3.c
+++ b/arch/mips/pci/ops-loongson3.c
@@ -13,7 +13,10 @@
 #define HT1LO_PCICFG_BASE      0x1a000000
 #define HT1LO_PCICFG_BASE_TP1  0x1b000000
 
-static int loongson3_pci_config_access(unsigned char access_type,
+#define HT1LO_PCICFG_BASE_EXT 0xefe00000000
+#define HT1LO_PCICFG_BASE_TP1_EXT 0xefe10000000
+
+int rs780e_pci_config_access(unsigned char access_type,
 		struct pci_bus *bus, unsigned int devfn,
 		int where, u32 *data)
 {
@@ -62,11 +65,72 @@ static int loongson3_pci_config_access(unsigned char access_type,
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
+static void ls7a1000_pci_class_quirk(struct pci_dev *dev)
+{
+	dev->class = PCI_CLASS_BRIDGE_PCI << 8;
+}
+
+DECLARE_PCI_FIXUP_EARLY(0x0014, 0x7a09, ls7a1000_pci_class_quirk);
+DECLARE_PCI_FIXUP_EARLY(0x0014, 0x7a19, ls7a1000_pci_class_quirk);
+DECLARE_PCI_FIXUP_EARLY(0x0014, 0x7a29, ls7a1000_pci_class_quirk);
+
 static int loongson3_pci_pcibios_read(struct pci_bus *bus, unsigned int devfn,
 				 int where, int size, u32 *val)
 {
 	u32 data = 0;
-	int ret = loongson3_pci_config_access(PCI_ACCESS_READ,
+	int ret = loongson_sysconf.pci_config_access(PCI_ACCESS_READ,
 			bus, devfn, where, &data);
 
 	if (ret != PCIBIOS_SUCCESSFUL)
@@ -91,7 +155,7 @@ static int loongson3_pci_pcibios_write(struct pci_bus *bus, unsigned int devfn,
 	if (size == 4)
 		data = val;
 	else {
-		ret = loongson3_pci_config_access(PCI_ACCESS_READ,
+		ret = loongson_sysconf.pci_config_access(PCI_ACCESS_READ,
 				bus, devfn, where, &data);
 		if (ret != PCIBIOS_SUCCESSFUL)
 			return ret;
@@ -104,7 +168,7 @@ static int loongson3_pci_pcibios_write(struct pci_bus *bus, unsigned int devfn,
 			    (val << ((where & 3) << 3));
 	}
 
-	ret = loongson3_pci_config_access(PCI_ACCESS_WRITE,
+	ret = loongson_sysconf.pci_config_access(PCI_ACCESS_WRITE,
 			bus, devfn, where, &data);
 
 	return ret;
-- 
2.1.0

