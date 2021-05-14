Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E5D738073B
	for <lists+linux-mips@lfdr.de>; Fri, 14 May 2021 12:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230217AbhENKc5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 May 2021 06:32:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:42760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229973AbhENKc5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 14 May 2021 06:32:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BB0B7611AB;
        Fri, 14 May 2021 10:31:44 +0000 (UTC)
From:   Huacai Chen <chenhuacai@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@loongson.cn>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] MIPS: Loongson64: Remove a "set but not used" variable
Date:   Fri, 14 May 2021 18:32:17 +0800
Message-Id: <20210514103217.2051315-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This fix build warning:

   arch/mips/loongson64/env.c: In function 'prom_init_env':
>> arch/mips/loongson64/env.c:50:14: warning: variable 'device' set but not used [-Wunused-but-set-variable]
      50 |  u16 vendor, device;
         |              ^~~~~~
   {standard input}: Assembler messages:
   {standard input}:788: Error: found '(', expected: ')'
   {standard input}:788: Error: found '(', expected: ')'
   {standard input}:788: Error: non-constant expression in ".if" statement
   {standard input}:788: Error: junk at end of line, first unrecognized character is `('
   {standard input}:801: Error: found '(', expected: ')'
   {standard input}:801: Error: found '(', expected: ')'
   {standard input}:801: Error: non-constant expression in ".if" statement
   {standard input}:801: Error: junk at end of line, first unrecognized character is `('

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/mips/loongson64/env.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
index c8bb75d58f17..c961e2999f15 100644
--- a/arch/mips/loongson64/env.c
+++ b/arch/mips/loongson64/env.c
@@ -62,7 +62,7 @@ void __init prom_lefi_init_env(void)
 	struct efi_cpuinfo_loongson *ecpu;
 	struct irq_source_routing_table *eirq_source;
 	u32 id;
-	u16 vendor, device;
+	u16 vendor;
 
 	/* firmware arguments are initialized in head.S */
 	boot_p = (struct boot_params *)fw_arg2;
@@ -166,7 +166,6 @@ void __init prom_lefi_init_env(void)
 	/* Read the ID of PCI host bridge to detect bridge type */
 	id = readl(HOST_BRIDGE_CONFIG_ADDR);
 	vendor = id & 0xffff;
-	device = (id >> 16) & 0xffff;
 
 	switch (vendor) {
 	case PCI_VENDOR_ID_LOONGSON:
-- 
2.27.0

