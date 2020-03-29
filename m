Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB0C8196EEB
	for <lists+linux-mips@lfdr.de>; Sun, 29 Mar 2020 19:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728544AbgC2Ri5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 29 Mar 2020 13:38:57 -0400
Received: from mo4-p04-ob.smtp.rzone.de ([81.169.146.179]:15288 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728460AbgC2Ril (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 29 Mar 2020 13:38:41 -0400
X-Greylist: delayed 9635 seconds by postgrey-1.27 at vger.kernel.org; Sun, 29 Mar 2020 13:38:41 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1585503519;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=44B31HdYZjedMQJXf0inYUwYyxn++K8adWlV7iSTrAk=;
        b=jgYNSJGlOfU8jV71TWYW42kficirtR6ZYK5BMGRM4iH4zY8Hv+gp1I/MlgHf8bYaSE
        idnkkSfzH74x/4hP8e6W/NXs9+G8P1Jhi5bX4XIoh8BMrbCA3ejXJHRGE6fZPU0yJI21
        QRS6omFzIXG6kdiV7wueYh3I4FOIKxgzAt1RNN5Vb8ROOUMCBiDICR/qzkmw5ac21jWN
        8r1aF9mf3ZX/dK6330JbfhPwLRt1VCU7lfKsmjXErlVy0or/W3Hks0zEI55iJOvV2Bq9
        V+LmdcC6SDf8R9AFSXyDwBSiX+39v253aLIZXPLLL7St57sTsi3dPpqYOewCogBOYzKX
        w3yw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pDz2rsNxxv"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
        with ESMTPSA id m02241w2THcVBMp
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 29 Mar 2020 19:38:31 +0200 (CEST)
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
Cc:     Philipp Rossak <embed3d@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v5 7/8] ARM: DTS: omap5: add sgx gpu child node
Date:   Sun, 29 Mar 2020 19:38:25 +0200
Message-Id: <543338383426c7f0510255f52ba780b48cdb8eff.1585503505.git.hns@goldelico.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585503505.git.hns@goldelico.com>
References: <cover.1585503505.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

and add interrupt.

Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # Pyra-Handheld.
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/omap5.dtsi | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
index d0ecf54d5a23..4c7c4ca0bd87 100644
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -269,7 +269,7 @@ sata: sata@4a141100 {
 			ports-implemented = <0x1>;
 		};
 
-		target-module@56000000 {
+		sgx_module: target-module@56000000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
 			reg = <0x5600fe00 0x4>,
 			      <0x5600fe10 0x4>;
@@ -286,10 +286,11 @@ target-module@56000000 {
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
 
 		dss: dss@58000000 {
-- 
2.25.1

