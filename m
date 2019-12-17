Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6023B12343F
	for <lists+linux-mips@lfdr.de>; Tue, 17 Dec 2019 19:03:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728198AbfLQSCz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Dec 2019 13:02:55 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.101]:34612 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727976AbfLQSCa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 17 Dec 2019 13:02:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1576605747;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=ETBzEAb6h197GGRUhh3HldTekxclXafQd020eG+uWFk=;
        b=cqocFmn83jaDOOn06iQMFTZP026phvJfZbHFyYQVlycEpIUAjl+WApyTlhHqlhTC98
        cKqxghPtWLjtVLUH1BFWKY00LbLCbe6tOSEDpqpO/X0W74va2zFetWQZwy8X2DhJq6yn
        xAWWdTKLjHF70pPbtWkHdIg/iAdyj7SPDvGZO3uOQnt74BsutrZBztU0yXPaikltrwt/
        uiKXYmduPlWVPjWvdMTYcKoqwLpxxp/uahhOr2IUK2tH//cFuk/M1Mu6G7W4c9AnyJ3V
        wtfYMiFgIEZ/i/WOsP4cOrJz2N5Qj42yaQ5iXnTP9pFxmnz3NiWT9QTZaqIwWATDjOuX
        RnxQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH5Hd8HaSCa"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.0.7 DYNA|AUTH)
        with ESMTPSA id q020e2vBHI2A2dZ
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
Subject: [PATCH v4 6/8] ARM: DTS: omap4: add sgx gpu child node
Date:   Tue, 17 Dec 2019 19:02:04 +0100
Message-Id: <52af9ae6dd26c42e5ada1af247d2c070d0635fcf.1576605726.git.hns@goldelico.com>
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

Since omap4420/30/60 and omap4470 come with different SGX variants
we need to introduce a new omap4470.dtsi. If an omap4470 board
does not want to use SGX it is no problem to still include
omap4460.dtsi.

Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # PandaBoard ES
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/omap4.dtsi   |  9 +++++----
 arch/arm/boot/dts/omap4470.dts | 15 +++++++++++++++
 2 files changed, 20 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/boot/dts/omap4470.dts

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
index 2de8a6b53de9..bfca05309a99 100644
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -347,10 +347,11 @@
 			#size-cells = <1>;
 			ranges = <0 0x56000000 0x2000000>;
 
-			/*
-			 * Closed source PowerVR driver, no child device
-			 * binding or driver in mainline
-			 */
+			sgx: img@0 {
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
2.23.0

