Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D20F9767DFB
	for <lists+linux-mips@lfdr.de>; Sat, 29 Jul 2023 12:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbjG2KDY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 29 Jul 2023 06:03:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjG2KDX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 29 Jul 2023 06:03:23 -0400
X-Greylist: delayed 136 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 29 Jul 2023 03:03:21 PDT
Received: from p3plsmtpa11-04.prod.phx3.secureserver.net (p3plsmtpa11-04.prod.phx3.secureserver.net [68.178.252.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B7C10D0
        for <linux-mips@vger.kernel.org>; Sat, 29 Jul 2023 03:03:21 -0700 (PDT)
Received: from localhost.localdomain ([14.16.17.17])
        by :SMTPAUTH: with ESMTPSA
        id PgkpqFpajiS9mPgksqoECi; Sat, 29 Jul 2023 03:01:03 -0700
X-CMAE-Analysis: v=2.4 cv=D7SBaNdj c=1 sm=1 tr=0 ts=64c4e360
 a=34c9DTqauJ9c0AOVdCw1kg==:117 a=34c9DTqauJ9c0AOVdCw1kg==:17 a=NEAV23lmAAAA:8
 a=_twTT5zqAAAA:8 a=a0w_8txgfLuf3tCdzpgA:9 a=ILoXdGDbYT3DTB7Z0gVI:22
X-SECURESERVER-ACCT: dhu@hodcarrier.org
From:   Du Huanpeng <dhu@hodcarrier.org>
To:     linux-mips@vger.kernel.org, u-boot@lists.denx.de
Cc:     u74147@gmail.com, trini@konsulko.com, jiaxun.yang@flygoat.com,
        Du Huanpeng <dhu@hodcarrier.org>
Subject: [PATCH] MIPS: Loongson32: DeviceTree for Loongson-ls1c300
Date:   Sat, 29 Jul 2023 18:00:48 +0800
Message-Id: <20230729100048.1953-1-dhu@hodcarrier.org>
X-Mailer: git-send-email 2.40.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfIeBp2LwDbfmZ0k3TGyACU8nRkS9qGIECZ9hndyeRMbSRKDkLRrauKu14iR9hKxCZw+GOOZ//l3Tdqs0aU/ugxnhfN8Ye0+t1Su3uOXhZOACjBVtUjuG
 mFlE/LTgTnq34ryHBu6n0RGQMjMlJ5OK1UwETWdr7RHltQFiGd5qauUbIwlsrUrEsgo/ES86XU8yfeczlxz0PeHZLy/+EYKkilFSTLqx7CRBrUjY9CfNXESL
 OcTJIpUd+0Cqm3zQ0JLZRTb0khjtscFHqInJ/urehVulPLx5097FhggwZk3zh3sMQ8yidIUONtFInkM7PLKQAqgw78gso9CTjP6jLfwHI/oVXMFa4GuXgo/Q
 /E8fD+5i
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add DeviceTree files for Loongson-ls1c300 processor, currently only
has below nodes.

- reset-controller
- watchdog
- serial
- clock-controller

tool for generate header and dts:
[1] https://github.com/hodcarrier/ls1c300_bsp/tree/master/dts

Signed-off-by: Du Huanpeng <dhu@hodcarrier.org>
---
 arch/mips/Kconfig                             |   2 +
 arch/mips/boot/dts/Makefile                   |   1 +
 arch/mips/boot/dts/loongson/Makefile          |   2 +
 .../dts/loongson/loongson32-ls1c300b.dtsi     | 162 ++++++++++++++++++
 arch/mips/boot/dts/loongson/ls1c300-eval.dts  |  31 ++++
 include/dt-bindings/clock/ls1c300-clk.h       |  18 ++
 include/dt-bindings/reset/ls1c300-reset.h     |  33 ++++
 7 files changed, 249 insertions(+)
 create mode 100644 arch/mips/boot/dts/loongson/loongson32-ls1c300b.dtsi
 create mode 100644 arch/mips/boot/dts/loongson/ls1c300-eval.dts
 create mode 100644 include/dt-bindings/clock/ls1c300-clk.h
 create mode 100644 include/dt-bindings/reset/ls1c300-reset.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index fc6fba925aea..fbdd203a6fb5 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -467,6 +467,8 @@ config LANTIQ
 config MACH_LOONGSON32
 	bool "Loongson 32-bit family of machines"
 	select SYS_SUPPORTS_ZBOOT
+	select USE_OF
+	select BUILTIN_DTB
 	help
 	  This enables support for the Loongson-1 family of machines.
 
diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
index 928f38a79dff..2e040b1ba97b 100644
--- a/arch/mips/boot/dts/Makefile
+++ b/arch/mips/boot/dts/Makefile
@@ -6,6 +6,7 @@ subdir-$(CONFIG_FIT_IMAGE_FDT_BOSTON)	+= img
 subdir-$(CONFIG_MACH_INGENIC)		+= ingenic
 subdir-$(CONFIG_LANTIQ)			+= lantiq
 subdir-$(CONFIG_MACH_LOONGSON64)	+= loongson
+subdir-$(CONFIG_MACH_LOONGSON32)	+= loongson
 subdir-$(CONFIG_SOC_VCOREIII)		+= mscc
 subdir-$(CONFIG_MIPS_MALTA)		+= mti
 subdir-$(CONFIG_LEGACY_BOARD_SEAD3)	+= mti
diff --git a/arch/mips/boot/dts/loongson/Makefile b/arch/mips/boot/dts/loongson/Makefile
index 5c6433e441ee..f2a5ab153f77 100644
--- a/arch/mips/boot/dts/loongson/Makefile
+++ b/arch/mips/boot/dts/loongson/Makefile
@@ -6,4 +6,6 @@ dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64c_8core_rs780e.dtb
 dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64g_4core_ls7a.dtb
 dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64v_4core_virtio.dtb
 
+dtb-$(CONFIG_MACH_LOONGSON32)	+= ls1c300-eval.dtb
+
 obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
diff --git a/arch/mips/boot/dts/loongson/loongson32-ls1c300b.dtsi b/arch/mips/boot/dts/loongson/loongson32-ls1c300b.dtsi
new file mode 100644
index 000000000000..cc894e8feeb8
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/loongson32-ls1c300b.dtsi
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <dt-bindings/clock/ls1c300-clk.h>
+#include <dt-bindings/reset/ls1c300-reset.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "loongson,ls1c300-soc";
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		cpu@0 {
+			device_type = "cpu";
+			reg = <0>;
+			compatible = "loongson,gs232", "mips,mips4Kc";
+			clocks = <&acc CLK_CPU_THROT>;
+		};
+	};
+
+	clocks {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		u-boot,dm-pre-reloc;
+
+		xtal: oscillator {
+			compatible = "fixed-clock";
+			clock-frequency = <24000000>;
+			#clock-cells = <0>;
+		};
+	};
+
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		ranges;
+
+		acc: clock-controller@1fe78030 {
+			compatible = "loongson,ls1c300-clk";
+			clocks = <&xtal>;
+			#clock-cells = <1>;
+			reg = <0x1fe78030 0x8>, <0x1fe7c010 0x4>;
+			u-boot,dm-pre-reloc;
+		};
+
+		uart0: serial@1fe40000 {
+			compatible = "loongson,ls1c300-uart", "ns16550a";
+			clocks = <&acc CLK_APB>;
+			reg = <0x1fe40000 0x100>;
+			reg-shift = <0>;
+			status = "disabled";
+		};
+
+		uart1: serial@1fe44000 {
+			compatible = "loongson,ls1c300-uart", "ns16550a";
+			clocks = <&acc CLK_APB>;
+			reg = <0x1fe44000 0x100>;
+			reg-shift = <0>;
+			status = "disabled";
+		};
+
+		uart2: serial@1fe48000 {
+			compatible = "loongson,ls1c300-uart", "ns16550a";
+			clocks = <&acc CLK_APB>;
+			reg = <0x1fe48000 0x100>;
+			reg-shift = <0>;
+			resets = <&shut_ctrl UART2_SHUT>;
+			reset-names = "uart2";
+			status = "disabled";
+		};
+
+		uart3: serial@1fe4c000 {
+			compatible = "loongson,ls1c300-uart", "ns16550a";
+			clocks = <&acc CLK_APB>;
+			reg = <0x1fe4c000 0x100>;
+			reg-shift = <0>;
+			status = "disabled";
+		};
+
+		uart4:  serial@1fe4c400 {
+			compatible = "loongson,ls1c300-uart", "ns16550a";
+			clocks = <&acc CLK_APB>;
+			reg = <0x1fe4c400 0x100>;
+			reg-shift = <0>;
+			status = "disabled";
+		};
+
+		uart5:  serial@1fe4c500 {
+			compatible = "loongson,ls1c300-uart", "ns16550a";
+			clocks = <&acc CLK_APB>;
+			reg = <0x1fe4c500 0x100>;
+			reg-shift = <0>;
+			status = "disabled";
+		};
+
+		uart6:  serial@1fe4c600 {
+			compatible = "loongson,ls1c300-uart", "ns16550a";
+			clocks = <&acc CLK_APB>;
+			reg = <0x1fe4c600 0x100>;
+			reg-shift = <0>;
+			status = "disabled";
+		};
+
+		uart7:  serial@1fe4c700 {
+			compatible = "loongson,ls1c300-uart", "ns16550a";
+			clocks = <&acc CLK_APB>;
+			reg = <0x1fe4c700 0x100>;
+			reg-shift = <0>;
+			status = "disabled";
+		};
+
+		uart8:  serial@1fe4c800 {
+			compatible = "loongson,ls1c300-uart", "ns16550a";
+			clocks = <&acc CLK_APB>;
+			reg = <0x1fe4c800 0x100>;
+			reg-shift = <0>;
+			status = "disabled";
+		};
+
+		uart9:  serial@1fe4c900 {
+			compatible = "loongson,ls1c300-uart", "ns16550a";
+			clocks = <&acc CLK_APB>;
+			reg = <0x1fe4c900 0x100>;
+			reg-shift = <0>;
+			status = "disabled";
+		};
+
+		uart10: serial@1fe4ca00 {
+			compatible = "loongson,ls1c300-uart", "ns16550a";
+			clocks = <&acc CLK_APB>;
+			reg = <0x1fe4ca00 0x100>;
+			reg-shift = <0>;
+			status = "disabled";
+		};
+
+		uart11: serial@1fe4cb00 {
+			compatible = "loongson,ls1c300-uart", "ns16550a";
+			clocks = <&acc CLK_APB>;
+			reg = <0x1fe4cb00 0x100>;
+			reg-shift = <0>;
+			status = "disabled";
+		};
+
+		wdt: watchdog@1fe5c060 {
+			compatible = "loongson,ls1c300-wdt";
+			clocks = <&acc CLK_APB>;
+			reg = <0x1fe5c060 0x10>;
+		};
+
+		reset-controller {
+			compatible = "wdt-reboot";
+			wdt = <&wdt>;
+		};
+
+		shut_ctrl: reset-controller@1fd00420 {
+			compatible = "loongson,shut_ctrl";
+			reg = <0x1fd00420 0x4>;
+			#reset-cells = <1>;
+		};
+	};
+};
diff --git a/arch/mips/boot/dts/loongson/ls1c300-eval.dts b/arch/mips/boot/dts/loongson/ls1c300-eval.dts
new file mode 100644
index 000000000000..eaf65b2d966f
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/ls1c300-eval.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022 Du Huanpeng <dhu@hodcarrier.org>
+ */
+
+/dts-v1/;
+
+#include "loongson32-ls1c300b.dtsi"
+
+/ {
+	compatible = "lsmips,ls1c300-soc";
+	model = "ls1c300-eval";
+
+	aliases {
+		serial0 = &uart2;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x4000000>;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart2 {
+	status = "okay";
+};
+
diff --git a/include/dt-bindings/clock/ls1c300-clk.h b/include/dt-bindings/clock/ls1c300-clk.h
new file mode 100644
index 000000000000..66798f40c7d0
--- /dev/null
+++ b/include/dt-bindings/clock/ls1c300-clk.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2022 Du Huanpeng <dhu@hodcarrier.org>
+ */
+
+#ifndef __DT_BINDINGS_LS1C300_CLK_H__
+#define __DT_BINDINGS_LS1C300_CLK_H__
+
+#define CLK_XTAL	0
+#define CLK_PLL		1
+#define CLK_CPU		2
+#define CLK_APB         3
+#define CLK_CAMERA	4
+#define CLK_PIX		5
+#define CLK_AXIMUX	6
+#define CLK_CPU_THROT	7
+
+#endif /* __DT_BINDINGS_LS1C300_CLK_H__ */
diff --git a/include/dt-bindings/reset/ls1c300-reset.h b/include/dt-bindings/reset/ls1c300-reset.h
new file mode 100644
index 000000000000..d03db712476c
--- /dev/null
+++ b/include/dt-bindings/reset/ls1c300-reset.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef	_DT_BINDINGS_RESET_LS1C300_H
+#define	_DT_BINDINGS_RESET_LS1C300_H
+
+#define ADC_SHUT	25
+#define SDIO_SHUT	24
+#define DMA2_SHUT	23
+#define DMA1_SHUT	22
+#define DMA0_SHUT	21
+#define SPI1_SHUT	20
+#define SPI0_SHUT	19
+#define I2C2_SHUT	18
+#define I2C1_SHUT	17
+#define I2C0_SHUT	16
+#define AC97_SHUT	15
+#define I2S_SHUT	14
+#define UART3_SHUT	13
+#define UART2_SHUT	12
+#define UART1_SHUT	11
+#define UART0_SHUT	10
+#define CAN1_SHUT	9
+#define CAN0_SHUT	8
+#define ECC_SHUT	7
+#define MAC_SHUT	6
+#define USBHOST_SHUT	5
+#define USBOTG_SHUT	4
+#define SDRAM_SHUT	3
+#define SRAM_SHUT	2
+#define CAM_SHUT	1
+#define LCD_SHUT	0
+
+#endif	/* _DT_BINDINGS_RESET_LS1C300_H */
-- 
2.34.1

