Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBD921E8F01
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2020 09:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728888AbgE3HgY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 30 May 2020 03:36:24 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:52002 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728786AbgE3HgX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 30 May 2020 03:36:23 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 45ACF8030779;
        Sat, 30 May 2020 07:36:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id zaFgTL81LlYt; Sat, 30 May 2020 10:36:18 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, <linux-mips@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 0/7] watchdog: dw_wdt: Take Baikal-T1 DW WDT peculiarities into account
Date:   Sat, 30 May 2020 10:35:50 +0300
Message-ID: <20200530073557.22661-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Merge window is upon us. Please review/merge in/whatever the rest of the
patches.

There were a few features enabled at the time of the Baikal-T1 SoC DW WDT
IP synthesis, which weren't taken into account in the DW WDT driver available
in the kernel. First of all the SoC engineers synthesized the watchdog core
with WDT_USE_FIX_TOP set to false (don't really know why, but they did).
Due to this the timer reset values weren't fixed as the driver expected
but were initialized with a pre-defined values selected by the engineers.
Secondly the driver expected that the watchdog APB bus and the timer had
synchronous reference clocks, while Baikal-T1 SoC DW WDT was created with
asynchronous ones. So the driver should enable two clock devices: APB bus
clocks and a separate timer reference clock. Finally DW Watchdog Timer is
capable of generating a pre-timeout interrupt if corresponding config is
enabled. The problem was that the pre-timeout IRQ happens when the set
timeout elapses, while the actual WDT expiration and subsequent reboot take
place in the next timeout. This makes the pre-timeout functionality
implementation a bit tricky, since in this case we would have to find a
WDT timeout twice smaller the requested timeout. All of the changes described
above are provided by the patches in this patchset.

In addition traditionally we replaced the legacy plain text-based dt-binding
file with yaml-based one and added the controller registers dump DebugFS node
to ease the driver debug procedure.

This patchset is rebased and tested on the mainline Linux kernel 5.6-rc4:
base-commit: 0e698dfa2822 ("Linux 5.7-rc4")
tag: v5.7-rc4

Changelog v2:
- Rearrange SoBs.
- Discard BE copyright header from the binding file.
- Replace "additionalProperties: false" with "unevaluatedProperties: false"
  property in the binding.
- Move the APB3 clocks support declared in the dt binding file into a
  dedicated patch.
- Move $ref to the root level of the "snps,watchdog-tops" property
  so does the constraints.
- Make Pre-timeout IRQs support being optional.
- Add "ms" suffix to the methods returning msec and convert the methods
  with no "ms" suffix to return a timeout in sec.
- Make sure minimum timeout is at least 1 sec.
- Refactor the timeouts calculation procedure to to retain the timeouts in
  the ascending order.
- Make sure there is no integer overflow in milliseconds calculation. It
  is saved in a dedicated uint field of the timeout structure.
- Discard timeout/pretimeout/ping/enable DebugFS nodes. Registers state
  dump node is only left.

Link: https://lore.kernel.org/linux-watchdog/20200510105807.880-1-Sergey.Semin@baikalelectronics.ru/
Changelog v3:
- Add Rob's Reviewed-by tag to the DT-related patches.
- Remove items from the "snps,watchdog-tops" property and move the
  minItems and maxItems constraints to the root level of it.

Link: https://lore.kernel.org/linux-watchdog/20200526154123.24402-1-Sergey.Semin@baikalelectronics.ru
Changelog v4:
- Add Guenter's Reviewed-by tags.
- IRQ > 0 is only valid in Linux so make sure we request IRQ only if valid
  number is returned from platform_get_irq_optional().

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>
Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Cc: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
Cc: Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>
Cc: Vadim Vlasov <V.Vlasov@baikalelectronics.ru>
Cc: Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-mips@vger.kernel.org
Cc: linux-watchdog@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Serge Semin (7):
  dt-bindings: watchdog: Convert DW WDT binding to DT schema
  dt-bindings: watchdog: dw-wdt: Support devices with asynch clocks
  dt-bindings: watchdog: dw-wdt: Add watchdog TOPs array property
  watchdog: dw_wdt: Support devices with non-fixed TOP values
  watchdog: dw_wdt: Support devices with asynch clocks
  watchdog: dw_wdt: Add pre-timeouts support
  watchdog: dw_wdt: Add DebugFS files

 .../devicetree/bindings/watchdog/dw_wdt.txt   |  24 -
 .../bindings/watchdog/snps,dw-wdt.yaml        |  90 ++++
 drivers/watchdog/dw_wdt.c                     | 437 ++++++++++++++++--
 3 files changed, 494 insertions(+), 57 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/dw_wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml

-- 
2.26.2

