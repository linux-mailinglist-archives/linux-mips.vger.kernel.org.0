Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E25B312341F
	for <lists+linux-mips@lfdr.de>; Tue, 17 Dec 2019 19:02:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727939AbfLQSCZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Dec 2019 13:02:25 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.102]:24617 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727754AbfLQSCZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 17 Dec 2019 13:02:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1576605741;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=YXIU//H72PWNc49RBs+rhxV4zwJ2ZepdHCtmFdJqKeM=;
        b=H8xdEFrxwq4QJFb/q8YL6Pu1yU2iQzdI3J10KUuFBA3xyIJFmB6xGfEqrV7xyPPQqq
        RhSqembRYYgOQFz8xwUKE5PBXqX3EUZ0vQwTPOS1a1JvE+LP+mzz29/UH0uHgTqGXrBp
        Ate17iEMaQuhXV+PL7YFs2VLcH3zEfPQgiZRgFoHQV4XCzD4OBGwk40hABawmKkxrAXx
        8/NNYtz0fn9w3WeiaZ2u5CsG2Q2/wDf5GsC5t5DJjguMJTjH7mveqUroxSajsHoON0t0
        Q5+xaPreOZbOsAbzy0Fbkj7gf3BPCL5FoMrrJGB7Z+ySiNZ6NDKiIdkLlokhGZ4YXXGH
        +jxA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH5Hd8HaSCa"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.0.7 DYNA|AUTH)
        with ESMTPSA id q020e2vBHI2A2dY
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 17 Dec 2019 19:02:10 +0100 (CET)
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
Subject: [PATCH v4 5/8] ARM: DTS: omap36xx: add sgx gpu child node
Date:   Tue, 17 Dec 2019 19:02:03 +0100
Message-Id: <83e05f942e337b2dd4b5e294589b6cdf10c70262.1576605726.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1576605726.git.hns@goldelico.com>
References: <cover.1576605726.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

and add interrupt.

Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # GTA04, BeagleBoard XM
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/omap36xx.dtsi | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap36xx.dtsi
index c618cb257d00..b9d488a193e8 100644
--- a/arch/arm/boot/dts/omap36xx.dtsi
+++ b/arch/arm/boot/dts/omap36xx.dtsi
@@ -194,7 +194,7 @@
 		 * "ti,sysc-omap4" type register with just sidle and midle bits
 		 * available while omap34xx has "ti,sysc-omap2" type sysconfig.
 		 */
-		sgx_module: target-module@50000000 {
+		target-module@50000000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
 			reg = <0x5000fe00 0x4>,
 			      <0x5000fe10 0x4>;
@@ -211,10 +211,11 @@
 			#size-cells = <1>;
 			ranges = <0 0x50000000 0x2000000>;
 
-			/*
-			 * Closed source PowerVR driver, no child device
-			 * binding or driver in mainline
-			 */
+			sgx: gpu@0 {
+				compatible = "ti,omap3-sgx530-125", "img,sgx530-125", "img,sgx530";
+				reg = <0x0 0x10000>;	/* 64kB */
+				interrupts = <21>;
+			};
 		};
 	};
 
-- 
2.23.0

