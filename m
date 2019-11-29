Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5756610D2C1
	for <lists+linux-mips@lfdr.de>; Fri, 29 Nov 2019 09:53:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbfK2Ixk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Nov 2019 03:53:40 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25811 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726215AbfK2Ixk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Nov 2019 03:53:40 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1575017574; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=XrUUmzDNWD9eDWQr0JwTIeKS4IWGUir5/ETPGk1W1E5IfHzuWALR25+tLFSkQR9mT5VU3I5b1YMiEZA/PVwRtg3mfTh2Y7MWX9mm81ol/Yi3GWKOd07QdNPcX+gKmQ4ZToT+2AqALHDGwapo1JAGGBw3gShPvztWKtaQnQDu7uQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1575017574; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=pTCJtqXHpXkAnDrCfmjCohfbapD+itP6W1tkzdFlk0E=; 
        b=jmxqNK3mSvTBr2sAPeA2pyVXbN4hwdG1XcYWOqkrCDzj870txQxJUQHeaIKQd8eWk7Qn2BGUNWlD8msaSxQDNV5Cg+lEoL28Pm53S/+tnCmgnu5omEQpeK8NEdTKzU0U9M8Pk/cwHLiFyN0ju7mY2WuH3GCZCF36up5areaYBvM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=DsE2/1FrFUaffCfD1rxaMzuh4lQpB9u/EBwFJBCYG3WoeVxOeui/yv3cnKYV8xibtDtv7yHRdbGc
    aruEJZKgBKHptJmen6eWAd5hzMSy23SEguR9lqpTk3MG9zom1j51  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1575017574;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=pTCJtqXHpXkAnDrCfmjCohfbapD+itP6W1tkzdFlk0E=;
        b=GqJjjC2oocCv5RYyr2I4gNBTKZmitRgmV8Fhbzhura2dXx0ciwSYhjY7kJWEcyyp
        kLuNjGCjwi4oXK6dBr2iCqbCrPD0PNgIm6Nwn2SZqIFEcfZOp2Zl3thH8+G9JqUt4QV
        YySEHpg7x/A912beNwlw9XkxFPodxRYGvYwFRIVA=
Received: from zhouyanjie-virtual-machine.localdomain (139.207.146.46 [139.207.146.46]) by mx.zohomail.com
        with SMTPS id 1575017572688310.91785768983414; Fri, 29 Nov 2019 00:52:52 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, mripard@kernel.org, shawnguo@kernel.org,
        mark.rutland@arm.com, syq@debian.org, ralf@linux-mips.org,
        heiko@sntech.de, icenowy@aosc.io,
        laurent.pinchart@ideasonboard.com, krzk@kernel.org,
        geert+renesas@glider.be, paul@crapouillou.net,
        prasannatsmkumar@gmail.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, 772753199@qq.com
Subject: [PATCH v6 07/12] MIPS: X1000: Add msc controller DT node.
Date:   Fri, 29 Nov 2019 16:48:48 +0800
Message-Id: <1575017333-29020-8-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575017333-29020-1-git-send-email-zhouyanjie@zoho.com>
References: <1575017333-29020-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the appropriate DT node to probe the msc controller driver
using the devicetree.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---

Notes:
    v5:
    New patch.
    
    v5->v6:
    No change.

 arch/mips/boot/dts/ingenic/cu1000-neo.dts | 16 ++++++++++++
 arch/mips/boot/dts/ingenic/x1000.dtsi     | 42 +++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/cu1000-neo.dts b/arch/mips/boot/dts/ingenic/cu1000-neo.dts
index fb00439..195b266 100644
--- a/arch/mips/boot/dts/ingenic/cu1000-neo.dts
+++ b/arch/mips/boot/dts/ingenic/cu1000-neo.dts
@@ -43,10 +43,26 @@
 	pinctrl-0 = <&pins_uart2>;
 };
 
+&msc0 {
+	status = "okay";
+
+	bus-width = <8>;
+	max-frequency = <50000000>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_msc0>;
+};
+
 &pinctrl {
 	pins_uart2: uart2 {
 		function = "uart2";
 		groups = "uart2-data-d";
 		bias-disable;
 	};
+
+	pins_msc0: msc0 {
+		function = "mmc0";
+		groups = "mmc0-1bit", "mmc0-4bit", "mmc0-8bit";
+		bias-disable;
+	};
 };
diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi b/arch/mips/boot/dts/ingenic/x1000.dtsi
index c432828..8b8d335 100644
--- a/arch/mips/boot/dts/ingenic/x1000.dtsi
+++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
@@ -186,4 +186,46 @@
 
 		clocks = <&cgu X1000_CLK_PDMA>;
 	};
+
+	msc0: msc@13450000 {
+		compatible = "ingenic,x1000-mmc";
+		reg = <0x13450000 0x1000>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <37>;
+
+		clocks = <&cgu X1000_CLK_MSC0>;
+		clock-names = "mmc";
+
+		cap-sd-highspeed;
+		cap-mmc-highspeed;
+		cap-sdio-irq;
+
+		dmas = <&pdma X1000_DMA_MSC0_RX 0xffffffff>,
+			   <&pdma X1000_DMA_MSC0_TX 0xffffffff>;
+		dma-names = "rx", "tx";
+
+		status = "disabled";
+	};
+
+	msc1: msc@13460000 {
+		compatible = "ingenic,x1000-mmc";
+		reg = <0x13460000 0x1000>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <36>;
+
+		clocks = <&cgu X1000_CLK_MSC1>;
+		clock-names = "mmc";
+
+		cap-sd-highspeed;
+		cap-mmc-highspeed;
+		cap-sdio-irq;
+
+		dmas = <&pdma X1000_DMA_MSC1_RX 0xffffffff>,
+			   <&pdma X1000_DMA_MSC1_TX 0xffffffff>;
+		dma-names = "rx", "tx";
+
+		status = "disabled";
+	};
 };
-- 
2.7.4


