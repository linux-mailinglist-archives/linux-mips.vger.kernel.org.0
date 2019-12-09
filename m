Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECAAB116D7E
	for <lists+linux-mips@lfdr.de>; Mon,  9 Dec 2019 14:01:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727708AbfLINBJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 9 Dec 2019 08:01:09 -0500
Received: from out28-220.mail.aliyun.com ([115.124.28.220]:59178 "EHLO
        out28-220.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727567AbfLINBJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 9 Dec 2019 08:01:09 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07732261|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.424408-0.0111602-0.564432;DS=CONTINUE|ham_system_inform|0.144077-0.000892893-0.85503;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03300;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=22;RT=22;SR=0;TI=SMTPD_---.GDcmOki_1575896441;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GDcmOki_1575896441)
          by smtp.aliyun-inc.com(10.147.41.138);
          Mon, 09 Dec 2019 21:01:02 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, mripard@kernel.org, shawnguo@kernel.org,
        mark.rutland@arm.com, ebiederm@xmission.com, ralf@linux-mips.org,
        heiko@sntech.de, icenowy@aosc.io,
        laurent.pinchart@ideasonboard.com, krzk@kernel.org,
        geert+renesas@glider.be, paul@crapouillou.net,
        prasannatsmkumar@gmail.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, 772753199@qq.com
Subject: [PATCH v7 5/6] MIPS: X1000: Add missing X1000 nodes.
Date:   Mon,  9 Dec 2019 21:00:37 +0800
Message-Id: <1575896438-9562-6-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575896438-9562-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1575896438-9562-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the appropriate DT node to probe pdma/msc/rtc/watchdog/ethernet
driver using the devicetree.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v7:
    New patch, merge[05/12],[07/12],[09/12],[11/12] in v6.

 arch/mips/boot/dts/ingenic/x1000.dtsi | 96 +++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi b/arch/mips/boot/dts/ingenic/x1000.dtsi
index 13a6c9ff..398a756 100644
--- a/arch/mips/boot/dts/ingenic/x1000.dtsi
+++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <dt-bindings/clock/x1000-cgu.h>
+#include <dt-bindings/dma/x1000-dma.h>
 
 / {
 	#address-cells = <1>;
@@ -68,6 +69,25 @@
 		interrupts = <27 26 25>;
 	};
 
+	wdt: watchdog@10002000 {
+		compatible = "ingenic,x1000-watchdog", "ingenic,jz4780-watchdog";
+		reg = <0x10002000 0x10>;
+
+		clocks = <&cgu X1000_CLK_RTCLK>;
+		clock-names = "rtc";
+	};
+
+	rtc: rtc@10003000 {
+		compatible = "ingenic,x1000-rtc", "ingenic,jz4780-rtc";
+		reg = <0x10003000 0x4c>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <32>;
+
+		clocks = <&cgu X1000_CLK_RTCLK>;
+		clock-names = "rtc";
+	};
+
 	pinctrl: pin-controller@10010000 {
 		compatible = "ingenic,x1000-pinctrl";
 		reg = <0x10010000 0x800>;
@@ -173,4 +193,80 @@
 
 		status = "disabled";
 	};
+
+	pdma: dma-controller@13420000 {
+		compatible = "ingenic,x1000-dma";
+		reg = <0x13420000 0x400
+			   0x13421000 0x40>;
+		#dma-cells = <2>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <10>;
+
+		clocks = <&cgu X1000_CLK_PDMA>;
+	};
+
+	mac: mac@134b0000 {
+		compatible = "ingenic,x1000-mac", "snps,dwmac";
+		reg = <0x134b0000 0x2000>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <55>;
+		interrupt-names = "macirq";
+
+		clocks = <&cgu X1000_CLK_MAC>;
+		clock-names = "stmmaceth";
+
+		status = "disabled";
+
+		mdio: mdio {
+			compatible = "snps,dwmac-mdio";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+	};
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

