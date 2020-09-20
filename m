Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2372271373
	for <lists+linux-mips@lfdr.de>; Sun, 20 Sep 2020 13:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbgITLMX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Sep 2020 07:12:23 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:53280 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbgITLMX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 20 Sep 2020 07:12:23 -0400
X-Greylist: delayed 522 seconds by postgrey-1.27 at vger.kernel.org; Sun, 20 Sep 2020 07:12:21 EDT
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 826848030865;
        Sun, 20 Sep 2020 11:03:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Bjp3YX6FKhWw; Sun, 20 Sep 2020 14:03:38 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        <linux-mips@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] clk: baikal-t1: Mark Ethernet PLL as critical
Date:   Sun, 20 Sep 2020 14:03:35 +0300
Message-ID: <20200920110335.18034-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

We've discovered that disabling the so called Ethernet PLL causes reset of
the devices consuming its outgoing clock. The resets happen automatically
even if each underlying clock gate is turned off. Due to that we can't
disable the Ethernet PLL until the kernel is prepared for the corresponding
resets. So for now just mark the PLL clock provider as critical.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: linux-mips@vger.kernel.org
---
 drivers/clk/baikal-t1/clk-ccu-pll.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/baikal-t1/clk-ccu-pll.c b/drivers/clk/baikal-t1/clk-ccu-pll.c
index 1eec8c0b8f50..2445d4b12baf 100644
--- a/drivers/clk/baikal-t1/clk-ccu-pll.c
+++ b/drivers/clk/baikal-t1/clk-ccu-pll.c
@@ -51,11 +51,13 @@ struct ccu_pll_info {
 };
 
 /*
- * Mark as critical all PLLs except Ethernet one. CPU and DDR PLLs are sources
- * of CPU cores and DDR controller reference clocks, due to which they
- * obviously shouldn't be ever gated. SATA and PCIe PLLs are the parents of
- * APB-bus and DDR controller AXI-bus clocks. If they are gated the system will
- * be unusable.
+ * Alas we have to mark all PLLs as critical. CPU and DDR PLLs are sources of
+ * CPU cores and DDR controller reference clocks, due to which they obviously
+ * shouldn't be ever gated. SATA and PCIe PLLs are the parents of APB-bus and
+ * DDR controller AXI-bus clocks. If they are gated the system will be
+ * unusable. Moreover disabling SATA and Ethernet PLLs causes automatic reset
+ * of the corresponding subsystems. So until we aren't ready to re-initialize
+ * all the devices consuming those PLLs, they will be marked as critical too.
  */
 static const struct ccu_pll_info pll_info[] = {
 	CCU_PLL_INFO(CCU_CPU_PLL, "cpu_pll", "ref_clk", CCU_CPU_PLL_BASE,
@@ -67,7 +69,7 @@ static const struct ccu_pll_info pll_info[] = {
 	CCU_PLL_INFO(CCU_PCIE_PLL, "pcie_pll", "ref_clk", CCU_PCIE_PLL_BASE,
 		     CLK_IS_CRITICAL),
 	CCU_PLL_INFO(CCU_ETH_PLL, "eth_pll", "ref_clk", CCU_ETH_PLL_BASE,
-		     CLK_SET_RATE_GATE)
+		     CLK_IS_CRITICAL | CLK_SET_RATE_GATE)
 };
 
 struct ccu_pll_data {
-- 
2.27.0

