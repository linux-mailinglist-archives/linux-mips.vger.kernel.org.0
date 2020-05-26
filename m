Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E15151E22BE
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 15:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729052AbgEZNIr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 09:08:47 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:57476 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbgEZNIr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 09:08:47 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 16A79803086B;
        Tue, 26 May 2020 13:08:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id fJXa1zhMv0r9; Tue, 26 May 2020 16:08:42 +0300 (MSK)
Date:   Tue, 26 May 2020 16:08:41 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Rob Herring <robh+dt@kernel.org>
CC:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Olof Johansson <olof@lixom.net>, <linux-mips@vger.kernel.org>,
        <soc@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/6] bus/memory: Add Baikal-T1 SoC APB/AXI/L2 drivers
Message-ID: <20200526130841.ap6qlxv7hqmabnh5@mobilestation>
References: <20200526125928.17096-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200526125928.17096-1-Sergey.Semin@baikalelectronics.ru>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Rob,
Could you pay attention to this patchset? There is only one DT binding left
without your tag:
[PATCH v3 3/6] dt-bindings: memory: Add Baikal-T1 L2-cache Control Block binding
After we get it, Arnd will merge the series into the soc repository.

Thanks
-Sergey


On Tue, May 26, 2020 at 03:59:22PM +0300, Serge Semin wrote:
> Baikal-T1 SoC CPU is based on two MIPS Warrior P5600 cores. Their main
> memory Non-Coherent IO interface is connected to the OCP2AXI bridge, which
> in turn is then connected to the DW AMBA 3 AXI Interconnect (so called
> Main Interconnect) with nine masters and four slaves ports. Main
> Interconnect is responsible for the AXI-bus traffic arbitration (QoS) and
> its routing from one component to another. In addition there is a Errors
> Handler Block (EHB) accesible by means of the Baikal-T1 SoC System
> Controller responsible to detect AXI protocol errors and device not
> responding situations built on top the interconnect. Baikal-T1 AXI-bus
> driver included in this patchset will be responsible for working with that
> functionality, though currently it doesn't support QoS tuning. Instead
> it's capable of detecting the error events, reporting an info about them
> to the system log, injecting artificial errors to test the driver
> functionality. Since AXI Interconnect doesn't provide a way to find out
> which devices are connected to it, so its DT node is supposed to be
> compatible with "simple-bus" driver, while sub-nodes shall represent the
> masters attached to the bus.
> 
> One of the AXI Interconnect slaves is an AXI-APB bridge used to access the
> Baikal-T1 SoC subsystems CSRs. MMIO request from CPU and DMAC masters are
> routed there if they are detected to be within [0x08000000 0x1FFFFFFF]
> range of the physical memory. In case if an attempted APB transaction
> stays with no response for a pre-defined time it will be detected by the
> APB-bus Errors Handler Block (EHB), which will raise an interrupt, then
> the bus gets freed for a next operation. The APB-bus driver provides the
> interrupt handler to detect the erroneous address, update an errors
> counter and prints an error message about the faulty address. The counter
> and the APB-bus operations timeout can be accessed via corresponding sysfs
> nodes. A dedicated sysfs-node can be also used to artificially cause the
> bus errors described above. Since APB-bus is a platform bus, it doesn't
> provide a way to detect slave devices connected to it, so similarly to the
> AXI-bus it's also supposed to be compatible with "simple-bus" driver.
> 
> Aside from PCIe/SATA/DDR/I2C/EHB/CPU/reboot specific settings the
> Baikal-T1 System Controller provides a MIPS P5600 CM2 L2-cache tuning
> block. It is responsible for the setting up the Tag/Data/WS L2-to-RAM
> latencies. The last small patch in this patchset provides a driver and
> DT-schema-based binding for the described device. So that the latencies
> can be tuned up by means of dedicated DT properties and sysfs nodes.
> 
> This patchset is rebased and tested on the mainline Linux kernel 5.7-rc4:
> 0e698dfa2822 ("Linux 5.7-rc4")
> tag: v5.7-rc4
> 
> Changelog v2 (AXI/APB bus):
> - Assign dual GPL/BSD licenses to the bindings.
> - Use single lined copyright headers in the bindings.
> - Replace "additionalProperties: false" property with
>   "unevaluatedProperties: false" in the bindings.
> - Don't use a multi-arg clock phandle reference in DT binding examples.
>   Thus remove includes from there.
> - Fix some commit message and Kconfig help text spelling.
> - Move drivers from soc to the bus subsystem.
> - Convert a simple EHB drivers to the Baikal-T1 AXI and APB bus ones.
> - Convert APB bus driver to using regmap MMIO API.
> - Use syscon regmap to access the AXI-bus erroneous address.
> - Add reset line support.
> - Add Main Interconnect clock support to the AXI-bus driver.
> - Remove probe-status info string printout.
> - Discard of_match_ptr() macro utilization.
> - Don't print error-message if no platform IRQ found. Just return an error.
> - Use generic FIELD_{GET,PREP} macros instead of handwritten ones in the
>   AXI-bus driver.
> 
> Changelog v2 (l2 driver):
> - Fix some commit message and Kconfig help text spelling.
> - Move the driver to the memory subsystem.
> - Assign dual GPL/BSD license to the DT binding.
> - Use single lined copyright header in the binding.
> - Discard reg property and syscon compatible string.
> - Move "allOf" restrictions to the root level of the properties.
> - The DT node is supposed to be a child of the Baikal-T1 system controller
>   node. So regmap will be fetched from there.
> - Use generic FIELD_{GET,PREP} macro.
> - Remove probe-status info string printout.
> - Since the driver depends on the OF config we can remove of_match_ptr()
>   macro utilization.
> 
> Changelog v3:
> - Combine l2 and AXI/APB bus patches in a single patchset.
> - Retrieve AXI-bus QoS registers by resource name "qos".
> - Discard CONFIG_OF dependency since there is none at compile-time.
> - Add syscon EHB registers range to the AXI-bus reg property as optional
>   entry.
> - Fix invalid of_property_read_u32() return value test in the l2-ctl
>   driver.
> - Get the reg property back into the l2-ctl DT bindings even though the
>   driver is using the parental syscon regmap.
> - The l2-ctl DT schema will live separately from the system controller,
>   but the corresponding sub-node of the later DT schema will $ref this one.
> - Set non-default latencies in the l2-ctl DT example.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>
> Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
> Cc: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
> Cc: Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>
> Cc: Vadim Vlasov <V.Vlasov@baikalelectronics.ru>
> Cc: Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Olof Johansson <olof@lixom.net>
> Cc: linux-mips@vger.kernel.org
> Cc: soc@kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> Serge Semin (6):
>   dt-bindings: bus: Add Baikal-T1 AXI-bus binding
>   dt-bindings: bus: Add Baikal-T1 APB-bus binding
>   dt-bindings: memory: Add Baikal-T1 L2-cache Control Block binding
>   bus: Add Baikal-T1 AXI-bus driver
>   bus: Add Baikal-T1 APB-bus driver
>   memory: Add Baikal-T1 L2-cache Control Block driver
> 
>  .../bindings/bus/baikal,bt1-apb.yaml          |  90 ++++
>  .../bindings/bus/baikal,bt1-axi.yaml          | 107 +++++
>  .../memory-controllers/baikal,bt1-l2-ctl.yaml |  63 +++
>  drivers/bus/Kconfig                           |  30 ++
>  drivers/bus/Makefile                          |   2 +
>  drivers/bus/bt1-apb.c                         | 421 ++++++++++++++++++
>  drivers/bus/bt1-axi.c                         | 318 +++++++++++++
>  drivers/memory/Kconfig                        |  11 +
>  drivers/memory/Makefile                       |   1 +
>  drivers/memory/bt1-l2-ctl.c                   | 322 ++++++++++++++
>  10 files changed, 1365 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/baikal,bt1-apb.yaml
>  create mode 100644 Documentation/devicetree/bindings/bus/baikal,bt1-axi.yaml
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/baikal,bt1-l2-ctl.yaml
>  create mode 100644 drivers/bus/bt1-apb.c
>  create mode 100644 drivers/bus/bt1-axi.c
>  create mode 100644 drivers/memory/bt1-l2-ctl.c
> 
> -- 
> 2.26.2
> 
