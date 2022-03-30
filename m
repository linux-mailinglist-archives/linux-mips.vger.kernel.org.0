Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 599A54EC6D4
	for <lists+linux-mips@lfdr.de>; Wed, 30 Mar 2022 16:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347070AbiC3Op0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Mar 2022 10:45:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347040AbiC3OpZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Mar 2022 10:45:25 -0400
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com [87.245.175.226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 00B055BD15;
        Wed, 30 Mar 2022 07:43:34 -0700 (PDT)
Received: from mail.baikalelectronics.ru (unknown [192.168.51.25])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id A3A9216A6;
        Wed, 30 Mar 2022 17:43:35 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.baikalelectronics.ru A3A9216A6
Received: from localhost (192.168.53.207) by mail (192.168.51.25) with
 Microsoft SMTP Server (TLS) id 15.0.1395.4; Wed, 30 Mar 2022 17:43:31 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Bjorn Helgaas <bhelgaas@google.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        <linux-clk@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/4] clk: Baikal-T1 DDR/PCIe resets and some xGMAC fixes
Date:   Wed, 30 Mar 2022 17:43:16 +0300
Message-ID: <20220330144320.27039-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patchset is an initial one in the series created in the framework
of my Baikal-T1 PCIe/eDMA-related work:

[1: In-progress v1] clk: Baikal-T1 DDR/PCIe resets and some xGMAC fixes
Link: https://lore.kernel.org/linux-pci/20220324010905.15589-1-Sergey.Semin@baikalelectronics.ru/
[2: In-progress v1] PCI: dwc: Various fixes and cleanups
Link: https://lore.kernel.org/linux-pci/20220324012524.16784-1-Sergey.Semin@baikalelectronics.ru/
[3: In-progress v1] PCI: dwc: Add dma-ranges/YAML-schema/Baikal-T1 support
Link: https://lore.kernel.org/linux-pci/20220324013734.18234-1-Sergey.Semin@baikalelectronics.ru/
[4: In-progress v1] dmaengine: dw-edma: Add RP/EP local DMA controllers support
Link: https://lore.kernel.org/linux-pci/20220324014836.19149-1-Sergey.Semin@baikalelectronics.ru/

Since some of the patches in the later patchsets depend on the
modifications introduced here, @Bjorn could you please merge this series
through your PCIe subsystem repo? After getting all the required ack'es of
course.

Short summary regarding this patchset. A few more modifications are
introduced here to finally finish the Baikal-T1 CCU unit support up and
prepare the code before adding the Baikal-T1 PCIe/xGMAC support. First of
all it turned out I specified wrong DW xGMAC PTP reference clock divider
in my initial patches. It must be 8, not 10. Secondly I was wrong to add a
joint xGMAC Ref and PTP clock instead of having them separately defined.
The SoC manual describes these clocks as separate fixed clock wrappers.
Finally in order to close the SoC clock/reset support up we need to add
the DDR and PCIe interfaces reset controls support. It's done in two
steps. First I've moved the reset-controls-related code into a dedicated
module. Then the DDR/PCIe reset-control functionality is added.

Link: https://lore.kernel.org/linux-pci/20220324010905.15589-1-Sergey.Semin@baikalelectronics.ru/
Changelog v2:
- Resubmit the series with adding @Philipp to the list of recipients.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Rob Herring <robh@kernel.org>
Cc: "Krzysztof Wilczyński" <kw@linux.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-clk@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Serge Semin (4):
  clk: baikal-t1: Fix invalid xGMAC PTP clock divider
  clk: baikal-t1: Define shared xGMAC ref/ptp clocks parent
  clk: baikal-t1: Move reset-controls code into a dedicated module
  clk: baikal-t1: Add DDR/PCIe directly controlled resets support

 drivers/clk/baikal-t1/Kconfig       |  12 +-
 drivers/clk/baikal-t1/Makefile      |   1 +
 drivers/clk/baikal-t1/ccu-div.c     |   1 +
 drivers/clk/baikal-t1/ccu-div.h     |   6 +
 drivers/clk/baikal-t1/ccu-rst.c     | 373 ++++++++++++++++++++++++++++
 drivers/clk/baikal-t1/ccu-rst.h     |  64 +++++
 drivers/clk/baikal-t1/clk-ccu-div.c | 102 ++------
 include/dt-bindings/reset/bt1-ccu.h |   9 +
 8 files changed, 482 insertions(+), 86 deletions(-)
 create mode 100644 drivers/clk/baikal-t1/ccu-rst.c
 create mode 100644 drivers/clk/baikal-t1/ccu-rst.h

-- 
2.35.1

