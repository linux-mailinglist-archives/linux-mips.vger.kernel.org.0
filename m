Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE26210C6DD
	for <lists+linux-mips@lfdr.de>; Thu, 28 Nov 2019 11:39:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbfK1KjN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Nov 2019 05:39:13 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25891 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfK1KjN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Nov 2019 05:39:13 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574937497; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=BkLZN+1JHxYRG7lh+hYd3rkW6rbmuIp5EeXA9AYMH2j1PLO1KHHJWq8+z50+kmwTzvddCty0YeX6WGwV+dzDmrhFnqeHlmX24AbFfONB14FUuaiEdypo/1i4z1LBw35awajqcDFJwA6nnLBIfWRO3xqwKrGGvePbp81z13aZ3T8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574937497; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=1Cmb/fJzceLDwRTo3T6ENPIcIHT8w4riE9U+7KPxVfQ=; 
        b=LURXBZgQZ01gN3T7q91l4oY8D50za+tPIIF35Hkl1XKMqgXGUT4SGbqaeVbqC2DviBIJcB1mfPCw1+vN0po7Zio2zIza6WjLSkCxqFmxtUAlUDTGJXGRRnzJELpQcT5JDaWOWpnrBHgv6F1TUK4oPRapDx2OHb7qKMiqgrjez6o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=oBcD7jNPE52Dtr6bcNt02V3tXu/lw6Edsaj1qzeqHnKapm6hLM2UyN1MBJqd6f/I9M21ScnPgGix
    ukJCa3goKXohkSh2Q9XXX2ivTCWNR0OaRoQdVbliKzBfQ38op27v  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574937497;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=1Cmb/fJzceLDwRTo3T6ENPIcIHT8w4riE9U+7KPxVfQ=;
        b=WnVlzlZbWQvBPPEYY0DV7Xj/E49rNWVxkbAMoNAtRSujxSZWqZUDEL58pBk4cH10
        l4uBpjaHmZ23I2J3EP5anZoPLuppLpTEiLl2NDbUQl5OmIL3U+pBTd8N84VJRvCuJKb
        eZ2+buChVKZsrxwIh+PyTKBHExjTatQwk2k+o5RQ=
Received: from zhouyanjie-virtual-machine.localdomain (182.148.156.27 [182.148.156.27]) by mx.zohomail.com
        with SMTPS id 1574937495360197.14326149872045; Thu, 28 Nov 2019 02:38:15 -0800 (PST)
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
        zhenwenjin@gmail.com
Subject: [PATCH v5 01/10] MIPS: Ingenic: Initial X1000 support.
Date:   Thu, 28 Nov 2019 18:37:38 +0800
Message-Id: <1574937467-101907-2-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574937467-101907-1-git-send-email-zhouyanjie@zoho.com>
References: <1574937467-101907-1-git-send-email-zhouyanjie@zoho.com>
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

Notes:
    v1->v2:
    Rebase on top of mips-next, use ingenic-timer driver
    for system timer and clocksource.
    
    v2->v3:
    Drop the 'apb' node.
    
    v3->v4:
    Adjust the node order to make it consistent with
    other Ingenic boards.
    
    v4->v5:
    No change.

 arch/mips/boot/dts/ingenic/x1000.dtsi | 176 ++++++++++++++++++++++++++++++++++
 arch/mips/jz4740/Kconfig              |   6 ++
 2 files changed, 182 insertions(+)
 create mode 100644 arch/mips/boot/dts/ingenic/x1000.dtsi

diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi b/arch/mips/boot/dts/ingenic/x1000.dtsi
new file mode 100644
index 00000000..13a6c9ff
--- /dev/null
+++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
@@ -0,0 +1,176 @@
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
+		#clock-cells = <1>;
+
+		clocks = <&exclk>, <&rtclk>;
+		clock-names = "ext", "rtc";
+	};
+
+	tcu: timer@10002000 {
+		compatible = "ingenic,x1000-tcu",
+				 "ingenic,jz4770-tcu",
+				 "simple-mfd";
+		reg = <0x10002000 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x10002000 0x1000>;
+
+		#clock-cells = <1>;
+
+		clocks = <&cgu X1000_CLK_RTCLK
+			  &cgu X1000_CLK_EXCLK
+			  &cgu X1000_CLK_PCLK>;
+		clock-names = "rtc", "ext", "pclk";
+
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <27 26 25>;
+	};
+
+	pinctrl: pin-controller@10010000 {
+		compatible = "ingenic,x1000-pinctrl";
+		reg = <0x10010000 0x800>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpa: gpio@0 {
+			compatible = "ingenic,x1000-gpio";
+			reg = <0>;
+
+			gpio-controller;
+			gpio-ranges = <&pinctrl 0 0 32>;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			interrupt-parent = <&intc>;
+			interrupts = <17>;
+		};
+
+		gpb: gpio@1 {
+			compatible = "ingenic,x1000-gpio";
+			reg = <1>;
+
+			gpio-controller;
+			gpio-ranges = <&pinctrl 0 32 32>;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			interrupt-parent = <&intc>;
+			interrupts = <16>;
+		};
+
+		gpc: gpio@2 {
+			compatible = "ingenic,x1000-gpio";
+			reg = <2>;
+
+			gpio-controller;
+			gpio-ranges = <&pinctrl 0 64 32>;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			interrupt-parent = <&intc>;
+			interrupts = <15>;
+		};
+
+		gpd: gpio@3 {
+			compatible = "ingenic,x1000-gpio";
+			reg = <3>;
+
+			gpio-controller;
+			gpio-ranges = <&pinctrl 0 96 32>;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			interrupt-parent = <&intc>;
+			interrupts = <14>;
+		};
+	};
+
+	uart0: serial@10030000 {
+		compatible = "ingenic,x1000-uart";
+		reg = <0x10030000 0x100>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <51>;
+
+		clocks = <&exclk>, <&cgu X1000_CLK_UART0>;
+		clock-names = "baud", "module";
+
+		status = "disabled";
+	};
+
+	uart1: serial@10031000 {
+		compatible = "ingenic,x1000-uart";
+		reg = <0x10031000 0x100>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <50>;
+
+		clocks = <&exclk>, <&cgu X1000_CLK_UART1>;
+		clock-names = "baud", "module";
+
+		status = "disabled";
+	};
+
+	uart2: serial@10032000 {
+		compatible = "ingenic,x1000-uart";
+		reg = <0x10032000 0x100>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <49>;
+
+		clocks = <&exclk>, <&cgu X1000_CLK_UART2>;
+		clock-names = "baud", "module";
+
+		status = "disabled";
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
-- 
2.7.4


