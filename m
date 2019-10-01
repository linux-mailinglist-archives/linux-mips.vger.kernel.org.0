Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33C21C40AE
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 21:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726645AbfJATIp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 15:08:45 -0400
Received: from srv1.deutnet.info ([116.203.153.70]:55166 "EHLO
        srv1.deutnet.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbfJATIp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 1 Oct 2019 15:08:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deutnet.info; s=default; h=In-Reply-To:Message-ID:Subject:Cc:To:From:Date;
         bh=b+LjemFDxUNMrB9rHbfUreCeR0HbcM3LO0FBgY4gp/M=; b=kCfhfkfoUGyUmXNArXhhGdgqu
        jgCWIlDVAmNOr0TQM95AdmK/uG6obHTgEJu6ncUDAV50ggdB9K3QAmd4Wa7gFC0sqgbbA0DrMNnB9
        B3PcD4daGAtVLmZvkB53RQKY1tvkS4eOlMiN+t5sxRIWPk6QJvUasNn6GycJB/Jxit8P3xvToLjaH
        b/2JlI1oGjfudConHNml5ddVcCt8AFsUX0D3mucdftwx4uiB5+WuIs2ap7LxGDGPgvTUqGy/+s49w
        yT2SlrYC02suArl6mvfAYBwapUSbdoxrnQD+YteRpC2cM21r1kLnYEDMsHa5vCcoCKkt3ff0CXEal
        q5mlvCtPA==;
Received: from [2001:bc8:3dc9::1] (helo=localhost)
        by srv1.deutnet.info with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <agriveaux@deutnet.info>)
        id 1iFNVo-0000oT-VX; Tue, 01 Oct 2019 21:08:40 +0200
Received: from agriveaux by localhost with local (Exim 4.92)
        (envelope-from <agriveaux@deutnet.info>)
        id 1iFNVo-00BgM1-Jk; Tue, 01 Oct 2019 21:08:40 +0200
Date:   Tue, 1 Oct 2019 21:08:40 +0200
From:   Alexandre GRIVEAUX <agriveaux@deutnet.info>
To:     robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org,
        paul.burton@mips.com, jhogan@kernel.org, agriveaux@deutnet.info
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 1/5] MIPS: JZ4780: DTS: Add I2C nodes
Message-ID: <b5ffdad6c22a64975e374dc5d2cff878d3ff3312.1569955865.git.agriveaux@deutnet.info>
References: <cover.1569955865.git.agriveaux@deutnet.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1569955865.git.agriveaux@deutnet.info>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the devicetree nodes for the I2C core of the JZ4780 SoC, disabled
by default.

Signed-off-by: Alexandre GRIVEAUX <agriveaux@deutnet.info>
---
 arch/mips/boot/dts/ingenic/jz4780.dtsi | 86 ++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index c54bd7cfec55..f928329b034b 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -262,6 +262,92 @@
 		status = "disabled";
 	};
 
+	i2c0: i2c@10050000 {
+		compatible = "ingenic,jz4780-i2c";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		reg = <0x10050000 0x1000>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <60>;
+
+		clocks = <&cgu JZ4780_CLK_SMB0>;
+		clock-frequency = <100000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pins_i2c0_data>;
+
+		status = "disabled";
+	};
+
+	i2c1: i2c@10051000 {
+		compatible = "ingenic,jz4780-i2c";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x10051000 0x1000>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <59>;
+
+		clocks = <&cgu JZ4780_CLK_SMB1>;
+		clock-frequency = <100000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pins_i2c1_data>;
+
+		status = "disabled";
+	};
+
+	i2c2: i2c@10052000 {
+		compatible = "ingenic,jz4780-i2c";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x10052000 0x1000>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <58>;
+
+		clocks = <&cgu JZ4780_CLK_SMB2>;
+		clock-frequency = <100000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pins_i2c2_data>;
+
+		status = "disabled";
+	};
+
+	i2c3: i2c@10053000 {
+		compatible = "ingenic,jz4780-i2c";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x10053000 0x1000>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <57>;
+
+		clocks = <&cgu JZ4780_CLK_SMB3>;
+		clock-frequency = <100000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pins_i2c3_data>;
+
+		status = "disabled";
+	};
+
+	i2c4: i2c@10054000 {
+		compatible = "ingenic,jz4780-i2c";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x10054000 0x1000>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <56>;
+
+		clocks = <&cgu JZ4780_CLK_SMB4>;
+		clock-frequency = <100000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pins_i2c4_data>;
+
+		status = "disabled";
+	};
+
 	watchdog: watchdog@10002000 {
 		compatible = "ingenic,jz4780-watchdog";
 		reg = <0x10002000 0x10>;
-- 
2.20.1

