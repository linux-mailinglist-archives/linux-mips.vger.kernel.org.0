Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A762820A423
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jun 2020 19:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406839AbgFYRhy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Jun 2020 13:37:54 -0400
Received: from out28-49.mail.aliyun.com ([115.124.28.49]:55189 "EHLO
        out28-49.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405219AbgFYRhw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 25 Jun 2020 13:37:52 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436311|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0292448-0.0134207-0.957335;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03279;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.HsRfZK5_1593106660;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.HsRfZK5_1593106660)
          by smtp.aliyun-inc.com(10.147.41.231);
          Fri, 26 Jun 2020 01:37:46 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        paul.burton@mips.com, paul@crapouillou.net, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, ak@linux.intel.com,
        ebiederm@xmission.com, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: [PATCH v2 1/3] MIPS: Ingenic: Add Ingenic X1830 support.
Date:   Fri, 26 Jun 2020 01:37:14 +0800
Message-Id: <20200625173716.56146-2-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200625173716.56146-1-zhouyanjie@wanyeetech.com>
References: <20200625173716.56146-1-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Support the Ingenic X1830 SoC using the code under arch/mips/jz4740.
This is left unselectable in Kconfig until a X1830 based board is
added in a later commit.

Tested-by: 周正 (Zhou Zheng) <sernia.zhou@foxmail.com>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v1->v2:
    No change.

 arch/mips/boot/dts/ingenic/x1830.dtsi | 300 ++++++++++++++++++++++++++++++++++
 arch/mips/jz4740/Kconfig              |   6 +
 2 files changed, 306 insertions(+)
 create mode 100644 arch/mips/boot/dts/ingenic/x1830.dtsi

diff --git a/arch/mips/boot/dts/ingenic/x1830.dtsi b/arch/mips/boot/dts/ingenic/x1830.dtsi
new file mode 100644
index 000000000000..6d2d6f227b45
--- /dev/null
+++ b/arch/mips/boot/dts/ingenic/x1830.dtsi
@@ -0,0 +1,300 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <dt-bindings/clock/ingenic,tcu.h>
+#include <dt-bindings/clock/x1830-cgu.h>
+#include <dt-bindings/dma/x1830-dma.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "ingenic,x1830";
+
+	cpuintc: interrupt-controller {
+		#address-cells = <0>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		compatible = "mti,cpu-interrupt-controller";
+	};
+
+	intc: interrupt-controller@10001000 {
+		compatible = "ingenic,x1830-intc", "ingenic,jz4780-intc";
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
+	cgu: x1830-cgu@10000000 {
+		compatible = "ingenic,x1830-cgu";
+		reg = <0x10000000 0x100>;
+
+		#clock-cells = <1>;
+
+		clocks = <&exclk>, <&rtclk>;
+		clock-names = "ext", "rtc";
+	};
+
+	tcu: timer@10002000 {
+		compatible = "ingenic,x1830-tcu", "ingenic,x1000-tcu", "simple-mfd";
+		reg = <0x10002000 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x10002000 0x1000>;
+
+		#clock-cells = <1>;
+
+		clocks = <&cgu X1830_CLK_RTCLK
+			  &cgu X1830_CLK_EXCLK
+			  &cgu X1830_CLK_PCLK>;
+		clock-names = "rtc", "ext", "pclk";
+
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <27 26 25>;
+
+		wdt: watchdog@0 {
+			compatible = "ingenic,x1830-watchdog", "ingenic,jz4780-watchdog";
+			reg = <0x0 0x10>;
+
+			clocks = <&tcu TCU_CLK_WDT>;
+			clock-names = "wdt";
+		};
+	};
+
+	rtc: rtc@10003000 {
+		compatible = "ingenic,x1830-rtc", "ingenic,jz4780-rtc";
+		reg = <0x10003000 0x4c>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <32>;
+
+		clocks = <&cgu X1830_CLK_RTCLK>;
+		clock-names = "rtc";
+	};
+
+	pinctrl: pin-controller@10010000 {
+		compatible = "ingenic,x1830-pinctrl";
+		reg = <0x10010000 0x800>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpa: gpio@0 {
+			compatible = "ingenic,x1830-gpio";
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
+			compatible = "ingenic,x1830-gpio";
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
+			compatible = "ingenic,x1830-gpio";
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
+			compatible = "ingenic,x1830-gpio";
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
+	i2c0: i2c-controller@10050000 {
+		compatible = "ingenic,x1830-i2c", "ingenic,x1000-i2c";
+		reg = <0x10050000 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <60>;
+
+		clocks = <&cgu X1830_CLK_SMB0>;
+
+		status = "disabled";
+	};
+
+	i2c1: i2c-controller@10051000 {
+		compatible = "ingenic,x1830-i2c", "ingenic,x1000-i2c";
+		reg = <0x10051000 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <59>;
+
+		clocks = <&cgu X1830_CLK_SMB1>;
+
+		status = "disabled";
+	};
+
+	i2c2: i2c-controller@10052000 {
+		compatible = "ingenic,x1830-i2c", "ingenic,x1000-i2c";
+		reg = <0x10052000 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <58>;
+
+		clocks = <&cgu X1830_CLK_SMB2>;
+
+		status = "disabled";
+	};
+
+	uart0: serial@10030000 {
+		compatible = "ingenic,x1830-uart", "ingenic,x1000-uart";
+		reg = <0x10030000 0x100>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <51>;
+
+		clocks = <&exclk>, <&cgu X1830_CLK_UART0>;
+		clock-names = "baud", "module";
+
+		status = "disabled";
+	};
+
+	uart1: serial@10031000 {
+		compatible = "ingenic,x1830-uart", "ingenic,x1000-uart";
+		reg = <0x10031000 0x100>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <50>;
+
+		clocks = <&exclk>, <&cgu X1830_CLK_UART1>;
+		clock-names = "baud", "module";
+
+		status = "disabled";
+	};
+
+	pdma: dma-controller@13420000 {
+		compatible = "ingenic,x1830-dma";
+		reg = <0x13420000 0x400
+			   0x13421000 0x40>;
+		#dma-cells = <2>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <10>;
+
+		clocks = <&cgu X1830_CLK_PDMA>;
+	};
+
+	mac: ethernet@134b0000 {
+		compatible = "ingenic,x1830-mac", "snps,dwmac";
+		reg = <0x134b0000 0x2000>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <55>;
+		interrupt-names = "macirq";
+
+		clocks = <&cgu X1830_CLK_MAC>;
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
+	msc0: mmc@13450000 {
+		compatible = "ingenic,x1830-mmc", "ingenic,x1000-mmc";
+		reg = <0x13450000 0x1000>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <37>;
+
+		clocks = <&cgu X1830_CLK_MSC0>;
+		clock-names = "mmc";
+
+		cap-sd-highspeed;
+		cap-mmc-highspeed;
+		cap-sdio-irq;
+
+		dmas = <&pdma X1830_DMA_MSC0_RX 0xffffffff>,
+			   <&pdma X1830_DMA_MSC0_TX 0xffffffff>;
+		dma-names = "rx", "tx";
+
+		status = "disabled";
+	};
+
+	msc1: mmc@13460000 {
+		compatible = "ingenic,x1830-mmc", "ingenic,x1000-mmc";
+		reg = <0x13460000 0x1000>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <36>;
+
+		clocks = <&cgu X1830_CLK_MSC1>;
+		clock-names = "mmc";
+
+		cap-sd-highspeed;
+		cap-mmc-highspeed;
+		cap-sdio-irq;
+
+		dmas = <&pdma X1830_DMA_MSC1_RX 0xffffffff>,
+			   <&pdma X1830_DMA_MSC1_TX 0xffffffff>;
+		dma-names = "rx", "tx";
+
+		status = "disabled";
+	};
+};
diff --git a/arch/mips/jz4740/Kconfig b/arch/mips/jz4740/Kconfig
index 9c2e8c15bb97..cd0ddb52da99 100644
--- a/arch/mips/jz4740/Kconfig
+++ b/arch/mips/jz4740/Kconfig
@@ -50,3 +50,9 @@ config MACH_X1000
 	select MIPS_CPU_SCACHE
 	select SYS_HAS_CPU_MIPS32_R2
 	select SYS_SUPPORTS_HIGHMEM
+
+config MACH_X1830
+	bool
+	select MIPS_CPU_SCACHE
+	select SYS_HAS_CPU_MIPS32_R2
+	select SYS_SUPPORTS_HIGHMEM
-- 
2.11.0

