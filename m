Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF24E464021
	for <lists+linux-mips@lfdr.de>; Tue, 30 Nov 2021 22:27:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240746AbhK3Vae (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Nov 2021 16:30:34 -0500
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.120]:25969 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240628AbhK3Vab (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 Nov 2021 16:30:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1638307610;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=15Nkk1H/19ZCPCTvtDzkEK7DIJe2pfI1c9+1syWWzcY=;
    b=sWy8vEmk7nvIyRSKht61OFnVDjFYQ0EMK24N/NxRjVWRSH+eBSKfkyHe6f8Ci8Bcu6
    KYh87pSY37ee1g9hK97Q4LbTGgDX1/kmyNk7r7f58jP8dD+vtij21CDvaLcm4t/+toK1
    WeUGE2n/yoVhryQvnKgLjY3tEXkUIVXOPZwJAoWlO4qmh5QWtTpA7HA+DqxdrqXjnLH9
    Z6Yjg/cTrO9Oe/1eXWjzvbvaJsgC8VtgilkCBY3eI0ZpsY7h9ikyd353ppH7k768np2p
    fwvfIpvr7Uzn3DUX3QMVnwRcAi/DDFtEQflPQ5TRLUWL63KhtSCcsI+/WZYUNCBxvOTg
    ZWcA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1KHeBQyh+ITDDJuCr4="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 47.34.10 DYNA|AUTH)
    with ESMTPSA id e05ed8xAULQnToD
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 30 Nov 2021 22:26:49 +0100 (CET)
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
Subject: [PATCH v10 8/8] [RFC] MIPS: DTS: Ingenic: adjust register size to available registers
Date:   Tue, 30 Nov 2021 22:26:41 +0100
Message-Id: <ead6d476378e134837443ac245ccd112c0c59b64.1638307601.git.hns@goldelico.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1638307601.git.hns@goldelico.com>
References: <cover.1638307601.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

After getting the regmap size from the device tree we should
reduce the ranges to the really available registers. This
allows to read only existing registers from the debug fs
and makes the regmap check out-of-bounds access.

For the jz4780 we have done this already.

Suggested-for: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/boot/dts/ingenic/jz4725b.dtsi | 2 +-
 arch/mips/boot/dts/ingenic/jz4740.dtsi  | 2 +-
 arch/mips/boot/dts/ingenic/jz4770.dtsi  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/jz4725b.dtsi b/arch/mips/boot/dts/ingenic/jz4725b.dtsi
index 0c6a5a4266f43..e9e48022f6316 100644
--- a/arch/mips/boot/dts/ingenic/jz4725b.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4725b.dtsi
@@ -321,7 +321,7 @@ udc: usb@13040000 {
 
 	lcd: lcd-controller@13050000 {
 		compatible = "ingenic,jz4725b-lcd";
-		reg = <0x13050000 0x1000>;
+		reg = <0x13050000 0x130>; /* tbc */
 
 		interrupt-parent = <&intc>;
 		interrupts = <31>;
diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi b/arch/mips/boot/dts/ingenic/jz4740.dtsi
index 772542e1f266a..7f76cba03a089 100644
--- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
@@ -323,7 +323,7 @@ udc: usb@13040000 {
 
 	lcd: lcd-controller@13050000 {
 		compatible = "ingenic,jz4740-lcd";
-		reg = <0x13050000 0x1000>;
+		reg = <0x13050000 0x60>; /* LCDCMD1+4 */
 
 		interrupt-parent = <&intc>;
 		interrupts = <30>;
diff --git a/arch/mips/boot/dts/ingenic/jz4770.dtsi b/arch/mips/boot/dts/ingenic/jz4770.dtsi
index dfe74328ae5dc..bda0a3a86ed5f 100644
--- a/arch/mips/boot/dts/ingenic/jz4770.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4770.dtsi
@@ -399,7 +399,7 @@ gpu: gpu@13040000 {
 
 	lcd: lcd-controller@13050000 {
 		compatible = "ingenic,jz4770-lcd";
-		reg = <0x13050000 0x300>;
+		reg = <0x13050000 0x130>; /* tbc */
 
 		interrupt-parent = <&intc>;
 		interrupts = <31>;
-- 
2.33.0

