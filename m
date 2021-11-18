Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CA79456213
	for <lists+linux-mips@lfdr.de>; Thu, 18 Nov 2021 19:12:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234415AbhKRSP0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 18 Nov 2021 13:15:26 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:39768 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234373AbhKRSPW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 18 Nov 2021 13:15:22 -0500
Received: by mail-ot1-f49.google.com with SMTP id r10-20020a056830080a00b0055c8fd2cebdso12387535ots.6;
        Thu, 18 Nov 2021 10:12:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lKjGmeKxePzD70fPeVNX3iOZlAphvR/tEc1cbLf20w4=;
        b=F7wu5cPkMF+KjbduYL9zWClRaw8WUcy9V1dh4wPh9Up0PMTxYWlHhXKf5S7joDbT7Z
         6fwElI8m8f59xXSvclxDEZzCDrt0qFdr1wR3Fa565TvRekNXZAGc3ffVaQpUvQpbAZi7
         vEy+T20nVK+RjNTNeaeQDHeXIi/oKRC8Jy/rxDOuvuVD0KaxxRKqtWHD7pWQaAQm1DXC
         wbDjB1bpUpIALDpzI7jYjizqMFLGFfhZlQwIvkedO7TvDy1vScPj/psEsJfDPzWayoJ2
         +tG7kfmjk+jhVut49pB6iJwARlWJ7YBSdV8eAU0/6Y1h/qLJVPcxrq/y6vWZebN1ta6+
         JYLQ==
X-Gm-Message-State: AOAM530Z0JPNgNMfHZ5LllQCGf9GjGmFRC8XEyJoGnQUhEA4HUr11XpC
        w8TGjE2HxEGNYROD6woVdQ==
X-Google-Smtp-Source: ABdhPJxhAvBxb/0cxPU/ID9tNSxww6OwM8HW6DSbRf+ew+ITysWoNTRD9+PHgOYNwmYeZDuZ7NkSoQ==
X-Received: by 2002:a05:6830:4185:: with SMTP id r5mr23064102otu.50.1637259141449;
        Thu, 18 Nov 2021 10:12:21 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id n20sm99339ooe.7.2021.11.18.10.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 10:12:20 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Frank Rowand <frowand.list@gmail.com>,
        John Crispin <john@phrozen.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] of/fdt: Rework early_init_dt_scan_memory() to call directly
Date:   Thu, 18 Nov 2021 12:12:12 -0600
Message-Id: <20211118181213.1433346-4-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211118181213.1433346-1-robh@kernel.org>
References: <20211118181213.1433346-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use of the of_scan_flat_dt() function predates libfdt and is discouraged
as libfdt provides a nicer set of APIs. Rework
early_init_dt_scan_memory() to be called directly and use libfdt.

Cc: John Crispin <john@phrozen.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: linux-mips@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/mips/ralink/of.c      | 16 ++-------
 arch/powerpc/kernel/prom.c | 16 ++++-----
 drivers/of/fdt.c           | 68 ++++++++++++++++++++------------------
 include/linux/of_fdt.h     |  3 +-
 4 files changed, 47 insertions(+), 56 deletions(-)

diff --git a/arch/mips/ralink/of.c b/arch/mips/ralink/of.c
index 0135376c5de5..e1d79523343a 100644
--- a/arch/mips/ralink/of.c
+++ b/arch/mips/ralink/of.c
@@ -53,17 +53,6 @@ void __init device_tree_init(void)
 	unflatten_and_copy_device_tree();
 }
 
-static int memory_dtb;
-
-static int __init early_init_dt_find_memory(unsigned long node,
-				const char *uname, int depth, void *data)
-{
-	if (depth == 1 && !strcmp(uname, "memory@0"))
-		memory_dtb = 1;
-
-	return 0;
-}
-
 void __init plat_mem_setup(void)
 {
 	void *dtb;
@@ -77,9 +66,8 @@ void __init plat_mem_setup(void)
 	dtb = get_fdt();
 	__dt_setup_arch(dtb);
 
-	of_scan_flat_dt(early_init_dt_find_memory, NULL);
-	if (memory_dtb)
-		of_scan_flat_dt(early_init_dt_scan_memory, NULL);
+	if (!early_init_dt_scan_memory())
+		return;
 	else if (soc_info.mem_detect)
 		soc_info.mem_detect();
 	else if (soc_info.mem_size)
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 6e1a106f02eb..63762a3b75e8 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -532,19 +532,19 @@ static int  __init early_init_drmem_lmb(struct drmem_lmb *lmb,
 }
 #endif /* CONFIG_PPC_PSERIES */
 
-static int __init early_init_dt_scan_memory_ppc(unsigned long node,
-						const char *uname,
-						int depth, void *data)
+static int __init early_init_dt_scan_memory_ppc(void)
 {
 #ifdef CONFIG_PPC_PSERIES
-	if (depth == 1 &&
-	    strcmp(uname, "ibm,dynamic-reconfiguration-memory") == 0) {
+	const void *fdt = initial_boot_params;
+	int node = fdt_path_offset(fdt, "/ibm,dynamic-reconfiguration-memory");
+
+	if (node > 0) {
 		walk_drmem_lmbs_early(node, NULL, early_init_drmem_lmb);
 		return 0;
 	}
 #endif
 	
-	return early_init_dt_scan_memory(node, uname, depth, data);
+	return early_init_dt_scan_memory();
 }
 
 /*
@@ -749,7 +749,7 @@ void __init early_init_devtree(void *params)
 
 	/* Scan memory nodes and rebuild MEMBLOCKs */
 	early_init_dt_scan_root();
-	of_scan_flat_dt(early_init_dt_scan_memory_ppc, NULL);
+	early_init_dt_scan_memory_ppc();
 
 	parse_early_param();
 
@@ -858,7 +858,7 @@ void __init early_get_first_memblock_info(void *params, phys_addr_t *size)
 	 */
 	add_mem_to_memblock = 0;
 	early_init_dt_scan_root();
-	of_scan_flat_dt(early_init_dt_scan_memory_ppc, NULL);
+	early_init_dt_scan_memory_ppc();
 	add_mem_to_memblock = 1;
 
 	if (size)
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 5e216555fe4f..a799117886f4 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1078,49 +1078,53 @@ u64 __init dt_mem_next_cell(int s, const __be32 **cellp)
 /*
  * early_init_dt_scan_memory - Look for and parse memory nodes
  */
-int __init early_init_dt_scan_memory(unsigned long node, const char *uname,
-				     int depth, void *data)
+int __init early_init_dt_scan_memory(void)
 {
-	const char *type = of_get_flat_dt_prop(node, "device_type", NULL);
-	const __be32 *reg, *endp;
-	int l;
-	bool hotpluggable;
+	int node;
+	const void *fdt = initial_boot_params;
 
-	/* We are scanning "memory" nodes only */
-	if (type == NULL || strcmp(type, "memory") != 0)
-		return 0;
+	fdt_for_each_subnode(node, fdt, 0) {
+		const char *type = of_get_flat_dt_prop(node, "device_type", NULL);
+		const __be32 *reg, *endp;
+		int l;
+		bool hotpluggable;
 
-	reg = of_get_flat_dt_prop(node, "linux,usable-memory", &l);
-	if (reg == NULL)
-		reg = of_get_flat_dt_prop(node, "reg", &l);
-	if (reg == NULL)
-		return 0;
+		/* We are scanning "memory" nodes only */
+		if (type == NULL || strcmp(type, "memory") != 0)
+			continue;
 
-	endp = reg + (l / sizeof(__be32));
-	hotpluggable = of_get_flat_dt_prop(node, "hotpluggable", NULL);
+		reg = of_get_flat_dt_prop(node, "linux,usable-memory", &l);
+		if (reg == NULL)
+			reg = of_get_flat_dt_prop(node, "reg", &l);
+		if (reg == NULL)
+			return 0;
 
-	pr_debug("memory scan node %s, reg size %d,\n", uname, l);
+		endp = reg + (l / sizeof(__be32));
+		hotpluggable = of_get_flat_dt_prop(node, "hotpluggable", NULL);
 
-	while ((endp - reg) >= (dt_root_addr_cells + dt_root_size_cells)) {
-		u64 base, size;
+		pr_debug("memory scan node %s, reg size %d,\n",
+			fdt_get_name(fdt, node, NULL), l);
 
-		base = dt_mem_next_cell(dt_root_addr_cells, &reg);
-		size = dt_mem_next_cell(dt_root_size_cells, &reg);
+		while ((endp - reg) >= (dt_root_addr_cells + dt_root_size_cells)) {
+			u64 base, size;
 
-		if (size == 0)
-			continue;
-		pr_debug(" - %llx, %llx\n", base, size);
+			base = dt_mem_next_cell(dt_root_addr_cells, &reg);
+			size = dt_mem_next_cell(dt_root_size_cells, &reg);
 
-		early_init_dt_add_memory_arch(base, size);
+			if (size == 0)
+				continue;
+			pr_debug(" - %llx, %llx\n", base, size);
 
-		if (!hotpluggable)
-			continue;
+			early_init_dt_add_memory_arch(base, size);
 
-		if (memblock_mark_hotplug(base, size))
-			pr_warn("failed to mark hotplug range 0x%llx - 0x%llx\n",
-				base, base + size);
-	}
+			if (!hotpluggable)
+				continue;
 
+			if (memblock_mark_hotplug(base, size))
+				pr_warn("failed to mark hotplug range 0x%llx - 0x%llx\n",
+					base, base + size);
+		}
+	}
 	return 0;
 }
 
@@ -1271,7 +1275,7 @@ void __init early_init_dt_scan_nodes(void)
 		pr_warn("No chosen node found, continuing without\n");
 
 	/* Setup memory, calling early_init_dt_add_memory_arch */
-	of_scan_flat_dt(early_init_dt_scan_memory, NULL);
+	early_init_dt_scan_memory();
 
 	/* Handle linux,usable-memory-range property */
 	memblock_cap_memory_range(cap_mem_addr, cap_mem_size);
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index df3d31926c3c..914739f3c192 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -59,8 +59,7 @@ extern unsigned long of_get_flat_dt_root(void);
 extern uint32_t of_get_flat_dt_phandle(unsigned long node);
 
 extern int early_init_dt_scan_chosen(char *cmdline);
-extern int early_init_dt_scan_memory(unsigned long node, const char *uname,
-				     int depth, void *data);
+extern int early_init_dt_scan_memory(void);
 extern int early_init_dt_scan_chosen_stdout(void);
 extern void early_init_fdt_scan_reserved_mem(void);
 extern void early_init_fdt_reserve_self(void);
-- 
2.32.0

