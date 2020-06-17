Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 791EE1FD9C1
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2020 01:41:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbgFQXkr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Jun 2020 19:40:47 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:57738 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726763AbgFQXkq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Jun 2020 19:40:46 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id EC2E3803202F;
        Wed, 17 Jun 2020 23:40:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id IfbOWqE3ejpW; Thu, 18 Jun 2020 02:40:37 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Vinod Koul <vkoul@kernel.org>, Viresh Kumar <vireshk@kernel.org>
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
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>, <linux-mips@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND v6 0/9] dmaengine: dw: Take Baikal-T1 SoC DW DMAC peculiarities into account
Date:   Thu, 18 Jun 2020 02:40:19 +0300
Message-ID: <20200617234028.25808-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Folks, note I've removed the next patches from the series:
[PATCH v5 04/11] dmaengine: Introduce max SG list entries capability
[PATCH v5 11/11] dmaengine: dw: Initialize max_sg_nents capability
It turns out the problem with the asynchronous handling of Tx- and Rx-
SPI transfers interrupts is more complex than I expected. So in order to
solve the problem it isn't enough to split the SG list entries submission
up based on the max_sg_nents capability setting (though the synchronous
one-by-one SG list entries handling does fix a part of the problem). So
if and when I get to find a comprehensive solution for it I'll submit a
new series with fixups. Until then please consider to merge the patchset
in without those patches.

Regarding the patchset. Baikal-T1 SoC has an DW DMAC on-board to provide a
Mem-to-Mem, low-speed peripherals Dev-to-Mem and Mem-to-Dev functionality.
Mostly it's compatible with currently implemented in the kernel DW DMAC
driver, but there are some peculiarities which must be taken into account
in order to have the device fully supported.

First of all traditionally we replaced the legacy plain text-based dt-binding
file with yaml-based one. Secondly Baikal-T1 DW DMA Controller provides eight
channels, which alas have different max burst length configuration.
In particular first two channels may burst up to 128 bits (16 bytes) at a time
while the rest of them just up to 32 bits. We must make sure that the DMA
subsystem doesn't set values exceeding these limitations otherwise the
controller will hang up. In third currently we discovered the problem in using
the DW APB SPI driver together with DW DMAC. The problem happens if there is no
natively implemented multi-block LLP transfers support and the SPI-transfer
length exceeds the max lock size. In this case due to asynchronous handling of
Tx- and Rx- SPI transfers interrupt we might end up with DW APB SSI Rx FIFO
overflow. So if DW APB SSI (or any other DMAC service consumer) intends to use
the DMAC to asynchronously execute the transfers we'd have to at least warn
the user of the possible errors. In forth it's worth to set the DMA device max
segment size with max block size config specific to the DW DMA controller. It
shall help the DMA clients to create size-optimized SG-list items for the
controller. This in turn will cause less dw_desc allocations, less LLP
reinitializations, better DMA device performance.

Finally there is a bug in the algorithm of the nollp flag detection.
In particular even if DW DMAC parameters state the multi-block transfers
support there is still HC_LLP (hardcode LLP) flag, which if set makes expected
by the driver true multi-block LLP functionality unusable. This happens cause'
if HC_LLP flag is set the LLP registers will be hardcoded to zero so the
contiguous multi-block transfers will be only supported. We must take the
flag into account when detecting the LLP support otherwise the driver just
won't work correctly.

This patchset is rebased and tested on the mainline Linux kernel 5.7-rc4:
base-commit: 0e698dfa2822 ("Linux 5.7-rc4")
tag: v5.7-rc4

Changelog v2:
- Rearrange SoBs.
- Move $ref to the root level of the properties. So do do with the
  constraints in the DT binding.
- Replace "additionalProperties: false" with "unevaluatedProperties: false"
  property in the DT binding file.
- Discard default settings defined out of property enum constraint.
- Set default max-burst-len to 256 TR-WIDTH words in the DT binding.
- Discard noLLP and block_size accessors.
- Set max segment size of the DMA device structure with the DW DMA block size
  config.
- Print warning if noLLP flag is set.
- Discard max burst length accessor.
- Add comment about why hardware accelerated LLP list support depends
  on both MBLK_EN and HC_LLP configs setting.
- Use explicit bits state comparison operator in noLLP flag setting.

Link: https://lore.kernel.org/dmaengine/20200508105304.14065-1-Sergey.Semin@baikalelectronics.ru/
Changelog v3:
- Use the block_size found for the very first channel instead of looking for
  the maximum of maximum block sizes.
- Don't define device-specific device_dma_parameters object, since it has
  already been defined by the platform device core.
- Add more details into the property description about what limitations
  snps,max-burst-len defines.
- Move commit fb7e3bbfc830 ("dmaengine: dw: Take HC_LLP flag into account for
  noLLP auto-config") to the head of the series.
- Add a new patch "dmaengine: Introduce min burst length capability" as a
  result of the discussion with Vinod and Andy regarding the burst length
  capability.
- Add a new patch "dmaengine: Introduce max SG list entries capability"
  suggested by Andy.
- Add a new patch "dmaengine: Introduce DMA-device device_caps callback" as
  a result of the discussion with Vinud and Andy in the framework of DW DMA
  burst and LLP capabilities.
- Add a new patch "dmaengine: dw: Add dummy device_caps callback" as a
  preparation commit before setting the max_burst and max_sg_nents
  DW DMA capabilities.
- Override the slave channel max_burst capability instead of calculating
  the minimum value of max burst lengths and setting the DMA-device
  generic capability.
- Add a new patch "dmaengine: dw: Initialize max_sg_nents with nollp flag".
  This is required to fix the DW APB SSI issue of the Tx and Rx DMA
  channels de-synchronization.

Link: https://lore.kernel.org/dmaengine/20200526225022.20405-1-Sergey.Semin@baikalelectronics.ru/
Changelog v4:
- Use explicit if-else statement when assigning the max_sg_nents field.
- Clamp the dst and src burst lengths in the generic dwc_config() method
  instead of doing that in the encode_maxburst() callback.
- Define max_burst with u32 type in struct dw_dma_platform_data.
- Perform of_property_read_u32_array() with the platform data
  max_burst member passed directly.
- Add a new patch "dmaengine: dw: Initialize min_burst capability",
  which initializes the min_burst capability with 1.
- Fix of->if typo. It should be definitely "of" in the max_sg_list
  capability description.

Link: https://lore.kernel.org/dmaengine/20200528222401.26941-1-Sergey.Semin@baikalelectronics.ru
Changelog v5:
- Introduce macro with extreme min and max burst lengths supported by the
  DW DMA controller. Define them in the patch with default min and max burst
  length iintializations.
- Initialize max_burst length capability with extreme burst length supported
  by the DW DMAC IP-core.
- Move DW_DMA_MAX_BURST macro definition to the patch "dmaengine: dw:
  Initialize min and max burst DMA device capability".
- Add in-line comment at the point of the device_caps callback invocation.
- Add doc-comment for the device_caps member of struct dma_device

Link: https://lore.kernel.org/dmaengine/20200529144054.4251-1-Sergey.Semin@baikalelectronics.ru
Changelog v6:
- Discard patches:
  [PATCH v5 04/11] dmaengine: Introduce max SG list entries capability
  [PATCH v5 11/11] dmaengine: dw: Initialize max_sg_nents capability
  since for now it's not enough to have them merged in to provide the SPI
  Rx FIFO overrun error fix. They will be included into another series.

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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-mips@vger.kernel.org
Cc: dmaengine@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Serge Semin (9):
  dt-bindings: dma: dw: Convert DW DMAC to DT binding
  dt-bindings: dma: dw: Add max burst transaction length property
  dmaengine: Introduce min burst length capability
  dmaengine: Introduce DMA-device device_caps callback
  dmaengine: dw: Take HC_LLP flag into account for noLLP auto-config
  dmaengine: dw: Set DMA device max segment size parameter
  dmaengine: dw: Add dummy device_caps callback
  dmaengine: dw: Initialize min and max burst DMA device capability
  dmaengine: dw: Introduce max burst length hw config

 .../bindings/dma/snps,dma-spear1340.yaml      | 176 ++++++++++++++++++
 .../devicetree/bindings/dma/snps-dma.txt      |  69 -------
 drivers/dma/dmaengine.c                       |  11 ++
 drivers/dma/dw/core.c                         |  36 +++-
 drivers/dma/dw/of.c                           |   5 +
 drivers/dma/dw/regs.h                         |   3 +
 include/linux/dmaengine.h                     |   8 +
 include/linux/platform_data/dma-dw.h          |   5 +
 8 files changed, 243 insertions(+), 70 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/snps,dma-spear1340.yaml
 delete mode 100644 Documentation/devicetree/bindings/dma/snps-dma.txt

-- 
2.26.2

