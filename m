Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F12BB21AACE
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2020 00:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727844AbgGIWqm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jul 2020 18:46:42 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:48198 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727081AbgGIWqU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Jul 2020 18:46:20 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 0413180045E5;
        Thu,  9 Jul 2020 22:46:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id MRoD_kFL0_oL; Fri, 10 Jul 2020 01:46:16 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Vinod Koul <vkoul@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Williams <dan.j.williams@intel.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, <linux-mips@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 11/11] dmaengine: dw: Initialize max_sg_nents capability
Date:   Fri, 10 Jul 2020 01:45:50 +0300
Message-ID: <20200709224550.15539-12-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200709224550.15539-1-Sergey.Semin@baikalelectronics.ru>
References: <20200709224550.15539-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Multi-block support provides a way to map the kernel-specific SG-table so
the DW DMA device would handle it as a whole instead of handling the
SG-list items or so called LLP block items one by one. So if true LLP
list isn't supported by the DW DMA engine, then soft-LLP mode will be
utilized to load and execute each LLP-block one by one. The soft-LLP mode
of the DMA transactions execution might not work well for some DMA
consumers like SPI due to its Tx and Rx buffers inter-dependency. Let's
initialize the max_sg_nents DMA channels capability based on the nollp
flag state. If it's true, no hardware accelerated LLP is available and
max_sg_nents should be set with 1, which means that the DMA engine
can handle only a single SG list entry at a time. If noLLP is set to
false, then hardware accelerated LLP is supported and the DMA engine
can handle infinite number of SG entries in a single DMA transaction.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-mips@vger.kernel.org
Cc: devicetree@vger.kernel.org

---

Changelog v3:
- This is a new patch created as a result of the discussion with Vinud and
  Andy in the framework of DW DMA burst and LLP capabilities.

Changelog v4:
- Use explicit if-else statement when assigning the max_sg_nents field.
---
 drivers/dma/dw/core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 588b9bae827c..9dee5fa65153 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -1059,6 +1059,18 @@ static void dwc_caps(struct dma_chan *chan, struct dma_slave_caps *caps)
 	struct dw_dma_chan *dwc = to_dw_dma_chan(chan);
 
 	caps->max_burst = dwc->max_burst;
+
+	/*
+	 * It might be crucial for some devices to have the hardware
+	 * accelerated multi-block transfers supported, aka LLPs in DW DMAC
+	 * notation. So if LLPs are supported then max_sg_nents is set to
+	 * zero which means unlimited number of SG entries can be handled in a
+	 * single DMA transaction, otherwise it's just one SG entry.
+	 */
+	if (dwc->nollp)
+		caps->max_sg_nents = 1;
+	else
+		caps->max_sg_nents = 0;
 }
 
 int do_dma_probe(struct dw_dma_chip *chip)
-- 
2.26.2

