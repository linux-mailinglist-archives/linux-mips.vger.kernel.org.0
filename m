Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E43922939DA
	for <lists+linux-mips@lfdr.de>; Tue, 20 Oct 2020 13:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393566AbgJTLWG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Oct 2020 07:22:06 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:51552 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393568AbgJTLVa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 20 Oct 2020 07:21:30 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 6A60B803017C;
        Tue, 20 Oct 2020 11:21:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id BY9vIjNHL5cT; Tue, 20 Oct 2020 14:21:24 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>
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
        <linux-arm-kernel@lists.infradead.org>,
        <linux-snps-arc@lists.infradead.org>, <linux-mips@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 10/16] dt-bindings: usb: dwc3: Add interrupt-names property support
Date:   Tue, 20 Oct 2020 14:20:55 +0300
Message-ID: <20201020112101.19077-11-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201020112101.19077-1-Sergey.Semin@baikalelectronics.ru>
References: <20201020112101.19077-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The controller driver supports two types of DWC USB3 devices: with a
common interrupt lane and with individual interrupts for each mode. Add
support for both these cases to the DWC USB3 DT schema.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changelog v2:
- Grammar fix: "s/both of these cases support/support for both these cases"
- Drop quotes from around the string constants.
---
 Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
index 65bc66ec67d0..23f07222d3d7 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
@@ -30,9 +30,20 @@ properties:
       const: snps,dwc3
 
   interrupts:
+    description: |
+      It's either a single common DWC3 interrupt (dwc_usb3) or individual
+      interrupts for the host, gadget and DRD modes.
     minItems: 1
     maxItems: 3
 
+  interrupt-names:
+    minItems: 1
+    maxItems: 3
+    oneOf:
+      - const: dwc_usb3
+      - items:
+          enum: [host, peripheral, otg]
+
   clocks:
     description:
       In general the core supports three types of clocks. bus_early is a
-- 
2.27.0

