Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A63893FE9E6
	for <lists+linux-mips@lfdr.de>; Thu,  2 Sep 2021 09:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242637AbhIBHUz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 Sep 2021 03:20:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242520AbhIBHUz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 2 Sep 2021 03:20:55 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4614BC061757
        for <linux-mips@vger.kernel.org>; Thu,  2 Sep 2021 00:19:57 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1mLh0r-0000Rt-RW; Thu, 02 Sep 2021 09:19:53 +0200
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1mLh0r-0007Ub-2o; Thu, 02 Sep 2021 09:19:53 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh@kernel.org>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>
Subject: [PATCH v1] MIPS: Malta: fix alignment of the devicetree buffer
Date:   Thu,  2 Sep 2021 09:19:51 +0200
Message-Id: <20210902071951.28722-1-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Starting with following patch MIPS Malta is not able to boot:
| commit 79edff12060fe7772af08607eff50c0e2486c5ba
| Author: Rob Herring <robh@kernel.org>
| scripts/dtc: Update to upstream version v1.6.0-51-g183df9e9c2b9

The reason is the alignment test added to the fdt_ro_probe_(). To fix
this issue, we need to make sure that fdt_buf is aligned.

Since the dtc patch was designed to uncover potential issue, I handle
initial MIPS Malta patch as initial bug.

Fixes: e81a8c7dabac ("MIPS: Malta: Setup RAM regions via DT")
Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 arch/mips/mti-malta/malta-dtshim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/mti-malta/malta-dtshim.c b/arch/mips/mti-malta/malta-dtshim.c
index 0ddf03df6268..f451268f6c38 100644
--- a/arch/mips/mti-malta/malta-dtshim.c
+++ b/arch/mips/mti-malta/malta-dtshim.c
@@ -22,7 +22,7 @@
 #define  ROCIT_CONFIG_GEN1_MEMMAP_SHIFT	8
 #define  ROCIT_CONFIG_GEN1_MEMMAP_MASK	(0xf << 8)
 
-static unsigned char fdt_buf[16 << 10] __initdata;
+static unsigned char fdt_buf[16 << 10] __initdata __aligned(8);
 
 /* determined physical memory size, not overridden by command line args	 */
 extern unsigned long physical_memsize;
-- 
2.30.2

