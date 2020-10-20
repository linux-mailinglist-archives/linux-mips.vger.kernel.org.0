Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6F5928E58B
	for <lists+linux-mips@lfdr.de>; Wed, 14 Oct 2020 19:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbgJNRkH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Oct 2020 13:40:07 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:49600 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727146AbgJNRkH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 14 Oct 2020 13:40:07 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 44EAE803073E;
        Wed, 14 Oct 2020 17:40:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id YIjbSdqXSCpp; Wed, 14 Oct 2020 20:39:59 +0300 (MSK)
Date:   Wed, 14 Oct 2020 20:39:59 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
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
        <linux-arm-kernel@lists.infradead.org>,
        <linux-snps-arc@lists.infradead.org>, <linux-mips@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/20] dt-bindings: usb: Add generic USB HCD, xHCI, DWC
 USB3 DT schema
Message-ID: <20201014173959.l3cnybtg55jf3x53@mobilestation>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Ah, forgot to mark the series as v2. Sorry about that. The next one will be v3
then...

-Sergey

On Wed, Oct 14, 2020 at 01:13:42PM +0300, Serge Semin wrote:
> We've performed some work on the Generic USB HCD, xHCI and DWC USB3 DT
> bindings in the framework of the Baikal-T1 SoC support integration into
> the kernel. This patchset is a result of that work.
> 
> First of all we moved the generic USB properties from the legacy text
> bindings into the USB HCD DT schema. So now the generic USB HCD-compatible
> DT nodes are validated taking into account the optional properties like:
> maximum-speed, dr_mode, otg-rev, usb-role-switch, etc. We've fixed these
> properties a bit so they would correspond to what functionality kernel
> currently supports.
> 
> Secondly we converted generic USB xHCI text bindings file into the DT
> schema. It had to be split up into two bindings: DT schema with generic
> xHCI properties and a generic xHCI device DT schema. The later will be
> used to validate the pure xHCI-based nodes, while the former can be
> utilized by some vendor-specific versions of xHCI.
> 
> Thirdly, what was primarily intended to be done for Baikal-T1 SoC USB we
> converted the legacy text-based DWC USB3 bindings to DT schema and altered
> the result a bit so it would be more coherent with what actually
> controller and its driver support. Since we've now got the DWC USB3 DT
> schema, we made it used to validate the sub-nodes of the Qualcom, TI and
> Amlogic DWC3 DT nodes.
> 
> Finally we've also fixed all the OHCI/EHCI, xHCI and DW USB3 compatible DT
> nodes so they would comply with the nodes naming scema declared in the USB
> HCD DT bindings file.
> 
> Link: https://lore.kernel.org/linux-usb/20201010224121.12672-1-Sergey.Semin@baikalelectronics.ru/
> Changelog v2:
> - Thanks to Sergei Shtylyov for suggesting the commit logs grammar fixes:
>   [PATCH 04/18] dt-bindings: usb: usb-hcd: Add "ulpi/serial/hsic" PHY types
>   [PATCH 05/18] dt-bindings: usb: usb-hcd: Add "tpl-support" property
>   [PATCH 11/18] dt-bindings: usb: dwc3: Add interrupt-names property support
>   [PATCH 13/18] dt-bindings: usb: dwc3: Add Tx De-emphasis restrictions
>   [PATCH 17/18] dt-bindings: usb: keystone-dwc3: Validate DWC3 sub-node
> - Set FL-adj of the amlogiv,meson-g12a-usb controller with value 0x20 instead
>   of completely removing the property.
> - Drop the patch:
>   [PATCH 02/18] dt-bindings: usb: usb-hcd: Add "wireless" maximum-speed
>                 property value
>   since "wireless" speed type is depracated due to lack of the device
>   supporting it.
> - Drop quotes from around the compat string constant.
> - Discard '|' from the property descriptions, since we don't need to preserve
>   the text formatting.
> - Convert abbreviated form of the "maximum-speed" enum constraint into
>   the multi-lined version of the list.
> - Fix the DW USB3 "clock-names" prop description to be refererring to the
>   enumerated clock-names instead of the ones from the Databook.
> - Add explicit "additionalProperties: true" to the usb-xhci.yaml schema,
>   since additionalProperties/unevaluatedProperties are going to be mandary
>   for each binding.
> - Use "oneOf: [dwc2.yaml#, snps,dwc3.yaml#]" instead of the bulky "if:
>   properties: compatibe: ..." statement.
> - Discard the "^dwc3@[0-9a-f]+$" nodes from being acceptable as sub-nodes
>   of the Qualcomm DWC3 DT nodes.
> - Add new patches:
>   [PATCH 18/20] arch: dts: Fix EHCI/OHCI DT nodes name
>   [PATCH 19/20] arch: dts: Fix xHCI DT nodes name
>   [PATCH 20/20] arch: dts: Fix DWC USB3 DT nodes name
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Manu Gautam <mgautam@codeaurora.org>
> Cc: Roger Quadros <rogerq@ti.com>
> Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-mips@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-usb@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> Serge Semin (20):
>   dt-bindings: usb: usb-hcd: Convert generic USB properties to DT schema
>   dt-bindings: usb: usb-hcd: Add "otg-rev" property restriction
>   dt-bindings: usb: usb-hcd: Add "ulpi/serial/hsic" PHY types
>   dt-bindings: usb: usb-hcd: Add "tpl-support" property
>   dt-bindings: usb: usb-hcd: Add generic "usb-phy" property
>   dt-bindings: usb: Convert xHCI bindings to DT schema
>   dt-bindings: usb: xhci: Add Broadcom STB v2 compatible device
>   dt-bindings: usb: renesas-xhci: Refer to the usb-xhci.yaml file
>   dt-bindings: usb: Convert DWC USB3 bindings to DT schema
>   dt-bindings: usb: dwc3: Add interrupt-names property support
>   dt-bindings: usb: dwc3: Add synopsys,dwc3 compatible string
>   dt-bindings: usb: dwc3: Add Tx De-emphasis restrictions
>   dt-bindings: usb: dwc3: Add Frame Length Adj restrictions
>   dt-bindings: usb: meson-g12a-usb: Fix FL-adj property value
>   dt-bindings: usb: meson-g12a-usb: Validate DWC2/DWC3 sub-nodes
>   dt-bindings: usb: keystone-dwc3: Validate DWC3 sub-node
>   dt-bindings: usb: qcom,dwc3: Validate DWC3 sub-node
>   arch: dts: Fix EHCI/OHCI DT nodes name
>   arch: dts: Fix xHCI DT nodes name
>   arch: dts: Fix DWC USB3 DT nodes name
> 
>  .../usb/amlogic,meson-g12a-usb-ctrl.yaml      |   6 +-
>  .../devicetree/bindings/usb/dwc3.txt          | 125 -------
>  .../devicetree/bindings/usb/generic-xhci.yaml |  65 ++++
>  .../devicetree/bindings/usb/generic.txt       |  57 ----
>  .../devicetree/bindings/usb/qcom,dwc3.yaml    |   9 +-
>  .../bindings/usb/renesas,usb-xhci.yaml        |   4 +-
>  .../devicetree/bindings/usb/snps,dwc3.yaml    | 315 ++++++++++++++++++
>  .../bindings/usb/ti,keystone-dwc3.yaml        |   4 +-
>  .../devicetree/bindings/usb/usb-hcd.yaml      | 104 ++++++
>  .../devicetree/bindings/usb/usb-xhci.txt      |  41 ---
>  .../devicetree/bindings/usb/usb-xhci.yaml     |  42 +++
>  arch/arc/boot/dts/axs10x_mb.dtsi              |   4 +-
>  arch/arc/boot/dts/hsdk.dts                    |   4 +-
>  arch/arc/boot/dts/vdk_axs10x_mb.dtsi          |   2 +-
>  arch/arm/boot/dts/armada-375.dtsi             |   2 +-
>  arch/arm/boot/dts/bcm5301x.dtsi               |   6 +-
>  arch/arm/boot/dts/bcm53573.dtsi               |   4 +-
>  arch/arm/boot/dts/exynos5250.dtsi             |   2 +-
>  arch/arm/boot/dts/exynos54xx.dtsi             |   4 +-
>  arch/arm/boot/dts/hisi-x5hd2.dtsi             |   4 +-
>  arch/arm/boot/dts/keystone-k2e.dtsi           |   4 +-
>  arch/arm/boot/dts/keystone.dtsi               |   2 +-
>  arch/arm/boot/dts/lpc18xx.dtsi                |   4 +-
>  arch/arm/boot/dts/ls1021a.dtsi                |   2 +-
>  arch/arm/boot/dts/omap5-l4.dtsi               |   2 +-
>  arch/arm/boot/dts/stih407-family.dtsi         |   2 +-
>  arch/arm/boot/dts/stm32mp151.dtsi             |   4 +-
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  |   2 +-
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi    |   4 +-
>  arch/arm64/boot/dts/exynos/exynos7.dtsi       |   2 +-
>  .../arm64/boot/dts/freescale/fsl-ls1012a.dtsi |   4 +-
>  .../arm64/boot/dts/freescale/fsl-ls1043a.dtsi |   6 +-
>  .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi |   4 +-
>  .../arm64/boot/dts/freescale/fsl-ls208xa.dtsi |   4 +-
>  arch/arm64/boot/dts/hisilicon/hi3660.dtsi     |   2 +-
>  .../arm64/boot/dts/hisilicon/hi3798cv200.dtsi |   4 +-
>  arch/arm64/boot/dts/hisilicon/hip06.dtsi      |   4 +-
>  arch/arm64/boot/dts/hisilicon/hip07.dtsi      |   4 +-
>  arch/arm64/boot/dts/marvell/armada-cp11x.dtsi |   4 +-
>  arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi  |   4 +-
>  arch/arm64/boot/dts/qcom/ipq8074.dtsi         |   4 +-
>  arch/arm64/boot/dts/qcom/msm8996.dtsi         |   4 +-
>  arch/arm64/boot/dts/qcom/msm8998.dtsi         |   2 +-
>  arch/arm64/boot/dts/qcom/qcs404-evb.dtsi      |   2 +-
>  arch/arm64/boot/dts/qcom/qcs404.dtsi          |   4 +-
>  arch/arm64/boot/dts/qcom/sc7180.dtsi          |   2 +-
>  arch/arm64/boot/dts/qcom/sdm845.dtsi          |   4 +-
>  arch/arm64/boot/dts/qcom/sm8150.dtsi          |   2 +-
>  arch/mips/boot/dts/ingenic/jz4740.dtsi        |   2 +-
>  arch/mips/boot/dts/ingenic/jz4770.dtsi        |   2 +-
>  arch/mips/boot/dts/mti/sead3.dts              |   2 +-
>  arch/mips/boot/dts/ralink/mt7628a.dtsi        |   2 +-
>  arch/powerpc/boot/dts/akebono.dts             |   6 +-
>  53 files changed, 605 insertions(+), 305 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/dwc3.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/generic-xhci.yaml
>  delete mode 100644 Documentation/devicetree/bindings/usb/generic.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/snps,dwc3.yaml
>  delete mode 100644 Documentation/devicetree/bindings/usb/usb-xhci.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/usb-xhci.yaml
> 
> -- 
> 2.27.0
> 
