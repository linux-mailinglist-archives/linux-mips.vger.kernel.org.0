Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99466284CC3
	for <lists+linux-mips@lfdr.de>; Tue,  6 Oct 2020 15:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgJFN6m (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Oct 2020 09:58:42 -0400
Received: from mx2.suse.de ([195.135.220.15]:37932 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725902AbgJFN6m (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 6 Oct 2020 09:58:42 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 8CEC4AEC4;
        Tue,  6 Oct 2020 13:58:40 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: tx49xx: move tx4939_add_memory_regions into only user
Date:   Tue,  6 Oct 2020 15:58:37 +0200
Message-Id: <20201006135838.9920-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

tx4939_add_memory_regions() is only used in txx9/rbtx4939/prom.c.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/include/asm/txx9/tx4939.h   |  1 -
 arch/mips/txx9/generic/setup_tx4939.c | 17 -----------------
 arch/mips/txx9/rbtx4939/prom.c        | 14 +++++++++++++-
 3 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/arch/mips/include/asm/txx9/tx4939.h b/arch/mips/include/asm/txx9/tx4939.h
index 00805ac6e9fc..abf980af9ef4 100644
--- a/arch/mips/include/asm/txx9/tx4939.h
+++ b/arch/mips/include/asm/txx9/tx4939.h
@@ -498,7 +498,6 @@ struct tx4939_vpc_desc {
 	((((mst) + 245/2) / 245UL * 429 * 16 + 19) / 19 / 2)
 
 void tx4939_wdt_init(void);
-void tx4939_add_memory_regions(void);
 void tx4939_setup(void);
 void tx4939_time_init(unsigned int tmrnr);
 void tx4939_sio_init(unsigned int sclk, unsigned int cts_mask);
diff --git a/arch/mips/txx9/generic/setup_tx4939.c b/arch/mips/txx9/generic/setup_tx4939.c
index 360c388f4c82..bf8a3cdababf 100644
--- a/arch/mips/txx9/generic/setup_tx4939.c
+++ b/arch/mips/txx9/generic/setup_tx4939.c
@@ -22,7 +22,6 @@
 #include <linux/mtd/physmap.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/txx9/ndfmc.h>
-#include <asm/bootinfo.h>
 #include <asm/reboot.h>
 #include <asm/traps.h>
 #include <asm/txx9irq.h>
@@ -94,22 +93,6 @@ static struct resource tx4939_sdram_resource[4];
 static struct resource tx4939_sram_resource;
 #define TX4939_SRAM_SIZE 0x800
 
-void __init tx4939_add_memory_regions(void)
-{
-	int i;
-	unsigned long start, size;
-	u64 win;
-
-	for (i = 0; i < 4; i++) {
-		if (!((__u32)____raw_readq(&tx4939_ddrcptr->winen) & (1 << i)))
-			continue;
-		win = ____raw_readq(&tx4939_ddrcptr->win[i]);
-		start = (unsigned long)(win >> 48);
-		size = (((unsigned long)(win >> 32) & 0xffff) + 1) - start;
-		add_memory_region(start << 20, size << 20, BOOT_MEM_RAM);
-	}
-}
-
 void __init tx4939_setup(void)
 {
 	int i;
diff --git a/arch/mips/txx9/rbtx4939/prom.c b/arch/mips/txx9/rbtx4939/prom.c
index bd277ecb4ad6..1dc47ce81c92 100644
--- a/arch/mips/txx9/rbtx4939/prom.c
+++ b/arch/mips/txx9/rbtx4939/prom.c
@@ -7,11 +7,23 @@
  */
 
 #include <linux/init.h>
+#include <asm/bootinfo.h>
 #include <asm/txx9/generic.h>
 #include <asm/txx9/rbtx4939.h>
 
 void __init rbtx4939_prom_init(void)
 {
-	tx4939_add_memory_regions();
+	unsigned long start, size;
+	u64 win;
+	int i;
+
+	for (i = 0; i < 4; i++) {
+		if (!((__u32)____raw_readq(&tx4939_ddrcptr->winen) & (1 << i)))
+			continue;
+		win = ____raw_readq(&tx4939_ddrcptr->win[i]);
+		start = (unsigned long)(win >> 48);
+		size = (((unsigned long)(win >> 32) & 0xffff) + 1) - start;
+		add_memory_region(start << 20, size << 20, BOOT_MEM_RAM);
+	}
 	txx9_sio_putchar_init(TX4939_SIO_REG(0) & 0xfffffffffULL);
 }
-- 
2.16.4

