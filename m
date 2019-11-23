Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53864107C7A
	for <lists+linux-mips@lfdr.de>; Sat, 23 Nov 2019 03:35:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbfKWCf0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Nov 2019 21:35:26 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25805 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbfKWCf0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 Nov 2019 21:35:26 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574476496; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=eG490fnIqO4G7BpOEZGKi2zFQv1wrybtCwwUUaa8y05gfS8TS4g/WEi37hRNtthT4qR63nfLn2d3lm++l7gSXdgaE+xCeDX++/hBSD4juBNkTxW3exSkoG1+KP+iZmEf8Gx6OMGrQQVxZmpWhd5KJrcXj5aMBG8KAF3BdWMWTpY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574476496; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=GMGMcPNMSa+uM+T63eGOXmzW3+3p45nkCmuR1ZBTuX4=; 
        b=nWBILCHsWUwatFpgmWAqCnBv/D1leB9bZD9oKCl05pQokdh9td6nd/AsHHEe2GRh8F64CVkYjHYVn02XdOCff1EGl9GA8barrOv3WzYk0UkX2t4Td4Jm7f4aPsznhRG6KY7gMg1CZc7d58uK8O3Jd+jueOj5RqmAgDUOm+fNbCU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=jt7Q0ZReNh2uPoFnuYe3dBJjr+oLAGPwhZkrPwl/Qkjdnlb9OMLRW02tNUiHFF040dAfPajfXwR1
    U3Uy9ju2HyXvDkhSPVrjBl0SQn9q/RrDWN51ii/1C7aRShCmWAXy  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574476496;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=GMGMcPNMSa+uM+T63eGOXmzW3+3p45nkCmuR1ZBTuX4=;
        b=kJWlJl+kiiBCjsYdcSeQNYPO/66EXnScLxjkBlliKffmYe0sNGuygSrYSUVBzTWx
        oAglo+gRUw74JD1QjkDCwfyNjUhAO4iAVoE/j/EmOhwBFAhlRTwfd9ksFJQOWw/VcB7
        Dxv9mMGuVdMOlKE0zFJCdnCNhgtKeyIcElq4ek6I=
Received: from zhouyanjie-virtual-machine.localdomain (182.148.48.217 [182.148.48.217]) by mx.zohomail.com
        with SMTPS id 1574476494909528.3652007087777; Fri, 22 Nov 2019 18:34:54 -0800 (PST)
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
Subject: [PATCH v2 1/4] MIPS: Ingenic: initial X1000 support.
Date:   Sat, 23 Nov 2019 10:32:21 +0800
Message-Id: <1574476344-62631-2-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574476344-62631-1-git-send-email-zhouyanjie@zoho.com>
References: <1574476344-62631-1-git-send-email-zhouyanjie@zoho.com>
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

 arch/mips/boot/dts/ingenic/x1000.dtsi | 183 ++++++++++++++++++++++++++++++++++
 arch/mips/jz4740/Kconfig              |   6 ++
 2 files changed, 189 insertions(+)
 create mode 100644 arch/mips/boot/dts/ingenic/x1000.dtsi

diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi b/arch/mips/boot/dts/ingenic/x1000.dtsi
new file mode 100644
index 00000000..02a9b2a
--- /dev/null
+++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
@@ -0,0 +1,183 @@
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
+	apb {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <>;
+
+		tcu: timer@10002000 {
+			compatible = "ingenic,x1000-tcu",
+					 "ingenic,jz4770-tcu",
+					 "simple-mfd";
+			reg = <0x10002000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x10002000 0x1000>;
+
+			#clock-cells = <1>;
+
+			clocks = <&cgu X1000_CLK_RTCLK
+				  &cgu X1000_CLK_EXCLK
+				  &cgu X1000_CLK_PCLK>;
+			clock-names = "rtc", "ext", "pclk";
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			interrupt-parent = <&intc>;
+			interrupts = <27 26 25>;
+		};
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
-- 
2.7.4


