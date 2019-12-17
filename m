Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C64DB123442
	for <lists+linux-mips@lfdr.de>; Tue, 17 Dec 2019 19:03:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727797AbfLQSCz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Dec 2019 13:02:55 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.100]:33450 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727977AbfLQSCa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 17 Dec 2019 13:02:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1576605747;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=w4YsjtiS0N7/PiCO2qohupGa+C74qyUiSm8fz1nk/OU=;
        b=OJ/zVg0kQm/HXMKiBhsqbVoIaopfZsZoAHk67BJfDD178puSe2YvZ14z6T5hfOeSco
        IXtXEopVFDnlStXBldgBq2fzzcaXSH3e+3TrMhOM5R3bWcx7Qdsc+T1+unPWKTZclYt2
        7i9oSSkCM7d05EfPVj1D7+Qn3vNp4Q6NrPOK/yw3lYmCCJnipxAeN2FCeTLY58jkhReH
        tVK5LTU4v2KAmJwnuZ6KKcaSlBcVK82p+4AVMNcwpBjEsWPARESb65GHclX+aFb4JfeR
        tOKCZYp194ilh+CHDgD9raAMiv9pZAUtxM70M3PDat3fqpWSJwm7BEubIODBOfXp1/ni
        khHQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH5Hd8HaSCa"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.0.7 DYNA|AUTH)
        with ESMTPSA id q020e2vBHI2B2da
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 17 Dec 2019 19:02:11 +0100 (CET)
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
Subject: [PATCH v4 7/8] ARM: DTS: omap5: add sgx gpu child node
Date:   Tue, 17 Dec 2019 19:02:05 +0100
Message-Id: <118fefcd5426570822051d2333d9a97304bf2962.1576605726.git.hns@goldelico.com>
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

Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # Pyra-Handheld.
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/omap5.dtsi | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
index 1f6ad1debc90..3bb7a4949c12 100644
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -274,10 +274,11 @@
 			#size-cells = <1>;
 			ranges = <0 0x56000000 0x2000000>;
 
-			/*
-			 * Closed source PowerVR driver, no child device
-			 * binding or driver in mainline
-			 */
+			sgx: gpu@0 {
+				compatible = "ti,omap5-sgx544-116", "img,sgx544-116", "img,sgx544";
+				reg = <0x0 0x10000>;
+				interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		dss: dss@58000000 {
-- 
2.23.0

