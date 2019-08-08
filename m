Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC28B85C36
	for <lists+linux-mips@lfdr.de>; Thu,  8 Aug 2019 09:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731752AbfHHH6j (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Aug 2019 03:58:39 -0400
Received: from forward101o.mail.yandex.net ([37.140.190.181]:33782 "EHLO
        forward101o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731588AbfHHH6j (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Aug 2019 03:58:39 -0400
X-Greylist: delayed 446 seconds by postgrey-1.27 at vger.kernel.org; Thu, 08 Aug 2019 03:58:37 EDT
Received: from mxback20g.mail.yandex.net (mxback20g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:320])
        by forward101o.mail.yandex.net (Yandex) with ESMTP id C361E3C014C5;
        Thu,  8 Aug 2019 10:52:04 +0300 (MSK)
Received: from smtp2o.mail.yandex.net (smtp2o.mail.yandex.net [2a02:6b8:0:1a2d::26])
        by mxback20g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id 0aEjnyfQQs-q4LegEjt;
        Thu, 08 Aug 2019 10:52:04 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1565250724;
        bh=aCra1My9ERt/6aHL2hojQbanGUf8/BTypORYKxTIGaI=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=ZIbEOQ2wMJECNOijZtOQidPVjna6t4/g2uuaFw2av6N0khvx565UfFYSzr/mt6ktZ
         QqciP8KHJp/9t2qL+kpcbvLWU44V+lsW0IFeYD3kxt1SbvDgSJy9+GLIK3B1XVm+6k
         y++N60f+MfDl/CQpPwdAJ16GZaxaeiJIsTvkY1CE=
Authentication-Results: mxback20g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp2o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id 03dF3Y2ufp-pugunInj;
        Thu, 08 Aug 2019 10:52:02 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     paul.burton@mips.com, yasha.che3@gmail.com, aurelien@aurel32.net,
        sfr@canb.auug.org.au, fancer.lancer@gmail.com,
        matt.redfearn@mips.com, chenhc@lemote.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 6/7] MIPS: ip22: Drop addr_is_ram
Date:   Thu,  8 Aug 2019 15:50:12 +0800
Message-Id: <20190808075013.4852-7-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190808075013.4852-1-jiaxun.yang@flygoat.com>
References: <20190808075013.4852-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

It can be replaced by memblock_is_region_memory.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/sgi-ip22/ip28-berr.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/arch/mips/sgi-ip22/ip28-berr.c b/arch/mips/sgi-ip22/ip28-berr.c
index c0cf7baee36d..d4150ab8d140 100644
--- a/arch/mips/sgi-ip22/ip28-berr.c
+++ b/arch/mips/sgi-ip22/ip28-berr.c
@@ -12,6 +12,7 @@
 #include <linux/sched/debug.h>
 #include <linux/sched/signal.h>
 #include <linux/seq_file.h>
+#include <linux/memblock.h>
 
 #include <asm/addrspace.h>
 #include <asm/traps.h>
@@ -300,23 +301,6 @@ static void print_buserr(const struct pt_regs *regs)
 	       field, regs->cp0_epc, field, regs->regs[31]);
 }
 
-/*
- * Check, whether MC's (virtual) DMA address caused the bus error.
- * See "Virtual DMA Specification", Draft 1.5, Feb 13 1992, SGI
- */
-
-static int addr_is_ram(unsigned long addr, unsigned sz)
-{
-	int i;
-
-	for (i = 0; i < boot_mem_map.nr_map; i++) {
-		unsigned long a = boot_mem_map.map[i].addr;
-		if (a <= addr && addr+sz <= a+boot_mem_map.map[i].size)
-			return 1;
-	}
-	return 0;
-}
-
 static int check_microtlb(u32 hi, u32 lo, unsigned long vaddr)
 {
 	/* This is likely rather similar to correct code ;-) */
@@ -331,7 +315,7 @@ static int check_microtlb(u32 hi, u32 lo, unsigned long vaddr)
 			/* PTEIndex is VPN-low (bits [22:14]/[20:12] ?) */
 			unsigned long pte = (lo >> 6) << 12; /* PTEBase */
 			pte += 8*((vaddr >> pgsz) & 0x1ff);
-			if (addr_is_ram(pte, 8)) {
+			if (memblock_is_region_memory(pte, 8)) {
 				/*
 				 * Note: Since DMA hardware does look up
 				 * translation on its own, this PTE *must*
-- 
2.22.0

