Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA869168E3B
	for <lists+linux-mips@lfdr.de>; Sat, 22 Feb 2020 11:26:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727304AbgBVK0P (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 22 Feb 2020 05:26:15 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.100]:11238 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727124AbgBVK0B (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 22 Feb 2020 05:26:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582367158;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=V1+Q4JesqWcFYmt/4rldi7rtX4QsYdV77esVgLGK1a4=;
        b=Gr3HjOMYR2wjg+I8qajMOSRxldcCJmwWve/0wTk0GoAIz0vRPBOjZKoCxOUqaU7XjX
        epUvCFCd9nuvptu65ttsmCrSJVn7qmJS/CKGURH9IeW55iMLVJsixoAlXRxxAmcbPY8W
        SCIvH50vsN2WlQDle9czv5WeMjyiPVN8WBI34eLAkpCN/Gs+iyDtJ/eqwhTkPY/cwR1A
        5u4hQlpwVM35s8ke9NWlFiKzcFapy7XxFRbK4FKZRy6PL/CnJSTBpij95QxYFB38ekSr
        m3iy1YONRUgtKNx01yj+VnwG4RE755v2NwzHjKXec0m42aDV31gFGYWk1fLdUl3SaS/7
        nrtA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pAz7pC6Q5M"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1MAPljMe
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sat, 22 Feb 2020 11:25:47 +0100 (CET)
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
Subject: [PATCH v5 5/6] MIPS: DTS: JZ4780: define node for JZ4780 efuse
Date:   Sat, 22 Feb 2020 11:25:40 +0100
Message-Id: <a37450ad5702d0e02a7ff494d69bc1b2c9fa3c17.1582367141.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1582367141.git.hns@goldelico.com>
References: <cover.1582367141.git.hns@goldelico.com>
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

It also changes the nemc reg range to avoid overlap.

Tested-by: Mathieu Malaterre <malat@debian.org>
Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Signed-off-by: Mathieu Malaterre <malat@debian.org>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/boot/dts/ingenic/jz4780.dtsi | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index f928329b034b..1e266be28096 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -358,7 +358,7 @@
 
 	nemc: nemc@13410000 {
 		compatible = "ingenic,jz4780-nemc";
-		reg = <0x13410000 0x10000>;
+		reg = <0x13410000 0x4c>;
 		#address-cells = <2>;
 		#size-cells = <1>;
 		ranges = <1 0 0x1b000000 0x1000000
@@ -373,6 +373,21 @@
 		status = "disabled";
 	};
 
+	efuse: efuse@134100d0 {
+		compatible = "ingenic,jz4780-efuse";
+		reg = <0x134100d0 0x2c>;
+
+		clocks = <&cgu JZ4780_CLK_AHB2>;
+		clock-names = "ahb2";
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		eth0_addr: eth-mac-addr@0x22 {
+			reg = <0x22 0x6>;
+		};
+	};
+
 	dma: dma@13420000 {
 		compatible = "ingenic,jz4780-dma";
 		reg = <0x13420000 0x400
-- 
2.23.0

