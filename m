Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB3572EB4ED
	for <lists+linux-mips@lfdr.de>; Tue,  5 Jan 2021 22:37:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725817AbhAEVhZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 5 Jan 2021 16:37:25 -0500
Received: from mx2.suse.de ([195.135.220.15]:53358 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725792AbhAEVhY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 5 Jan 2021 16:37:24 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id C5214AEC1;
        Tue,  5 Jan 2021 21:36:41 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Paul Burton <paulburton@kernel.org>,
        John Crispin <john@phrozen.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        James Hartley <james.hartley@sondrel.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] MIPS: Remove empty prom_free_prom_memory functions
Date:   Tue,  5 Jan 2021 22:36:31 +0100
Message-Id: <20210105213633.76912-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Most of the prom_free_prom_memory functions are empty. With
a new weak prom_free_prom_memory() we can remove all of them.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/alchemy/common/prom.c     | 4 ----
 arch/mips/ar7/memory.c              | 5 -----
 arch/mips/ath25/prom.c              | 4 ----
 arch/mips/ath79/prom.c              | 5 -----
 arch/mips/bcm47xx/prom.c            | 4 ----
 arch/mips/bcm63xx/prom.c            | 4 ----
 arch/mips/bmips/setup.c             | 4 ----
 arch/mips/cobalt/setup.c            | 5 -----
 arch/mips/fw/arc/memory.c           | 2 +-
 arch/mips/fw/sni/sniprom.c          | 4 ----
 arch/mips/generic/init.c            | 4 ----
 arch/mips/lantiq/prom.c             | 4 ----
 arch/mips/loongson2ef/common/init.c | 4 ----
 arch/mips/loongson32/common/prom.c  | 4 ----
 arch/mips/loongson64/init.c         | 4 ----
 arch/mips/mm/init.c                 | 5 +++++
 arch/mips/mti-malta/malta-memory.c  | 4 ----
 arch/mips/netlogic/xlp/setup.c      | 5 -----
 arch/mips/netlogic/xlr/setup.c      | 5 -----
 arch/mips/pic32/pic32mzda/init.c    | 4 ----
 arch/mips/pistachio/init.c          | 4 ----
 arch/mips/ralink/prom.c             | 4 ----
 arch/mips/rb532/prom.c              | 5 -----
 arch/mips/sgi-ip27/ip27-memory.c    | 5 -----
 arch/mips/sgi-ip32/ip32-memory.c    | 5 -----
 arch/mips/sibyte/common/cfe.c       | 5 -----
 arch/mips/txx9/generic/setup.c      | 4 ----
 arch/mips/vr41xx/common/init.c      | 4 ----
 28 files changed, 6 insertions(+), 114 deletions(-)

diff --git a/arch/mips/alchemy/common/prom.c b/arch/mips/alchemy/common/prom.c
index d910c0a64de9..b13d8adf3be4 100644
--- a/arch/mips/alchemy/common/prom.c
+++ b/arch/mips/alchemy/common/prom.c
@@ -143,7 +143,3 @@ int __init prom_get_ethernet_addr(char *ethernet_addr)
 
 	return 0;
 }
-
-void __init prom_free_prom_memory(void)
-{
-}
diff --git a/arch/mips/ar7/memory.c b/arch/mips/ar7/memory.c
index 787716c5e946..ce8024c1a54e 100644
--- a/arch/mips/ar7/memory.c
+++ b/arch/mips/ar7/memory.c
@@ -49,8 +49,3 @@ void __init prom_meminit(void)
 	pages = memsize() >> PAGE_SHIFT;
 	memblock_add(PHYS_OFFSET, pages << PAGE_SHIFT);
 }
-
-void __init prom_free_prom_memory(void)
-{
-	/* Nothing to free */
-}
diff --git a/arch/mips/ath25/prom.c b/arch/mips/ath25/prom.c
index edf82be8870d..4466e14feaa4 100644
--- a/arch/mips/ath25/prom.c
+++ b/arch/mips/ath25/prom.c
@@ -20,7 +20,3 @@
 void __init prom_init(void)
 {
 }
-
-void __init prom_free_prom_memory(void)
-{
-}
diff --git a/arch/mips/ath79/prom.c b/arch/mips/ath79/prom.c
index 25724b4e97fd..cc6dc5600677 100644
--- a/arch/mips/ath79/prom.c
+++ b/arch/mips/ath79/prom.c
@@ -32,8 +32,3 @@ void __init prom_init(void)
 	}
 #endif
 }
-
-void __init prom_free_prom_memory(void)
-{
-	/* We do not have to prom memory to free */
-}
diff --git a/arch/mips/bcm47xx/prom.c b/arch/mips/bcm47xx/prom.c
index 3e2a8166377f..0a63721d0fbf 100644
--- a/arch/mips/bcm47xx/prom.c
+++ b/arch/mips/bcm47xx/prom.c
@@ -113,10 +113,6 @@ void __init prom_init(void)
 	setup_8250_early_printk_port(CKSEG1ADDR(BCM47XX_SERIAL_ADDR), 0, 0);
 }
 
-void __init prom_free_prom_memory(void)
-{
-}
-
 #if defined(CONFIG_BCM47XX_BCMA) && defined(CONFIG_HIGHMEM)
 
 #define EXTVBASE	0xc0000000
diff --git a/arch/mips/bcm63xx/prom.c b/arch/mips/bcm63xx/prom.c
index df69eaa453a1..c3a2ea62c5c3 100644
--- a/arch/mips/bcm63xx/prom.c
+++ b/arch/mips/bcm63xx/prom.c
@@ -94,7 +94,3 @@ void __init prom_init(void)
 		 */
 	}
 }
-
-void __init prom_free_prom_memory(void)
-{
-}
diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
index 19308df5f577..afc9d696bcb6 100644
--- a/arch/mips/bmips/setup.c
+++ b/arch/mips/bmips/setup.c
@@ -129,10 +129,6 @@ void __init prom_init(void)
 	register_bmips_smp_ops();
 }
 
-void __init prom_free_prom_memory(void)
-{
-}
-
 const char *get_system_type(void)
 {
 	return "Generic BMIPS kernel";
diff --git a/arch/mips/cobalt/setup.c b/arch/mips/cobalt/setup.c
index 46581e686882..2e099d55a564 100644
--- a/arch/mips/cobalt/setup.c
+++ b/arch/mips/cobalt/setup.c
@@ -117,8 +117,3 @@ void __init prom_init(void)
 
 	setup_8250_early_printk_port(CKSEG1ADDR(0x1c800000), 0, 0);
 }
-
-void __init prom_free_prom_memory(void)
-{
-	/* Nothing to do! */
-}
diff --git a/arch/mips/fw/arc/memory.c b/arch/mips/fw/arc/memory.c
index 37625ae5e35d..ef5fc1ca1b5d 100644
--- a/arch/mips/fw/arc/memory.c
+++ b/arch/mips/fw/arc/memory.c
@@ -173,7 +173,7 @@ void __weak __init prom_cleanup(void)
 {
 }
 
-void __weak __init prom_free_prom_memory(void)
+void __init prom_free_prom_memory(void)
 {
 	int i;
 
diff --git a/arch/mips/fw/sni/sniprom.c b/arch/mips/fw/sni/sniprom.c
index 8f6730376a42..74975e115950 100644
--- a/arch/mips/fw/sni/sniprom.c
+++ b/arch/mips/fw/sni/sniprom.c
@@ -87,10 +87,6 @@ void *prom_get_hwconf(void)
 	return (void *)CKSEG1ADDR(hwconf);
 }
 
-void __init prom_free_prom_memory(void)
-{
-}
-
 /*
  * /proc/cpuinfo system type
  *
diff --git a/arch/mips/generic/init.c b/arch/mips/generic/init.c
index 66a19337d2ab..68763fcde1d0 100644
--- a/arch/mips/generic/init.c
+++ b/arch/mips/generic/init.c
@@ -202,7 +202,3 @@ void __init arch_init_irq(void)
 
 	irqchip_init();
 }
-
-void __init prom_free_prom_memory(void)
-{
-}
diff --git a/arch/mips/lantiq/prom.c b/arch/mips/lantiq/prom.c
index 51a218f04fe0..0eb1d276da3e 100644
--- a/arch/mips/lantiq/prom.c
+++ b/arch/mips/lantiq/prom.c
@@ -44,10 +44,6 @@ int ltq_soc_type(void)
 	return soc_info.type;
 }
 
-void __init prom_free_prom_memory(void)
-{
-}
-
 static void __init prom_init_cmdline(void)
 {
 	int argc = fw_arg0;
diff --git a/arch/mips/loongson2ef/common/init.c b/arch/mips/loongson2ef/common/init.c
index ce3f02f75e2a..088aa56d4ed1 100644
--- a/arch/mips/loongson2ef/common/init.c
+++ b/arch/mips/loongson2ef/common/init.c
@@ -46,7 +46,3 @@ void __init prom_init(void)
 	prom_init_uart_base();
 	board_nmi_handler_setup = mips_nmi_setup;
 }
-
-void __init prom_free_prom_memory(void)
-{
-}
diff --git a/arch/mips/loongson32/common/prom.c b/arch/mips/loongson32/common/prom.c
index c133b5adf34e..fc580a22748e 100644
--- a/arch/mips/loongson32/common/prom.c
+++ b/arch/mips/loongson32/common/prom.c
@@ -36,10 +36,6 @@ void __init prom_init(void)
 	setup_8250_early_printk_port((unsigned long)uart_base, 0, 0);
 }
 
-void __init prom_free_prom_memory(void)
-{
-}
-
 void __init plat_mem_setup(void)
 {
 	memblock_add(0x0, (memsize << 20));
diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
index e13f704bef80..87a4569972ae 100644
--- a/arch/mips/loongson64/init.c
+++ b/arch/mips/loongson64/init.c
@@ -115,10 +115,6 @@ void __init prom_init(void)
 	board_nmi_handler_setup = mips_nmi_setup;
 }
 
-void __init prom_free_prom_memory(void)
-{
-}
-
 static int __init add_legacy_isa_io(struct fwnode_handle *fwnode, resource_size_t hw_start,
 				    resource_size_t size)
 {
diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index bc80893e5c0f..5cb73bf74a8b 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -495,6 +495,11 @@ void free_init_pages(const char *what, unsigned long begin, unsigned long end)
 
 void (*free_init_pages_eva)(void *begin, void *end) = NULL;
 
+void __weak __init prom_free_prom_memory(void)
+{
+	/* nothing to do */
+}
+
 void __ref free_initmem(void)
 {
 	prom_free_prom_memory();
diff --git a/arch/mips/mti-malta/malta-memory.c b/arch/mips/mti-malta/malta-memory.c
index 7c25a0a2345c..952018812885 100644
--- a/arch/mips/mti-malta/malta-memory.c
+++ b/arch/mips/mti-malta/malta-memory.c
@@ -37,10 +37,6 @@ void __init fw_meminit(void)
 	free_init_pages_eva = eva ? free_init_pages_eva_malta : NULL;
 }
 
-void __init prom_free_prom_memory(void)
-{
-}
-
 phys_addr_t mips_cdmm_phys_base(void)
 {
 	/* This address is "typically unused" */
diff --git a/arch/mips/netlogic/xlp/setup.c b/arch/mips/netlogic/xlp/setup.c
index 9adc0c1b4ffc..9fbaa1e5b340 100644
--- a/arch/mips/netlogic/xlp/setup.c
+++ b/arch/mips/netlogic/xlp/setup.c
@@ -130,11 +130,6 @@ const char *get_system_type(void)
 	}
 }
 
-void __init prom_free_prom_memory(void)
-{
-	/* Nothing yet */
-}
-
 void xlp_mmu_init(void)
 {
 	u32 conf4;
diff --git a/arch/mips/netlogic/xlr/setup.c b/arch/mips/netlogic/xlr/setup.c
index 627e88101316..aa83d691df0f 100644
--- a/arch/mips/netlogic/xlr/setup.c
+++ b/arch/mips/netlogic/xlr/setup.c
@@ -89,11 +89,6 @@ unsigned int nlm_get_cpu_frequency(void)
 	return (unsigned int)nlm_prom_info.cpu_frequency;
 }
 
-void __init prom_free_prom_memory(void)
-{
-	/* Nothing yet */
-}
-
 void nlm_percpu_init(int hwcpuid)
 {
 	if (hwcpuid % 4 == 0)
diff --git a/arch/mips/pic32/pic32mzda/init.c b/arch/mips/pic32/pic32mzda/init.c
index 50f376f058f4..d0b1429da656 100644
--- a/arch/mips/pic32/pic32mzda/init.c
+++ b/arch/mips/pic32/pic32mzda/init.c
@@ -91,10 +91,6 @@ void __init prom_init(void)
 	pic32_init_cmdline((int)fw_arg0, (char **)fw_arg1);
 }
 
-void __init prom_free_prom_memory(void)
-{
-}
-
 void __init device_tree_init(void)
 {
 	if (!initial_boot_params)
diff --git a/arch/mips/pistachio/init.c b/arch/mips/pistachio/init.c
index 558995ed6fe8..ddc0e84c13f5 100644
--- a/arch/mips/pistachio/init.c
+++ b/arch/mips/pistachio/init.c
@@ -118,10 +118,6 @@ void __init prom_init(void)
 	pr_info("SoC Type: %s\n", get_system_type());
 }
 
-void __init prom_free_prom_memory(void)
-{
-}
-
 void __init device_tree_init(void)
 {
 	if (!initial_boot_params)
diff --git a/arch/mips/ralink/prom.c b/arch/mips/ralink/prom.c
index 02e7878dc427..25728def3503 100644
--- a/arch/mips/ralink/prom.c
+++ b/arch/mips/ralink/prom.c
@@ -66,7 +66,3 @@ void __init prom_init(void)
 
 	prom_init_cmdline();
 }
-
-void __init prom_free_prom_memory(void)
-{
-}
diff --git a/arch/mips/rb532/prom.c b/arch/mips/rb532/prom.c
index a9d1f2019dc3..23ad8dd9aa5e 100644
--- a/arch/mips/rb532/prom.c
+++ b/arch/mips/rb532/prom.c
@@ -34,11 +34,6 @@ static struct resource ddr_reg[] = {
 	}
 };
 
-void __init prom_free_prom_memory(void)
-{
-	/* No prom memory to free */
-}
-
 static inline int match_tag(char *arg, const char *tag)
 {
 	return strncmp(arg, tag, strlen(tag)) == 0;
diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
index d411e0a90a5b..87bb6945ec25 100644
--- a/arch/mips/sgi-ip27/ip27-memory.c
+++ b/arch/mips/sgi-ip27/ip27-memory.c
@@ -404,11 +404,6 @@ void __init prom_meminit(void)
 	}
 }
 
-void __init prom_free_prom_memory(void)
-{
-	/* We got nothing to free here ...  */
-}
-
 extern void setup_zero_pages(void);
 
 void __init paging_init(void)
diff --git a/arch/mips/sgi-ip32/ip32-memory.c b/arch/mips/sgi-ip32/ip32-memory.c
index 0f53fed39da6..3fc8d0a0bdfa 100644
--- a/arch/mips/sgi-ip32/ip32-memory.c
+++ b/arch/mips/sgi-ip32/ip32-memory.c
@@ -40,8 +40,3 @@ void __init prom_meminit(void)
 		memblock_add(base, size);
 	}
 }
-
-
-void __init prom_free_prom_memory(void)
-{
-}
diff --git a/arch/mips/sibyte/common/cfe.c b/arch/mips/sibyte/common/cfe.c
index 89f7fca45152..a3323f8dcc1b 100644
--- a/arch/mips/sibyte/common/cfe.c
+++ b/arch/mips/sibyte/common/cfe.c
@@ -316,11 +316,6 @@ void __init prom_init(void)
 #endif
 }
 
-void __init prom_free_prom_memory(void)
-{
-	/* Not sure what I'm supposed to do here.  Nothing, I think */
-}
-
 void prom_putchar(char c)
 {
 	int ret;
diff --git a/arch/mips/txx9/generic/setup.c b/arch/mips/txx9/generic/setup.c
index 0ce49978a47e..20d3d27fcc8f 100644
--- a/arch/mips/txx9/generic/setup.c
+++ b/arch/mips/txx9/generic/setup.c
@@ -266,10 +266,6 @@ void __init prom_init(void)
 	txx9_board_vec->prom_init();
 }
 
-void __init prom_free_prom_memory(void)
-{
-}
-
 const char *get_system_type(void)
 {
 	return txx9_system_type;
diff --git a/arch/mips/vr41xx/common/init.c b/arch/mips/vr41xx/common/init.c
index ca53ac3060ef..628dddf79a05 100644
--- a/arch/mips/vr41xx/common/init.c
+++ b/arch/mips/vr41xx/common/init.c
@@ -58,7 +58,3 @@ void __init prom_init(void)
 			strlcat(arcs_cmdline, " ", COMMAND_LINE_SIZE);
 	}
 }
-
-void __init prom_free_prom_memory(void)
-{
-}
-- 
2.29.2

