Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B803245AB18
	for <lists+linux-mips@lfdr.de>; Tue, 23 Nov 2021 19:14:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239861AbhKWSRY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Nov 2021 13:17:24 -0500
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.121]:34093 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239802AbhKWSRV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Nov 2021 13:17:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637691245;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=HSbMnkEe2Jt2W3AUERTK6EItFoNAV8MtSmNWsrhpnPI=;
    b=jcHUZhX/y+bNXLRHcT36fgKtSIUS6YNX6XSYLAZ1cPT+5aMU0N77vrfgzwmw6gJrSh
    U8g9ukDcX8Mf0AKUBQmp7TwiqANJDgz488pQgNeC91XpaQw29VTVSK1Bp4z536pT/RB3
    PSPaCRgSbkxjviTs4fHJgLcT1mlmq8pe3Y3ZcEcKwj/0oEPTpM6Y6tHL3Oo5USaIB/Qs
    egMhmk6mD/m/yU/bPgNs8CIjZF5KrlCH/QL6dEhShtSP7hdZEE8JGWRJ549C2ss0g76U
    o+1EyCzab0xVbbhEBjS0EflCiHMAkkUO34nAPh5/8PlB/R3rkv7IhIdPDBW9KShXCJdv
    bqYg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lByOdcKVX0"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 47.34.6 DYNA|AUTH)
    with ESMTPSA id g09b5fxANIE57mb
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 23 Nov 2021 19:14:05 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kees Cook <keescook@chromium.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Paul Boddie <paul@boddie.org.uk>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        Jonas Karlman <jonas@kwiboo.se>,
        dri-devel@lists.freedesktop.org
Subject: [PATCH v8 5/8] MIPS: DTS: jz4780: Account for Synopsys HDMI driver and LCD controllers
Date:   Tue, 23 Nov 2021 19:13:58 +0100
Message-Id: <f9e74cf8391958db45faf82c51880ef581deb280.1637691240.git.hns@goldelico.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1637691240.git.hns@goldelico.com>
References: <cover.1637691240.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Paul Boddie <paul@boddie.org.uk>

A specialisation of the generic Synopsys HDMI driver is employed for
JZ4780 HDMI support. This requires a new driver, plus device tree and
configuration modifications.

Here we add jz4780 device tree setup.

Signed-off-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/boot/dts/ingenic/jz4780.dtsi | 40 ++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index b0a4e2e019c36..3f9ea47a10cd2 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -444,6 +444,46 @@ i2c4: i2c@10054000 {
 		status = "disabled";
 	};
 
+	hdmi: hdmi@10180000 {
+		compatible = "ingenic,jz4780-dw-hdmi";
+		reg = <0x10180000 0x8000>;
+		reg-io-width = <4>;
+
+		clocks = <&cgu JZ4780_CLK_AHB0>, <&cgu JZ4780_CLK_HDMI>;
+		clock-names = "iahb", "isfr";
+
+		interrupt-parent = <&intc>;
+		interrupts = <3>;
+
+		status = "disabled";
+	};
+
+	lcdc0: lcdc0@13050000 {
+		compatible = "ingenic,jz4780-lcd";
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
+
+	lcdc1: lcdc1@130a0000 {
+		compatible = "ingenic,jz4780-lcd";
+		reg = <0x130a0000 0x1800>;
+
+		clocks = <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD1PIXCLK>;
+		clock-names = "lcd", "lcd_pclk";
+
+		interrupt-parent = <&intc>;
+		interrupts = <23>;
+
+		status = "disabled";
+	};
+
 	nemc: nemc@13410000 {
 		compatible = "ingenic,jz4780-nemc", "simple-mfd";
 		reg = <0x13410000 0x10000>;
-- 
2.33.0

