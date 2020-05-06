Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 407931C6C6F
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2020 11:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728571AbgEFJJ6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 May 2020 05:09:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728474AbgEFJJ6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 May 2020 05:09:58 -0400
X-Greylist: delayed 301 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 06 May 2020 02:09:58 PDT
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46769C061A0F
        for <linux-mips@vger.kernel.org>; Wed,  6 May 2020 02:09:58 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:bd97:8453:3b10:1832])
        by michel.telenet-ops.be with bizsmtp
        id bM4u220093VwRR306M4uV3; Wed, 06 May 2020 11:04:54 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jWFz4-00041M-7U; Wed, 06 May 2020 11:04:54 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jWFz4-0000LY-4n; Wed, 06 May 2020 11:04:54 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] MIPS: ingenic: Replace <linux/clk-provider.h> by <linux/of_clk.h>
Date:   Wed,  6 May 2020 11:04:52 +0200
Message-Id: <20200506090452.1290-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The JZ4740 setup code is not a clock provider, and just needs to call
of_clk_init().

Hence it can include <linux/of_clk.h> instead of <linux/clk-provider.h>.

Fixes: f932449c11dabb4b ("MIPS: ingenic: Drop obsolete code, merge the rest in setup.c")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/mips/jz4740/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/jz4740/setup.c b/arch/mips/jz4740/setup.c
index 81428ddcaa9736f9..142cf127bf9e1c9f 100644
--- a/arch/mips/jz4740/setup.c
+++ b/arch/mips/jz4740/setup.c
@@ -5,13 +5,13 @@
  *  JZ4740 setup code
  */
 
-#include <linux/clk-provider.h>
 #include <linux/clocksource.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/irqchip.h>
 #include <linux/kernel.h>
 #include <linux/libfdt.h>
+#include <linux/of_clk.h>
 #include <linux/of_fdt.h>
 #include <linux/pm.h>
 #include <linux/suspend.h>
-- 
2.17.1

