Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62A711A96CC
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2020 10:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408160AbgDOIhL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Apr 2020 04:37:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2894615AbgDOIf4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 15 Apr 2020 04:35:56 -0400
Received: from mo6-p04-ob.smtp.rzone.de (mo6-p04-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5304::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47EF3C061A0E;
        Wed, 15 Apr 2020 01:35:52 -0700 (PDT)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7O2CKN9ej"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.4.0 DYNA|AUTH)
        with ESMTPSA id 6028a2w3F8ZT0Ix
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 15 Apr 2020 10:35:29 +0200 (CEST)
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
Cc:     Philipp Rossak <embed3d@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v6 11/12] ARM: dts: sun8i: a83t: add sgx gpu child node
Date:   Wed, 15 Apr 2020 10:35:18 +0200
Message-Id: <acc240eb8ccc2040dd90577f2e4bf429434583a1.1586939718.git.hns@goldelico.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1586939718.git.hns@goldelico.com>
References: <cover.1586939718.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Philipp Rossak <embed3d@gmail.com>

We are adding the devicetree binding for the PVR-SGX-544-115 gpu.

This driver is currently under development in the openpvrsgx-devgroup.
Right now the full binding is not figured out, so we provide here a
placeholder. It will be completed as soon as there is a demo available.

The currently used binding that is used during development is more
complete and was already verifyed by loading the kernelmodule successful.

Signed-off-by: Philipp Rossak <embed3d@gmail.com>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index 655404d6d3a3..bfb900622bf6 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -1192,6 +1192,17 @@ ths: thermal-sensor@1f04000 {
 			nvmem-cell-names = "calibration";
 			#thermal-sensor-cells = <1>;
 		};
+
+		gpu: gpu@1c400000 {
+			compatible = "allwinner,sun8i-a83t-sgx544-115",
+				     "img,sgx544-115", "img,sgx544";
+			reg = <0x01c40000 0x10000>;
+			/*
+			 * This node is currently a placeholder for the gpu.
+			 * This will be completed when a full demonstration
+			 * of the openpvrsgx driver is available for this board.
+			 */
+		};
 	};
 
 	thermal-zones {
-- 
2.25.1

