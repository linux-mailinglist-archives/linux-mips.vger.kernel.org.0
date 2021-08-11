Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 069A63E8C8B
	for <lists+linux-mips@lfdr.de>; Wed, 11 Aug 2021 10:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236356AbhHKIwR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Aug 2021 04:52:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233053AbhHKIwB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Aug 2021 04:52:01 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E875AC061381
        for <linux-mips@vger.kernel.org>; Wed, 11 Aug 2021 01:51:35 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
        by baptiste.telenet-ops.be with bizsmtp
        id g8rG2500C1gJxCh018rG4A; Wed, 11 Aug 2021 10:51:33 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mDjxE-001yaD-6N; Wed, 11 Aug 2021 10:51:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mDjxD-0058x9-D1; Wed, 11 Aug 2021 10:51:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Kossifidis <mick@ics.forth.gr>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Frank Rowand <frowand.list@gmail.com>,
        Dave Young <dyoung@redhat.com>
Cc:     Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
        Mike Rapoport <rppt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v5 5/9] of: fdt: Use IS_ENABLED(CONFIG_BLK_DEV_INITRD) instead of #ifdef
Date:   Wed, 11 Aug 2021 10:51:03 +0200
Message-Id: <604c13747f09d800da6a7c12f661e1ec146f1dfd.1628670468.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628670468.git.geert+renesas@glider.be>
References: <cover.1628670468.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Replace the conditional compilation using "#ifdef CONFIG_BLK_DEV_INITRD"
by a check for "IS_ENABLED(CONFIG_BLK_DEV_INITRD)", to increase compile
coverage and to simplify the code.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v5:
  - No changes,

v4:
  - New.
---
 drivers/of/fdt.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index bc041d8141e86e62..0142b9334559baec 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -880,7 +880,6 @@ const void * __init of_flat_dt_match_machine(const void *default_match,
 	return best_data;
 }
 
-#ifdef CONFIG_BLK_DEV_INITRD
 static void __early_init_dt_declare_initrd(unsigned long start,
 					   unsigned long end)
 {
@@ -906,6 +905,9 @@ static void __init early_init_dt_check_for_initrd(unsigned long node)
 	int len;
 	const __be32 *prop;
 
+	if (!IS_ENABLED(CONFIG_BLK_DEV_INITRD))
+		return;
+
 	pr_debug("Looking for initrd properties... ");
 
 	prop = of_get_flat_dt_prop(node, "linux,initrd-start", &len);
@@ -924,11 +926,6 @@ static void __init early_init_dt_check_for_initrd(unsigned long node)
 
 	pr_debug("initrd_start=0x%llx  initrd_end=0x%llx\n", start, end);
 }
-#else
-static inline void early_init_dt_check_for_initrd(unsigned long node)
-{
-}
-#endif /* CONFIG_BLK_DEV_INITRD */
 
 /**
  * early_init_dt_check_for_elfcorehdr - Decode elfcorehdr location from flat
-- 
2.25.1

