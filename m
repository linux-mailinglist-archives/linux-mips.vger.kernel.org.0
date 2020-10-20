Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 083212939D2
	for <lists+linux-mips@lfdr.de>; Tue, 20 Oct 2020 13:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392382AbgJTLVc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Oct 2020 07:21:32 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:51558 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393569AbgJTLVa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 20 Oct 2020 07:21:30 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id A5D18803202A;
        Tue, 20 Oct 2020 11:21:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id yX6jY9shVz70; Tue, 20 Oct 2020 14:21:27 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>, Roger Quadros <rogerq@ti.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
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
Subject: [PATCH v3 15/16] dt-bindings: usb: keystone-dwc3: Validate DWC3 sub-node
Date:   Tue, 20 Oct 2020 14:21:00 +0300
Message-ID: <20201020112101.19077-16-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201020112101.19077-1-Sergey.Semin@baikalelectronics.ru>
References: <20201020112101.19077-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

TI Keystone DWC3 compatible DT node is supposed to have a DWC USB3
compatible sub-node to describe a fully functioning USB interface.
Since DWC USB3 has now got a DT schema describing its DT node, let's make
sure the TI Keystone DWC3 sub-node passes validation against it.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changelog v2:
- Grammar fix: "s/it'/its"
---
 Documentation/devicetree/bindings/usb/ti,keystone-dwc3.yaml | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/ti,keystone-dwc3.yaml b/Documentation/devicetree/bindings/usb/ti,keystone-dwc3.yaml
index c1b19fc5d0a2..ca7fbe3ed22e 100644
--- a/Documentation/devicetree/bindings/usb/ti,keystone-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,keystone-dwc3.yaml
@@ -64,9 +64,7 @@ properties:
 
 patternProperties:
   "usb@[a-f0-9]+$":
-    type: object
-    description: This is the node representing the DWC3 controller instance
-      Documentation/devicetree/bindings/usb/dwc3.txt
+    $ref: snps,dwc3.yaml#
 
 required:
   - compatible
-- 
2.27.0

