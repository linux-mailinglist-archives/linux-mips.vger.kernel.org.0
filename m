Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C49B1A68C9
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2020 17:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730200AbgDMP2R (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Apr 2020 11:28:17 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:40530 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731034AbgDMP2N (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Apr 2020 11:28:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1586791636; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZIBSCfMAnn0++P8iAnfNVHRFYSN5HkjsbzJdoqXVhW4=;
        b=a+Qjw/X72J0Za66nY4e5rEzTE6x8Iqw7t+IquHxTLaKmO4YYKH7UvgV3rozVEjZn2uHxfr
        UYsjW/2f5mSMyoNKxar2ucrxNHSmIjP9OEM0BxuddVRO8/0yGQzFNrGUIUsfy/Clc3h8xM
        V4Q1FKF4kl7LgPG81waibiZoxYbXvAs=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     od@zcrc.me,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 08/13] MIPS: ingenic: DTS: Add nodes for the watchdog/PWM/OST
Date:   Mon, 13 Apr 2020 17:26:28 +0200
Message-Id: <20200413152633.198301-8-paul@crapouillou.net>
In-Reply-To: <20200413152633.198301-1-paul@crapouillou.net>
References: <20200413152633.198301-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the TCU nodes to the JZ4780, JZ4770 and JZ4740 devicetree files.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/boot/dts/ingenic/jz4740.dtsi | 14 +++++++++++
 arch/mips/boot/dts/ingenic/jz4770.dtsi | 34 ++++++++++++++++++++++++++
 arch/mips/boot/dts/ingenic/jz4780.dtsi | 24 ++++++++++++++++++
 3 files changed, 72 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi b/arch/mips/boot/dts/ingenic/jz4740.dtsi
index b56671157bbd..1520585c235c 100644
--- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
@@ -74,6 +74,20 @@ watchdog: watchdog@0 {
 			clocks = <&tcu TCU_CLK_WDT>;
 			clock-names = "wdt";
 		};
+
+		pwm: pwm@40 {
+			compatible = "ingenic,jz4740-pwm";
+			reg = <0x40 0x80>;
+
+			#pwm-cells = <3>;
+
+			clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER1>,
+				 <&tcu TCU_CLK_TIMER2>, <&tcu TCU_CLK_TIMER3>,
+				 <&tcu TCU_CLK_TIMER4>, <&tcu TCU_CLK_TIMER5>,
+				 <&tcu TCU_CLK_TIMER6>, <&tcu TCU_CLK_TIMER7>;
+			clock-names = "timer0", "timer1", "timer2", "timer3",
+				      "timer4", "timer5", "timer6", "timer7";
+		};
 	};
 
 	rtc_dev: rtc@10003000 {
diff --git a/arch/mips/boot/dts/ingenic/jz4770.dtsi b/arch/mips/boot/dts/ingenic/jz4770.dtsi
index 9a25a6f7a48d..3024c360c3ca 100644
--- a/arch/mips/boot/dts/ingenic/jz4770.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4770.dtsi
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <dt-bindings/clock/jz4770-cgu.h>
+#include <dt-bindings/clock/ingenic,tcu.h>
 
 / {
 	#address-cells = <1>;
@@ -65,6 +66,39 @@ tcu: timer@10002000 {
 
 		interrupt-parent = <&intc>;
 		interrupts = <27 26 25>;
+
+		watchdog: watchdog@0 {
+			compatible = "ingenic,jz4770-watchdog",
+				     "ingenic,jz4740-watchdog";
+			reg = <0x0 0xc>;
+
+			clocks = <&tcu TCU_CLK_WDT>;
+			clock-names = "wdt";
+		};
+
+		pwm: pwm@40 {
+			compatible = "ingenic,jz4770-pwm", "ingenic,jz4740-pwm";
+			reg = <0x40 0x80>;
+
+			#pwm-cells = <3>;
+
+			clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER1>,
+				 <&tcu TCU_CLK_TIMER2>, <&tcu TCU_CLK_TIMER3>,
+				 <&tcu TCU_CLK_TIMER4>, <&tcu TCU_CLK_TIMER5>,
+				 <&tcu TCU_CLK_TIMER6>, <&tcu TCU_CLK_TIMER7>;
+			clock-names = "timer0", "timer1", "timer2", "timer3",
+				      "timer4", "timer5", "timer6", "timer7";
+		};
+
+		ost: timer@e0 {
+			compatible = "ingenic,jz4770-ost";
+			reg = <0xe0 0x20>;
+
+			clocks = <&tcu TCU_CLK_OST>;
+			clock-names = "ost";
+
+			interrupts = <15>;
+		};
 	};
 
 	pinctrl: pin-controller@10010000 {
diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index 51ea764101aa..0f26beb7d85b 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -76,6 +76,30 @@ watchdog: watchdog@0 {
 			clocks = <&tcu TCU_CLK_WDT>;
 			clock-names = "wdt";
 		};
+
+		pwm: pwm@40 {
+			compatible = "ingenic,jz4780-pwm", "ingenic,jz4740-pwm";
+			reg = <0x40 0x80>;
+
+			#pwm-cells = <3>;
+
+			clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER1>,
+				 <&tcu TCU_CLK_TIMER2>, <&tcu TCU_CLK_TIMER3>,
+				 <&tcu TCU_CLK_TIMER4>, <&tcu TCU_CLK_TIMER5>,
+				 <&tcu TCU_CLK_TIMER6>, <&tcu TCU_CLK_TIMER7>;
+			clock-names = "timer0", "timer1", "timer2", "timer3",
+				      "timer4", "timer5", "timer6", "timer7";
+		};
+
+		ost: timer@e0 {
+			compatible = "ingenic,jz4780-ost", "ingenic,jz4770-ost";
+			reg = <0xe0 0x20>;
+
+			clocks = <&tcu TCU_CLK_OST>;
+			clock-names = "ost";
+
+			interrupts = <15>;
+		};
 	};
 
 	rtc_dev: rtc@10003000 {
-- 
2.25.1

