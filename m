Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D02F8173935
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2020 15:01:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbgB1N6j (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Feb 2020 08:58:39 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.104]:23042 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbgB1N6i (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 Feb 2020 08:58:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582898316;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=JVyqpyxQobtq+JgSsD2shjOsk44PtbUGnvMUC7ptRTU=;
        b=XXcOAhm7mBWVRFnZbfTFhtM+1uSEIRGVxkfunYLTJ32ojaJo8+K6jx3/8K40aKxuks
        lXgPiVa+/q8TuQ6DWyRlnsFllftIhvVWkAuuz6kvxhw41sJTxO48N4iM2ecN337bu9W0
        HooR3hX4agiyXVh3yHwa3WvNkkKQC3xF7shH5VfCSTg36Ww8SZgVyDxdtzJpTwyT4lxt
        FIpA2srB/jdZ0aHTz2Do8vEYQY57mpIcDkp/bIFXqkrGhf/smrxNKIT0ckkeDGG/99eR
        xpQpWd82owWV/eMP8doWU5hKu4tZGI8HPprSf0RG4AWWzjgLSPN05YkEaNSrNLkXMx85
        PXEw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6G1+ULkA="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
        with ESMTPSA id y0a02cw1SDwS1AC
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 28 Feb 2020 14:58:28 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Paul Cercueil <paul@crapouillou.net>,
        Mathieu Malaterre <malat@debian.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andi Kleen <ak@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Subject: [PATCH v7 6/7] MIPS: DTS: JZ4780: define node for JZ4780 efuse
Date:   Fri, 28 Feb 2020 14:58:22 +0100
Message-Id: <223d327c3ab76fc18430fd495003a2e920f638ac.1582898302.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1582898302.git.hns@goldelico.com>
References: <cover.1582898302.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>

This patch brings support for the JZ4780 efuse. Currently it only exposes
a read only access to the entire 8K bits efuse memory and the
ethernet mac address for the davicom dm9000 chip on the CI20 board.

It also changes the nemc ranges definition to give the driver
access to the efuse registers, which are in the middle of the
nemc reg range.

Tested-by: Mathieu Malaterre <malat@debian.org>
Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Signed-off-by: Mathieu Malaterre <malat@debian.org>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/boot/dts/ingenic/jz4780.dtsi | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index f928329b034b..79f90a5b0415 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -357,11 +357,12 @@
 	};
 
 	nemc: nemc@13410000 {
-		compatible = "ingenic,jz4780-nemc";
+		compatible = "ingenic,jz4780-nemc", "simple-mfd";
 		reg = <0x13410000 0x10000>;
 		#address-cells = <2>;
 		#size-cells = <1>;
-		ranges = <1 0 0x1b000000 0x1000000
+		ranges = <0 0 0x13410000 0x10000
+			  1 0 0x1b000000 0x1000000
 			  2 0 0x1a000000 0x1000000
 			  3 0 0x19000000 0x1000000
 			  4 0 0x18000000 0x1000000
@@ -371,6 +372,20 @@
 		clocks = <&cgu JZ4780_CLK_NEMC>;
 
 		status = "disabled";
+
+		efuse: efuse@d0 {
+			reg = <0 0xd0 0x30>;
+			compatible = "ingenic,jz4780-efuse";
+
+			clocks = <&cgu JZ4780_CLK_AHB2>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			eth0_addr: eth-mac-addr@0x22 {
+				reg = <0x22 0x6>;
+			};
+		};
 	};
 
 	dma: dma@13420000 {
-- 
2.23.0

