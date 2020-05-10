Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D8C91CCA6D
	for <lists+linux-mips@lfdr.de>; Sun, 10 May 2020 12:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728794AbgEJK6i (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 10 May 2020 06:58:38 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:46576 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726863AbgEJK6i (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 10 May 2020 06:58:38 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 969698030807;
        Sun, 10 May 2020 10:58:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 21DbGkKu43dC; Sun, 10 May 2020 13:58:31 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        <linux-mips@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/7] dt-bindings: watchdog: dw-wdt: Support devices with asynch clocks
Date:   Sun, 10 May 2020 13:58:02 +0300
Message-ID: <20200510105807.880-3-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200510105807.880-1-Sergey.Semin@baikalelectronics.ru>
References: <20200306132758.703FC8030704@mail.baikalelectronics.ru>
 <20200510105807.880-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

DW Watchdog IP core can be synthesised with asynchronous timer/APB
clocks support (WDT_ASYNC_CLK_MODE_ENABLE == 1). In this case
a separate clock signal is supposed to be used to feed watchdog timer
and APB interface of the device. Lets along with the watchdog timer
reference clock expect to have the optional APB3 bus interface clock
sepcified in a DW WDT dt node.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mips@vger.kernel.org

---

Changelog v2:
- It's a new patch unpinned from the previous one.
---
 .../devicetree/bindings/watchdog/snps,dw-wdt.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
index 4f6944756ab4..5bf6dc6377f3 100644
--- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
@@ -24,8 +24,16 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 1
     items:
       - description: Watchdog timer reference clock
+      - description: APB3 interface clock
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: tclk
+      - const: pclk
 
   resets:
     description: Phandle to the DW Watchdog reset lane
-- 
2.25.1

