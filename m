Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB6A1C9E90
	for <lists+linux-mips@lfdr.de>; Fri,  8 May 2020 00:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgEGWlo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 18:41:44 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:38962 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbgEGWlo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 May 2020 18:41:44 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id E334480307C1;
        Thu,  7 May 2020 22:41:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id sIuzsjFm3Owd; Fri,  8 May 2020 01:41:37 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Tony Lindgren <tony@atomide.com>,
        Tero Kristo <t-kristo@ti.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Olof Johansson <olof@lixom.net>, <linux-mips@vger.kernel.org>,
        <soc@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/4] bus: Add Baikal-T1 SoC APB/AXI bus drivers
Date:   Fri, 8 May 2020 01:41:12 +0300
Message-ID: <20200507224116.1523-1-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200306130731.938808030702@mail.baikalelectronics.ru>
References: <20200306130731.938808030702@mail.baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Baikal-T1 SoC CPU is based on two MIPS Warrior P5600 cores. Their main
memory Non-Coherent IO interface is connected to the OCP2AXI bridge, which
in turn is then connected to the DW AMBA 3 AXI Interconnect (so called Main
Interconnect) with nine masters and four slaves ports. Main Interconnect is
responsible for the AXI-bus traffic arbitration (QoS) and its routing from
one component to another. In addition there is a Errors Handler Block
(EHB) responsible to detect AXI protocol errors and device not responding
situations built on top the interconnect. Baikal-T1 AXI-bus driver included in
this patchset will be responsible for working with that functionality,
though currently it doesn't support QoS tuning. Instead it's capable of
detecting the error events, reporting an info about them to the system
log, injecting artificial errors to test the driver functionality.
Since AXI Interconnect doesn't provide a way to find out which devices are
connected to it, so its DT node is supposed to be compatible with
"simple-bus" driver, while sub-nodes shall represent the masters attached
to the bus.

One of the AXI Interconnect slaves is an AXI-APB bridge used to access the
Baikal-T1 SoC subsystems CSRs. MMIO request from CPU and DMAC masters are
routed there if they are detected to be within [0x08000000 0x1FFFFFFF]
range of the physical memory. In case if an attempted APB transaction
stays with no response for a pre-defined time it will be detected by the
APB-bus Errors Handler Block (EHB), which will raise an interrupt, then
the bus gets freed for a next operation. The APB-bus driver provides the
interrupt handler to detect the erroneous address, update an errors
counter and prints an error message about the faulty address. The counter
and the APB-bus operations timeout can be accessed via corresponding sysfs
nodes. A dedicated sysfs-node can be also used to artificially cause the
bus errors described above. Since APB-bus is a platform bus, it doesn't
provide a way to detect slave devices connected to it, so similarly to the
AXI-bus it's also supposed to be compatible with "simple-bus" driver.

This patchset is rebased and tested on the mainline Linux kernel 5.7-rc4:
0e698dfa2822 ("Linux 5.7-rc4")
tag: v5.7-rc4

Note initially the driver was a part of the patchset created to reside in
the kernel soc subsystem. But after a short discussion with Arnd:
https://lkml.org/lkml/2020/3/6/422
we decided to move it here.

New vendor prefix will be added in the framework of the next patchset:
https://lkml.org/lkml/2020/5/6/1047

Changelog v2:
- Assign dual GPL/BSD licenses to the bindings.
- Use single lined copyright headers in the bindings.
- Replace "additionalProperties: false" property with
  "unevaluatedProperties: false" in the bindings.
- Don't use a multi-arg clock phandle reference in DT binding examples.
  Thus remove includes from there.
- Fix some commit message and Kconfig help text spelling.
- Move drivers from soc to the bus subsystem.
- Convert a simple EHB drivers to the Baikal-T1 AXI and APB bus ones.
- Convert APB bus driver to using regmap MMIO API.
- Use syscon regmap to access the AXI-bus erroneous address.
- Add reset line support.
- Add Main Interconnect clock support to the AXI-bus driver.
- Remove probe-status info string printout.
- Discard of_match_ptr() macro utilization.
- Don't print error-message if no platform IRQ found. Just return an error.
- Use generic FIELD_{GET,PREP} macros instead of handwritten ones in the
  AXI-bus driver.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>
Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Cc: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
Cc: Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>
Cc: Vadim Vlasov <V.Vlasov@baikalelectronics.ru>
Cc: Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Tero Kristo <t-kristo@ti.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Jeffrey Hugo <jhugo@codeaurora.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Olof Johansson <olof@lixom.net>
Cc: linux-mips@vger.kernel.org
Cc: soc@kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Serge Semin (4):
  dt-bindings: bus: Add Baikal-T1 AXI-bus binding
  dt-bindings: bus: Add Baikal-T1 APB-bus binding
  bus: Add Baikal-T1 AXI-bus driver
  bus: Add Baikal-T1 APB-bus driver

 .../bindings/bus/baikal,bt1-apb.yaml          |  90 ++++
 .../bindings/bus/baikal,bt1-axi.yaml          |  95 ++++
 drivers/bus/Kconfig                           |  30 ++
 drivers/bus/Makefile                          |   2 +
 drivers/bus/bt1-apb.c                         | 421 ++++++++++++++++++
 drivers/bus/bt1-axi.c                         | 318 +++++++++++++
 6 files changed, 956 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/baikal,bt1-apb.yaml
 create mode 100644 Documentation/devicetree/bindings/bus/baikal,bt1-axi.yaml
 create mode 100644 drivers/bus/bt1-apb.c
 create mode 100644 drivers/bus/bt1-axi.c

-- 
2.25.1

