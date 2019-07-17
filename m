Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFB2F6C038
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jul 2019 19:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727147AbfGQRQj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Jul 2019 13:16:39 -0400
Received: from vps.deutnet.info ([92.222.219.9]:60708 "EHLO vps.deutnet.info"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726917AbfGQRQj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 17 Jul 2019 13:16:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deutnet.info; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:
        To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=JdQW5yef3/oLdjTuLUcYjPBC8Xuj3agNuqkg0iaCI/0=; b=nFlfFWBYdBHEuafvpo+RbP7HTS
        GI04vJPPD00ES7Hli6DLAaqlXo8+mjfV4L7R30WWDTG/WEfOJdOWByhAsoGcpvrzTkDHOHdkg8ZiR
        LkN7oUv6ZtAllN+9j++w6pH1D3iV8deHDCpMwfMs4HneCqFYIUhyeZVZ7ar3N2GxryIVdXzDk1ZRw
        pMtpyPrmX/DYhQjAKCDD2bc/V1fS66bq34xoe9Za3ThgBrmEa4J6GpzNpga6OCQUjX+NCuEjkffbK
        KVcRhZrs1ETStZvwXk3PkhAfMB6CPZes/pP8NT54sTYBiNFvxGUUIYd2ps63KJskGZc0AFd4zT4Vl
        4c8Z1/ew==;
Received: from [2001:41d0:fe79:6700:cf3e:2f2c:b15:9bf9] (helo=sonata)
        by vps.deutnet.info with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <agriveaux@deutnet.info>)
        id 1hnn8N-0006tM-G7; Wed, 17 Jul 2019 18:50:27 +0200
Received: from agriveaux by sonata with local (Exim 4.92)
        (envelope-from <agriveaux@localhost.localdomain>)
        id 1hnn8L-0003Du-DF; Wed, 17 Jul 2019 18:50:25 +0200
Date:   Wed, 17 Jul 2019 18:50:25 +0200
From:   Alexandre GRIVEAUX <agriveaux@deutnet.info>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Alexandre GRIVEAUX <agriveaux@deutnet.info>
Cc:     linux-mips <linux-mips@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org
Subject: [PATCH] MIPS: JZ4740: DTS: Add I2C nodes
Message-ID: <20190717165025.GA12362@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the devicetree nodes for the I2C core of the JZ4780 SoC, disabled
by default.
---
 arch/mips/boot/dts/ingenic/jz4780.dtsi | 86 ++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index b03cdec56de9..a76ecd69bfd0 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -239,6 +239,92 @@
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

