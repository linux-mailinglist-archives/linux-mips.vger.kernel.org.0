Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41E67196EEE
	for <lists+linux-mips@lfdr.de>; Sun, 29 Mar 2020 19:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728460AbgC2RjC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 29 Mar 2020 13:39:02 -0400
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.120]:35487 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728426AbgC2Rik (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 29 Mar 2020 13:38:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1585503518;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=Snu2lfs5+eWozVmWM7qfzq3eVbADpaPGPxUvfNGf0AI=;
        b=aBU9+f3scs4X5CmzTVrREU3CXK/G/2+q3P+xKpJwAuX6dNmTgaD+xvY8f/ufRlDNE2
        KltZj7U5PX9m3i274nXw1TrHQMxe0qWcUjjsLTYX0iNXHkq98clnayxqeNhC/WAPu6Jd
        G2FWpp2q5xa1oprbhZ7YqAdYOESx79JpcaJcgTlRe9bgwEM0UTAhmVDtf3hRGLyGqX6H
        Zwkf3cfIDQp2WLoc2U29Qv/U79DqL4DD7+VUiZs/bTmwkTIiFX0FxUYZ3JBSIJ8IoPV+
        dtBQPhRpxHkfLBpFauApAt5dCH8YvJrjZr5xznCmYaMGt4GWJ+Aetx532v2OuO2Zt804
        k2Qg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pDz2rsNxxv"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
        with ESMTPSA id m02241w2THcUBMn
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 29 Mar 2020 19:38:30 +0200 (CEST)
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
Subject: [PATCH v5 5/8] ARM: DTS: omap36xx: add sgx gpu child node
Date:   Sun, 29 Mar 2020 19:38:23 +0200
Message-Id: <d58f648e68c3446c7f7a71ce50db46c752b68d9c.1585503505.git.hns@goldelico.com>
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

Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # GTA04, BeagleBoard XM
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/omap36xx.dtsi | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap36xx.dtsi
index 71f3c8f1f924..b308dbb3b1bb 100644
--- a/arch/arm/boot/dts/omap36xx.dtsi
+++ b/arch/arm/boot/dts/omap36xx.dtsi
@@ -211,10 +211,11 @@ sgx_module: target-module@50000000 {
 			#size-cells = <1>;
 			ranges = <0 0x50000000 0x2000000>;
 
-			/*
-			 * Closed source PowerVR driver, no child device
-			 * binding or driver in mainline
-			 */
+			gpu: gpu@0 {
+				compatible = "ti,omap3-sgx530-125", "img,sgx530-125", "img,sgx530";
+				reg = <0x0 0x10000>;	/* 64kB */
+				interrupts = <21>;
+			};
 		};
 	};
 
-- 
2.25.1

