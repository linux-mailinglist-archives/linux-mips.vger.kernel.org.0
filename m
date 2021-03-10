Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 087A93336BC
	for <lists+linux-mips@lfdr.de>; Wed, 10 Mar 2021 08:57:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231815AbhCJH5Q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Mar 2021 02:57:16 -0500
Received: from mail.loongson.cn ([114.242.206.163]:33358 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229725AbhCJH4z (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Mar 2021 02:56:55 -0500
Received: from localhost.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn_O3e0hg6KoXAA--.12657S4;
        Wed, 10 Mar 2021 15:56:46 +0800 (CST)
From:   Qing Zhang <zhangqing@loongson.cn>
To:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Ming Wang <wangming01@loongson.cn>
Subject: [PATCH v4 2/7] MIPS: Loongson64: Distinguish firmware dependencies DTB/LEFI
Date:   Wed, 10 Mar 2021 15:56:34 +0800
Message-Id: <20210310075639.20372-3-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210310075639.20372-1-zhangqing@loongson.cn>
References: <20210310075639.20372-1-zhangqing@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn_O3e0hg6KoXAA--.12657S4
X-Coremail-Antispam: 1UD129KBjvJXoWxCrWkuFW3Gry5Kw15Kr17Wrg_yoWrXw47pa
        93Aa4DWr4rWrsxCr95JrW8ZrWrAFZ5GFsFqF429ryjgasFga4Sqr15GF15Ar47AF4rGa4r
        ZrWSgw4xWFs7C3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBS14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GF4l42xK82
        IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
        0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
        IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
        0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
        Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU1a0PDUUUU
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add DTB boot support, only support Loongson-2K1000 processor
for now, determine whether to use the built-in DTB or the DTB
from the firmware by checking the range of CKSEG0 and XKPHYS.
loongson_fw_interface will be used in the future.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
Tested-by: Ming Wang <wangming01@loongson.cn>
---

v3-v4: Standard submission of information
       Fix error handling 

 .../include/asm/mach-loongson64/boot_param.h     |  6 ++++++
 arch/mips/include/asm/mach-loongson64/loongson.h |  3 ++-
 arch/mips/loongson64/env.c                       | 13 ++++++++++++-
 arch/mips/loongson64/init.c                      | 16 ++++++++++++++--
 4 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
index 4592841b6b0c..43737401dc06 100644
--- a/arch/mips/include/asm/mach-loongson64/boot_param.h
+++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
@@ -198,7 +198,13 @@ enum loongson_bridge_type {
 	VIRTUAL = 3
 };
 
+enum loongson_fw_interface {
+	LOONGSON_LEFI,
+	LOONGSON_DTB,
+};
+
 struct loongson_system_configuration {
+	enum loongson_fw_interface fw_interface;
 	u32 nr_cpus;
 	u32 nr_nodes;
 	int cores_per_node;
diff --git a/arch/mips/include/asm/mach-loongson64/loongson.h b/arch/mips/include/asm/mach-loongson64/loongson.h
index ac1c20e172a2..3f885fa26ba6 100644
--- a/arch/mips/include/asm/mach-loongson64/loongson.h
+++ b/arch/mips/include/asm/mach-loongson64/loongson.h
@@ -23,7 +23,8 @@ extern u32 memsize, highmemsize;
 extern const struct plat_smp_ops loongson3_smp_ops;
 
 /* loongson-specific command line, env and memory initialization */
-extern void __init prom_init_env(void);
+extern void __init prom_dtb_init_env(void);
+extern void __init prom_lefi_init_env(void);
 extern void __init szmem(unsigned int node);
 extern void *loongson_fdt_blob;
 
diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
index 51a5d050a94c..e7d3a06175e3 100644
--- a/arch/mips/loongson64/env.c
+++ b/arch/mips/loongson64/env.c
@@ -43,7 +43,18 @@ const char *get_system_type(void)
 	return "Generic Loongson64 System";
 }
 
-void __init prom_init_env(void)
+
+void __init prom_dtb_init_env(void)
+{
+	if ((fw_arg2 < CKSEG0 || fw_arg2 > CKSEG1)
+		&& (fw_arg2 < XKPHYS || fw_arg2 > XKSEG))
+
+		loongson_fdt_blob = __dtb_loongson64_2core_2k1000_begin;
+	else
+		loongson_fdt_blob = (void *)fw_arg2;
+}
+
+void __init prom_lefi_init_env(void)
 {
 	struct boot_params *boot_p;
 	struct loongson_params *loongson_p;
diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
index cfa788bca871..ed280b73bf89 100644
--- a/arch/mips/loongson64/init.c
+++ b/arch/mips/loongson64/init.c
@@ -52,6 +52,10 @@ void __init szmem(unsigned int node)
 	static unsigned long num_physpages;
 	u64 node_id, node_psize, start_pfn, end_pfn, mem_start, mem_size;
 
+	/* Otherwise come from DTB */
+	if (loongson_sysconf.fw_interface != LOONGSON_LEFI)
+		return;
+
 	/* Parse memory information and activate */
 	for (i = 0; i < loongson_memmap->nr_map; i++) {
 		node_id = loongson_memmap->map[i].node_id;
@@ -94,12 +98,20 @@ static void __init prom_init_memory(void)
 void __init prom_init(void)
 {
 	fw_init_cmdline();
-	prom_init_env();
+
+	if (fw_arg2 == 0 || (fdt_magic(fw_arg2) == FDT_MAGIC)) {
+		loongson_sysconf.fw_interface = LOONGSON_DTB;
+		prom_dtb_init_env();
+	} else {
+		loongson_sysconf.fw_interface = LOONGSON_LEFI;
+		prom_lefi_init_env();
+	}
 
 	/* init base address of io space */
 	set_io_port_base(PCI_IOBASE);
 
-	loongson_sysconf.early_config();
+	if (loongson_sysconf.early_config)
+		loongson_sysconf.early_config();
 
 #ifdef CONFIG_NUMA
 	prom_init_numa_memory();
-- 
2.20.1

