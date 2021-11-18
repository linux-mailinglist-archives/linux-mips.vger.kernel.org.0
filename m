Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31DC345620C
	for <lists+linux-mips@lfdr.de>; Thu, 18 Nov 2021 19:12:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231650AbhKRSPS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 18 Nov 2021 13:15:18 -0500
Received: from mail-oo1-f52.google.com ([209.85.161.52]:40862 "EHLO
        mail-oo1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231467AbhKRSPR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 18 Nov 2021 13:15:17 -0500
Received: by mail-oo1-f52.google.com with SMTP id m37-20020a4a9528000000b002b83955f771so2726323ooi.7;
        Thu, 18 Nov 2021 10:12:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G/rDT7Ch22cRv8ocwTIplCJIJgVz/+NCSfa9ah97YsE=;
        b=kpSjYj0ih0OqJv8EmjJNMz86zgADAnjEkz9OfedxhOd/zhQbfNpX+PWka8yTj9PL4D
         HfMoN0SumFR5i+9wrSJrLsofI08K+H2T8TxFiSNyYHtGPaGbWgJlZNC00pLPNXINppQb
         WwNyP9GYuekxgf7rPNtW/EE2X5daRen83F+2NgZRovn4aNTZaPEeHlmd9gq0lUT+gvzi
         SxFDPdZO8rQpwRbd+zlXIgA4qv0jnTHAyyhiW5/KaGFLbjcQheFKX0Rt5vowAS2PMcXo
         cRiW5mhzrYDHLA5tvQs/dGhulw2dIDyxAAnHkEh+vBSyWXfxZnI0DuFGL/zf7vt4J/Pt
         DKtA==
X-Gm-Message-State: AOAM531t4zHkc479LcNRTFI3jViZHPNMr6UYntxGjKULdlEPfirWJrTA
        qpETPUCGDVnWa/K/hM3FgQ==
X-Google-Smtp-Source: ABdhPJyL/SlOyJsSGpmvSajfOGfDWDXAiWYA9MuwFEUsGar/48u2hwyBPRUwD7lVoJi4p5yXKpuwpg==
X-Received: by 2002:a4a:d00a:: with SMTP id h10mr14268325oor.60.1637259136784;
        Thu, 18 Nov 2021 10:12:16 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id n20sm99339ooe.7.2021.11.18.10.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 10:12:15 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Frank Rowand <frowand.list@gmail.com>,
        John Crispin <john@phrozen.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] of/fdt: Rework early_init_dt_scan_chosen() to call directly
Date:   Thu, 18 Nov 2021 12:12:10 -0600
Message-Id: <20211118181213.1433346-2-robh@kernel.org>
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
early_init_dt_scan_chosen() to be called directly and use libfdt.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/powerpc/kernel/prom.c           |  2 +-
 arch/powerpc/mm/nohash/kaslr_booke.c |  4 +--
 drivers/of/fdt.c                     | 39 ++++++++++++++--------------
 include/linux/of_fdt.h               |  3 +--
 4 files changed, 22 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 2e67588f6f6e..c6c398ccd98a 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -402,7 +402,7 @@ static int __init early_init_dt_scan_chosen_ppc(unsigned long node,
 	const unsigned long *lprop; /* All these set by kernel, so no need to convert endian */
 
 	/* Use common scan routine to determine if this is the chosen node */
-	if (early_init_dt_scan_chosen(node, uname, depth, data) == 0)
+	if (early_init_dt_scan_chosen(data) < 0)
 		return 0;
 
 #ifdef CONFIG_PPC64
diff --git a/arch/powerpc/mm/nohash/kaslr_booke.c b/arch/powerpc/mm/nohash/kaslr_booke.c
index 8fc49b1b4a91..90debe19ab4c 100644
--- a/arch/powerpc/mm/nohash/kaslr_booke.c
+++ b/arch/powerpc/mm/nohash/kaslr_booke.c
@@ -44,9 +44,7 @@ struct regions __initdata regions;
 
 static __init void kaslr_get_cmdline(void *fdt)
 {
-	int node = fdt_path_offset(fdt, "/chosen");
-
-	early_init_dt_scan_chosen(node, "chosen", 1, boot_command_line);
+	early_init_dt_scan_chosen(boot_command_line);
 }
 
 static unsigned long __init rotate_xor(unsigned long hash, const void *area,
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index bdca35284ceb..1f1705f76263 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1124,18 +1124,18 @@ int __init early_init_dt_scan_memory(unsigned long node, const char *uname,
 	return 0;
 }
 
-int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
-				     int depth, void *data)
+int __init early_init_dt_scan_chosen(char *cmdline)
 {
-	int l;
+	int l, node;
 	const char *p;
 	const void *rng_seed;
+	const void *fdt = initial_boot_params;
 
-	pr_debug("search \"chosen\", depth: %d, uname: %s\n", depth, uname);
-
-	if (depth != 1 || !data ||
-	    (strcmp(uname, "chosen") != 0 && strcmp(uname, "chosen@0") != 0))
-		return 0;
+	node = fdt_path_offset(fdt, "/chosen");
+	if (node < 0)
+		node = fdt_path_offset(fdt, "/chosen@0");
+	if (node < 0)
+		return -ENOENT;
 
 	early_init_dt_check_for_initrd(node);
 	early_init_dt_check_for_elfcorehdr(node);
@@ -1144,7 +1144,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 	/* Retrieve command line */
 	p = of_get_flat_dt_prop(node, "bootargs", &l);
 	if (p != NULL && l > 0)
-		strlcpy(data, p, min(l, COMMAND_LINE_SIZE));
+		strlcpy(cmdline, p, min(l, COMMAND_LINE_SIZE));
 
 	/*
 	 * CONFIG_CMDLINE is meant to be a default in case nothing else
@@ -1153,18 +1153,18 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 	 */
 #ifdef CONFIG_CMDLINE
 #if defined(CONFIG_CMDLINE_EXTEND)
-	strlcat(data, " ", COMMAND_LINE_SIZE);
-	strlcat(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
+	strlcat(cmdline, " ", COMMAND_LINE_SIZE);
+	strlcat(cmdline, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
 #elif defined(CONFIG_CMDLINE_FORCE)
-	strlcpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
+	strlcpy(cmdline, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
 #else
 	/* No arguments from boot loader, use kernel's  cmdl*/
-	if (!((char *)data)[0])
-		strlcpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
+	if (!((char *)cmdline)[0])
+		strlcpy(cmdline, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
 #endif
 #endif /* CONFIG_CMDLINE */
 
-	pr_debug("Command line is: %s\n", (char *)data);
+	pr_debug("Command line is: %s\n", (char *)cmdline);
 
 	rng_seed = of_get_flat_dt_prop(node, "rng-seed", &l);
 	if (rng_seed && l > 0) {
@@ -1178,8 +1178,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 				fdt_totalsize(initial_boot_params));
 	}
 
-	/* break now */
-	return 1;
+	return 0;
 }
 
 #ifndef MIN_MEMBLOCK_ADDR
@@ -1261,14 +1260,14 @@ bool __init early_init_dt_verify(void *params)
 
 void __init early_init_dt_scan_nodes(void)
 {
-	int rc = 0;
+	int rc;
 
 	/* Initialize {size,address}-cells info */
 	of_scan_flat_dt(early_init_dt_scan_root, NULL);
 
 	/* Retrieve various information from the /chosen node */
-	rc = of_scan_flat_dt(early_init_dt_scan_chosen, boot_command_line);
-	if (!rc)
+	rc = early_init_dt_scan_chosen(boot_command_line);
+	if (rc)
 		pr_warn("No chosen node found, continuing without\n");
 
 	/* Setup memory, calling early_init_dt_add_memory_arch */
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index cf48983d3c86..654722235df6 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -58,8 +58,7 @@ extern int of_flat_dt_is_compatible(unsigned long node, const char *name);
 extern unsigned long of_get_flat_dt_root(void);
 extern uint32_t of_get_flat_dt_phandle(unsigned long node);
 
-extern int early_init_dt_scan_chosen(unsigned long node, const char *uname,
-				     int depth, void *data);
+extern int early_init_dt_scan_chosen(char *cmdline);
 extern int early_init_dt_scan_memory(unsigned long node, const char *uname,
 				     int depth, void *data);
 extern int early_init_dt_scan_chosen_stdout(void);
-- 
2.32.0

