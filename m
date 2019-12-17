Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA3BD12342A
	for <lists+linux-mips@lfdr.de>; Tue, 17 Dec 2019 19:02:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728128AbfLQSCk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Dec 2019 13:02:40 -0500
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.123]:23769 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727841AbfLQSCj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 17 Dec 2019 13:02:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1576605753;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=7LJXRXD92QzD8gzgf+rZuDp+jr2upt/Et3tNgeqztWo=;
        b=kpafRh5CV8eZp8d9gDqYW4Xn5zo4THC2kcLeK3q4e2mtTqRaR9y+H5awiE5Fj4vE4G
        pS8KMmWPL5ZHRKIsNQhhfH+7ZP7iDxLmXPjKwD8pPDeDLDTrF4EYc3LTwRBgk1S5/4mz
        BCrH4tYqwHNOfjQy0eyVaKWkNC5mugHSivQGfIwhzhxvR5fdkUXIcIz4kznh3CEIdC78
        IV6f/bm4moIhdvdpGsk9HbajTJIQ+wM8aHMT91EIGHtiaxSiif9qN6p8D9VVwm0M1BCB
        DMxN5mQHF2/g9Gpo036JBbo2yteFaYEGW7RHTL6HOl7RQ+HII7PvT3Q3mtcWB0NerYq3
        +xdA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH5Hd8HaSCa"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.0.7 DYNA|AUTH)
        with ESMTPSA id q020e2vBHI2B2db
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
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Paul Boddie <paul@boddie.org.uk>
Subject: [PATCH v4 8/8] MIPS: DTS: jz4780: add sgx gpu node
Date:   Tue, 17 Dec 2019 19:02:06 +0100
Message-Id: <45ccb78d84794db784828b0b62a2b7170f92461f.1576605726.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1576605726.git.hns@goldelico.com>
References: <cover.1576605726.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

and add interrupt and clocks.

Tested to build for CI20 board and load a (non-working - there is no video driver for jz4780) driver.

Suggested-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/boot/dts/ingenic/jz4780.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index f928329b034b..c111f955dece 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -356,6 +356,17 @@
 		clock-names = "rtc";
 	};
 
+	gpu: gpu@13040000 {
+		compatible = "ingenic,jz4780-sgx540-120", "img,sgx540-120", "img,sgx540";
+		reg = <0x13040000 0x4000>;
+
+		clocks = <&cgu JZ4780_CLK_GPU>;
+		clock-names = "gpu";
+
+		interrupt-parent = <&intc>;
+		interrupts = <63>;
+	};
+
 	nemc: nemc@13410000 {
 		compatible = "ingenic,jz4780-nemc";
 		reg = <0x13410000 0x10000>;
-- 
2.23.0

