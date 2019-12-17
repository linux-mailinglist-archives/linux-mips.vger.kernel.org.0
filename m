Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0212712343C
	for <lists+linux-mips@lfdr.de>; Tue, 17 Dec 2019 19:03:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727988AbfLQSC3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Dec 2019 13:02:29 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.100]:21663 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727754AbfLQSC3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 17 Dec 2019 13:02:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1576605746;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=e9Acl2lPHSViAJlry8h9OxbHdT+QMq3UUsSm00td1FE=;
        b=TIguiMO2FMlGP0OBGFb0Ugbt2/t/EmumWGKKyvhyw0WbX64YFPu/6THluPg6r5N8mw
        iyzNBrIDmzicQgv73tHroe9fQx6ZRAbaZaaBZB3xL9G9vmXFPOJEtql7eWroVUmXpCBq
        lOmwY2DHToY/ToWxfTzLKvq9sxLjbLHe/CMIqNSPu6XxB+WnaJdGSxrVVwNTxEmHJlfr
        yDKo/DpYDUJSoq+wBgOGd6PRFc9SdFqqEB5Ou3H/HnzCxxRykMSqc0xEsAJEePUWd243
        fsTHNvjZ08/C7puGDcgsR4TlUR0byKc1HqwQ7cFkL+cJ80aUqF3+Lkd1OpAHRWCR4V+H
        8WUA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH5Hd8HaSCa"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.0.7 DYNA|AUTH)
        with ESMTPSA id q020e2vBHI292dX
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 17 Dec 2019 19:02:09 +0100 (CET)
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
Subject: [PATCH v4 4/8] ARM: DTS: omap3: add sgx gpu child node
Date:   Tue, 17 Dec 2019 19:02:02 +0100
Message-Id: <103c92a7d19387860aea406e0356249b02a3cbce.1576605726.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1576605726.git.hns@goldelico.com>
References: <cover.1576605726.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

and add interrupt

Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # OpenPandora 600 MHz.
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/omap34xx.dtsi | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/omap34xx.dtsi b/arch/arm/boot/dts/omap34xx.dtsi
index c4dd9801840d..a858a2e8002d 100644
--- a/arch/arm/boot/dts/omap34xx.dtsi
+++ b/arch/arm/boot/dts/omap34xx.dtsi
@@ -159,7 +159,7 @@
 		 * are also different clocks, but we do not have any dts users
 		 * for it.
 		 */
-		sgx_module: target-module@50000000 {
+		target-module@50000000 {
 			compatible = "ti,sysc-omap2", "ti,sysc";
 			reg = <0x50000014 0x4>;
 			reg-names = "rev";
@@ -169,10 +169,11 @@
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

