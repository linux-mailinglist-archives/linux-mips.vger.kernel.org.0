Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71C143E38E1
	for <lists+linux-mips@lfdr.de>; Sun,  8 Aug 2021 07:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230397AbhHHFLa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 8 Aug 2021 01:11:30 -0400
Received: from mo4-p04-ob.smtp.rzone.de ([81.169.146.176]:8324 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbhHHFL0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 8 Aug 2021 01:11:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1628399448;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=K0sFdrnmJtU+HNf5UqSpAGXxaDpXX2cDTnFEZZMJfDU=;
    b=Mca2gerA9tw5onCxIaCy85MMcyBNEmpH9YWE62L9Q0LIzlewr4WcmgF2wER71gnybM
    Lq2Q30ztT74st+r2Ldw/7UcUTlRbFYIGCoL0/0d64gCdP0IRWu9Y18CfS1jZ5tQ7EEh2
    NAvo7/P7mzIH+LZZN7c//EkoOMG+X4k1Iw03vBQfCdjk3CcNZKZ98JbdFDFymM8Sudoq
    7/fBPtwCgpao/NSHrzqw9pgG4D44kl2ZxEJIxV9qAN9GCtbgi69RTpSyQjIOxOlS3of2
    yeL4saj/28m3MjjlYLbUeqLGCIRcMCA5bCVuajUSPlSs/AlLFshrg2Lh6TrrEpjRxPWl
    jT8g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lByOdcKVX0"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 47.31.0 DYNA|AUTH)
    with ESMTPSA id Q02727x785AlEyh
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Sun, 8 Aug 2021 07:10:47 +0200 (CEST)
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
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        Paul Boddie <paul@boddie.org.uk>,
        Jonas Karlman <jonas@kwiboo.se>,
        dri-devel@lists.freedesktop.org
Subject: [PATCH v3 6/9] MIPS: DTS: jz4780: account for Synopsys HDMI driver and LCD controllers
Date:   Sun,  8 Aug 2021 07:10:40 +0200
Message-Id: <c55314a3c812786e518f3f6e079a2fe294372dbb.1628399442.git.hns@goldelico.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1628399442.git.hns@goldelico.com>
References: <cover.1628399442.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 arch/mips/boot/dts/ingenic/jz4780.dtsi | 45 ++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index 9e34f433b9b58..4cbc6a4db6cda 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -424,6 +424,51 @@ i2c4: i2c@10054000 {
 		status = "disabled";
 	};
 
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
+		interrupts = <31>;
+
+		status = "disabled";
+	};
+
 	nemc: nemc@13410000 {
 		compatible = "ingenic,jz4780-nemc", "simple-mfd";
 		reg = <0x13410000 0x10000>;
-- 
2.31.1

