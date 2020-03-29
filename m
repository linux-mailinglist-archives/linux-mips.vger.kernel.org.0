Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EDA2196EDD
	for <lists+linux-mips@lfdr.de>; Sun, 29 Mar 2020 19:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728507AbgC2Rim (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 29 Mar 2020 13:38:42 -0400
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.120]:14273 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728465AbgC2Ril (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 29 Mar 2020 13:38:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1585503519;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=iyEhMCKeP2FreN2b/L3+ZjLXH7lhAMv1iW4jyUtBvjo=;
        b=Ba0la23jr5Sj0IFxpZA8mXzm0IevQonvcn2TrIHR8ZVTvWI1TKS/WqiF8XABT74eC/
        Nxb/jxkL1USZpiuIvnJvWoKhUX6uYWhL0lI7VblU8kl4wqArd9BuAeAejCpAvCjvXlOV
        bO8T0Vxe9tc0Lb5eDA3wz1aMP3RriSLJIfCVzjnkG3tQpoPGR5COuqvDCKAVOEaL/kNN
        XdOojt8a06BktecdEjXq6Ooxf1sfpSl9r8T+MkG/6I0OBflDbyU7Dokfhdz+pkELu85V
        OSz6frPrT188Q/zgDsS29BpxSm5uCNhMYXch2P+rsg+iGBOE2AXC7AV1FjLLqulO7W9g
        YgDw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pDz2rsNxxv"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
        with ESMTPSA id m02241w2THcUBMo
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
Subject: [PATCH v5 6/8] ARM: DTS: omap4: add sgx gpu child node
Date:   Sun, 29 Mar 2020 19:38:24 +0200
Message-Id: <df6e1449b403d33d39f8bb994a1e3a81be552c13.1585503505.git.hns@goldelico.com>
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

Since omap4420/30/60 and omap4470 come with different SGX variants
we need to introduce a new omap4470.dtsi. If an omap4470 board
does not want to use SGX it is no problem to still include
omap4460.dtsi.

Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # PandaBoard ES
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/omap4.dtsi   | 11 ++++++-----
 arch/arm/boot/dts/omap4470.dts | 15 +++++++++++++++
 2 files changed, 21 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm/boot/dts/omap4470.dts

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
index 9a87440d0b9d..939061f96523 100644
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -390,7 +390,7 @@ abb_iva: regulator-abb-iva {
 			status = "disabled";
 		};
 
-		target-module@56000000 {
+		sgx_module: target-module@56000000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
 			reg = <0x5600fe00 0x4>,
 			      <0x5600fe10 0x4>;
@@ -409,10 +409,11 @@ target-module@56000000 {
 			#size-cells = <1>;
 			ranges = <0 0x56000000 0x2000000>;
 
-			/*
-			 * Closed source PowerVR driver, no child device
-			 * binding or driver in mainline
-			 */
+			gpu: gpu@0 {
+				compatible = "ti,omap4-sgx540-120", "img,sgx540-120", "img,sgx540";
+				reg = <0x0 0x2000000>;	/* 32MB */
+				interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		dss: dss@58000000 {
diff --git a/arch/arm/boot/dts/omap4470.dts b/arch/arm/boot/dts/omap4470.dts
new file mode 100644
index 000000000000..19b554612401
--- /dev/null
+++ b/arch/arm/boot/dts/omap4470.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Device Tree Source for OMAP4470 SoC
+ *
+ * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+#include "omap4460.dtsi"
+
+&sgx {
+	compatible = "img,sgx544-112", "img,sgx544", "ti,omap-omap4-sgx544-112";
+};
-- 
2.25.1

