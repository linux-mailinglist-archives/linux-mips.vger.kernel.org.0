Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D30D34591BC
	for <lists+linux-mips@lfdr.de>; Mon, 22 Nov 2021 16:54:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240070AbhKVP5S (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Nov 2021 10:57:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240085AbhKVP5Q (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 22 Nov 2021 10:57:16 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53A1EC061714
        for <linux-mips@vger.kernel.org>; Mon, 22 Nov 2021 07:54:09 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:e4da:38c:79e9:48bf])
        by andre.telenet-ops.be with bizsmtp
        id MTu82600i4yPVd601Tu8P6; Mon, 22 Nov 2021 16:54:09 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mpBdw-00EL2i-KM; Mon, 22 Nov 2021 16:54:08 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mpBdv-00HGsc-NS; Mon, 22 Nov 2021 16:54:07 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] irqchip/mips-gic: Use bitfield helpers
Date:   Mon, 22 Nov 2021 16:54:07 +0100
Message-Id: <74f9d126961a90d3e311b92a54870eaac5b3ae57.1637593297.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <a1445d3abb45cfc95cb1b03180fd53caf122035b.1637593297.git.geert+renesas@glider.be>
References: <a1445d3abb45cfc95cb1b03180fd53caf122035b.1637593297.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use the FIELD_GET() helper, instead of open-coding the same operation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.

See "[PATCH 00/17] Non-const bitfield helper conversions"
(https://lore.kernel.org/r/cover.1637592133.git.geert+renesas@glider.be)
for background and more conversions.
---
 drivers/irqchip/irq-mips-gic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index d02b05a067d950a0..ff89b36267dd4955 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -9,6 +9,7 @@
 
 #define pr_fmt(fmt) "irq-mips-gic: " fmt
 
+#include <linux/bitfield.h>
 #include <linux/bitmap.h>
 #include <linux/clocksource.h>
 #include <linux/cpuhotplug.h>
@@ -735,8 +736,7 @@ static int __init gic_of_init(struct device_node *node,
 	mips_gic_base = ioremap(gic_base, gic_len);
 
 	gicconfig = read_gic_config();
-	gic_shared_intrs = gicconfig & GIC_CONFIG_NUMINTERRUPTS;
-	gic_shared_intrs >>= __ffs(GIC_CONFIG_NUMINTERRUPTS);
+	gic_shared_intrs = FIELD_GET(GIC_CONFIG_NUMINTERRUPTS, gicconfig);
 	gic_shared_intrs = (gic_shared_intrs + 1) * 8;
 
 	if (cpu_has_veic) {
-- 
2.25.1

