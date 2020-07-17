Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3519322414D
	for <lists+linux-mips@lfdr.de>; Fri, 17 Jul 2020 19:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728033AbgGQRAp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Jul 2020 13:00:45 -0400
Received: from out28-124.mail.aliyun.com ([115.124.28.124]:54634 "EHLO
        out28-124.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727810AbgGQRAp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 17 Jul 2020 13:00:45 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07466951|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0939416-0.000470004-0.905588;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03301;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.I3U5VZp_1595005212;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.I3U5VZp_1595005212)
          by smtp.aliyun-inc.com(10.147.41.121);
          Sat, 18 Jul 2020 01:00:22 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     daniel.lezcano@linaro.org, tsbogend@alpha.franken.de,
        robh+dt@kernel.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, tglx@linutronix.de,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com, paul@crapouillou.net
Subject: [PATCH v7 4/5] MIPS: X1000: Use SYSOST instead of TCU to provide clocksource.
Date:   Sat, 18 Jul 2020 00:59:46 +0800
Message-Id: <20200717165947.56158-5-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200717165947.56158-1-zhouyanjie@wanyeetech.com>
References: <20200717165947.56158-1-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Before this series of patches, X1000 used TCU to provide
clocksource and clockevent, but because the timer of TCU
is only 16 bits, so the timing length is only 16 bits. In
actual use, it is easy to cause some problems such as data
loss during data transmission. The SYSOST driver is provided
in this series of patches, which can provide 32bit timing
length, so use SYSOST instead of TCU to provide clocksource
and clockevent to solve the aforementioned problems.

Tested-by: 周正 (Zhou Zheng) <sernia.zhou@foxmail.com>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v7:
    New patch.

 arch/mips/boot/dts/ingenic/cu1000-neo.dts |  9 +++------
 arch/mips/boot/dts/ingenic/x1000.dtsi     | 16 ++++++++++++++++
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/cu1000-neo.dts b/arch/mips/boot/dts/ingenic/cu1000-neo.dts
index 22a1066d637b..9418dbeccfa6 100644
--- a/arch/mips/boot/dts/ingenic/cu1000-neo.dts
+++ b/arch/mips/boot/dts/ingenic/cu1000-neo.dts
@@ -3,7 +3,7 @@
 
 #include "x1000.dtsi"
 #include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/clock/ingenic,tcu.h>
+#include <dt-bindings/clock/ingenic,sysost.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
 / {
@@ -43,13 +43,10 @@
 	clock-frequency = <24000000>;
 };
 
-&tcu {
+&ost {
 	/* 1500 kHz for the system timer and clocksource */
-	assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER2>;
+	assigned-clocks = <&ost OST_CLK_PERCPU_TIMER>, <&ost OST_CLK_GLOBAL_TIMER>;
 	assigned-clock-rates = <1500000>, <1500000>;
-
-	/* Use channel #0 for the system timer channel #2 for the clocksource */
-	ingenic,pwm-channels-mask = <0xfa>;
 };
 
 &uart2 {
diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi b/arch/mips/boot/dts/ingenic/x1000.dtsi
index 9de9e7c2d523..bf7951dc89ef 100644
--- a/arch/mips/boot/dts/ingenic/x1000.dtsi
+++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
@@ -47,6 +47,22 @@
 		clock-names = "ext", "rtc";
 	};
 
+	ost: timer@12000000 {
+		compatible = "ingenic,x1000-ost";
+		reg = <0x12000000 0x1000>;
+
+		#clock-cells = <1>;
+
+		clocks = <&cgu X1000_CLK_OST>;
+		clock-names = "ost";
+
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		interrupt-parent = <&cpuintc>;
+		interrupts = <3>;
+	};
+
 	tcu: timer@10002000 {
 		compatible = "ingenic,x1000-tcu", "simple-mfd";
 		reg = <0x10002000 0x1000>;
-- 
2.11.0

