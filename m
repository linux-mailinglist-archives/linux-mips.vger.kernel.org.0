Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E81FE3D06F7
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jul 2021 05:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231597AbhGUCWL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Jul 2021 22:22:11 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:53503 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231363AbhGUCVa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 20 Jul 2021 22:21:30 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.west.internal (Postfix) with ESMTP id B0B182B004FC;
        Tue, 20 Jul 2021 23:02:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 20 Jul 2021 23:02:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=1LK9TbzR4mbFW
        wxa2DMjASOGjEHNStV5ARumpu+hHTQ=; b=GZ0n3cuRcyd0fOHJcgmxcsqFnhjfb
        /0NtfYGYodl8Jj2bmgAXxCPk5BmiEfZzNUZMbVj6yjS/Gjcj0c3xovsWDy7RjYS5
        Dyu3PUUBwuw0J3JU2TgXt9QJkUbJ6V5dLYBBQTH3IjTV9sEoRC2K0oqN+Uz3XwhZ
        rjmwiLCT7B+hoQ8uWZgjYyXUreWM2HKEQEQIqh5iREeLzAS2RUGaVl6iDwq036rD
        VYCg7SpE9vcjOScdEAasYS71unHanIC2YHyeG8XxKnP5gMp6usp0YbTRQW/6Z95s
        qHB1uoVYjfROvLn+N0fuhWxZl4/v7xL6JtZybbjwYZaeDmuQT4ThD4nQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=1LK9TbzR4mbFWwxa2DMjASOGjEHNStV5ARumpu+hHTQ=; b=Wcms8viT
        uwYMjYhw+juuQkqlCzqyzG5nYcVxXmTKrXylV8wOh49560wcDDxpKL56TEvZ+8N8
        vU+MQiO6AxbXDRYtL1uokRmDWsKteouimYfc51wwYf/RQ1uDZteke/0JmbsfgS04
        2wKFy9dCJ2NU/A8CdoJnq/5P4C7lX26t9RBSHMMEWMR0dLIA3627NPT22BzODGm/
        MV2DJ2t8pT92hyWOxAcXVWfiaa/2E/WwcIXrrULvkK/MLBVVSi2qQMUlCuWnqkaG
        H5zmD5MNbaqdhnXGL2GPDIO4HJJc/L/cEB45EpzrIql4A/t3PfqyIRqumTYJxaHk
        Gw1aCyaPHuDr9A==
X-ME-Sender: <xms:LY73YEEL26fMohSQ3uDtk9fUzi8FyIAbfAg3feSEXuhamEypf2nECQ>
    <xme:LY73YNVMQkoyr7tLUi_c6ctIdZuKBkbTKAryjom-WbtH8h_NevlWOgGzxK-hdie71
    KWdFY9lkgK9R55F5yg>
X-ME-Received: <xmr:LY73YOJs_rCvM1X_JMLTFcu4WvLYMkJqxx_BEzQz0z2qnDrztsWsQTDArn3LPrMxQw2BRZ0b4lkD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeefgdehiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeeihffgteelkeelffduke
    dtheevudejvdegkeekjeefhffhhfetudetgfdtffeunecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomh
X-ME-Proxy: <xmx:LY73YGHUYpPMxTd9dxolzhWKivx2L2B336gSyGvGdvzIN4IUpE-6DQ>
    <xmx:LY73YKVXk68F-w3gNSbVtyo-Cvhg6m4Q1ZyQwCYOSazdUSayYVsR0Q>
    <xmx:LY73YJMrfYX8LSSR4c1cJ4anCzbQTPEWV80Hd2nsWUG71KwqNKG-Aw>
    <xmx:Lo73YDMdQ-LWVUpU-VmVIgKWLiXm6mPKaKWvFtva1AUP1WTdjR3CGEBLVVs>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jul 2021 23:02:01 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 2/9] MIPS: DTS: Pistachio add missing cpc and cdmm
Date:   Wed, 21 Jul 2021 11:01:27 +0800
Message-Id: <20210721030134.10562-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210721030134.10562-1-jiaxun.yang@flygoat.com>
References: <20210721030134.10562-1-jiaxun.yang@flygoat.com>
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

