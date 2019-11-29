Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6857C10D29F
	for <lists+linux-mips@lfdr.de>; Fri, 29 Nov 2019 09:50:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbfK2Iue (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Nov 2019 03:50:34 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25814 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726143AbfK2Iud (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Nov 2019 03:50:33 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1575017386; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=dLja4iDbdo0DGhlXJfR+2cCcXqgMQTmYPYi+tFzOabefYY01dtEoRIn5iwHxFT5SHv7bT46xU6xA3CU8DZl159p46L6eJ5lK4heKy9rnKAY6e17K6mQcgeSxJHU6S6Yr2LWbqQ5Q7jzZvGfhnxmN1AwfmUN4/aGvr6cxW1a8/PI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1575017386; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=BHyThfnol8fhXd5mJuF3LT91Vd9/nF2qNlUB2KTGsF8=; 
        b=OT83HCUmckSNtXCyDzAglp54mNxD24vY2gMftn4B87mvPTt4x8gjoUZMdmAXS+9u3hDUnl4ua5I4H7SNUEHXacuggGn7qCkFmR5pZKMYCjrgrv+8sEWo8JWi6lO9OXthBV8ptyisNdpS90J1fW3dOXQVEAYWUl4+u3Z/dqdETK4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=uS9HD9na59Y+h3wlc254QVHlEmXeE0+8VLzKmu9Pz0fxjo8+8eLtaJxJaJUerSLinrMEosvrYwMZ
    NIl8U6iCr4sfjHUme954uns6bYGFLrLYopKyFh6fl7ou4f8ACSkl  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1575017386;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=BHyThfnol8fhXd5mJuF3LT91Vd9/nF2qNlUB2KTGsF8=;
        b=RZUU7g2HPSYqNNzhOsoMatJ1oN8p8TPeCD8ywM0QZ4I4+oevqwIlEiYXwdLfGA/W
        3drTvS2I+vPJzRJNvAwSStcMflKN+XSN7UFxGo1hDTKe6x7rNtrT8Efy3RPTTFrgOZ4
        sbMgkSDE9BFusrIXn38BrtuEKZ+DyjhVMznVPO4I=
Received: from zhouyanjie-virtual-machine.localdomain (139.207.146.46 [139.207.146.46]) by mx.zohomail.com
        with SMTPS id 1575017384522253.80501101504683; Fri, 29 Nov 2019 00:49:44 -0800 (PST)
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
Subject: [PATCH v6 01/12] MIPS: Ingenic: Initial X1000 support.
Date:   Fri, 29 Nov 2019 16:48:42 +0800
Message-Id: <1575017333-29020-2-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575017333-29020-1-git-send-email-zhouyanjie@zoho.com>
References: <1575017333-29020-1-git-send-email-zhouyanjie@zoho.com>
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
    
    v5->v6:
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


