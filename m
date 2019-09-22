Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA67EBAB8E
	for <lists+linux-mips@lfdr.de>; Sun, 22 Sep 2019 22:12:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731575AbfIVUMn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 22 Sep 2019 16:12:43 -0400
Received: from srv1.deutnet.info ([116.203.153.70]:44672 "EHLO
        srv1.deutnet.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729892AbfIVUMn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 22 Sep 2019 16:12:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deutnet.info; s=default; h=In-Reply-To:Message-ID:Subject:Cc:To:From:Date;
         bh=5UXMOr/ulTWR012xYXMNl3dPd+SSd8gi2/c+EtqMttc=; b=lWw29ReyagtKHd1f82LKd0b97
        WQM1Rpw83bmgFSPxqa3D24ITEJRCOnU8rjEc8U2oJX+KBHbnFkvooU1gVk0cLMvJtYzvrFh7xbnDQ
        Kin9nO5nikeQehai/HiAqVKpY5JleyRug9p+tD+CNLMKaHaeJOegakfNHbLhmQ7ZU5bplalujyfq8
        ZN90iZIKJmqW8bXNj/TtWPiN5ergAvqnvNT1OQIpH29HHeAXgAfC6CC6+CuM05blABSpKgb58++3A
        lV8ycy/iSAkUDgaQZzLTEatOiq7bNz3qUYUDzkg2vh4lyWFZO7tQOrGtFuDHKZb6CfDKjhSzjA7JP
        S6aJEuLAg==;
Received: from [2001:bc8:3dc9::1] (helo=localhost)
        by srv1.deutnet.info with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <agriveaux@deutnet.info>)
        id 1iC8Dl-0007tN-Pg; Sun, 22 Sep 2019 22:12:37 +0200
Received: from agriveaux by localhost with local (Exim 4.92)
        (envelope-from <agriveaux@deutnet.info>)
        id 1iC8Dl-007vee-Du; Sun, 22 Sep 2019 22:12:37 +0200
Date:   Sun, 22 Sep 2019 22:12:37 +0200
From:   Alexandre GRIVEAUX <agriveaux@deutnet.info>
To:     robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org,
        paul.burton@mips.com, jhogan@kernel.org, agriveaux@deutnet.info
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/4] MIPS: CI20: DTS: Add IW8103 Wifi + bluetooth
Message-ID: <2ab4eb8e7f2c1de24228dd9216cd42e8dd2007a4.1569181001.git.agriveaux@deutnet.info>
References: <cover.1569181001.git.agriveaux@deutnet.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1569181001.git.agriveaux@deutnet.info>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add IW8103 Wifi + bluetooth module to device tree and related power domain.

Signed-off-by: Alexandre GRIVEAUX <agriveaux@deutnet.info>
---
 arch/mips/boot/dts/ingenic/ci20.dts | 39 +++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index 4a77fa30a9cd..c62c36ae94c2 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -31,6 +31,13 @@
 		gpio = <&gpb 25 GPIO_ACTIVE_LOW>;
 		enable-active-high;
 	};
+
+	wlan0_power: fixedregulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "wlan0_power";
+		gpio = <&gpb 19 GPIO_ACTIVE_LOW>;
+		enable-active-high;
+	};
 };
 
 &ext {
@@ -54,9 +61,18 @@
 
 	bus-width = <4>;
 	max-frequency = <50000000>;
+	non-removable;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pins_mmc1>;
+
+	brcmf: wifi@1 {
+/*		reg = <4>;*/
+		compatible = "brcm,bcm4330-fmac";
+		vcc-supply = <&wlan0_power>;
+		device-wakeup-gpios = <&gpd 9 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpf 7 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &uart0 {
@@ -73,6 +89,23 @@
 	pinctrl-0 = <&pins_uart1>;
 };
 
+&uart2 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_uart2>;
+	uart-has-rtscts;
+
+	bluetooth {
+		compatible = "brcm,bcm4330-bt";
+		reset-gpios = <&gpf 8 GPIO_ACTIVE_HIGH>;
+		vcc-supply = <&wlan0_power>;
+		device-wakeup-gpios = <&gpf 5 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpf 6 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpf 4 GPIO_ACTIVE_LOW>;
+	};
+};
+
 &uart3 {
 	status = "okay";
 
@@ -314,6 +347,12 @@
 		bias-disable;
 	};
 
+	pins_uart2: uart2 {
+		function = "uart2";
+		groups = "uart2-data", "uart2-hwflow";
+		bias-disable;
+	};
+
 	pins_uart3: uart3 {
 		function = "uart3";
 		groups = "uart3-data", "uart3-hwflow";
-- 
2.20.1

