Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81DB82D56A1
	for <lists+linux-mips@lfdr.de>; Thu, 10 Dec 2020 10:17:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388788AbgLJJQL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Dec 2020 04:16:11 -0500
Received: from mx.chip.baikal.ru ([94.125.187.42]:36708 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732128AbgLJJL7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 10 Dec 2020 04:11:59 -0500
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
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
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v6 18/19] dt-bindings: usb: qcom,dwc3: Validate DWC3 sub-node
Date:   Thu, 10 Dec 2020 12:09:42 +0300
Message-ID: <20201210090944.16283-19-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201210090944.16283-1-Sergey.Semin@baikalelectronics.ru>
References: <20201210090944.16283-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Qualcomm msm8996/sc7180/sdm845 DWC3 compatible DT nodes are supposed to
have a DWC USB3 compatible sub-node to describe a fully functioning USB
interface. Let's use the available DWC USB3 DT schema to validate the
Qualcomm DWC3 sub-nodes.

Note since the generic DWC USB3 DT node is supposed to be named as generic
USB HCD ("^usb(@.*)?") one we have to accordingly fix the sub-nodes name
regexp and fix the DT node example.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changelog v2:
- Discard the "^dwc3@[0-9a-f]+$" nodes from being acceptable as sub-nodes.
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 2cf525d21e05..b336662e838c 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -103,11 +103,8 @@ properties:
 # Required child node:
 
 patternProperties:
-  "^dwc3@[0-9a-f]+$":
-    type: object
-    description:
-      A child node must exist to represent the core DWC3 IP block
-      The content of the node is defined in dwc3.txt.
+  "^usb@[0-9a-f]+$":
+    $ref: snps,dwc3.yaml#
 
 required:
   - compatible
@@ -162,7 +159,7 @@ examples:
 
             resets = <&gcc GCC_USB30_PRIM_BCR>;
 
-            dwc3@a600000 {
+            usb@a600000 {
                 compatible = "snps,dwc3";
                 reg = <0 0x0a600000 0 0xcd00>;
                 interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.29.2

