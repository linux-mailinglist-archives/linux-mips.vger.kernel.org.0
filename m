Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE11B283394
	for <lists+linux-mips@lfdr.de>; Mon,  5 Oct 2020 11:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbgJEJsV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Oct 2020 05:48:21 -0400
Received: from mx2.suse.de ([195.135.220.15]:48854 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725887AbgJEJsV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 5 Oct 2020 05:48:21 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 12DC6AD1A;
        Mon,  5 Oct 2020 09:48:19 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: alchemy: Share prom_init implementation
Date:   Mon,  5 Oct 2020 11:48:14 +0200
Message-Id: <20201005094815.49773-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

All boards have the same prom_init() function. Move it to common code and
delete the duplicates.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/alchemy/board-gpr.c          | 17 -----------------
 arch/mips/alchemy/board-mtx1.c         | 17 -----------------
 arch/mips/alchemy/board-xxs1500.c      | 18 ------------------
 arch/mips/alchemy/common/prom.c        | 20 ++++++++++++++++++++
 arch/mips/alchemy/devboards/platform.c | 17 -----------------
 5 files changed, 20 insertions(+), 69 deletions(-)

diff --git a/arch/mips/alchemy/board-gpr.c b/arch/mips/alchemy/board-gpr.c
index 6c47318946e4..f587c40b6d00 100644
--- a/arch/mips/alchemy/board-gpr.c
+++ b/arch/mips/alchemy/board-gpr.c
@@ -31,23 +31,6 @@ const char *get_system_type(void)
 	return "GPR";
 }
 
-void __init prom_init(void)
-{
-	unsigned char *memsize_str;
-	unsigned long memsize;
-
-	prom_argc = fw_arg0;
-	prom_argv = (char **)fw_arg1;
-	prom_envp = (char **)fw_arg2;
-
-	prom_init_cmdline();
-
-	memsize_str = prom_getenv("memsize");
-	if (!memsize_str || kstrtoul(memsize_str, 0, &memsize))
-		memsize = 0x04000000;
-	add_memory_region(0, memsize, BOOT_MEM_RAM);
-}
-
 void prom_putchar(char c)
 {
 	alchemy_uart_putchar(AU1000_UART0_PHYS_ADDR, c);
diff --git a/arch/mips/alchemy/board-mtx1.c b/arch/mips/alchemy/board-mtx1.c
index 23093535399f..68ea57511629 100644
--- a/arch/mips/alchemy/board-mtx1.c
+++ b/arch/mips/alchemy/board-mtx1.c
@@ -30,23 +30,6 @@ const char *get_system_type(void)
 	return "MTX-1";
 }
 
-void __init prom_init(void)
-{
-	unsigned char *memsize_str;
-	unsigned long memsize;
-
-	prom_argc = fw_arg0;
-	prom_argv = (char **)fw_arg1;
-	prom_envp = (char **)fw_arg2;
-
-	prom_init_cmdline();
-
-	memsize_str = prom_getenv("memsize");
-	if (!memsize_str || kstrtoul(memsize_str, 0, &memsize))
-		memsize = 0x04000000;
-	add_memory_region(0, memsize, BOOT_MEM_RAM);
-}
-
 void prom_putchar(char c)
 {
 	alchemy_uart_putchar(AU1000_UART0_PHYS_ADDR, c);
diff --git a/arch/mips/alchemy/board-xxs1500.c b/arch/mips/alchemy/board-xxs1500.c
index c67dfe1f4997..b184baa4e56a 100644
--- a/arch/mips/alchemy/board-xxs1500.c
+++ b/arch/mips/alchemy/board-xxs1500.c
@@ -25,24 +25,6 @@ const char *get_system_type(void)
 	return "XXS1500";
 }
 
-void __init prom_init(void)
-{
-	unsigned char *memsize_str;
-	unsigned long memsize;
-
-	prom_argc = fw_arg0;
-	prom_argv = (char **)fw_arg1;
-	prom_envp = (char **)fw_arg2;
-
-	prom_init_cmdline();
-
-	memsize_str = prom_getenv("memsize");
-	if (!memsize_str || kstrtoul(memsize_str, 0, &memsize))
-		memsize = 0x04000000;
-
-	add_memory_region(0, memsize, BOOT_MEM_RAM);
-}
-
 void prom_putchar(char c)
 {
 	alchemy_uart_putchar(AU1000_UART0_PHYS_ADDR, c);
diff --git a/arch/mips/alchemy/common/prom.c b/arch/mips/alchemy/common/prom.c
index af312b5e33f6..cfa203064d3c 100644
--- a/arch/mips/alchemy/common/prom.c
+++ b/arch/mips/alchemy/common/prom.c
@@ -34,6 +34,8 @@
  */
 
 #include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/sizes.h>
 #include <linux/string.h>
 
 #include <asm/bootinfo.h>
@@ -76,6 +78,24 @@ char *prom_getenv(char *envname)
 	return NULL;
 }
 
+void __init prom_init(void)
+{
+	unsigned char *memsize_str;
+	unsigned long memsize;
+
+	prom_argc = (int)fw_arg0;
+	prom_argv = (char **)fw_arg1;
+	prom_envp = (char **)fw_arg2;
+
+	prom_init_cmdline();
+
+	memsize_str = prom_getenv("memsize");
+	if (!memsize_str || kstrtoul(memsize_str, 0, &memsize))
+		memsize = SZ_64M; /* minimum memsize is 64MB RAM */
+
+	add_memory_region(0, memsize, BOOT_MEM_RAM);
+}
+
 static inline unsigned char str2hexnum(unsigned char c)
 {
 	if (c >= '0' && c <= '9')
diff --git a/arch/mips/alchemy/devboards/platform.c b/arch/mips/alchemy/devboards/platform.c
index 8d4b65c3268a..754bdd2ca630 100644
--- a/arch/mips/alchemy/devboards/platform.c
+++ b/arch/mips/alchemy/devboards/platform.c
@@ -20,23 +20,6 @@
 
 #include <prom.h>
 
-void __init prom_init(void)
-{
-	unsigned char *memsize_str;
-	unsigned long memsize;
-
-	prom_argc = (int)fw_arg0;
-	prom_argv = (char **)fw_arg1;
-	prom_envp = (char **)fw_arg2;
-
-	prom_init_cmdline();
-	memsize_str = prom_getenv("memsize");
-	if (!memsize_str || kstrtoul(memsize_str, 0, &memsize))
-		memsize = 64 << 20; /* all devboards have at least 64MB RAM */
-
-	add_memory_region(0, memsize, BOOT_MEM_RAM);
-}
-
 void prom_putchar(char c)
 {
 	if (alchemy_get_cputype() == ALCHEMY_CPU_AU1300)
-- 
2.16.4

