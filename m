Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96345F2D42
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2019 12:18:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387811AbfKGLSN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 Nov 2019 06:18:13 -0500
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.122]:18844 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727732AbfKGLSN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 Nov 2019 06:18:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1573125491;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=y3zYbwzLGCQd958Btkq+b622MLFLPWeGrOh+oKuq+CI=;
        b=QcJiG6Z5nk8l2wAoj0W5K0Q0LHxB1BF70UGjdNGi2tECUPSUhzLW2XLEfJDSwe/0LS
        epGSwlQ4w3KZtLRqCaOWdEIfp49JLluoFt/TErxl/mZamNWfNx0Ms+qesw7mg/Dded6X
        bW7KlZ75oAbAFe+kYliU86X9oTHujyrqTJBgPH8rWqjfdMRyQ7TFBnJZ0lIJyLG3A4vL
        1ZWuvYCHyLBsMLrHFJ9nouIvIfn0sdYTuWXidOoVphyus2EbfTtxQagEMDTuMsYOazA8
        KXU3CUzdMxBPH54SMT46TCSzope/WsDxRZADeovNbOKrEvFThOllb0rhGzgk/+6FhaGa
        VJRA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7PR5/L9P0"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
        with ESMTPSA id L09db3vA7B6Fdgy
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Thu, 7 Nov 2019 12:06:15 +0100 (CET)
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
Subject: [PATCH v2 4/8] ARM: DTS: omap3: add sgx gpu child node
Date:   Thu,  7 Nov 2019 12:06:07 +0100
Message-Id: <78e6f575e25cd4cfec40a5d735303b8ac61521b9.1573124770.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1573124770.git.hns@goldelico.com>
References: <cover.1573124770.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

and add interrupt

Tested on OpenPandora 600 MHz.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/omap34xx.dtsi | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/omap34xx.dtsi b/arch/arm/boot/dts/omap34xx.dtsi
index 7b09cbee8bb8..9b050d71849b 100644
--- a/arch/arm/boot/dts/omap34xx.dtsi
+++ b/arch/arm/boot/dts/omap34xx.dtsi
@@ -111,7 +111,7 @@
 		 * are also different clocks, but we do not have any dts users
 		 * for it.
 		 */
-		sgx_module: target-module@50000000 {
+		target-module@50000000 {
 			compatible = "ti,sysc-omap2", "ti,sysc";
 			reg = <0x50000014 0x4>;
 			reg-names = "rev";
@@ -121,10 +121,11 @@
 			#size-cells = <1>;
 			ranges = <0 0x50000000 0x4000>;
 
-			/*
-			 * Closed source PowerVR driver, no child device
-			 * binding or driver in mainline
-			 */
+			sgx: gpu@0 {
+				compatible = "ti,omap3-sgx530-121", "img,sgx530-121", "img,sgx530";
+				reg = <0x0 0x4000>;	/* 64kB */
+				interrupts = <21>;
+			};
 		};
 	};
 
-- 
2.23.0

