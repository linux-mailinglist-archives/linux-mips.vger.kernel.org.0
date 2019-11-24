Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3360F108329
	for <lists+linux-mips@lfdr.de>; Sun, 24 Nov 2019 12:41:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbfKXLkr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 24 Nov 2019 06:40:47 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.100]:9619 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726740AbfKXLkq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 24 Nov 2019 06:40:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574595643;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=ZYQzlQVMDmnVrRYXkfhAI7LtxZT/3zaRWYdCXsxRj0I=;
        b=hgjYrSvFGL9sesnDgiN0jpRRjgM8SsSO/fPyvx6dQD5jnKQBBLKUCISIo6fyCCweHp
        Wv/a8TTpm7fcfFwofDptqVvRoFA1tTQMD94lK0TBlQLE4BDUagu2rfx5uT1mM93YvTTu
        sLpLBBKBNolC//OF5PynBuoTjRZR7mw9ElLEDOxdxHg90wP4PU+1O96gUUQLdcsRWxTZ
        rUok1jILws8R5Xopo60fQj8llG2xUGgPXn/haTmWCsTWTmotys53vy7TixfmElVmdTCM
        KIS2k3mOv8fNC4p6v0GWqTCbIynkv9iSZIL3XGfJcEUcOnf0DHUmJCuQKO7c+4a4vzw4
        lu7A==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH4HEaKeuIV"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
        with ESMTPSA id L09db3vAOBeUwES
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Sun, 24 Nov 2019 12:40:30 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v3 2/8] ARM: DTS: am33xx: add sgx gpu child node
Date:   Sun, 24 Nov 2019 12:40:22 +0100
Message-Id: <2ae609d6958727723ebaea2cfb62b547b38c23ee.1574595627.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1574595627.git.hns@goldelico.com>
References: <cover.1574595627.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

and add timer and interrupt

Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # BeagleBone Black
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/am33xx.dtsi | 38 +++++++++++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
index a9d848d50b20..1fbc8a2cc7fd 100644
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -480,13 +480,43 @@
 			#size-cells = <1>;
 			ranges = <0 0x56000000 0x1000000>;
 
-			/*
-			 * Closed source PowerVR driver, no child device
-			 * binding or driver in mainline
-			 */
+			sgx: gpu@0 {
+				compatible = "ti,am3352-sgx530-125", "img,sgx530-125", "img,sgx530";
+				reg = <0x00 0x1000000>;	/* 16 MB */
+				interrupts = <37>;
+			};
 		};
 	};
 };
 
 #include "am33xx-l4.dtsi"
 #include "am33xx-clocks.dtsi"
+
+&prcm {
+	prm_per: prm@c00 {
+		compatible = "ti,am3-prm-inst";
+		reg = <0xc00 0x100>;
+		#reset-cells = <1>;
+		clocks = <&pruss_ocp_clkctrl AM3_PRUSS_OCP_PRUSS_CLKCTRL 0>;
+	};
+
+	prm_wkup: prm@d00 {
+		compatible = "ti,am3-prm-inst";
+		reg = <0xd00 0x100>;
+		#reset-cells = <1>;
+		clocks = <&l4_wkup_clkctrl AM3_WKUP_M3_CLKCTRL 0>;
+	};
+
+	prm_device: prm@f00 {
+		compatible = "ti,am3-prm-inst";
+		reg = <0xf00 0x100>;
+		#reset-cells = <1>;
+	};
+
+	prm_gfx: prm@1100 {
+		compatible = "ti,am3-prm-inst";
+		reg = <0x1100 0x100>;
+		#reset-cells = <1>;
+		clocks = <&gfx_l3_clkctrl AM3_GFX_CLKCTRL 0>;
+	};
+};
-- 
2.23.0

