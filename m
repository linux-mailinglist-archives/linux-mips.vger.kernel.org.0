Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68EE12AECC9
	for <lists+linux-mips@lfdr.de>; Wed, 11 Nov 2020 10:10:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbgKKJJt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Nov 2020 04:09:49 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:38834 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726644AbgKKJJL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Nov 2020 04:09:11 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 8B0B98030171;
        Wed, 11 Nov 2020 09:09:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id TZS9AUp4z0AJ; Wed, 11 Nov 2020 12:09:03 +0300 (MSK)
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
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-snps-arc@lists.infradead.org>, <linux-mips@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 01/18] dt-bindings: usb: usb-hcd: Detach generic USB controller properties
Date:   Wed, 11 Nov 2020 12:08:36 +0300
Message-ID: <20201111090853.14112-2-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
References: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There can be three distinctive types of the USB controllers: USB hosts,
USB peripherals/gadgets and USB OTG, which can switch from one role to
another. In order to have that hierarchy handled in the DT binding files,
we need to collect common properties in a common DT schema and specific
properties in dedicated schemas. Seeing the usb-hcd.yaml DT schema is
dedicated for the USB host controllers only, let's move some common
properties from there into the usb.yaml schema. So the later would be
available to evaluate all currently supported types of the USB
controllers.

While at it add an explicit "additionalProperties: true" into the
usb-hcd.yaml as setting the additionalProperties/unevaluateProperties
properties is going to be get mandatory soon.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

---

Changelog v4:
- This is a new patch created as a result of the comment left
  by Chunfeng Yun in v3
---
 .../devicetree/bindings/usb/usb-hcd.yaml      | 14 ++-------
 .../devicetree/bindings/usb/usb.yaml          | 29 +++++++++++++++++++
 2 files changed, 32 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/usb.yaml

diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
index 7263b7f2b510..81f3ad1419d8 100644
--- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
@@ -9,18 +9,10 @@ title: Generic USB Host Controller Device Tree Bindings
 maintainers:
   - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 
-properties:
-  $nodename:
-    pattern: "^usb(@.*)?"
+allOf:
+  - $ref: usb.yaml#
 
-  phys:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    description:
-      List of all the USB PHYs on this HCD
-
-  phy-names:
-    description:
-      Name specifier for the USB PHY
+additionalProperties: true
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/usb/usb.yaml b/Documentation/devicetree/bindings/usb/usb.yaml
new file mode 100644
index 000000000000..941ad59fbac5
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/usb.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/usb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic USB Controller Device Tree Bindings
+
+maintainers:
+  - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+
+select: false
+
+properties:
+  $nodename:
+    pattern: "^usb(@.*)?"
+
+  phys:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      List of all the USB PHYs on this HCD
+
+  phy-names:
+    description:
+      Name specifier for the USB PHY
+
+additionalProperties: true
+
+...
-- 
2.28.0

