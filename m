Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58C663D31A7
	for <lists+linux-mips@lfdr.de>; Fri, 23 Jul 2021 04:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233271AbhGWBpl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 22 Jul 2021 21:45:41 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:38713 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233267AbhGWBpk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 22 Jul 2021 21:45:40 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id 1984E5808BF;
        Thu, 22 Jul 2021 22:26:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 22 Jul 2021 22:26:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=1LK9TbzR4mbFW
        wxa2DMjASOGjEHNStV5ARumpu+hHTQ=; b=K3niiI7nviZHrP86ME1O1xBYRVGeD
        +MqkCrTUxIJtYPF/CCqLdAqPe9Xn/+/V3vM6KKlL2uxDNy4yN/4LogsBB5B6Rq/5
        xCz8U+YxEpcTbmvJ89K0sCIEkUNanasBvSQUAdeRF+upZZ+ALECgRcU53amTqNF8
        8p4KNcsAF794KjDoWXWAnt3cpr78ZhqwFjfTyyeRq4t5WTEFUlJAn+5OulJOSNJL
        PwSHpTI2j4Qww+vLGu01mRmxF3kb6JZcaP7+1y34GpSQ9abJtZn03pHiAFQG8Bby
        5Wdt+VarEUBHm/kCD7YOuyShK0m9EBEbwiCrVhy10BRjAltXBAHUgzZ2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=1LK9TbzR4mbFWwxa2DMjASOGjEHNStV5ARumpu+hHTQ=; b=weGEHQ86
        t7crtvQOhWpcuocflyzIAub0CuDHSNdhvZBNwd48XRoP0AeH04PQTQVRS+QLOuG0
        sim2EgEGxkK9eB4muHnkkGx91sSpv7l1vluTpeJH1IZEcIyzuSPzQr7jF0zxQhJC
        5D4frud4+0spcxPk9FtA9Lpr1+S+i5DI18uLGj6rKzrsE+AIQC9uf3v9Qw/L435Y
        sBSc0dnvUoWxfC6y6YI0cVmXTH7rfEd+DpffRuORfw3Pjmx+3BWPNLxP6XdvzpFP
        aPssIIjeAfl6X7ZisrAIFju9+I3D+2aJ+gZxoUqIVLAWu+ujT1bnG7BbaokN4rwr
        e8WDqSjX33WfsQ==
X-ME-Sender: <xms:xSj6YBIgCA_PPEH9DoPztQVX62f4zBrzJlm_YSum9XpBIVfVrHBWHw>
    <xme:xSj6YNLv0yf5GIJfE44GwJbL8jRhGh_jq_DqXvlyeIzHKvKG7PZn9VqWNH2-lXqbV
    0p16xY9MXk-wriWvpk>
X-ME-Received: <xmr:xSj6YJsgrId8lOXiSu3nRMGdtol4htNxaFkap_pdJxZykMqTjXo-ErsjbxvfDjORv8toq1To54ch>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeejgdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeeihffgteelkeelffduke
    dtheevudejvdegkeekjeefhffhhfetudetgfdtffeunecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomh
X-ME-Proxy: <xmx:xSj6YCaQXCeM-XsXJPvu9gfNkkLHmiayN9PD08-2XHCYxlh6Phb_9w>
    <xmx:xSj6YIZIN__sr9ZswRenhwkSYIR-2AuXgUYMkf6x-pxKXUPgUrwkDA>
    <xmx:xSj6YGDhIOapfPOmu5rDn3kTeAURkYmWlziFSbDoJDC5CMiirE8D4A>
    <xmx:xij6YFQIuehLzi9HkD-0G6sc0sbI0arF8xXjpdUL5Sxvt1RaLaoQfA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jul 2021 22:26:08 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v4 2/9] MIPS: DTS: Pistachio add missing cpc and cdmm
Date:   Fri, 23 Jul 2021 10:25:36 +0800
Message-Id: <20210723022543.4095-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210723022543.4095-1-jiaxun.yang@flygoat.com>
References: <20210723022543.4095-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CPC and CDMM addresses are adjustable and we should tell kernel
how to place them in devicetree.

Note that MACH_PISTACHIO code hardcoded CDMM base to 0x1bdd0000,
however it will collide with GIC address range. As we don't have
any CDMM device on this platform it won't be a problem.
I found another spare range, 0x1bdf0000~0x1be00000 to place CDMM
instead.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/boot/dts/img/pistachio.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/mips/boot/dts/img/pistachio.dtsi b/arch/mips/boot/dts/img/pistachio.dtsi
index dc3b7909de73..b1db8b8f446f 100644
--- a/arch/mips/boot/dts/img/pistachio.dtsi
+++ b/arch/mips/boot/dts/img/pistachio.dtsi
@@ -900,6 +900,16 @@ timer {
 		};
 	};
 
+	cpc: cpc@1bde0000 {
+		compatible = "mti,mips-cpc";
+		reg = <0x1bde0000 0x10000>;
+	};
+
+	cdmm: cdmm@1bdf0000 {
+		compatible = "mti,mips-cdmm";
+		reg = <0x1bdf0000 0x10000>;
+	};
+
 	usb_phy: usb-phy {
 		compatible = "img,pistachio-usb-phy";
 		clocks = <&clk_core CLK_USB_PHY>;
-- 
2.32.0

