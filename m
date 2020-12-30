Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6C62E7C9B
	for <lists+linux-mips@lfdr.de>; Wed, 30 Dec 2020 22:23:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbgL3VXJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Dec 2020 16:23:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbgL3VXJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Dec 2020 16:23:09 -0500
Received: from yawp.biot.com (yawp.biot.com [IPv6:2a01:4f8:10a:8e::fce2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07BC4C061573
        for <linux-mips@vger.kernel.org>; Wed, 30 Dec 2020 13:22:28 -0800 (PST)
Received: from debian-spamd by yawp.biot.com with sa-checked (Exim 4.93)
        (envelope-from <bert@biot.com>)
        id 1kuivK-00AlvG-US
        for linux-mips@vger.kernel.org; Wed, 30 Dec 2020 22:22:27 +0100
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on yawp
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.4
Received: from [2a02:578:460c:1:ae1f:6bff:fed1:9ca8] (helo=sumner.biot.com)
        by yawp.biot.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <bert@biot.com>)
        id 1kuivB-00Alub-8g; Wed, 30 Dec 2020 22:22:17 +0100
Received: from bert by sumner.biot.com with local (Exim 4.93)
        (envelope-from <bert@biot.com>)
        id 1kuivA-00Avne-ON; Wed, 30 Dec 2020 22:22:16 +0100
From:   Bert Vermeulen <bert@biot.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sander Vanheule <sander@svanheule.net>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Bert Vermeulen <bert@biot.com>
Subject: [PATCH v3 4/4] dts: Add support for Cisco SG220-26 switch
Date:   Wed, 30 Dec 2020 22:22:05 +0100
Message-Id: <20201230212205.2605383-4-bert@biot.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201230212205.2605383-1-bert@biot.com>
References: <20201230212205.2605383-1-bert@biot.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Signed-off-by: Bert Vermeulen <bert@biot.com>
Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
 arch/mips/Kconfig                             | 10 +++
 arch/mips/boot/dts/realtek/Makefile           |  2 +
 arch/mips/boot/dts/realtek/cisco_sg220-26.dts | 81 +++++++++++++++++++
 3 files changed, 93 insertions(+)
 create mode 100644 arch/mips/boot/dts/realtek/Makefile
 create mode 100644 arch/mips/boot/dts/realtek/cisco_sg220-26.dts

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 0986d0c4405f..a398416842ca 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1055,6 +1055,16 @@ config NLM_XLP_BOARD
 
 endchoice
 
+if MACH_REALTEK_RTL
+choice
+	prompt "Realtek RTL838x/RTL839x-based switch"
+	optional
+
+	config DT_CISCO_SG220_26
+		bool "Cisco SG220-26"
+endchoice
+endif
+
 source "arch/mips/alchemy/Kconfig"
 source "arch/mips/ath25/Kconfig"
 source "arch/mips/ath79/Kconfig"
diff --git a/arch/mips/boot/dts/realtek/Makefile b/arch/mips/boot/dts/realtek/Makefile
new file mode 100644
index 000000000000..f0a3e5816767
--- /dev/null
+++ b/arch/mips/boot/dts/realtek/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_DT_CISCO_SG220_26)		+= cisco_sg220-26.dtb
diff --git a/arch/mips/boot/dts/realtek/cisco_sg220-26.dts b/arch/mips/boot/dts/realtek/cisco_sg220-26.dts
new file mode 100644
index 000000000000..5d8ba3df95aa
--- /dev/null
+++ b/arch/mips/boot/dts/realtek/cisco_sg220-26.dts
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
+
+/dts-v1/;
+
+#include "rtl83xx.dtsi"
+#include "rtl838x.dtsi"
+
+/ {
+	model = "Cisco SG220-26";
+	compatible = "cisco,sg220-26", "realtek,rtl8382-soc";
+
+	chosen {
+		stdout-path = "serial0:9600n8";
+		bootargs = "earlycon console=ttyS0,9600";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x8000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&spi {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		spi-max-frequency = <10000000>;
+		reg = <0>;
+		m25p,fast-read;
+		broken-flash-reset;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			loader: partition@0 {
+				label = "boot";
+				reg = <0x0 0x80000>;
+				read-only;
+			};
+
+			bdinfo: partition@80000 {
+				label = "bdinfo";
+				reg = <0x80000 0x10000>;
+				read-only;
+			};
+
+			sysinfo: partition@90000 {
+				label = "sysinfo";
+				reg = <0x90000 0x10000>;
+				read-only;
+			};
+
+			jffs2_cfg: partition@a0000 {
+				label = "jffs2 cfg";
+				reg = <0xa0000 0x400000>;
+			};
+
+			jffs2_log: partition@4a0000 {
+				label = "jffs2 log";
+				reg = <0x4a0000 0x100000>;
+			};
+
+			runtime: partition@5a0000 {
+				label = "runtime";
+				reg = <0x5a0000 0xd30000>;
+			};
+
+			runtime2: partition@12d0000 {
+				label = "runtime2";
+				reg = <0x12d0000 0xd30000>;
+			};
+		};
+	};
+};
-- 
2.25.1

