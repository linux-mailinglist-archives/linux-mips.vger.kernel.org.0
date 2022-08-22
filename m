Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9D3659C663
	for <lists+linux-mips@lfdr.de>; Mon, 22 Aug 2022 20:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237473AbiHVSbN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Aug 2022 14:31:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237442AbiHVSaM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 22 Aug 2022 14:30:12 -0400
Received: from mail.baikalelectronics.com (mail.baikalelectronics.com [87.245.175.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C3B494A126;
        Mon, 22 Aug 2022 11:29:46 -0700 (PDT)
Received: from mail (mail.baikal.int [192.168.51.25])
        by mail.baikalelectronics.com (Postfix) with ESMTP id 941F6BCA;
        Mon, 22 Aug 2022 21:32:53 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.baikalelectronics.com 941F6BCA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baikalelectronics.ru; s=mail; t=1661193173;
        bh=7Wd5s3mAaxc2zSZkSbVnCZdx2+51jTZeJ//9LMynMAo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References:From;
        b=NOr0axc8QKKWnRQtHWtR37f/G0tyB1J85TbXxvf5H1pBugqRuyOlIVT4wV6HHg3qi
         AhPcq3cPKLa9Kfp95j8tjU27/iiY1pykaChN7spFm/3csLIXXvqD/2E4F81P+HSBL6
         TxpxPh7PgrcWbykW0m8Q0NDp8nHlcuNTtiVM7Mvo=
Received: from localhost (192.168.168.10) by mail (192.168.51.25) with
 Microsoft SMTP Server (TLS) id 15.0.1395.4; Mon, 22 Aug 2022 21:29:39 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        <linux-clk@vger.kernel.org>, <linux-mips@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND v10 3/7] clk: baikal-t1: Add shared xGMAC ref/ptp clocks internal parent
Date:   Mon, 22 Aug 2022 21:29:29 +0300
Message-ID: <20220822182934.23734-4-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20220822182934.23734-1-Sergey.Semin@baikalelectronics.ru>
References: <20220822182934.23734-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
        T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Baikal-T1 CCU reference manual says that both xGMAC reference and xGMAC
PTP clocks are generated by two different wrappers with the same constant
divider thus each producing a 156.25 MHz signal. But for some reason both
of these clock sources are gated by a single switch-flag in the CCU
registers space - CCU_SYS_XGMAC_BASE.BIT(0). In order to make the clocks
handled independently we need to define a shared parental gate so the base
clock signal would be switched off only if both of the child-clocks are
disabled.

Note the ID is intentionally set to -2 since we are going to add a one
more internal clock identifier in the next commit.

Fixes: 353afa3a8d2e ("clk: Add Baikal-T1 CCU Dividers driver")
Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

---

Changelog v4:
- Change the ID macro name to the more descriptive CCU_SYS_XGMAC_CLK.
---
 drivers/clk/baikal-t1/ccu-div.c     | 1 +
 drivers/clk/baikal-t1/ccu-div.h     | 6 ++++++
 drivers/clk/baikal-t1/clk-ccu-div.c | 8 +++++---
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/baikal-t1/ccu-div.c b/drivers/clk/baikal-t1/ccu-div.c
index 4062092d67f9..bbfa3526ee10 100644
--- a/drivers/clk/baikal-t1/ccu-div.c
+++ b/drivers/clk/baikal-t1/ccu-div.c
@@ -579,6 +579,7 @@ struct ccu_div *ccu_div_hw_register(const struct ccu_div_init_data *div_init)
 		goto err_free_div;
 	}
 	parent_data.fw_name = div_init->parent_name;
+	parent_data.name = div_init->parent_name;
 	hw_init.parent_data = &parent_data;
 	hw_init.num_parents = 1;
 
diff --git a/drivers/clk/baikal-t1/ccu-div.h b/drivers/clk/baikal-t1/ccu-div.h
index 795665caefbd..b6a9c8e45318 100644
--- a/drivers/clk/baikal-t1/ccu-div.h
+++ b/drivers/clk/baikal-t1/ccu-div.h
@@ -13,6 +13,12 @@
 #include <linux/bits.h>
 #include <linux/of.h>
 
+/*
+ * CCU Divider private clock IDs
+ * @CCU_SYS_XGMAC_CLK: CCU XGMAC internal clock
+ */
+#define CCU_SYS_XGMAC_CLK		-2
+
 /*
  * CCU Divider private flags
  * @CCU_DIV_SKIP_ONE: Due to some reason divider can't be set to 1.
diff --git a/drivers/clk/baikal-t1/clk-ccu-div.c b/drivers/clk/baikal-t1/clk-ccu-div.c
index ea77eec40ddd..3953ae5664be 100644
--- a/drivers/clk/baikal-t1/clk-ccu-div.c
+++ b/drivers/clk/baikal-t1/clk-ccu-div.c
@@ -204,10 +204,12 @@ static const struct ccu_div_info sys_info[] = {
 			  "eth_clk", CCU_SYS_GMAC1_BASE, 5),
 	CCU_DIV_FIXED_INFO(CCU_SYS_GMAC1_PTP_CLK, "sys_gmac1_ptp_clk",
 			   "eth_clk", 10),
-	CCU_DIV_GATE_INFO(CCU_SYS_XGMAC_REF_CLK, "sys_xgmac_ref_clk",
-			  "eth_clk", CCU_SYS_XGMAC_BASE, 8),
+	CCU_DIV_GATE_INFO(CCU_SYS_XGMAC_CLK, "sys_xgmac_clk",
+			  "eth_clk", CCU_SYS_XGMAC_BASE, 1),
+	CCU_DIV_FIXED_INFO(CCU_SYS_XGMAC_REF_CLK, "sys_xgmac_ref_clk",
+			   "sys_xgmac_clk", 8),
 	CCU_DIV_FIXED_INFO(CCU_SYS_XGMAC_PTP_CLK, "sys_xgmac_ptp_clk",
-			   "eth_clk", 8),
+			   "sys_xgmac_clk", 8),
 	CCU_DIV_GATE_INFO(CCU_SYS_USB_CLK, "sys_usb_clk",
 			  "eth_clk", CCU_SYS_USB_BASE, 10),
 	CCU_DIV_VAR_INFO(CCU_SYS_PVT_CLK, "sys_pvt_clk",
-- 
2.35.1

