Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 195AC1708A0
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2020 20:13:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727451AbgBZTNQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 Feb 2020 14:13:16 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.103]:8033 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727327AbgBZTNP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 26 Feb 2020 14:13:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582744392;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=2EvwvmMzOKZtUZJLHlIF1SJL85vzPp9aE2EFoN3J+us=;
        b=JyNYIs8eJF3enx4BQ0lLSgQ4ZtsIZ48STigs58bKZrZyRG99cGbOuRsqKLSDrwQ7e1
        4nvLsna6naCL/FuMDOOsbU2whqLMT7U2Kbz6sdWFkl4cbtdGs20qIBSA1isVRmdi3P9Z
        Bj807aTMXezrkAFI142tVBJan2KdcgDyiAIVcENldEP9mgLnJLpGvRgV0p030Z7NsReu
        BtkWM4f8aHP7nZBk0/Zh8tjCW0Pgtyap+JCYOJ5S+g8yLkd8pQUXrb3sArubDbmVnLp4
        ABV4pZLsG9ZlnCng7B1QqVFI/O9y+kv5+dEBL6bmEckST5EsBobfDOpWKCfQltXCugnk
        mIsg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pAzoz/Oc2x"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1QJD56bP
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 26 Feb 2020 20:13:05 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Paul Cercueil <paul@crapouillou.net>,
        Paul Boddie <paul@boddie.org.uk>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andi Kleen <ak@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: [RFC 6/8] MIPS: DTS: jz4780: account for Synopsys HDMI driver and LCD controller
Date:   Wed, 26 Feb 2020 20:12:58 +0100
Message-Id: <fc8b92092f9e4ecdba86df973455ff06e836b349.1582744379.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1582744379.git.hns@goldelico.com>
References: <cover.1582744379.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Paul Boddie <paul@boddie.org.uk>

A specialisation of the generic Synopsys HDMI driver is employed for JZ4780
HDMI support. This requires a new driver, plus device tree and configuration
modifications.

Signed-off-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/boot/dts/ingenic/jz4780.dtsi | 32 ++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index f928329b034b..391d4e1efd35 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -433,4 +433,36 @@
 
 		status = "disabled";
 	};
+
+	hdmi: hdmi@10180000 {
+		compatible = "ingenic,jz4780-dw-hdmi";
+		reg = <0x10180000 0x8000>;
+		reg-io-width = <4>;
+
+		clocks = <&cgu JZ4780_CLK_HDMI>, <&cgu JZ4780_CLK_AHB0>;
+		clock-names = "isfr" , "iahb";
+
+		assigned-clocks = <&cgu JZ4780_CLK_HDMI>;
+		assigned-clock-rates = <27000000>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <3>;
+
+		/* ddc-i2c-bus = <&i2c4>; */
+
+		status = "disabled";
+	};
+
+	lcd: lcd@13050000 {
+		compatible = "ingenic,jz4740-lcd";
+		reg = <0x13050000 0x1800>;
+
+		clocks = <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD0PIXCLK>;
+		clock-names = "lcd", "lcd_pclk";
+
+		interrupt-parent = <&intc>;
+		interrupts = <31>;
+
+		status = "disabled";
+	};
 };
-- 
2.23.0

