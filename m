Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49ECA2AED3B
	for <lists+linux-mips@lfdr.de>; Wed, 11 Nov 2020 10:18:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgKKJRE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Nov 2020 04:17:04 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:39692 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbgKKJQI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Nov 2020 04:16:08 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 34806803016F;
        Wed, 11 Nov 2020 09:16:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id u5SEvu3guARK; Wed, 11 Nov 2020 12:16:04 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-mips@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 07/18] mips: dts: jz47x: Harmonize EHCI/OHCI DT nodes name
Date:   Wed, 11 Nov 2020 12:15:41 +0300
Message-ID: <20201111091552.15593-8-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201111091552.15593-1-Sergey.Semin@baikalelectronics.ru>
References: <20201111091552.15593-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In accordance with the Generic EHCI/OHCI bindings the corresponding node
name is suppose to comply with the Generic USB HCD DT schema, which
requires the USB nodes to have the name acceptable by the regexp:
"^usb(@.*)?" . Make sure the "generic-ehci" and "generic-ohci"-compatible
nodes are correctly named.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Acked-by: Paul Cercueil <paul@crapouillou.net>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/mips/boot/dts/ingenic/jz4740.dtsi | 2 +-
 arch/mips/boot/dts/ingenic/jz4770.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi b/arch/mips/boot/dts/ingenic/jz4740.dtsi
index 1520585c235c..b989ff62ffbc 100644
--- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
@@ -281,7 +281,7 @@ dmac: dma-controller@13020000 {
 		clocks = <&cgu JZ4740_CLK_DMA>;
 	};
 
-	uhc: uhc@13030000 {
+	uhc: usb@13030000 {
 		compatible = "ingenic,jz4740-ohci", "generic-ohci";
 		reg = <0x13030000 0x1000>;
 
diff --git a/arch/mips/boot/dts/ingenic/jz4770.dtsi b/arch/mips/boot/dts/ingenic/jz4770.dtsi
index fa11ac950499..e45c03038826 100644
--- a/arch/mips/boot/dts/ingenic/jz4770.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4770.dtsi
@@ -417,7 +417,7 @@ dmac1: dma-controller@13420100 {
 		interrupts = <23>;
 	};
 
-	uhc: uhc@13430000 {
+	uhc: usb@13430000 {
 		compatible = "generic-ohci";
 		reg = <0x13430000 0x1000>;
 
-- 
2.28.0

