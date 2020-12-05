Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54F232CFD16
	for <lists+linux-mips@lfdr.de>; Sat,  5 Dec 2020 19:52:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727991AbgLESTc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 5 Dec 2020 13:19:32 -0500
Received: from ns2.chip.baikal.ru ([94.125.187.42]:53276 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727099AbgLERkK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 5 Dec 2020 12:40:10 -0500
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
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v5 05/19] dt-bindings: usb: usb-hcd: Add "tpl-support" property
Date:   Sat, 5 Dec 2020 18:24:12 +0300
Message-ID: <20201205152427.29537-6-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201205152427.29537-1-Sergey.Semin@baikalelectronics.ru>
References: <20201205152427.29537-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The host controller device might be designed to work for the particular
products or applications. In that case its DT node is supposed to be
equipped with the tpl-support property.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changelog v2:
- Grammar fix: "s/it'/its"
- Discard '|' from the property description, since we don't need to preserve
  the text formatting.
---
 Documentation/devicetree/bindings/usb/usb-hcd.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
index 52cc84c400c0..9881ac10380d 100644
--- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
@@ -17,6 +17,12 @@ properties:
     description: Phandle of a companion device
     $ref: /schemas/types.yaml#/definitions/phandle
 
+  tpl-support:
+    description:
+      Indicates if the Targeted Peripheral List is supported for given
+      targeted hosts (non-PC hosts).
+    type: boolean
+
 additionalProperties: true
 
 examples:
-- 
2.29.2

