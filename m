Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C56592695
	for <lists+linux-mips@lfdr.de>; Mon, 19 Aug 2019 16:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbfHSOX5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Aug 2019 10:23:57 -0400
Received: from forward102p.mail.yandex.net ([77.88.28.102]:34925 "EHLO
        forward102p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726186AbfHSOX5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 19 Aug 2019 10:23:57 -0400
Received: from mxback20g.mail.yandex.net (mxback20g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:320])
        by forward102p.mail.yandex.net (Yandex) with ESMTP id 564891D415AA;
        Mon, 19 Aug 2019 17:23:54 +0300 (MSK)
Received: from smtp1o.mail.yandex.net (smtp1o.mail.yandex.net [2a02:6b8:0:1a2d::25])
        by mxback20g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id iDILPg74VJ-NruKAx01;
        Mon, 19 Aug 2019 17:23:54 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1566224634;
        bh=69rubySvm+GCjkbI4Uzz8s5Udpk7VpmXAJTjsm7auGg=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=fG40C8YjKwBxi3nkQORuOITQqNg0OT8ZFOXP/r5j2i2Ji4bUUQ9vI5ZKl37bpJc2n
         ZiINNQ5ubC16/RRdLYspEX5d7o/9JuMOFuORYOMeL8Tj9AnXt0mjh3fidx3J1u9XUF
         QePQaiTF79YSRrawJfcDLSQfm0Hl4+fGeqhbzBaM=
Authentication-Results: mxback20g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp1o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id StE3L42zOl-NnUmd3pw;
        Mon, 19 Aug 2019 17:23:52 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     paul.burton@mips.com, yasha.che3@gmail.com, aurelien@aurel32.net,
        sfr@canb.auug.org.au, fancer.lancer@gmail.com,
        matt.redfearn@mips.com, chenhc@lemote.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v1 5/8] MIPS: ip22: Drop addr_is_ram
Date:   Mon, 19 Aug 2019 22:23:10 +0800
Message-Id: <20190819142313.3535-6-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190819142313.3535-1-jiaxun.yang@flygoat.com>
References: <20190819142313.3535-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

It can be replaced by page_is_ram.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/sgi-ip22/ip28-berr.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/arch/mips/sgi-ip22/ip28-berr.c b/arch/mips/sgi-ip22/ip28-berr.c
index c0cf7baee36d..c61362d9ea95 100644
--- a/arch/mips/sgi-ip22/ip28-berr.c
+++ b/arch/mips/sgi-ip22/ip28-berr.c
@@ -8,6 +8,7 @@
 
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/mm.h>
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
 #include <linux/sched/signal.h>
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
+			if (page_is_ram(PFN_DOWN(pte))) {
 				/*
 				 * Note: Since DMA hardware does look up
 				 * translation on its own, this PTE *must*
-- 
2.22.0

