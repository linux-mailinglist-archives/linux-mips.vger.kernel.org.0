Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE32E4591B3
	for <lists+linux-mips@lfdr.de>; Mon, 22 Nov 2021 16:54:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240022AbhKVP5J (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Nov 2021 10:57:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240048AbhKVP5I (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 22 Nov 2021 10:57:08 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79C08C061714
        for <linux-mips@vger.kernel.org>; Mon, 22 Nov 2021 07:54:01 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:e4da:38c:79e9:48bf])
        by andre.telenet-ops.be with bizsmtp
        id MTty2600n4yPVd601TtyLD; Mon, 22 Nov 2021 16:53:59 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mpBdm-00EL1l-Fv; Mon, 22 Nov 2021 16:53:58 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mpBdm-00HGkw-2p; Mon, 22 Nov 2021 16:53:58 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] MIPS: CPC: Use bitfield helpers
Date:   Mon, 22 Nov 2021 16:53:46 +0100
Message-Id: <35f0f17e3d987afaa9cd09cdcb8131d42a53c3e1.1637593297.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <a1445d3abb45cfc95cb1b03180fd53caf122035b.1637593297.git.geert+renesas@glider.be>
References: <a1445d3abb45cfc95cb1b03180fd53caf122035b.1637593297.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use the FIELD_PREP() helper, instead of open-coding the same operation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.

See "[PATCH 00/17] Non-const bitfield helper conversions"
(https://lore.kernel.org/r/cover.1637592133.git.geert+renesas@glider.be)
for background and more conversions.
---
 arch/mips/kernel/mips-cpc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/mips-cpc.c b/arch/mips/kernel/mips-cpc.c
index 8d2535123f11c8f3..17aff13cd7ce6ea7 100644
--- a/arch/mips/kernel/mips-cpc.c
+++ b/arch/mips/kernel/mips-cpc.c
@@ -4,6 +4,7 @@
  * Author: Paul Burton <paul.burton@mips.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/errno.h>
 #include <linux/percpu.h>
 #include <linux/of.h>
@@ -97,7 +98,7 @@ void mips_cpc_lock_other(unsigned int core)
 	curr_core = cpu_core(&current_cpu_data);
 	spin_lock_irqsave(&per_cpu(cpc_core_lock, curr_core),
 			  per_cpu(cpc_core_lock_flags, curr_core));
-	write_cpc_cl_other(core << __ffs(CPC_Cx_OTHER_CORENUM));
+	write_cpc_cl_other(FIELD_PREP(CPC_Cx_OTHER_CORENUM, core));
 
 	/*
 	 * Ensure the core-other region reflects the appropriate core &
-- 
2.25.1

