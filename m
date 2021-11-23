Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C306B45AA77
	for <lists+linux-mips@lfdr.de>; Tue, 23 Nov 2021 18:47:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239508AbhKWRuI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Nov 2021 12:50:08 -0500
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.123]:22376 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239376AbhKWRt6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Nov 2021 12:49:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637689589;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=HSbMnkEe2Jt2W3AUERTK6EItFoNAV8MtSmNWsrhpnPI=;
    b=jjJFK7NbTVvIO+XUUw/USfANMoxWuBbd6NwfyrjFP/zJ0mUjq8/ABDnxnOVgyQ3CPr
    pYxoEzKjY/VVZuiwn+xP2Kc0L3SxXZxcJm82hSPK3gDv+G+4sBdkLuUTvqWQ5flFwK0u
    gu7lY7y8JjmfCjxAIlRrnnSjKCHlZ+eOyiN8w7G6bmvD80fmDsqNKCYYJDDtz4M2dwjE
    g2ScEH3HZ4nM+LoDGGyz8db111pT/R1WQxyHceL6yvFMSa63JXlWfoc456ctXSi5X4jV
    +xBQ10DvPuHXo9J1IqUfWUfNNDxSfPD98qnTkg+3DDPH0D84Q34/ZanFbHt4Ae2cjvEW
    bpDQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lByOdcKVX0"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 47.34.6 DYNA|AUTH)
    with ESMTPSA id g09b5fxANHkS7fr
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 23 Nov 2021 18:46:28 +0100 (CET)
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
Subject: [PATCH v7 5/8] MIPS: DTS: jz4780: Account for Synopsys HDMI driver and LCD controllers
Date:   Tue, 23 Nov 2021 18:46:20 +0100
Message-Id: <5546d102dbd2a7030918e4c77ac6a6498eef2ddd.1637689583.git.hns@goldelico.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1637689583.git.hns@goldelico.com>
References: <cover.1637689583.git.hns@goldelico.com>
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

