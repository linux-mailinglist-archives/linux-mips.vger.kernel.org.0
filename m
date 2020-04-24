Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 654E91B80B8
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2020 22:34:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgDXUev (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Apr 2020 16:34:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgDXUeu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Apr 2020 16:34:50 -0400
Received: from mo6-p04-ob.smtp.rzone.de (mo6-p04-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5304::5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A602C09B049;
        Fri, 24 Apr 2020 13:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587760485;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=aeLQCupRaiUXbpss4HFlekm68gu+EZORgbPWCj4bUNQ=;
        b=l3ZW+OBcvbDY7isy1fAmFenBtzfvigTsSRmvgWABoGgG2XTW8X6UyP+zexjhbZI66+
        cYSmSdzRneGrNSIc0KH6SoOtngruwClfh/H9dGhmil/ydnX7RqoxPfBY97V5ntWu0OiU
        /Xoft1PAI4F1UW3wGpzuPiFNSdw/pTxIGYzq/gWyaw1vS1/tSXN9Q9uWFYQkaO66RPJ+
        I/Ma99WSXVKKLTCT/m+9ZxY+wsnah9uFIlGJisM4nKvWtO1XfErL5KR84uZ2gB7wcS3R
        J0ejaNG9mV83M51oI5YI2mDoEn3WzR2LtrrkkOPtMPfNc+4tYbqUxvXu7vInozfeUlA0
        NWGA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6GK44R2FE"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id R0acebw3OKYNEVF
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 24 Apr 2020 22:34:23 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jonathan Bakker <xc-racer2@live.ca>,
        Philipp Rossak <embed3d@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v7 07/12] ARM: DTS: omap5: add sgx gpu child node
Date:   Fri, 24 Apr 2020 22:34:10 +0200
Message-Id: <5840297da588ba37f65a2a4f4f1421922fe28a06.1587760454.git.hns@goldelico.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1587760454.git.hns@goldelico.com>
References: <cover.1587760454.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add SGX GPU node with interrupt. Tested on Pyra-Handheld.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/omap5.dtsi | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
index 2ac7f021c284..1cf41664fd00 100644
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -270,7 +270,7 @@ sata: sata@4a141100 {
 			ports-implemented = <0x1>;
 		};
 
-		target-module@56000000 {
+		sgx_module: target-module@56000000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
 			reg = <0x5600fe00 0x4>,
 			      <0x5600fe10 0x4>;
@@ -287,10 +287,11 @@ target-module@56000000 {
 			#size-cells = <1>;
 			ranges = <0 0x56000000 0x2000000>;
 
-			/*
-			 * Closed source PowerVR driver, no child device
-			 * binding or driver in mainline
-			 */
+			gpu: gpu@0 {
+				compatible = "ti,omap5-sgx544-116", "img,sgx544-116", "img,sgx544";
+				reg = <0x0 0x10000>;
+				interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		target-module@58000000 {
-- 
2.25.1

