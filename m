Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C707707F7
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jul 2019 19:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730811AbfGVR4H (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Jul 2019 13:56:07 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:44024 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730640AbfGVR4H (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 22 Jul 2019 13:56:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1563818162; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XKJD/duDCCvxdTkR+BQPdr3qIw5J1rRyS9ahXmNoHHM=;
        b=Sx4UcjVmZOcZJBKURHNEuJcaYaDx22Tu8czq/M/8UVBKQSEn21YPQeYsIgJKs2kgP9mPN0
        jZZClXbw1CtUvF/mx+4qkQmzDMFxsHKommeJmFa3CPE1aaSiLdmfyPi8rS3lOmNCAqM2Io
        SlZuFsBfL3kX8eojESgNpZ8HJHamgGc=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     od@zcrc.me, linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/2] MIPS: dts: ingenic: Add 'cpus' node
Date:   Mon, 22 Jul 2019 13:55:48 -0400
Message-Id: <20190722175548.18434-2-paul@crapouillou.net>
In-Reply-To: <20190722175548.18434-1-paul@crapouillou.net>
References: <20190722175548.18434-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add 'cpus' node to the jz4740.dtsi, jz4770.dtsi, jz4780.dtsi files.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/boot/dts/ingenic/jz4740.dtsi | 19 +++++++++++
 arch/mips/boot/dts/ingenic/jz4770.dtsi | 29 ++++++++++++++++
 arch/mips/boot/dts/ingenic/jz4780.dtsi | 47 ++++++++++++++++++++++++++
 3 files changed, 95 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi b/arch/mips/boot/dts/ingenic/jz4740.dtsi
index 2beb78a62b7d..14d777dae87d 100644
--- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
@@ -6,6 +6,25 @@
 	#size-cells = <1>;
 	compatible = "ingenic,jz4740";
 
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "ingenic,xburst-d0";
+			reg = <0>;
+			clocks = <&cgu JZ4740_CLK_CCLK>;
+			clock-names = "cpu";
+
+			i-cache-size = <0x4000>;
+			i-cache-block-size = <32>;
+
+			d-cache-size = <0x4000>;
+			d-cache-block-size = <32>;
+		};
+	};
+
 	cpuintc: interrupt-controller {
 		#address-cells = <0>;
 		#interrupt-cells = <1>;
diff --git a/arch/mips/boot/dts/ingenic/jz4770.dtsi b/arch/mips/boot/dts/ingenic/jz4770.dtsi
index 49ede6c14ff3..83ee526fbe10 100644
--- a/arch/mips/boot/dts/ingenic/jz4770.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4770.dtsi
@@ -7,6 +7,35 @@
 	#size-cells = <1>;
 	compatible = "ingenic,jz4770";
 
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "ingenic,xburst-d1";
+			reg = <0>;
+			clocks = <&cgu JZ4770_CLK_CCLK>;
+			clock-names = "cpu";
+
+			i-cache-size = <0x4000>;
+			i-cache-block-size = <32>;
+
+			d-cache-size = <0x4000>;
+			d-cache-block-size = <32>;
+
+			next-level-cache = <&L2_cache>;
+
+			L2_cache: cache-controller {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				cache-size = <0x40000>;
+				cache-block-size = <32>;
+			};
+		};
+	};
+
 	cpuintc: interrupt-controller {
 		#address-cells = <0>;
 		#interrupt-cells = <1>;
diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index b03cdec56de9..3339b37101c0 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -7,6 +7,53 @@
 	#size-cells = <1>;
 	compatible = "ingenic,jz4780";
 
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "ingenic,xburst-e1";
+			reg = <0>;
+
+			clocks = <&cgu JZ4780_CLK_CPU>;
+			clock-names = "cpu";
+
+			i-cache-size = <0x8000>;
+			i-cache-block-size = <32>;
+
+			d-cache-size = <0x8000>;
+			d-cache-block-size = <32>;
+
+			next-level-cache = <&L2_cache>;
+
+			L2_cache: l2-cache {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				cache-size = <0x80000>;
+				cache-block-size = <32>;
+			};
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "ingenic,xburst-e1";
+			reg = <1>;
+
+			clocks = <&cgu JZ4780_CLK_CORE1>;
+			clock-names = "cpu";
+
+			i-cache-size = <0x8000>;
+			i-cache-block-size = <32>;
+
+			d-cache-size = <0x8000>;
+			d-cache-block-size = <32>;
+
+			next-level-cache = <&L2_cache>;
+		};
+	};
+
 	cpuintc: interrupt-controller {
 		#address-cells = <0>;
 		#interrupt-cells = <1>;
-- 
2.21.0.593.g511ec345e18

