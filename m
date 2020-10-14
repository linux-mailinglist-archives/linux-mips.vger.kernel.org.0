Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49BF528DEAE
	for <lists+linux-mips@lfdr.de>; Wed, 14 Oct 2020 12:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387990AbgJNKPZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Oct 2020 06:15:25 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:45952 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729669AbgJNKOQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 14 Oct 2020 06:14:16 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 1ECCD803073C;
        Wed, 14 Oct 2020 10:14:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id jXLq2i-h9V0q; Wed, 14 Oct 2020 13:14:08 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
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
        <linux-arm-kernel@lists.infradead.org>,
        <linux-snps-arc@lists.infradead.org>, <linux-mips@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 05/20] dt-bindings: usb: usb-hcd: Add generic "usb-phy" property
Date:   Wed, 14 Oct 2020 13:13:47 +0300
Message-ID: <20201014101402.18271-6-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Even though the Generic PHY framework is the more preferable way of
setting the USB PHY up, there are still many dts-files and DT bindings
which rely on having the legacy "usb-phy" specified to attach particular
USB PHYs to USB cores. Let's have the "usb-phy" property described in
the generic USB HCD binding file so it would be validated against the
nodes in which it's specified. Mark the property as deprecated to
discourage the developers from using it.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

---

Changelog v2:
- Discard '|' from the property description, since we don't need to preserve
  the text formatting.
---
 Documentation/devicetree/bindings/usb/usb-hcd.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
index 1f9b40fdea70..264a660dc6ea 100644
--- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
@@ -22,6 +22,13 @@ properties:
     description:
       Name specifier for the USB PHY
 
+  usb-phy:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      List of all the USB PHYs on this HCD to be accepted by the legacy USB
+      Physical Layer subsystem.
+    deprecated: true
+
   maximum-speed:
    description:
      Tells USB controllers we want to work up to a certain speed. In case this
-- 
2.27.0

