Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3C0F2CFC38
	for <lists+linux-mips@lfdr.de>; Sat,  5 Dec 2020 18:07:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727571AbgLERAQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 5 Dec 2020 12:00:16 -0500
Received: from ns2.chip.baikal.ru ([94.125.187.42]:53194 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726755AbgLEQzy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 5 Dec 2020 11:55:54 -0500
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Roger Quadros <rogerq@ti.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-snps-arc@lists.infradead.org>, <linux-mips@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 00/19] dt-bindings: usb: Add generic USB HCD, xHCI, DWC USB3 DT schema
Date:   Sat, 5 Dec 2020 18:24:07 +0300
Message-ID: <20201205152427.29537-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

We've performed some work on the Generic USB HCD, xHCI and DWC USB3 DT
bindings in the framework of the Baikal-T1 SoC support integration into
the kernel. This patchset is a result of that work.

First of all we moved the generic USB properties from the legacy text
bindings to the USB DT schema. The properties have been distributed
between three DT schemas dedicated for particular types of USB
controllers: Generic USB controller properties (like node-naming, phys,
maximum-speed, etc), Generic USB Host Controller bindings (companion and
TPL support), Dual-Role USB Controller (OTG revision, DR mode,
HNP/SRP/ADP protocols, etc). So the USB controllers DT bindings from now
can validate the nodes against a generic USB-controller schema suitable
for the controller functionality.

Secondly we converted generic USB xHCI text bindings file into the DT
schema. It had to be split up into two bindings: DT schema with generic
xHCI properties and a generic xHCI device DT schema. The later will be
used to validate the pure xHCI-based nodes, while the former can be
utilized by some vendor-specific versions of xHCI.

Thirdly, what was primarily intended to be done for Baikal-T1 SoC USB we
converted the legacy text-based DWC USB3 bindings to DT schema and altered
the result a bit so it would be more coherent with what actually
controller and its driver support. Since we've now got the DWC USB3 DT
schema, we made it used to validate the sub-nodes of the Qualcom, TI and
Amlogic DWC3 DT nodes.

Link: https://lore.kernel.org/linux-usb/20201010224121.12672-1-Sergey.Semin@baikalelectronics.ru/
Changelog v2:
- Thanks to Sergei Shtylyov for suggesting the commit logs grammar fixes:
  [PATCH 04/18] dt-bindings: usb: usb-hcd: Add "ulpi/serial/hsic" PHY types
  [PATCH 05/18] dt-bindings: usb: usb-hcd: Add "tpl-support" property
  [PATCH 11/18] dt-bindings: usb: dwc3: Add interrupt-names property support
  [PATCH 13/18] dt-bindings: usb: dwc3: Add Tx De-emphasis restrictions
  [PATCH 17/18] dt-bindings: usb: keystone-dwc3: Validate DWC3 sub-node
- Set FL-adj of the amlogiv,meson-g12a-usb controller with value 0x20 instead
  of completely removing the property.
- Drop the patch:
  [PATCH 02/18] dt-bindings: usb: usb-hcd: Add "wireless" maximum-speed
                property value
  since "wireless" speed type is depracated due to lack of the device
  supporting it.
- Drop quotes from around the compat string constant.
- Discard '|' from the property descriptions, since we don't need to preserve
  the text formatting.
- Convert abbreviated form of the "maximum-speed" enum constraint into
  the multi-lined version of the list.
- Fix the DW USB3 "clock-names" prop description to be refererring to the
  enumerated clock-names instead of the ones from the Databook.
- Add explicit "additionalProperties: true" to the usb-xhci.yaml schema,
  since additionalProperties/unevaluatedProperties are going to be mandary
  for each binding.
- Use "oneOf: [dwc2.yaml#, snps,dwc3.yaml#]" instead of the bulky "if:
  properties: compatibe: ..." statement.
- Discard the "^dwc3@[0-9a-f]+$" nodes from being acceptable as sub-nodes
  of the Qualcomm DWC3 DT nodes.
- Add new patches:
  [PATCH 18/20] arch: dts: Fix EHCI/OHCI DT nodes name
  [PATCH 19/20] arch: dts: Fix xHCI DT nodes name
  [PATCH 20/20] arch: dts: Fix DWC USB3 DT nodes name

Link: https://lore.kernel.org/linux-usb/20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru
Changelog v3:
- Drop the patches:
  [PATCH 18/20] arch: dts: Fix EHCI/OHCI DT nodes name
  [PATCH 19/20] arch: dts: Fix xHCI DT nodes name
  [PATCH 20/20] arch: dts: Fix DWC USB3 DT nodes name
  as they are going to be submitted in the framework of a dedicated patchset.
- Drop the patch:
  [PATCH 11/20] dt-bindings: usb: dwc3: Add synopsys,dwc3 compatible string
  since it's going to be replaced with the driver/dts fixup and moved to a
  dedicated patchset.
- Apply usb-xhci.yaml# schema for the DWC USB3 node only if the controller is
  supposed to work as either host or otg.

Link: https://lore.kernel.org/linux-usb/20201020112101.19077-1-Sergey.Semin@baikalelectronics.ru
Changelog v4:
- Get the patch
  [PATCH 11/17] dt-bindings: usb: dwc3: Add synopsys,dwc3 compatible string
  back, since we can't discard the deprecated prefix from the driver.
- Discard the block scalar style modifier "|" from the interrupts property
  description.
- Split the generic USB controller properties into three schemas: Generic USB
  controllers, USB Host controllers and USB OTG controllers.

Link: https://lore.kernel.org/linux-usb/20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru
Changelog v5:
- Add "snps,dis-split-quirk" property to the DWC USB3 DT schema.
- Add a text to the
  [PATCH v4 10/18] dt-bindings: usb: Convert DWC USB3 bindings to DT schema
  patch log about the small change in the clock-related properties bindings
  with respect to the original binding file.
- Discard duplicated "additionalProperties" from the usb-hcd.yaml schema.
- Make sure dr_mode exist in DW USB3 node to apply the USB-gadget-only schema.
- Add a new patch:
  [PATCH v5 19/19] dt-bindings: usb: intel,keembay-dwc3: Validate DWC3 sub-node
  since the Intel Keem Bay DWC3 bindings has been just added.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Manu Gautam <mgautam@codeaurora.org>
Cc: Roger Quadros <rogerq@ti.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-mips@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Serge Semin (19):
  dt-bindings: usb: usb-hcd: Detach generic USB controller properties
  dt-bindings: usb: Convert generic USB properties to DT schemas
  dt-bindings: usb: usb-drd: Add "otg-rev" property constraints
  dt-bindings: usb: Add "ulpi/serial/hsic" PHY types
  dt-bindings: usb: usb-hcd: Add "tpl-support" property
  dt-bindings: usb: Add generic "usb-phy" property
  dt-bindings: usb: Convert xHCI bindings to DT schema
  dt-bindings: usb: xhci: Add Broadcom STB v2 compatible device
  dt-bindings: usb: renesas-xhci: Refer to the usb-xhci.yaml file
  dt-bindings: usb: Convert DWC USB3 bindings to DT schema
  dt-bindings: usb: dwc3: Add interrupt-names property support
  dt-bindings: usb: dwc3: Add synopsys,dwc3 compatible string
  dt-bindings: usb: dwc3: Add Tx De-emphasis constraints
  dt-bindings: usb: dwc3: Add Frame Length Adj constraints
  dt-bindings: usb: meson-g12a-usb: Fix FL-adj property value
  dt-bindings: usb: meson-g12a-usb: Validate DWC2/DWC3 sub-nodes
  dt-bindings: usb: keystone-dwc3: Validate DWC3 sub-node
  dt-bindings: usb: qcom,dwc3: Validate DWC3 sub-node
  dt-bindings: usb: intel,keembay-dwc3: Validate DWC3 sub-node

 .../usb/amlogic,meson-g12a-usb-ctrl.yaml      |   6 +-
 .../devicetree/bindings/usb/dwc3.txt          | 128 -------
 .../devicetree/bindings/usb/generic-xhci.yaml |  65 ++++
 .../devicetree/bindings/usb/generic.txt       |  57 ---
 .../bindings/usb/intel,keembay-dwc3.yaml      |   9 +-
 .../devicetree/bindings/usb/qcom,dwc3.yaml    |   9 +-
 .../bindings/usb/renesas,usb-xhci.yaml        |   4 +-
 .../devicetree/bindings/usb/snps,dwc3.yaml    | 332 ++++++++++++++++++
 .../bindings/usb/ti,keystone-dwc3.yaml        |   4 +-
 .../devicetree/bindings/usb/usb-drd.yaml      |  78 ++++
 .../devicetree/bindings/usb/usb-hcd.yaml      |  19 +-
 .../devicetree/bindings/usb/usb-xhci.txt      |  41 ---
 .../devicetree/bindings/usb/usb-xhci.yaml     |  42 +++
 .../devicetree/bindings/usb/usb.yaml          |  60 ++++
 14 files changed, 600 insertions(+), 254 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/dwc3.txt
 create mode 100644 Documentation/devicetree/bindings/usb/generic-xhci.yaml
 delete mode 100644 Documentation/devicetree/bindings/usb/generic.txt
 create mode 100644 Documentation/devicetree/bindings/usb/snps,dwc3.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/usb-drd.yaml
 delete mode 100644 Documentation/devicetree/bindings/usb/usb-xhci.txt
 create mode 100644 Documentation/devicetree/bindings/usb/usb-xhci.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/usb.yaml

-- 
2.29.2

