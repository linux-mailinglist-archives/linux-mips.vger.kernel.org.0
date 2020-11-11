Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C89A32AECD1
	for <lists+linux-mips@lfdr.de>; Wed, 11 Nov 2020 10:11:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726584AbgKKJKw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Nov 2020 04:10:52 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:39422 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbgKKJJs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Nov 2020 04:09:48 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 43040803017E;
        Wed, 11 Nov 2020 09:09:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Ontg9NCpW9V1; Wed, 11 Nov 2020 12:09:04 +0300 (MSK)
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
Subject: [PATCH v4 02/18] dt-bindings: usb: Convert generic USB properties to DT schemas
Date:   Wed, 11 Nov 2020 12:08:37 +0300
Message-ID: <20201111090853.14112-3-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
References: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The generic USB properties have been described in the legacy bindings
text file: Documentation/devicetree/bindings/usb/generic.txt . Let's
convert its content into the generic USB, USB HCD and USB DRD DT
schemas. So the Generic USB schema will be applicable to all USB
controllers, USB HCD - for the generic USB Host controllers and the USB
DRD - for the USB Dual-role controllers.

Note the USB DRD schema is supposed to work in conjunction with
the USB peripheral/gadget and USB host controllers DT schemas.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

---

Changelog v2:
- Discard '|' in all the new properties, since we don't need to preserve
  the text formatting.
- Convert abbreviated form of the "maximum-speed" enum restriction into
  the multi-lined version of the list.
- Drop quotes from around the string constants.

Changelog v4:
- Redistribute the properties between generic ones, USB HCD-specific and
  USB DRD-specific.
- Discard the Rob'es Reviewed-by tag. Please review the patch one more time.
---
 .../devicetree/bindings/usb/generic.txt       | 57 --------------
 .../devicetree/bindings/usb/usb-drd.yaml      | 77 +++++++++++++++++++
 .../devicetree/bindings/usb/usb-hcd.yaml      |  5 ++
 .../devicetree/bindings/usb/usb.yaml          | 22 ++++++
 4 files changed, 104 insertions(+), 57 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/generic.txt
 create mode 100644 Documentation/devicetree/bindings/usb/usb-drd.yaml

diff --git a/Documentation/devicetree/bindings/usb/generic.txt b/Documentation/devicetree/bindings/usb/generic.txt
deleted file mode 100644
index ba472e7aefc9..000000000000
--- a/Documentation/devicetree/bindings/usb/generic.txt
+++ /dev/null
@@ -1,57 +0,0 @@
-Generic USB Properties
-
-Optional properties:
- - maximum-speed: tells USB controllers we want to work up to a certain
-			speed. Valid arguments are "super-speed-plus",
-			"super-speed", "high-speed", "full-speed" and
-			"low-speed". In case this isn't passed via DT, USB
-			controllers should default to their maximum HW
-			capability.
- - dr_mode: tells Dual-Role USB controllers that we want to work on a
-			particular mode. Valid arguments are "host",
-			"peripheral" and "otg". In case this attribute isn't
-			passed via DT, USB DRD controllers should default to
-			OTG.
- - phy_type: tells USB controllers that we want to configure the core to support
-			a UTMI+ PHY with an 8- or 16-bit interface if UTMI+ is
-			selected. Valid arguments are "utmi" and "utmi_wide".
-			In case this isn't passed via DT, USB controllers should
-			default to HW capability.
- - otg-rev: tells usb driver the release number of the OTG and EH supplement
-			with which the device and its descriptors are compliant,
-			in binary-coded decimal (i.e. 2.0 is 0200H). This
-			property is used if any real OTG features(HNP/SRP/ADP)
-			is enabled, if ADP is required, otg-rev should be
-			0x0200 or above.
- - companion: phandle of a companion
- - hnp-disable: tells OTG controllers we want to disable OTG HNP, normally HNP
-			is the basic function of real OTG except you want it
-			to be a srp-capable only B device.
- - srp-disable: tells OTG controllers we want to disable OTG SRP, SRP is
-			optional for OTG device.
- - adp-disable: tells OTG controllers we want to disable OTG ADP, ADP is
-			optional for OTG device.
- - usb-role-switch: boolean, indicates that the device is capable of assigning
-			the USB data role (USB host or USB device) for a given
-			USB connector, such as Type-C, Type-B(micro).
-			see connector/usb-connector.yaml.
- - role-switch-default-mode: indicating if usb-role-switch is enabled, the
-			device default operation mode of controller while usb
-			role is USB_ROLE_NONE. Valid arguments are "host" and
-			"peripheral". Defaults to "peripheral" if not
-			specified.
-
-
-This is an attribute to a USB controller such as:
-
-dwc3@4a030000 {
-	compatible = "synopsys,dwc3";
-	reg = <0x4a030000 0xcfff>;
-	interrupts = <0 92 4>
-	usb-phy = <&usb2_phy>, <&usb3,phy>;
-	maximum-speed = "super-speed";
-	dr_mode = "otg";
-	phy_type = "utmi_wide";
-	otg-rev = <0x0200>;
-	adp-disable;
-};
diff --git a/Documentation/devicetree/bindings/usb/usb-drd.yaml b/Documentation/devicetree/bindings/usb/usb-drd.yaml
new file mode 100644
index 000000000000..f3a64c46dcd0
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/usb-drd.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/usb-drd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic USB OTG Controller Device Tree Bindings
+
+maintainers:
+  - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+
+properties:
+  otg-rev:
+    description:
+      Tells usb driver the release number of the OTG and EH supplement with
+      which the device and its descriptors are compliant, in binary-coded
+      decimal (i.e. 2.0 is 0200H). This property is used if any real OTG
+      features (HNP/SRP/ADP) is enabled. If ADP is required, otg-rev should be
+      0x0200 or above.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  dr_mode:
+    description:
+      Tells Dual-Role USB controllers that we want to work on a particular
+      mode. In case this attribute isn't passed via DT, USB DRD controllers
+      should default to OTG.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [host, peripheral, otg]
+
+  hnp-disable:
+    description:
+      Tells OTG controllers we want to disable OTG HNP. Normally HNP is the
+      basic function of real OTG except you want it to be a srp-capable only B
+      device.
+    type: boolean
+
+  srp-disable:
+    description:
+      Tells OTG controllers we want to disable OTG SRP. SRP is optional for OTG
+      device.
+    type: boolean
+
+  adp-disable:
+    description:
+      Tells OTG controllers we want to disable OTG ADP. ADP is optional for OTG
+      device.
+    type: boolean
+
+  usb-role-switch:
+    description:
+      Indicates that the device is capable of assigning the USB data role
+      (USB host or USB device) for a given USB connector, such as Type-C,
+      Type-B(micro). See connector/usb-connector.yaml.
+
+  role-switch-default-mode:
+    description:
+      Indicates if usb-role-switch is enabled, the device default operation
+      mode of controller while usb role is USB_ROLE_NONE.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [host, peripheral]
+    default: peripheral
+
+additionalProperties: true
+
+examples:
+  - |
+    usb@4a030000 {
+        compatible = "snps,dwc3";
+        reg = <0x4a030000 0xcfff>;
+        interrupts = <0 92 4>;
+        usb-phy = <&usb2_phy>, <&usb3_phy>;
+        maximum-speed = "super-speed";
+        dr_mode = "otg";
+        phy_type = "utmi_wide";
+        otg-rev = <0x0200>;
+        adp-disable;
+    };
diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
index 81f3ad1419d8..52cc84c400c0 100644
--- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
@@ -12,6 +12,11 @@ maintainers:
 allOf:
   - $ref: usb.yaml#
 
+properties:
+  companion:
+    description: Phandle of a companion device
+    $ref: /schemas/types.yaml#/definitions/phandle
+
 additionalProperties: true
 
 examples:
diff --git a/Documentation/devicetree/bindings/usb/usb.yaml b/Documentation/devicetree/bindings/usb/usb.yaml
index 941ad59fbac5..991c02725e2b 100644
--- a/Documentation/devicetree/bindings/usb/usb.yaml
+++ b/Documentation/devicetree/bindings/usb/usb.yaml
@@ -24,6 +24,28 @@ properties:
     description:
       Name specifier for the USB PHY
 
+  phy_type:
+    description:
+      Tells USB controllers that we want to configure the core to support a
+      UTMI+ PHY with an 8- or 16-bit interface if UTMI+ is selected. In case
+      this isn't passed via DT, USB controllers should default to HW
+      capability.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [utmi, utmi_wide]
+
+  maximum-speed:
+   description:
+     Tells USB controllers we want to work up to a certain speed. In case this
+     isn't passed via DT, USB controllers should default to their maximum HW
+     capability.
+   $ref: /schemas/types.yaml#/definitions/string
+   enum:
+     - low-speed
+     - full-speed
+     - high-speed
+     - super-speed
+     - super-speed-plus
+
 additionalProperties: true
 
 ...
-- 
2.28.0

