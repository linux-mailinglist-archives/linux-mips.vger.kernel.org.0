Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF54293AC6
	for <lists+linux-mips@lfdr.de>; Tue, 20 Oct 2020 14:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394106AbgJTMCN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Oct 2020 08:02:13 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:52058 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393992AbgJTMAY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 20 Oct 2020 08:00:24 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id A369C80305E2;
        Tue, 20 Oct 2020 12:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id nUS0tHAmOFxj; Tue, 20 Oct 2020 15:00:21 +0300 (MSK)
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
        <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mips@vger.kernel.org>
Subject: [PATCH 12/29] mips: dts: jz47x: Harmonize EHCI/OHCI DT nodes name
Date:   Tue, 20 Oct 2020 14:59:42 +0300
Message-ID: <20201020115959.2658-13-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
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
2.27.0

