Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D79CD1FD9D8
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2020 01:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727861AbgFQXl0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Jun 2020 19:41:26 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:57886 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727031AbgFQXks (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Jun 2020 19:40:48 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 37E59803202A;
        Wed, 17 Jun 2020 23:40:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Gg27YjHjmQiO; Thu, 18 Jun 2020 02:40:42 +0300 (MSK)
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
Subject: [PATCH v6 7/9] dmaengine: dw: Add dummy device_caps callback
Date:   Thu, 18 Jun 2020 02:40:26 +0300
Message-ID: <20200617234028.25808-8-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200617234028.25808-1-Sergey.Semin@baikalelectronics.ru>
References: <20200617234028.25808-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Since some DW DMA controllers (like one installed on Baikal-T1 SoC) may
have non-uniform DMA capabilities per device channels, let's add
the DW DMA specific device_caps callback to expose that specifics up to
the DMA consumer. It's a dummy function for now. We'll fill it in with
capabilities overrides in the next commits.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
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
---
 drivers/dma/dw/core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index fb95920c429e..ceded21537e2 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -1049,6 +1049,11 @@ static void dwc_free_chan_resources(struct dma_chan *chan)
 	dev_vdbg(chan2dev(chan), "%s: done\n", __func__);
 }
 
+static void dwc_caps(struct dma_chan *chan, struct dma_slave_caps *caps)
+{
+
+}
+
 int do_dma_probe(struct dw_dma_chip *chip)
 {
 	struct dw_dma *dw = chip->dw;
@@ -1214,6 +1219,7 @@ int do_dma_probe(struct dw_dma_chip *chip)
 	dw->dma.device_prep_dma_memcpy = dwc_prep_dma_memcpy;
 	dw->dma.device_prep_slave_sg = dwc_prep_slave_sg;
 
+	dw->dma.device_caps = dwc_caps;
 	dw->dma.device_config = dwc_config;
 	dw->dma.device_pause = dwc_pause;
 	dw->dma.device_resume = dwc_resume;
-- 
2.26.2

