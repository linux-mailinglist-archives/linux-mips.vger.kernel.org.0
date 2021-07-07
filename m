Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF313BE15B
	for <lists+linux-mips@lfdr.de>; Wed,  7 Jul 2021 05:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbhGGDTK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Jul 2021 23:19:10 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:38727 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230149AbhGGDTI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 6 Jul 2021 23:19:08 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id 0C95A580452;
        Tue,  6 Jul 2021 23:16:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 06 Jul 2021 23:16:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=1LK9TbzR4mbFW
        wxa2DMjASOGjEHNStV5ARumpu+hHTQ=; b=OVGB85Btd0Kj++USGc7cMpSgcx0NF
        3DS8YUNIHeeoe5/X/H74kA7OrHlx+4aW2nLtUPXgOY54ihiE7jTqsClpqCDHMFfy
        6tFU0CyadAoHuRcdn80+Zd64zA0wdctyDlcTyhcEnevTeOzyeWIKtsNIzux4AYZO
        V7F0qe9Byuenoe8b0/Dwe2rjiBzVDeECKzXzjQpc96MtelBxwkDSbBWeeIA6OL4q
        HLU5qcH8C3eT43LPKTahFS3MQ3/o1CPZl8Aeg5IvczvHUnh7iRzcpqLOGLF12UFd
        2t4YoMzAYu7PXnupCxSWzLuPdxbkzBZXrFkd3xJxCZdWaSC4vkR+c/TUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=1LK9TbzR4mbFWwxa2DMjASOGjEHNStV5ARumpu+hHTQ=; b=dg1XonSv
        csU5WYNaGk2w6MepW7ohdutpEgBpERmdaXlr/0aCKf87SM6OaVCCNLYLQafv+MUB
        JCcUh5c4MuHe41FbPYsiprabBW4p5QZzryumTcvgSUF10BKuGNCtG0B6/kktHinp
        blc+3jDG5IvwOZ1KovcDTVZWg/naXCM3CJG/TQWQrdxp3RqQF76KSGG69T83b219
        e28tvU0sWqduJ4mfyT9Z+DYrGNzR2dbFepDQEl4lN6kE9NV3qbZQ4t3/hZYoSXGF
        oIfKHBfgW8heEd5NnUwCE1qOiv9x6CB4SlhgP2f9x2luT3oNkRmaRwdWKJn/E6lw
        OZPW7tX7tW/upQ==
X-ME-Sender: <xms:ixzlYD-GfDlqIIz-ukr41pEfGE1DiQzH1oLzXji2GLAdoFrHo5Nq6A>
    <xme:ixzlYPveqwZQ58SKa5aBOKjKHF4VvFKQLyq-mLDVEsuMxfDg9_FHskPd9N0xtvW4G
    ZYIoBRRX3cGiroT6G8>
X-ME-Received: <xmr:ixzlYBDLR3J_azJ8tLxfXvnvdp1Elac4beqcvfch0fUEOKSnUfjEAqdINlkXTskyYpt_8QfB9dByHNR1aw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddugdeghecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeeihffgteelkeelffduke
    dtheevudejvdegkeekjeefhffhhfetudetgfdtffeunecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomh
X-ME-Proxy: <xmx:ixzlYPdBpYBXFJrUSaTQSlJ8ChRB3fIwKVK2AtxdG5qDw7Oi1O4QPg>
    <xmx:ixzlYIPEmH2sDoJnrVOrAgK5cklVE8O8ucPYE8rpQzCvOGo9KOVRGQ>
    <xmx:ixzlYBn6Q_6XaQLc65S6MbRqJXDQetQAuNpm9CoLcu_kllcF4DgZvg>
    <xmx:jBzlYJF9FdETNin_1xDuFZvLH6pNjoUxCWeySl0mGkhG0c52T1lpFw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jul 2021 23:16:23 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 2/9] MIPS: DTS: Pistachio add missing cpc and cdmm
Date:   Wed,  7 Jul 2021 11:15:45 +0800
Message-Id: <20210707031552.20166-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707031552.20166-1-jiaxun.yang@flygoat.com>
References: <20210707031552.20166-1-jiaxun.yang@flygoat.com>
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

