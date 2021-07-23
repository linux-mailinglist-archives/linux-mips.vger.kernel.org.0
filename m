Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 674B63D31BB
	for <lists+linux-mips@lfdr.de>; Fri, 23 Jul 2021 04:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233371AbhGWBqC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 22 Jul 2021 21:46:02 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:58273 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233303AbhGWBqB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 22 Jul 2021 21:46:01 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id A73595808BF;
        Thu, 22 Jul 2021 22:26:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 22 Jul 2021 22:26:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=l9PH4QLd/cM4/
        cQPPaMBDFls0x1FzgEX2pJ1FwyEWZE=; b=m1v+TIVMqNGsZ8mfwlF0cUfWoM2h2
        HpgH/lJ01UZuscjeKa0YFU+XxxaVNgEqBcFy93jxiA1rIg8jYTBIy3W1Lw2gpV3C
        kIAT5vMwRescG26sz7QZKw0sYWZllDzS9nPRboJB/eL8pXJvnW9tGeh5zggxJBi1
        TzFrWU4Lqy12XgTSYrZpbpDfnyf9jV/jAhHg/KUbSo1DSgM7ABKnyxBbc3v2B4jO
        BMb5tXjW1uIB2TAOzMB3L6zs30oDo5tquAPp56F7ctzqx+f8r/bNXYf3Dtg4VRgr
        2aAw75sLFm11yMH0eC52rfc4eh9kATj6V/ZVOpGrKql94CrSUce+4q+Nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=l9PH4QLd/cM4/cQPPaMBDFls0x1FzgEX2pJ1FwyEWZE=; b=RY2g7wsl
        MLuuM9E6321AuYSCacT/b1/nH4JxCNhms6GWjOyPOefhY76SH3xZol0o7piLrujP
        /YF6X6YdYwWwXStZOuuR1dUpmgtZsnfz6KXGA2cnQvz9QS0lwdibehgufszFhI6a
        k+ewQ/fAHi/nQDw3Iw1xVFpuExHr/nAnsU4dyX+bFSCAfiz7/3S3SIlPPhFyDovU
        XmS/vrsoXTOeguccRLEq4l7Qv3jnOjek0tsqhvIbJa4U8zngJnC+Q4XPaIaT1vl5
        bDdPe71baaQ9QEYYyUUMEZb5EDnbalW0UBrsded5YBLRqzhAAhAictHk85S5VlQJ
        7VrZM/BKSe1jxA==
X-ME-Sender: <xms:2yj6YDR_mwKtcxqEbj7dzsPv9eE4z9ah8AwQfHbzIXH2tfP6zFDK2Q>
    <xme:2yj6YEz9Y3Qin_44LMv1annPBaOsThj23J1A9QHHzsf4SrigcuZIuiBe42uxiviU6
    DtrgfUkn3YvWTBo6PE>
X-ME-Received: <xmr:2yj6YI15lcXoqyfgp81eP2pD0mYsqwdNWj9ABE-zKvtpAAqAtItdU_A376no0GqzxnUZBV1Rn4ov>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeejgdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeeihffgteelkeelffduke
    dtheevudejvdegkeekjeefhffhhfetudetgfdtffeunecuvehluhhsthgvrhfuihiivgep
    vdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomh
X-ME-Proxy: <xmx:2yj6YDDbuARRLsjyQbPufz80RBtmI5dSlHPKpAKVAEjMxgTBe8hnWQ>
    <xmx:2yj6YMg3JgR-Jp6Cc9_rriMsLHtcYNHmf2VQeoFCv5wcubNYS5GS3w>
    <xmx:2yj6YHoMqnfFusvpmSzP6SzQXsjbRQp6OfTh7vsQs8428c8ulfFMlQ>
    <xmx:2yj6YBZMKjHx8MmewGqXwNIMGOaSGqc0dqDmKkFa7LVqGo3JEDeZsQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jul 2021 22:26:30 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v4 6/9] pinctrl: pistachio: Make it as an option
Date:   Fri, 23 Jul 2021 10:25:40 +0800
Message-Id: <20210723022543.4095-7-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210723022543.4095-1-jiaxun.yang@flygoat.com>
References: <20210723022543.4095-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

So it will be avilable for generic MIPS kernel.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
--
v3: Depend on OF as well
---
 drivers/pinctrl/Kconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index c2c7e7963ed0..295f5eec58a9 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -248,12 +248,15 @@ config PINCTRL_SX150X
 	  - 16 bits: sx1509q, sx1506q
 
 config PINCTRL_PISTACHIO
-	def_bool y if MACH_PISTACHIO
+	bool "IMG Pistachio SoC pinctrl driver"
+	depends on OF && (MIPS || COMPILE_TEST)
 	depends on GPIOLIB
 	select PINMUX
 	select GENERIC_PINCONF
 	select GPIOLIB_IRQCHIP
 	select OF_GPIO
+    help
+	  This support pinctrl and gpio driver for IMG Pistachio SoC.
 
 config PINCTRL_ST
 	bool
-- 
2.32.0

