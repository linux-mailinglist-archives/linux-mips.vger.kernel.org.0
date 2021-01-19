Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E7202FB90E
	for <lists+linux-mips@lfdr.de>; Tue, 19 Jan 2021 15:35:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395396AbhASOSN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Jan 2021 09:18:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732590AbhASJWk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Jan 2021 04:22:40 -0500
Received: from yawp.biot.com (yawp.biot.com [IPv6:2a01:4f8:10a:8e::fce2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D28B1C061786
        for <linux-mips@vger.kernel.org>; Tue, 19 Jan 2021 01:21:48 -0800 (PST)
Received: from debian-spamd by yawp.biot.com with sa-checked (Exim 4.93)
        (envelope-from <bert@biot.com>)
        id 1l1nCs-00EDwL-Tt
        for linux-mips@vger.kernel.org; Tue, 19 Jan 2021 10:21:47 +0100
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on yawp
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.4
Received: from [2a02:578:460c:1:ae1f:6bff:fed1:9ca8] (helo=sumner.biot.com)
        by yawp.biot.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <bert@biot.com>)
        id 1l1nCT-00EDsg-1I; Tue, 19 Jan 2021 10:21:21 +0100
Received: from bert by sumner.biot.com with local (Exim 4.93)
        (envelope-from <bert@biot.com>)
        id 1l1nCS-000mDW-JN; Tue, 19 Jan 2021 10:21:20 +0100
From:   Bert Vermeulen <bert@biot.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>,
        John Crispin <john@phrozen.org>,
        Birger Koblitz <mail@birger-koblitz.de>
Cc:     Bert Vermeulen <bert@biot.com>
Subject: [PATCH v4 5/5] mips: dts: Add support for Cisco SG220-26 switch
Date:   Tue, 19 Jan 2021 10:21:09 +0100
Message-Id: <20210119092109.185282-6-bert@biot.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210119092109.185282-1-bert@biot.com>
References: <20210119092109.185282-1-bert@biot.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Signed-off-by: Bert Vermeulen <bert@biot.com>
---
 arch/mips/Kconfig                             | 10 ++++++++
 arch/mips/boot/dts/realtek/Makefile           |  2 ++
 arch/mips/boot/dts/realtek/cisco_sg220-26.dts | 25 +++++++++++++++++++
 3 files changed, 37 insertions(+)
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
index 000000000000..1cdbb09297ef
--- /dev/null
+++ b/arch/mips/boot/dts/realtek/cisco_sg220-26.dts
@@ -0,0 +1,25 @@
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
-- 
2.25.1

