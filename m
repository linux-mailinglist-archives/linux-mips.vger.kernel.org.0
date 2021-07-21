Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2BF3D0708
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jul 2021 05:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232149AbhGUCXA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Jul 2021 22:23:00 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:47513 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231467AbhGUCVy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 20 Jul 2021 22:21:54 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.west.internal (Postfix) with ESMTP id 836962B00513;
        Tue, 20 Jul 2021 23:02:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 20 Jul 2021 23:02:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=l9PH4QLd/cM4/
        cQPPaMBDFls0x1FzgEX2pJ1FwyEWZE=; b=cZcSPfT5nsjjHMnKkcGG4XUIp3fUn
        lVTfUhUBnD0sEZAZxcO5JLQyhNrfPihJq8cjYa9Dc4vG7I8L2Sm1qO0/XW9TzFV/
        GJdDKjNwXmmH2w6hhmMRc9fkhlrLB0xfssZeMjIb4F28e3pG7s8vBXZ/PUqAQ9Xb
        F7YuX6ZODSCrZHdE0WT39bubElqe1j2u2t49yJF3i1rP5mWwIgTwbjv2EAJjISg/
        0ezy4afrUBwW18uFMIUGUZKP1Q1qfxIauaNdzt/lNLsmcy8SnQOnJ5p5ndJMkiUj
        2iq2oJr9ol0740UlZiTrGPuCcvY+Hu/pGvnSf1CXVg/qKDnlLLb1wjMNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=l9PH4QLd/cM4/cQPPaMBDFls0x1FzgEX2pJ1FwyEWZE=; b=vunWxpF3
        uuKUM6YB6XS6QSZKOE0H+AkNwupXkbVZEngcYsIOVh8iKdcoRK6i1A9woMjXTwLs
        gIS58kw0Zlv/daSi84xOU1fMgmXvZrFt2Co/uaPStn3DVfeUURFgt18sVNHK3i5o
        MWpyn7Ezm/Rpvzc/cmGM+Y1bliJX79vV6fxPNmt9j78P/Fu5Mvivrx3lZwQQCQjP
        Y8fIv7MUe7r9nzeAD6Xa1qhqM1bFQznmm+Eo9kp7K1Lgw0TXWLEz3s07+x7jIdnD
        h3/Gd40mVbNd8c3zGOXuRDKLoZPm6bqsjSVIxuAsdIiKkHO8y5GZifRiEHZcPZHJ
        ahGStgAfpR232Q==
X-ME-Sender: <xms:Ro73YOtff6AAhz5vCgIkNpp-8y4GwJVuaAEaYeRp-EV1NRU0PKZwNQ>
    <xme:Ro73YDcVA0U0Pq1dxbjDXIdyTv7xu7-XeyU_ZJHIKwe5_Baee3C91g8PaF5VznFUE
    4I9hO6i9oI7IDuY_AM>
X-ME-Received: <xmr:Ro73YJzKc18epeX5tVFiIXuZuIMRcJ7AJ3_5cWSHmxDLQ6QbIK9BJk80lYOCncIQ1W7ErB-gwS9D>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeefgdehiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeeihffgteelkeelffduke
    dtheevudejvdegkeekjeefhffhhfetudetgfdtffeunecuvehluhhsthgvrhfuihiivgep
    vdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomh
X-ME-Proxy: <xmx:Ro73YJPYCAFKXpYcGNRWE1R5jqw4fsJy_vI09Df-msnn0RhbcZYKQQ>
    <xmx:Ro73YO8MIMGM_ZPYPsyyDc32Txm86m_lhT7mHHqgqrdWMYODZh1qVw>
    <xmx:Ro73YBXYfrXRWvymNMQwLitWd1b6LS58vi5pAS1XqaQ4svQouYu_gg>
    <xmx:Ro73YP2471XS2PsYEUO0Fiosw63bVz3GWkWgUd9Yp3UMML3cOLNmM6FZR2s>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jul 2021 23:02:25 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 6/9] pinctrl: pistachio: Make it as an option
Date:   Wed, 21 Jul 2021 11:01:31 +0800
Message-Id: <20210721030134.10562-7-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210721030134.10562-1-jiaxun.yang@flygoat.com>
References: <20210721030134.10562-1-jiaxun.yang@flygoat.com>
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

