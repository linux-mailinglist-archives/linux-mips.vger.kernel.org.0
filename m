Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1161123439
	for <lists+linux-mips@lfdr.de>; Tue, 17 Dec 2019 19:02:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728025AbfLQSCb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Dec 2019 13:02:31 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:27279 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727983AbfLQSCa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 17 Dec 2019 13:02:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1576605745;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=W0Zq1kSNAO7ndDsKHfhB+6NaI3nh7bHG6tICVRK9oaQ=;
        b=eqLk7ORA4fvkprr4oGMcmiFV9MrMzC7CtsrfkDCBFhhFlWghfkV5PDikasuBoHiUb6
        xpwemc5Ije5q3sIFxrtxjPsNtMYZ8NgeooexYlAi4Vy6XRdHIV7Zp6k3qCsFvcmm9sdm
        Tv6nfMkxYtbUGGCOafifUq+vqoxZdobGZNtwdk/Bo0ZjGq0FGwdRk6NK5AqamqrKfC19
        d9L9NKIQ/a9YQn/9TTZ95wT7FM3Tl3swdUHc0h619ieLNLzRRCZ98mLBwlKu/Vg2K3OE
        HznmgeNHbT0X4Hfljin0jcYmLMPcLpFLBntYizBbkoHPS5RaM48R+meDaaH/bC7HKUH6
        io7w==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH5Hd8HaSCa"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.0.7 DYNA|AUTH)
        with ESMTPSA id q020e2vBHI282dV
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 17 Dec 2019 19:02:08 +0100 (CET)
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
Subject: [PATCH v4 2/8] ARM: DTS: am33xx: add sgx gpu child node
Date:   Tue, 17 Dec 2019 19:02:00 +0100
Message-Id: <30fbbc9dc573a1cedf2d4a9d3301ffceaa5ea1ee.1576605726.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1576605726.git.hns@goldelico.com>
References: <cover.1576605726.git.hns@goldelico.com>
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
 arch/arm/boot/dts/am33xx.dtsi | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
index c427ce8c2539..11c7b0dbb5dc 100644
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -477,10 +477,11 @@
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
-- 
2.23.0

