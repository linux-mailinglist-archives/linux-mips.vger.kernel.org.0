Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 186B21072D8
	for <lists+linux-mips@lfdr.de>; Fri, 22 Nov 2019 14:13:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727269AbfKVNNI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Nov 2019 08:13:08 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25822 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726568AbfKVNNI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 Nov 2019 08:13:08 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574428333; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=dwgH6AZ746RKEqOky+jmTkgvc6ZKmdqSXc2EMpKaoPVxeFDvTlOzIWMs9X37bxnQmf0kVlWa15zgXCfqK+Lp5x2cZPT1kVypo7J5cctjRYKHTYMcZZuZEhKKruYpQnHpzMsFa2wQug59eUKT8byscqL9BXJVNM0n59ilZDuJkkQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574428333; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=Yk91gegkDiprCih4bQL3Hr91VfNtMPC59CFsak0Y0FY=; 
        b=Ve0oExFaT3rtQr+8RYgAscycD/LT22WM6aoRKw4qvPP92vaOjjvvmzc79/LW3xOgaGEM/G3XoD8mz3UpbNFyyauFvOYgK8OqrWrJ1sjwyw7CYbJf/zPgcims83RzUw4YOAHs1ZEBHPIykxqehUbY0HM4yyCAzK5qyNY4kVWNM7g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=nCHuv7rHGxq28oyvB02H0mqBjQt1aV8RucoceEA4ueqspd84kBPYQ0KrVOxRMem4QGWLt27DP6xM
    vwmmp7l6LCXAbsQRXl0/nYmiWGcbpSu2wLijr0/eBDeO91ffOZ91  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574428333;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=Yk91gegkDiprCih4bQL3Hr91VfNtMPC59CFsak0Y0FY=;
        b=A1aFn6ECfOn26ZVQnY3yv28Kn0VY1tWBzFJpwIGEWXQNIw3GZQ5+6To/WrfBdV0C
        kKNDtEchNvaKqpYIHnI1bzOI6l8ajrtUVvgyuv5Vh0YNaF82GzZHlJmCVb1T14HvhMS
        hFAaS/YSWTiI/aHDDDIgy56SdIbueQdpcK76JYmQ=
Received: from zhouyanjie-virtual-machine.localdomain (171.221.83.158 [171.221.83.158]) by mx.zohomail.com
        with SMTPS id 1574428332336117.71147169930214; Fri, 22 Nov 2019 05:12:12 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, mripard@kernel.org, shawnguo@kernel.org,
        mark.rutland@arm.com, syq@debian.org, ralf@linux-mips.org,
        heiko@sntech.de, icenowy@aosc.io,
        laurent.pinchart@ideasonboard.com, krzk@kernel.org,
        geert+renesas@glider.be, paul@crapouillou.net,
        prasannatsmkumar@gmail.com, sernia.zhou@foxmail.com
Subject: [PATCH 1/4] MIPS: Ingenic: initial X1000 support.
Date:   Fri, 22 Nov 2019 21:11:26 +0800
Message-Id: <1574428289-21764-2-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574428289-21764-1-git-send-email-zhouyanjie@zoho.com>
References: <1574428289-21764-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Support the Ingenic X1000 SoC using the code under arch/mips/jz4740.
This is left unselectable in Kconfig until a X1000 based board is
added in a later commit.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 arch/mips/boot/dts/ingenic/x1000.dtsi | 161 ++++++++++++++++++++++++++++++++++
 arch/mips/jz4740/Kconfig              |   6 ++
 arch/mips/jz4740/time.c               |   4 +-
 3 files changed, 170 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/boot/dts/ingenic/x1000.dtsi

diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi b/arch/mips/boot/dts/ingenic/x1000.dtsi
new file mode 100644
index 0000000..b8658a6
--- /dev/null
+++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <dt-bindings/clock/x1000-cgu.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "ingenic,x1000", "ingenic,x1000e";
+
+	cpuintc: interrupt-controller {
+		#address-cells = <0>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		compatible = "mti,cpu-interrupt-controller";
+	};
+
+	intc: interrupt-controller@10001000 {
+		compatible = "ingenic,x1000-intc", "ingenic,jz4780-intc";
+		reg = <0x10001000 0x50>;
+
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		interrupt-parent = <&cpuintc>;
+		interrupts = <2>;
+	};
+
+	exclk: ext {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	rtclk: rtc {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+
+	cgu: x1000-cgu@10000000 {
+		compatible = "ingenic,x1000-cgu";
+		reg = <0x10000000 0x100>;
+
+		clocks = <&exclk>, <&rtclk>;
+		clock-names = "ext", "rtc";
+
+		#clock-cells = <1>;
+	};
+
+	apb {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <>;
+
+		uart0: serial@10030000 {
+			compatible = "ingenic,x1000-uart";
+			reg = <0x10030000 0x100>;
+
+			interrupt-parent = <&intc>;
+			interrupts = <51>;
+
+			clocks = <&exclk>, <&cgu X1000_CLK_UART0>;
+			clock-names = "baud", "module";
+
+			status = "disabled";
+		};
+
+		uart1: serial@10031000 {
+			compatible = "ingenic,x1000-uart";
+			reg = <0x10031000 0x100>;
+
+			interrupt-parent = <&intc>;
+			interrupts = <50>;
+
+			clocks = <&exclk>, <&cgu X1000_CLK_UART1>;
+			clock-names = "baud", "module";
+
+			status = "disabled";
+		};
+
+		uart2: serial@10032000 {
+			compatible = "ingenic,x1000-uart";
+			reg = <0x10032000 0x100>;
+
+			interrupt-parent = <&intc>;
+			interrupts = <49>;
+
+			clocks = <&exclk>, <&cgu X1000_CLK_UART2>;
+			clock-names = "baud", "module";
+
+			status = "disabled";
+		};
+
+		pinctrl: pin-controller@10010000 {
+			compatible = "ingenic,x1000-pinctrl";
+			reg = <0x10010000 0x800>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			gpa: gpio@0 {
+				compatible = "ingenic,x1000-gpio";
+				reg = <0>;
+
+				gpio-controller;
+				gpio-ranges = <&pinctrl 0 0 32>;
+				#gpio-cells = <2>;
+
+				interrupt-controller;
+				#interrupt-cells = <2>;
+
+				interrupt-parent = <&intc>;
+				interrupts = <17>;
+			};
+
+			gpb: gpio@1 {
+				compatible = "ingenic,x1000-gpio";
+				reg = <1>;
+
+				gpio-controller;
+				gpio-ranges = <&pinctrl 0 32 32>;
+				#gpio-cells = <2>;
+
+				interrupt-controller;
+				#interrupt-cells = <2>;
+
+				interrupt-parent = <&intc>;
+				interrupts = <16>;
+			};
+
+			gpc: gpio@2 {
+				compatible = "ingenic,x1000-gpio";
+				reg = <2>;
+
+				gpio-controller;
+				gpio-ranges = <&pinctrl 0 64 32>;
+				#gpio-cells = <2>;
+
+				interrupt-controller;
+				#interrupt-cells = <2>;
+
+				interrupt-parent = <&intc>;
+				interrupts = <15>;
+			};
+
+			gpd: gpio@3 {
+				compatible = "ingenic,x1000-gpio";
+				reg = <3>;
+
+				gpio-controller;
+				gpio-ranges = <&pinctrl 0 96 32>;
+				#gpio-cells = <2>;
+
+				interrupt-controller;
+				#interrupt-cells = <2>;
+
+				interrupt-parent = <&intc>;
+				interrupts = <14>;
+			};
+		};
+	};
+};
diff --git a/arch/mips/jz4740/Kconfig b/arch/mips/jz4740/Kconfig
index 4dd0c44..6b96844 100644
--- a/arch/mips/jz4740/Kconfig
+++ b/arch/mips/jz4740/Kconfig
@@ -33,3 +33,9 @@ config MACH_JZ4780
 	select MIPS_CPU_SCACHE
 	select SYS_HAS_CPU_MIPS32_R2
 	select SYS_SUPPORTS_HIGHMEM
+
+config MACH_X1000
+	bool
+	select MIPS_CPU_SCACHE
+	select SYS_HAS_CPU_MIPS32_R2
+	select SYS_SUPPORTS_HIGHMEM
diff --git a/arch/mips/jz4740/time.c b/arch/mips/jz4740/time.c
index cb768e5..3af6538 100644
--- a/arch/mips/jz4740/time.c
+++ b/arch/mips/jz4740/time.c
@@ -101,7 +101,9 @@ static struct clock_event_device jz4740_clockevent = {
 #ifdef CONFIG_MACH_JZ4740
 	.irq = JZ4740_IRQ_TCU0,
 #endif
-#if defined(CONFIG_MACH_JZ4770) || defined(CONFIG_MACH_JZ4780)
+#if defined(CONFIG_MACH_JZ4770) || \
+    defined(CONFIG_MACH_JZ4780) || \
+    defined(CONFIG_MACH_X1000)
 	.irq = JZ4780_IRQ_TCU2,
 #endif
 };
-- 
2.7.4


