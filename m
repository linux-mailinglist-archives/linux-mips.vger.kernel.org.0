Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C954928DEAB
	for <lists+linux-mips@lfdr.de>; Wed, 14 Oct 2020 12:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387919AbgJNKPY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Oct 2020 06:15:24 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:46180 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730085AbgJNKO0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 14 Oct 2020 06:14:26 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id B5615800254A;
        Wed, 14 Oct 2020 10:14:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id KD9TK71YVkdt; Wed, 14 Oct 2020 13:14:14 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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
        <linux-arm-kernel@lists.infradead.org>,
        <linux-snps-arc@lists.infradead.org>, <linux-mips@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-amlogic@lists.infradead.org>
Subject: [PATCH 14/20] dt-bindings: usb: meson-g12a-usb: Fix FL-adj property value
Date:   Wed, 14 Oct 2020 13:13:56 +0300
Message-ID: <20201014101402.18271-15-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

An empty snps,quirk-frame-length-adjustment won't cause any change
performed by the driver. Moreover the DT schema validation will fail,
since it expects the property being assigned with some value. So set
fix the example by setting a valid FL-adj value in accordance with
Neil Armstrong comment.

Link: https://lore.kernel.org/linux-usb/20201010224121.12672-16-Sergey.Semin@baikalelectronics.ru/
Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>

---

Note the same problem is in the DT source file
arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi .
---
 .../devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
index 5b04a7dfa018..a4b44a16aaef 100644
--- a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
+++ b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
@@ -209,6 +209,6 @@ examples:
               interrupts = <30>;
               dr_mode = "host";
               snps,dis_u2_susphy_quirk;
-              snps,quirk-frame-length-adjustment;
+              snps,quirk-frame-length-adjustment = <0x20>;
           };
     };
-- 
2.27.0

