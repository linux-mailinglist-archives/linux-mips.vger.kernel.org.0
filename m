Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24C882AECE5
	for <lists+linux-mips@lfdr.de>; Wed, 11 Nov 2020 10:11:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbgKKJLc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Nov 2020 04:11:32 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:39436 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726719AbgKKJJo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Nov 2020 04:09:44 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id CCEBE80305E2;
        Wed, 11 Nov 2020 09:09:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id n8keCE_iaknt; Wed, 11 Nov 2020 12:09:10 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Roger Quadros <rogerq@ti.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-snps-arc@lists.infradead.org>, <linux-mips@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 09/18] dt-bindings: usb: renesas-xhci: Refer to the usb-xhci.yaml file
Date:   Wed, 11 Nov 2020 12:08:44 +0300
Message-ID: <20201111090853.14112-10-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
References: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

With minor peculiarities (like uploading some vendor-specific firmware)
these are just Generic xHCI controllers fully compatible with its
properties. Make sure the Renesas USB xHCI DT nodes are also validated
against the Generic xHCI DT schema.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml b/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml
index add9f7b66da0..4491567152a1 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml
@@ -11,7 +11,7 @@ maintainers:
   - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
 
 allOf:
-  - $ref: "usb-hcd.yaml"
+  - $ref: "usb-xhci.yaml"
 
 properties:
   compatible:
@@ -68,7 +68,7 @@ required:
   - power-domains
   - resets
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.28.0

